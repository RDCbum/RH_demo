#!/usr/bin/env python3
"""Fail the gate if non-core declarations or sorry/admit exist in ERURH."""

from __future__ import annotations

import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
SCAN_ROOT = REPO_ROOT / "lean" / "formal_proofs" / "ERURH"

DECL_PATTERN = re.compile(r"^\s*(axiom|constant|opaque)\b")
SORRY_PATTERN = re.compile(r"\b(sorry|admit)\b")
NONCOMPUTABLE_PATTERN = re.compile(r"^\s*noncomputable\b")


def main() -> None:
    if not SCAN_ROOT.exists():
        print(f"Missing ERURH sources at {SCAN_ROOT}", file=sys.stderr)
        sys.exit(1)

    decl_hits: list[str] = []
    sorry_hits: list[str] = []
    noncomputable_hits: list[str] = []
    for file_path in SCAN_ROOT.rglob("*.lean"):
        try:
            lines = file_path.read_text(encoding="utf-8", errors="ignore").splitlines()
        except OSError:
            continue
        for idx, line in enumerate(lines, start=1):
            rel = file_path.relative_to(REPO_ROOT)
            if DECL_PATTERN.search(line):
                decl_hits.append(f"{rel}:{idx}: {line.strip()}")
            if SORRY_PATTERN.search(line):
                sorry_hits.append(f"{rel}:{idx}: {line.strip()}")
            if NONCOMPUTABLE_PATTERN.search(line):
                noncomputable_hits.append(f"{rel}:{idx}: {line.strip()}")

    if decl_hits or sorry_hits:
        if decl_hits:
            print("Non-core axiom/constant/opaque declarations detected:", file=sys.stderr)
            for entry in decl_hits:
                print(entry, file=sys.stderr)
        if sorry_hits:
            print("Sorry/admit tokens detected:", file=sys.stderr)
            for entry in sorry_hits:
                print(entry, file=sys.stderr)
        sys.exit(1)

    if noncomputable_hits:
        print(
            f"Note: found {len(noncomputable_hits)} noncomputable declarations under lean/formal_proofs/ERURH.",
            file=sys.stderr,
        )
        for entry in noncomputable_hits:
            print(entry, file=sys.stderr)

    print("OK: no axiom/constant/opaque/sorry/admit declarations under lean/formal_proofs/ERURH")


if __name__ == "__main__":
    main()
