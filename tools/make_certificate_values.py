"""Generate Lean certificate values for the ERURH proof bundle."""

from __future__ import annotations

import argparse
import json
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Dict, Mapping, Tuple

DEFAULT_RELEASE_DIR = Path("data") / "releases" / "erurh-v2-core" / "formal"
DEFAULT_CONSTANTS_PATH = Path("data") / "releases" / "erurh-v2-core" / "constants_global.json"
DEFAULT_OUT_JSON = Path("data") / "docs" / "paper" / "certificate_values.json"
DEFAULT_LEAN_OUT = Path("lean") / "formal_proofs" / "ERURH" / "CertificateValues.lean"
DEFAULT_RATIONAL_BOUNDS = Path("data") / "docs" / "paper" / "rational_bounds.json"

def rat_literal(num: int, den: int) -> str:
    return f"(({num}) : ℚ) / ({den})"


def _read_json(path: Path) -> Mapping[str, object]:
    try:
        text = path.read_text(encoding="utf-8")
    except FileNotFoundError as exc:
        raise FileNotFoundError(f"Missing artefact: {path}") from exc
    try:
        return json.loads(text, parse_float=Decimal)
    except json.JSONDecodeError as exc:
        raise ValueError(f"Malformed JSON in {path}: {exc}") from exc


def _to_fraction(value: object) -> Fraction:
    if isinstance(value, Fraction):
        return value
    if isinstance(value, Decimal):
        return Fraction(value)
    if isinstance(value, (int, float)):
        return Fraction(Decimal(str(value)))
    if isinstance(value, str):
        return Fraction(Decimal(value))
    raise TypeError(f"Unsupported value type for conversion to Fraction: {type(value)!r}")


def _fraction_payload(frac: Fraction) -> Dict[str, object]:
    if frac.denominator <= 0:
        raise ValueError(f"Expected positive denominator, received {frac.denominator}")
    return {
        "numerator": int(frac.numerator),
        "denominator": int(frac.denominator),
        "decimal": f"{frac.numerator / frac.denominator:.36f}".rstrip("0").rstrip("."),
    }


def _load_certificate_values(
    release_dir: Path, constants_path: Path
) -> Tuple[Dict[str, Dict[str, object]], Dict[str, str]]:
    bridge_closed = _read_json(release_dir / "bridge_closed.json")
    formal_report = _read_json(release_dir / "formal_report_strict.json")
    constants_global = _read_json(constants_path)

    eps_phi = _to_fraction(bridge_closed["epsilon_phi"])
    eps_L = _to_fraction(bridge_closed["epsilon_L"])
    eps_kappa = _to_fraction(bridge_closed["epsilon_kappa"])

    inflation_factor = (Fraction(1) + eps_phi) * (Fraction(1) + eps_L) * (Fraction(1) + eps_kappa)
    reported_inflation = _to_fraction(bridge_closed["inflation_factor"])
    if abs(inflation_factor - reported_inflation) > Fraction(1, 10**60):
        raise ValueError(
            "Inflation factor mismatch exceeds tolerance: "
            f"computed={inflation_factor} reported={reported_inflation}"
        )

    c_envelope_closed = _to_fraction(bridge_closed["C_envelope_closed"])
    c_envelope_base = c_envelope_closed / inflation_factor

    s0_strict = _to_fraction(formal_report["s0"])

    values = {
        "s0_strict": _fraction_payload(s0_strict),
        "c_envelope_base": _fraction_payload(c_envelope_base),
        "c_envelope_closed": _fraction_payload(c_envelope_closed),
        "epsilon_phi": _fraction_payload(eps_phi),
        "epsilon_L": _fraction_payload(eps_L),
        "epsilon_kappa": _fraction_payload(eps_kappa),
        "inflation_factor": _fraction_payload(inflation_factor),
        "inflation_factor_reported": _fraction_payload(reported_inflation),
    }

    for key, payload in values.items():
        if not isinstance(payload, Mapping):
            raise TypeError(f"Value '{key}' is not a mapping.")
        if "numerator" not in payload or "denominator" not in payload:
            raise AssertionError("Use exact rationals (num/den), not decimals.")
        if not isinstance(payload["numerator"], int) or not isinstance(payload["denominator"], int):
            raise TypeError(f"Value '{key}' must expose integer numerator/denominator.")

    sources = {
        "bridge_closed": str((release_dir / "bridge_closed.json").resolve()),
        "formal_report_strict": str((release_dir / "formal_report_strict.json").resolve()),
        "constants_global": str(constants_path.resolve()),
    }

    return values, sources


def _emit_qbound(name: str, numerator: int, denominator: int) -> str:
    return "\n".join(
        [
            f"@[simp] def {name} : QBound :=",
            "  {",
            f"    num := {numerator},",
            f"    den := {denominator},",
            "    den_pos := by decide",
            "  }",
        ]
    )


def write_lean_module(
    values: Mapping[str, Dict[str, object]],
    lean_path: Path,
    la_closed_num: int,
    la_closed_den: int,
) -> None:
    name_map = {
        "s0_strict": "s0Strict",
        "c_envelope_base": "cEnvelopeBase",
        "c_envelope_closed": "cEnvelopeClosedExact",
        "epsilon_phi": "epsPhiBound",
        "epsilon_L": "epsLBound",
        "epsilon_kappa": "epsKappaBound",
        "inflation_factor": "inflationFactorExact",
        "inflation_factor_reported": "inflationFactorReported",
    }

    required_keys = set(name_map)
    missing = required_keys - set(values)
    if missing:
        raise KeyError(f"Certificate values missing required keys: {sorted(missing)}")

    lines = [
        "-- This file is auto-generated by tools.make_certificate_values.py",
        "-- Do not edit manually.",
        "",
        "import Mathlib.Tactic.FieldSimp",
        "import Mathlib.Tactic.NormNum",
        "",
        "import ERURH.RationalBounds",
        "import ERURH.Certificate",
        "import ERURH.LemmaAContraction",
        "import ERURH.LemmaBEnergy",
        "",
        "namespace ERURH",
        "",
        "open scoped Rat",
        "",
    ]

    for key, lean_name in name_map.items():
        payload = values[key]
        numerator = int(payload["numerator"])
        denominator = int(payload["denominator"])
        lines.append(_emit_qbound(lean_name, numerator, denominator))
        lines.append("")
        lines.append(f"@[simp] def {lean_name}Rat : Rat := {rat_literal(numerator, denominator)}")
        lines.append("")

    base_num = int(values["c_envelope_base"]["numerator"])
    base_den = int(values["c_envelope_base"]["denominator"])
    eps_phi_num = int(values["epsilon_phi"]["numerator"])
    eps_phi_den = int(values["epsilon_phi"]["denominator"])
    eps_L_num = int(values["epsilon_L"]["numerator"])
    eps_L_den = int(values["epsilon_L"]["denominator"])
    eps_kappa_num = int(values["epsilon_kappa"]["numerator"])
    eps_kappa_den = int(values["epsilon_kappa"]["denominator"])

    lines += [
        "@[simp] theorem cEnvelopeClosedEqBaseInflated :\n"
        "    cEnvelopeClosedExactRat =\n"
        "      cEnvelopeBaseRat *\n"
        "        ((1 + epsPhiBoundRat) * (1 + epsLBoundRat) * (1 + epsKappaBoundRat)) := by\n"
        "  field_simp [cEnvelopeClosedExactRat, cEnvelopeBaseRat, epsPhiBoundRat, epsLBoundRat, epsKappaBoundRat]; norm_num\n",
        "",
        "@[simp] theorem cEnvelopeBase_nonneg : 0 <= cEnvelopeBaseRat := by\n"
        f"  have hnum : 0 <= (({base_num}) : ℚ) := by norm_num\n"
        f"  have hden : 0 <= (({base_den}) : ℚ) := by norm_num\n"
        "  simpa [cEnvelopeBaseRat] using div_nonneg hnum hden\n",
        "@[simp] theorem epsPhiBound_nonneg : 0 <= epsPhiBoundRat := by\n"
        f"  have hnum : 0 <= (({eps_phi_num}) : ℚ) := by norm_num\n"
        f"  have hden : 0 <= (({eps_phi_den}) : ℚ) := by norm_num\n"
        "  simpa [epsPhiBoundRat] using div_nonneg hnum hden\n",
        "@[simp] theorem epsLBound_nonneg : 0 <= epsLBoundRat := by\n"
        f"  have hnum : 0 <= (({eps_L_num}) : ℚ) := by norm_num\n"
        f"  have hden : 0 <= (({eps_L_den}) : ℚ) := by norm_num\n"
        "  simpa [epsLBoundRat] using div_nonneg hnum hden\n",
        "@[simp] theorem epsKappaBound_nonneg : 0 <= epsKappaBoundRat := by\n"
        f"  have hnum : 0 <= (({eps_kappa_num}) : ℚ) := by norm_num\n"
        f"  have hden : 0 <= (({eps_kappa_den}) : ℚ) := by norm_num\n"
        "  simpa [epsKappaBoundRat] using div_nonneg hnum hden\n",
        "",
        "def certificateFromBundle : Certificate :=\n"
        "  { s0 := s0Strict,\n"
        "    lGlobal := lGlobalFormal,\n"
        "    lClosed := lAClosed,\n"
        "    kappaLow := kappaLowFormal,\n"
        "    kappaHigh := kappaHighFormal,\n"
        "    kappaClosed := kappaBookClosed,\n"
        "    cEnvelope := cEnvelopeBase,\n"
        "    cEnvelopeClosed := cEnvelopeClosedExact,\n"
        "    epsPhi := epsPhiBound,\n"
        "    epsL := epsLBound,\n"
        "    epsKappa := epsKappaBound }\n",
        "",
        "@[simp] theorem certificateFromBundle_hypotheses :\n"
        "    CertificateHypotheses certificateFromBundle := by\n"
        "  refine\n"
        "    { lGlobal_le_closed := by\n"
        "        simpa [certificateFromBundle] using lemmaA_contraction_bound,\n"
        "      lClosed_lt_one := by\n"
        f"        have : (({la_closed_num} : ℚ) / {la_closed_den}) < (1 : ℚ) := by norm_num\n"
        "        simpa [certificateFromBundle, lAClosedRat] using this,\n"
        "      kappaLow_le_high := by\n"
        "        simpa [certificateFromBundle] using lemmaB_band_bounds,\n"
        "      kappaHigh_le_closed := by\n"
        "        simpa [certificateFromBundle] using lemmaB_closed_bound,\n"
        "      cEnvelope_nonneg := by\n"
        "        simpa using cEnvelopeBase_nonneg,\n"
        "      epsPhi_nonneg := by\n"
        "        simpa using epsPhiBound_nonneg,\n"
        "      epsL_nonneg := by\n"
        "        simpa using epsLBound_nonneg,\n"
        "      epsKappa_nonneg := by\n"
        "        simpa using epsKappaBound_nonneg,\n"
        "      envelope_closed := by\n"
        "        simpa using cEnvelopeClosedEqBaseInflated }\n",
        "",
        "end ERURH",
        "",
    ]

    lean_path.write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate Lean certificate values for ERURH.")
    parser.add_argument(
        "--release-dir",
        type=Path,
        default=DEFAULT_RELEASE_DIR,
        help="Directory containing ERURH formal artefacts.",
    )
    parser.add_argument(
        "--constants-path",
        type=Path,
        default=DEFAULT_CONSTANTS_PATH,
        help="Path to constants_global.json with baseline envelope.",
    )
    parser.add_argument(
        "--out-json",
        type=Path,
        default=DEFAULT_OUT_JSON,
        help="Destination JSON payload capturing the rational certificate values.",
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        default=DEFAULT_LEAN_OUT,
        help="Destination Lean module path.",
    )
    parser.add_argument(
        "--bounds-path",
        type=Path,
        default=DEFAULT_RATIONAL_BOUNDS,
        help="Path to rational_bounds.json with reference inequalities.",
    )
    args = parser.parse_args()

    release_dir = args.release_dir.resolve()
    constants_path = args.constants_path.resolve()
    bounds_path = args.bounds_path.resolve()

    values, sources = _load_certificate_values(release_dir, constants_path)
    bounds_payload = _read_json(bounds_path)
    la_closed_entry = bounds_payload["bounds"]["L_A_closed"]
    la_closed_num = int(la_closed_entry["numerator"])
    la_closed_den = int(la_closed_entry["denominator"])

    payload = {
        "values": values,
        "sources": sources,
    }
    args.out_json.resolve().parent.mkdir(parents=True, exist_ok=True)
    args.out_json.resolve().write_text(json.dumps(payload, indent=2), encoding="utf-8")

    if args.lean_out:
        args.lean_out.resolve().parent.mkdir(parents=True, exist_ok=True)
        write_lean_module(values, args.lean_out.resolve(), la_closed_num, la_closed_den)


if __name__ == "__main__":
    main()
