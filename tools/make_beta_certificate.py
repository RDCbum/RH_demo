"""Generate beta inertia certificate artefacts."""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from pathlib import Path
from typing import Dict, Iterable, List, Mapping, Tuple

DEFAULT_RELEASE_DIR = Path("data") / "releases" / "erurh-v2-core" / "formal"
DEFAULT_INPUT = "beta_inertia_certificate.json"
DEFAULT_OUT_JSON = Path("data") / "docs" / "paper" / "beta_certificate.json"
DEFAULT_LEAN_OUT = Path("lean") / "formal_proofs" / "ERURH" / "Beta" / "GeneratedBetaCertificate.lean"


def _read_json(path: Path) -> Mapping[str, object]:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError as exc:
        raise FileNotFoundError(f"Missing artefact: {path}") from exc
    except json.JSONDecodeError as exc:
        raise ValueError(f"Malformed JSON in {path}: {exc}") from exc


def _require_mapping(value: object, *, source: str) -> Mapping[str, object]:
    if isinstance(value, Mapping):
        return value
    raise TypeError(f"Expected mapping in {source}, got {type(value)}")


def _require_int(value: object, *, source: str) -> int:
    if isinstance(value, bool):
        raise TypeError(f"Boolean not allowed where int expected in {source}")
    if isinstance(value, int):
        return value
    raise TypeError(f"Expected int in {source}, got {type(value)}")


def _read_rat(mapping: Mapping[str, object], key: str, *, source: str) -> Tuple[int, int]:
    if key not in mapping:
        raise KeyError(f"Key '{key}' missing in {source}")
    payload = _require_mapping(mapping[key], source=f"{source}.{key}")
    num = _require_int(payload.get("numerator"), source=f"{source}.{key}.numerator")
    den = _require_int(payload.get("denominator"), source=f"{source}.{key}.denominator")
    if den <= 0:
        raise ValueError(f"Expected positive denominator for {source}.{key}")
    return num, den


def _rat_literal(num: int, den: int) -> str:
    return f"(({num} : ℚ) / ({den} : ℚ))"


def _fraction(num: int, den: int) -> Fraction:
    return Fraction(num, den)


def _validate_positive(frac: Fraction, *, name: str) -> None:
    if frac <= 0:
        raise ValueError(f"Expected positive value for {name}, got {frac}")


def _validate_nonnegative(frac: Fraction, *, name: str) -> None:
    if frac < 0:
        raise ValueError(f"Expected nonnegative value for {name}, got {frac}")


def _validate_empty_windows(windows: Iterable[object]) -> None:
    if list(windows):
        raise ValueError("This generator currently supports only an empty windows list.")


def _emit_window_record(window: Mapping[str, object]) -> str:
    required = ["id", "s_left", "s_right", "s_mid", "rms_bound", "sup_bound"]
    for key in required:
        if key not in window:
            raise KeyError(f"Missing '{key}' in window record")
    num, den = _read_rat(window, "s_left", source="window")
    s_left = _rat_literal(num, den)
    num, den = _read_rat(window, "s_right", source="window")
    s_right = _rat_literal(num, den)
    num, den = _read_rat(window, "s_mid", source="window")
    s_mid = _rat_literal(num, den)
    num, den = _read_rat(window, "rms_bound", source="window")
    rms_bound = _rat_literal(num, den)
    num, den = _read_rat(window, "sup_bound", source="window")
    sup_bound = _rat_literal(num, den)
    window_id = window["id"]
    if not isinstance(window_id, str):
        raise TypeError("window.id must be a string")
    return (
        "    { id := \"" + window_id + "\", sLeft := " + s_left + ", sRight := "
        + s_right + ", sMid := " + s_mid + ", rmsBound := " + rms_bound
        + ", supBound := " + sup_bound + " }"
    )


def load_certificate(release_dir: Path) -> Dict[str, object]:
    path = release_dir / DEFAULT_INPUT
    payload = _read_json(path)
    strong = _require_mapping(payload.get("strong_inertia"), source="strong_inertia")
    global_cert = _require_mapping(payload.get("global_inertia"), source="global_inertia")

    c_rms_num, c_rms_den = _read_rat(strong, "C_RMS_beta", source="strong_inertia")
    s0_num, s0_den = _read_rat(strong, "S0_beta", source="strong_inertia")
    tail_num, tail_den = _read_rat(strong, "tail_rms_bound", source="strong_inertia")
    kernel_id = strong.get("kernel_id")
    if not isinstance(kernel_id, str):
        raise TypeError("strong_inertia.kernel_id must be a string")

    windows = strong.get("windows")
    if not isinstance(windows, list):
        raise TypeError("strong_inertia.windows must be a list")

    _validate_empty_windows(windows)

    if tail_num != 0:
        raise ValueError("tail_rms_bound must be zero for the current proof generator")

    _validate_positive(_fraction(c_rms_num, c_rms_den), name="C_RMS_beta")
    _validate_positive(_fraction(s0_num, s0_den), name="S0_beta")
    _validate_nonnegative(_fraction(tail_num, tail_den), name="tail_rms_bound")

    c_global_num, c_global_den = _read_rat(global_cert, "C_Global_beta", source="global_inertia")
    s0g_num, s0g_den = _read_rat(global_cert, "S0_global", source="global_inertia")
    smax_num, smax_den = _read_rat(global_cert, "Smax_global", source="global_inertia")
    sref_num, sref_den = _read_rat(global_cert, "sRef", source="global_inertia")

    _validate_positive(_fraction(c_global_num, c_global_den), name="C_Global_beta")
    _validate_positive(_fraction(s0g_num, s0g_den), name="S0_global")
    if _fraction(smax_num, smax_den) < _fraction(s0g_num, s0g_den):
        raise ValueError("Smax_global must be >= S0_global")

    return {
        "strong_inertia": {
            "C_RMS_beta": (c_rms_num, c_rms_den),
            "S0_beta": (s0_num, s0_den),
            "kernel_id": kernel_id,
            "tail_rms_bound": (tail_num, tail_den),
            "windows": windows,
        },
        "global_inertia": {
            "C_Global_beta": (c_global_num, c_global_den),
            "S0_global": (s0g_num, s0g_den),
            "Smax_global": (smax_num, smax_den),
            "sRef": (sref_num, sref_den),
        },
        "source": str(path.resolve()),
    }


def write_json(payload: Mapping[str, object], out_path: Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(payload, indent=2), encoding="utf-8")


def write_lean_module(payload: Mapping[str, object], lean_path: Path) -> None:
    strong = payload["strong_inertia"]
    global_cert = payload["global_inertia"]
    c_rms_num, c_rms_den = strong["C_RMS_beta"]
    s0_num, s0_den = strong["S0_beta"]
    tail_num, tail_den = strong["tail_rms_bound"]
    kernel_id = strong["kernel_id"]
    windows = strong["windows"]

    c_global_num, c_global_den = global_cert["C_Global_beta"]
    s0g_num, s0g_den = global_cert["S0_global"]
    smax_num, smax_den = global_cert["Smax_global"]
    sref_num, sref_den = global_cert["sRef"]

    window_lines: List[str] = []
    for window in windows:
        window_lines.append(_emit_window_record(window))

    if window_lines:
        windows_expr = "[\n" + ",\n".join(window_lines) + "\n  ]"
    else:
        windows_expr = "[]"

    lines: List[str] = []
    lines.append("-- This file is auto-generated by tools.make_beta_certificate.py")
    lines.append("-- Do not edit manually.")
    lines.append("")
    lines.append("import Mathlib")
    lines.append("import Mathlib.Tactic.NormNum")
    lines.append("")
    lines.append("import ERURH.Beta.InertiaCertificatesBeta")
    lines.append("import ERURH.Beta.GlobalInertiaBeta")
    lines.append("import ERURH.Beta.CompositeCertificateBeta")
    lines.append("")
    lines.append("namespace ERURH")
    lines.append("namespace Beta")
    lines.append("")
    lines.append("noncomputable def strongInertiaCertificate_beta_numeric : StrongInertiaCertificate_beta :=")
    lines.append("{")
    lines.append(f"  C_RMS_beta   := {_rat_literal(c_rms_num, c_rms_den)},")
    lines.append(f"  S0_beta      := {_rat_literal(s0_num, s0_den)},")
    lines.append(f"  kernelId     := \"{kernel_id}\",")
    lines.append(f"  windows      := {windows_expr},")
    lines.append(f"  tailRMSBound := {_rat_literal(tail_num, tail_den)}")
    lines.append("}")
    lines.append("")
    lines.append("noncomputable def globalInertiaCertificate_beta_numeric : GlobalInertiaCertificate_beta :=")
    lines.append("{")
    lines.append(f"  C_Global_beta := {_rat_literal(c_global_num, c_global_den)},")
    lines.append(f"  S0_global     := {_rat_literal(s0g_num, s0g_den)},")
    lines.append(f"  Smax_global   := {_rat_literal(smax_num, smax_den)},")
    lines.append(f"  sRef          := {_rat_literal(sref_num, sref_den)}")
    lines.append("}")
    lines.append("")
    lines.append("noncomputable def strongInertiaComposite_beta_numeric : StrongInertiaComposite_beta :=")
    lines.append("{")
    lines.append("  localCert  := strongInertiaCertificate_beta_numeric,")
    lines.append("  globalCert := globalInertiaCertificate_beta_numeric,")
    lines.append(f"  kernelId   := \"{kernel_id}\"")
    lines.append("}")
    lines.append("")
    lines.append("theorem strongInertiaCertificate_beta_numeric_correct :")
    lines.append("    StrongInertiaCertificateCorrect_beta strongInertiaCertificate_beta_numeric := by")
    lines.append("  dsimp [StrongInertiaCertificateCorrect_beta, strongInertiaCertificate_beta_numeric]")
    lines.append("  refine And.intro ?hC ?hrest")
    lines.append("  · norm_num")
    lines.append("  · refine And.intro ?hS0 ?hrest2")
    lines.append("    · norm_num")
    lines.append("    · refine And.intro ?hWindows ?hrest3")
    lines.append("      · simp")
    lines.append("      · refine And.intro ?hRms ?hTail")
    lines.append("        · simp")
    lines.append("        · have hC_nonneg : (0:ℝ) ≤ "
                 f"({_rat_literal(c_rms_num, c_rms_den)} : ℝ) := by\n"
                 "            norm_num")
    lines.append("          have hExp_nonneg : (0:ℝ) ≤ Real.exp (- "
                 f"({_rat_literal(s0_num, s0_den)} : ℝ) / 2) := by\n"
                 "            exact le_of_lt (Real.exp_pos _)")
    lines.append("          have hSq_nonneg : (0:ℝ) ≤ ("
                 f"({_rat_literal(s0_num, s0_den)} : ℝ) ^ 2) := by\n"
                 "            norm_num")
    lines.append("          have hCE : 0 ≤ "
                 f"({_rat_literal(c_rms_num, c_rms_den)} : ℝ) * Real.exp (- "
                 f"({_rat_literal(s0_num, s0_den)} : ℝ) / 2) := by\n"
                 "            exact mul_nonneg hC_nonneg hExp_nonneg")
    lines.append("          have hProd : 0 ≤ "
                 f"({_rat_literal(c_rms_num, c_rms_den)} : ℝ) * Real.exp (- "
                 f"({_rat_literal(s0_num, s0_den)} : ℝ) / 2) * "
                 f"(({_rat_literal(s0_num, s0_den)} : ℝ) ^ 2) := by\n"
                 "            exact mul_nonneg hCE hSq_nonneg")
    lines.append("          simpa using hProd")
    lines.append("")
    lines.append("theorem globalInertiaCertificate_beta_numeric_correct :")
    lines.append("    GlobalInertiaCertificateCorrect_beta globalInertiaCertificate_beta_numeric := by")
    lines.append("  dsimp [GlobalInertiaCertificateCorrect_beta, globalInertiaCertificate_beta_numeric]")
    lines.append("  constructor")
    lines.append("  · norm_num")
    lines.append("  constructor")
    lines.append("  · norm_num")
    lines.append("  · norm_num")
    lines.append("")
    lines.append("theorem strongInertiaComposite_beta_numeric_correct :")
    lines.append("    StrongInertiaCompositeCorrect_beta strongInertiaComposite_beta_numeric := by")
    lines.append("  exact And.intro strongInertiaCertificate_beta_numeric_correct ")
    lines.append("    globalInertiaCertificate_beta_numeric_correct")
    lines.append("")
    lines.append("end Beta")
    lines.append("end ERURH")
    lines.append("")
    lean_path.parent.mkdir(parents=True, exist_ok=True)
    lean_path.write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate beta inertia certificate artefacts.")
    parser.add_argument(
        "--release-dir",
        type=Path,
        default=DEFAULT_RELEASE_DIR,
        help="Directory containing formal proof JSON artefacts.",
    )
    parser.add_argument(
        "--out",
        type=Path,
        default=DEFAULT_OUT_JSON,
        help="Destination JSON path.",
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        default=DEFAULT_LEAN_OUT,
        help="Destination Lean module path.",
    )
    args = parser.parse_args()

    payload = load_certificate(args.release_dir.resolve())
    output_json = {
        "strong_inertia": {
            "C_RMS_beta": {"numerator": payload["strong_inertia"]["C_RMS_beta"][0],
                            "denominator": payload["strong_inertia"]["C_RMS_beta"][1]},
            "S0_beta": {"numerator": payload["strong_inertia"]["S0_beta"][0],
                        "denominator": payload["strong_inertia"]["S0_beta"][1]},
            "kernel_id": payload["strong_inertia"]["kernel_id"],
            "tail_rms_bound": {"numerator": payload["strong_inertia"]["tail_rms_bound"][0],
                               "denominator": payload["strong_inertia"]["tail_rms_bound"][1]},
            "windows": payload["strong_inertia"]["windows"],
        },
        "global_inertia": {
            "C_Global_beta": {"numerator": payload["global_inertia"]["C_Global_beta"][0],
                              "denominator": payload["global_inertia"]["C_Global_beta"][1]},
            "S0_global": {"numerator": payload["global_inertia"]["S0_global"][0],
                          "denominator": payload["global_inertia"]["S0_global"][1]},
            "Smax_global": {"numerator": payload["global_inertia"]["Smax_global"][0],
                            "denominator": payload["global_inertia"]["Smax_global"][1]},
            "sRef": {"numerator": payload["global_inertia"]["sRef"][0],
                     "denominator": payload["global_inertia"]["sRef"][1]},
        },
        "sources": {"beta_inertia_certificate": payload["source"]},
    }

    write_json(output_json, args.out.resolve())
    write_lean_module(payload, args.lean_out.resolve())


if __name__ == "__main__":
    main()
