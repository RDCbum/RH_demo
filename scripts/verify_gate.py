#!/usr/bin/env python3
"""Reproducibility gate for the ERURH proof artefacts."""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path
from typing import Sequence

REPO_ROOT = Path(__file__).resolve().parents[1]
LEAN_OUT_DIR = REPO_ROOT / "lean" / "formal_proofs" / "ERURH"
DATA_OUT_DIR = REPO_ROOT / "data" / "docs" / "paper"

SORRY_CHECK_OUT = REPO_ROOT / "docs" / "core" / "STEP6_gate_sorry_check.txt"


def scan_no_sorry(root: Path, output_path: Path) -> None:
    pattern = re.compile(r"\b(sorry|admit)\b")
    hits = []
    scan_root = root / "lean" / "formal_proofs" / "ERURH"
    for file_path in scan_root.rglob("*.lean"):
        try:
            lines = file_path.read_text(encoding="utf-8", errors="ignore").splitlines()
        except OSError:
            continue
        for idx, line in enumerate(lines, start=1):
            if pattern.search(line):
                rel = file_path.relative_to(root)
                hits.append(f"{rel}:{idx}: {line.strip()}")
    output_path.parent.mkdir(parents=True, exist_ok=True)
    if hits:
        output_path.write_text("SORRY/ADMIT FOUND\n" + "\n".join(hits) + "\n", encoding="utf-8")
        print(f"Found sorry/admit in {len(hits)} lines; see {output_path}", file=sys.stderr)
        for entry in hits:
            print(entry, file=sys.stderr)
        sys.exit(1)
    output_path.write_text("OK: no sorry/admit found under lean/formal_proofs/ERURH\n", encoding="utf-8")


def run(cmd: Sequence[str], *, cwd: Path) -> None:
    print(f"+ {' '.join(cmd)}", flush=True)
    subprocess.run(cmd, check=True, cwd=cwd)


def git_porcelain(cwd: Path) -> set[str]:
    result = subprocess.run(
        ["git", "status", "--porcelain"],
        cwd=cwd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=True,
    )
    entries = set()
    for line in result.stdout.splitlines():
        if not line.strip():
            continue
        entries.add(line.strip())
    return entries


def main() -> None:
    parser = argparse.ArgumentParser(description="Verify ERURH formal artefacts.")
    parser.add_argument(
        "--skip-diff-check",
        action="store_true",
        help="Do not fail if the working tree becomes dirty.",
    )
    parser.add_argument(
        "--skip-pytests",
        action="store_true",
        help="Skip running the Python regression suite.",
    )
    args = parser.parse_args()

    baseline = git_porcelain(REPO_ROOT)
    tracked_outputs = [
        DATA_OUT_DIR / "rational_bounds.json",
        DATA_OUT_DIR / "certificate_values.json",
        DATA_OUT_DIR / "rms_context.json",
        DATA_OUT_DIR / "beta_certificate.json",
        LEAN_OUT_DIR / "RationalBounds.lean",
        LEAN_OUT_DIR / "CertificateValues.lean",
        LEAN_OUT_DIR / "Alpha" / "GeneratedRMSContext.lean",
        LEAN_OUT_DIR / "Beta" / "GeneratedBetaCertificate.lean",
    ]
    original_bytes = {path: (path.read_bytes() if path.exists() else None) for path in tracked_outputs}

    try:
        run(
            [
                sys.executable,
                "tools/make_rational_bounds.py",
            ],
            cwd=REPO_ROOT,
        )
        run(
            [
                sys.executable,
                "tools/make_certificate_values.py",
            ],
            cwd=REPO_ROOT,
        )
        run(
            [
                sys.executable,
                "tools/make_rms_context.py",
            ],
            cwd=REPO_ROOT,
        )
        run(
            [
                sys.executable,
                "tools/check_rms_context.py",
            ],
            cwd=REPO_ROOT,
        )
        run(
            [
                sys.executable,
                "tools/make_beta_certificate.py",
            ],
            cwd=REPO_ROOT,
        )
        run(["lake", "build", "ERURH"], cwd=REPO_ROOT)
        if not args.skip_pytests:
            run([sys.executable, "-m", "pytest", "tests"], cwd=REPO_ROOT)
    except subprocess.CalledProcessError as exc:
        sys.exit(exc.returncode)

    scan_no_sorry(REPO_ROOT, SORRY_CHECK_OUT)

    if not args.skip_diff_check:
        for path in tracked_outputs:
            before = original_bytes[path]
            after = path.read_bytes() if path.exists() else None
            if before is None or after != before:
                print(f"{path.relative_to(REPO_ROOT)} changed during verification.", file=sys.stderr)
                sys.exit(1)

        after = git_porcelain(REPO_ROOT)
        new_entries = after - baseline
        if new_entries:
            print("Working tree acquired new changes:", file=sys.stderr)
            for entry in sorted(new_entries):
                print(f"  {entry}", file=sys.stderr)
            sys.exit(1)

    # Allow for pre-existing modifications as long as no new entries appear.


if __name__ == "__main__":
    main()
