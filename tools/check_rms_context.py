#!/usr/bin/env python3
"""Check RMS envelope consistency between gate data and formal bounds."""

from __future__ import annotations

import json
import sys
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parents[1]
RATIONAL_BOUNDS = REPO_ROOT / "data" / "docs" / "paper" / "rational_bounds.json"
RMS_CONTEXT = REPO_ROOT / "data" / "releases" / "erurh-v2-core" / "formal" / "rms_context.json"


def parse_rational(value: Any, *, label: str) -> Fraction:
    if isinstance(value, Fraction):
        return value
    if isinstance(value, Decimal):
        return Fraction(value)
    if isinstance(value, int):
        return Fraction(value, 1)
    if isinstance(value, float):
        return Fraction(Decimal(str(value)))
    if isinstance(value, str):
        if "/" in value:
            num_str, den_str = value.split("/", 1)
            num = int(num_str.strip())
            den = int(den_str.strip())
            if den == 0:
                raise ValueError(f"{label} has zero denominator")
            return Fraction(num, den)
        return Fraction(Decimal(value))
    raise TypeError(f"{label} must be a rational string or number, got {type(value)!r}")


def frac_to_str(value: Fraction) -> str:
    return f"{value.numerator}/{value.denominator}"


def main() -> None:
    try:
        bounds = json.loads(RATIONAL_BOUNDS.read_text(encoding="utf-8"), parse_float=Decimal)
    except FileNotFoundError as exc:
        raise FileNotFoundError(f"Missing rational bounds JSON: {RATIONAL_BOUNDS}") from exc

    try:
        rms = json.loads(RMS_CONTEXT.read_text(encoding="utf-8"), parse_float=Decimal)
    except FileNotFoundError as exc:
        raise FileNotFoundError(f"Missing rms_context JSON: {RMS_CONTEXT}") from exc

    try:
        bounds_entry = bounds["bounds"]["C_envelope_formal"]
        formal = Fraction(bounds_entry["numerator"], bounds_entry["denominator"])
    except (KeyError, TypeError) as exc:
        raise KeyError("Missing C_envelope_formal numerator/denominator in rational_bounds.json") from exc

    ctx = parse_rational(rms.get("C_envelope_ctx"), label="C_envelope_ctx")

    if ctx != formal:
        print(
            "RMS envelope mismatch: C_envelope_ctx != C_envelope_formal\n"
            f"  C_envelope_ctx    = {frac_to_str(ctx)}\n"
            f"  C_envelope_formal = {frac_to_str(formal)}",
            file=sys.stderr,
        )
        sys.exit(1)

    print(
        "OK: RMS envelope matches formal bounds\n"
        f"  C_envelope_ctx    = {frac_to_str(ctx)}\n"
        f"  C_envelope_formal = {frac_to_str(formal)}"
    )


if __name__ == "__main__":
    main()
