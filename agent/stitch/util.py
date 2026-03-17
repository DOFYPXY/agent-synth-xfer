from __future__ import annotations

from dataclasses import dataclass, field

from xdsl.ir import BlockArgument, Operation
from xdsl_smt.dialects.transfer import CmpOp, Constant as ConstantOp, GetOp


def _int_attr_value(op: Operation, attr_name: str) -> int | None:
    attr = op.attributes.get(attr_name)
    if attr is None:
        return None

    # xdsl IntegerAttr[IndexType] value shape: attr.value.data
    value = getattr(attr, "value", None)
    data = getattr(value, "data", None)
    if isinstance(data, int):
        return data

    return None


@dataclass(frozen=True)
class Opcode:
    """Node kind used by DAG matching.

    Two vertices with equal `Opcode` are considered the same node kind.
    """

    key: str
    arity: int

    @staticmethod
    def leaf() -> Opcode:
        return Opcode("leaf", 0)

    @staticmethod
    def from_mlir_op(mlir_op: Operation | BlockArgument) -> Opcode:
        if isinstance(mlir_op, BlockArgument):
            return Opcode("block_argument", 0)

        arity = len(mlir_op.operands)

        if isinstance(mlir_op, ConstantOp):
            cst = _int_attr_value(mlir_op, "value")
            if cst is not None:
                return Opcode(f"{mlir_op.name}[{cst}]", 0)

        if isinstance(mlir_op, GetOp):
            index = _int_attr_value(mlir_op, "index")
            if index is not None:
                return Opcode(f"{mlir_op.name}[{index}]", arity)

        if isinstance(mlir_op, CmpOp):
            pred = _int_attr_value(mlir_op, "predicate")
            if pred is not None:
                return Opcode(f"{mlir_op.name}[{pred}]", arity)

        return Opcode(mlir_op.name, arity)


@dataclass(eq=False)
class Vertex:
    """A DAG node used for MLIR pattern matching.

    `opcode` must be inferred from `mlir_op`, except synthetic wildcard nodes such as
    `Opcode.leaf()` used in patterns.
    """

    opcode: Opcode
    args: list[Vertex] = field(default_factory=list)
    mlir_op: Operation | BlockArgument | None = None


def _clone_subtree(
    v: Vertex,
    memo: dict[int, Vertex],
    subst: tuple[int, Vertex] | None = None,
) -> Vertex:
    if subst is not None and id(v) == subst[0]:
        return _clone_subtree(subst[1], memo)
    key = id(v)
    if key in memo:
        return memo[key]
    copied = Vertex(opcode=v.opcode, mlir_op=v.mlir_op)
    memo[key] = copied
    copied.args = [_clone_subtree(arg, memo, subst) for arg in v.args]
    return copied


class DAG:
    """A directed acyclic graph represented by a single root."""

    root: Vertex

    def __init__(self, root: Vertex) -> None:
        self.root = root
        self.inst_count = sum(1 for v in iter_vertices(root) if v.opcode != Opcode.leaf())

    def clone(self) -> DAG:
        return DAG(root=_clone_subtree(self.root, {}))

    def __str__(self) -> str:
        seen: dict[int, int] = {}
        counter = [0]

        def fmt(v: Vertex, indent: int) -> str:
            vid = id(v)
            prefix = "  " * indent
            if v.opcode == Opcode.leaf():
                if vid in seen:
                    return prefix + f"@{seen[vid]}"
                seen[vid] = counter[0]
                counter[0] += 1
                return prefix + "_"
            if vid in seen:
                return prefix + f"@{seen[vid]}"
            seen[vid] = counter[0]
            counter[0] += 1
            lines = [prefix + v.opcode.key]
            for arg in v.args:
                lines.append(fmt(arg, indent + 1))
            return "\n".join(lines)

        return fmt(self.root, 0)

    def clone_with_substitution(self, target: Vertex, replacement: Vertex) -> DAG:
        """Clone this DAG, replacing every occurrence of `target` (by identity)
        with an independent deep-cloned copy of `replacement`.

        `target` must be a leaf node (args == []).
        """
        return DAG(root=_clone_subtree(self.root, {}, subst=(id(target), replacement)))


def iter_vertices(root: Vertex) -> list[Vertex]:
    """Return all vertices reachable from root in top-down order."""

    seen: set[int] = set()
    ordered: list[Vertex] = []

    def visit(v: Vertex) -> None:
        key = id(v)
        if key in seen:
            return
        seen.add(key)
        ordered.append(v)
        for arg in v.args:
            visit(arg)

    visit(root)

    return ordered
