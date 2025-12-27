#!/usr/bin/env python3
"""Fail the gate if non-core axiom/constant declarations exist in ERURH."""

from __future__ import annotations

import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
SCAN_ROOT = REPO_ROOT / "lean" / "formal_proofs" / "ERURH"

PATTERN = re.compile(r"^\s*(axiom|constant)\b")


def main() -> None:
    if not SCAN_ROOT.exists():
        print(f"Missing ERURH sources at {SCAN_ROOT}", file=sys.stderr)
        sys.exit(1)

    hits: list[str] = []
    for file_path in SCAN_ROOT.rglob("*.lean"):
        try:
            lines = file_path.read_text(encoding="utf-8", errors="ignore").splitlines()
        except OSError:
            continue
        for idx, line in enumerate(lines, start=1):
            if PATTERN.search(line):
                rel = file_path.relative_to(REPO_ROOT)
                hits.append(f"{rel}:{idx}: {line.strip()}")

    if hits:
        print("Non-core axiom/constant declarations detected:", file=sys.stderr)
        for entry in hits:
            print(entry, file=sys.stderr)
        sys.exit(1)

    print("OK: no axiom/constant declarations under lean/formal_proofs/ERURH")


if __name__ == "__main__":
    main()
