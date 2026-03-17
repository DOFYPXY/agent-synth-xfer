from __future__ import annotations

from dataclasses import dataclass
import itertools
from pathlib import Path

from xdsl_smt.dialects.transfer import GetOp, MakeOp

from agent.stitch.converter import mlir_program_to_dags
from agent.stitch.matcher import match
from agent.stitch.util import DAG, Opcode, Vertex, iter_vertices


@dataclass
class PatternHit:
    pattern: DAG
    pattern_key: str
    total_matches: int
    matched_functions: dict[str, int]


@dataclass
class SearchResult:
    op_sigs: list[Opcode]
    hits: list[PatternHit]


def _pattern_key(root: Vertex) -> str:
    """Canonical string key for a DAG pattern, handling shared nodes."""
    vertices = iter_vertices(root)
    index = {id(v): i for i, v in enumerate(vertices)}
    parts = []
    for i, v in enumerate(vertices):
        if v.opcode == Opcode.leaf():
            parts.append(f"{i}=leaf")
        else:
            args_str = ",".join(str(index[id(a)]) for a in v.args)
            parts.append(f"{i}={v.opcode.key}({args_str})")
    return "|".join(parts)


def _ancestors_of(root: Vertex, target: Vertex) -> set[int]:
    """Return IDs of all vertices from which `target` is reachable, including `target` itself."""
    target_id = id(target)
    ancestors: set[int] = set()

    def dfs(v: Vertex) -> bool:
        if id(v) == target_id:
            ancestors.add(id(v))
            return True
        for arg in v.args:
            if dfs(arg):
                ancestors.add(id(v))
                return True
        return False

    dfs(root)
    return ancestors


def _expand_pattern(pattern: DAG, op_sigs: list[Opcode]) -> list[DAG]:
    """Expand pattern by replacing each leaf with a new instruction.

    Each arg of the new instruction can be:
    - a fresh wildcard leaf node, OR
    - any existing node in the pattern that is not an ancestor of the replaced leaf
      (adding a back-edge to an ancestor would create a cycle).
    """
    results: list[DAG] = []
    leaves = [v for v in iter_vertices(pattern.root) if v.opcode == Opcode.leaf()]

    for leaf in leaves:
        ancestors = _ancestors_of(pattern.root, leaf)
        candidates = [v for v in iter_vertices(pattern.root) if id(v) not in ancestors]

        for opcode in op_sigs:
            k = opcode.arity
            # None sentinel = fresh leaf wildcard
            arg_choices: list[Vertex | None] = [None, *candidates]
            for combo in itertools.product(arg_choices, repeat=k):
                new_args = [
                    Vertex(opcode=Opcode.leaf()) if a is None else a for a in combo
                ]
                new_vertex = Vertex(opcode=opcode, args=new_args)
                results.append(pattern.clone_with_substitution(leaf, new_vertex))

    return results


def _collect_program_dags(paths: list[Path]) -> dict[str, DAG]:
    dags: dict[str, DAG] = {}
    for path in paths:
        for fn, dag in mlir_program_to_dags(path).items():
            dags[f"{path.name}:{fn}"] = dag
    return dags


def _collect_opcode_signatures(program_dags: dict[str, DAG]) -> list[Opcode]:
    seen: set[Opcode] = set()
    for dag in program_dags.values():
        for v in iter_vertices(dag.root):
            if v.opcode in (Opcode.leaf(), Opcode("block_argument", 0)):
                continue
            if isinstance(v.mlir_op, (GetOp, MakeOp)):
                continue
            seen.add(v.opcode)
    return sorted(seen, key=lambda s: (s.key, s.arity))


def _count_pattern_matches(
    pattern: DAG, program_dags: dict[str, DAG]
) -> tuple[int, dict[str, int]]:
    matched_functions: dict[str, int] = {}
    total = 0
    for fn_name, prog in program_dags.items():
        n = len(match(prog, pattern))
        if n > 0:
            matched_functions[fn_name] = n
            total += n
    return total, matched_functions


def search_patterns(paths: list[Path], max_instructions: int = 3) -> SearchResult:
    """Top-down search with pruning over patterns with <= max_instructions.

    Starts from single-instruction patterns, then expands one leaf per step.
    Each leaf can be replaced by a new instruction whose args are either fresh
    wildcard leaves or existing non-ancestor nodes (enabling diamond DAG patterns).
    A pattern is expanded only if it has >0 matches.
    """

    program_dags = _collect_program_dags(paths)
    op_sigs = _collect_opcode_signatures(program_dags)

    hits: list[PatternHit] = []
    queue: list[DAG] = [
        DAG(
            root=Vertex(
                opcode=sig, args=[Vertex(opcode=Opcode.leaf()) for _ in range(sig.arity)]
            )
        )
        for sig in op_sigs
    ]
    seen: set[str] = set()

    while queue:
        pattern = queue.pop(0)
        key = _pattern_key(pattern.root)
        if key in seen:
            continue
        seen.add(key)

        total, per_fn = _count_pattern_matches(pattern, program_dags)
        if total == 0:
            continue

        hits.append(
            PatternHit(
                pattern=pattern,
                pattern_key=key,
                total_matches=total,
                matched_functions=per_fn,
            )
        )

        if pattern.inst_count >= max_instructions:
            continue

        for expanded in _expand_pattern(pattern, op_sigs):
            queue.append(expanded)

    hits.sort(key=lambda h: (-h.total_matches, h.pattern_key))
    return SearchResult(op_sigs=op_sigs, hits=hits)
