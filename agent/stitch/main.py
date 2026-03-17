from __future__ import annotations

import argparse
from pathlib import Path

from agent.stitch.search import search_patterns


def _parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(description="Top-down DAG pattern search over MLIR files")
    p.add_argument(
        "mlir_files",
        nargs="+",
        help="One or more MLIR files (for example corpus/llm/llm_add.mlir)",
    )
    p.add_argument(
        "--max-instructions",
        type=int,
        default=3,
        help="Maximum number of non-leaf instructions in a pattern",
    )
    return p.parse_args()


def main() -> None:
    args = _parse_args()
    paths = [Path(p).resolve() for p in args.mlir_files]
    result = search_patterns(paths, max_instructions=args.max_instructions)
    for hit in result.hits:
        if hit.pattern.inst_count < 2:
            continue
        print(f"=== {hit.total_matches} matches | {hit.pattern_key} ===")
        # print(hit.pattern)
        # print()


if __name__ == "__main__":
    main()
