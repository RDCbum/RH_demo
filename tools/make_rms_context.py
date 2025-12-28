"""Generate RMS context artefacts for Plan B (Route B)."""

from __future__ import annotations

import argparse
import json
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Dict, List, Mapping, MutableMapping, Sequence

DEFAULT_RELEASE_DIR = Path("data") / "releases" / "erurh-v2-core" / "formal"
DEFAULT_IN_FILE = "rms_context.json"
DEFAULT_OUT_JSON = Path("data") / "docs" / "paper" / "rms_context.json"
DEFAULT_LEAN_OUT = Path("lean") / "formal_proofs" / "ERURH" / "Alpha" / "GeneratedRMSContext.lean"
SCHEMA_VERSION = "rms_context_schema_v1"


def _load_json(path: Path) -> Dict[str, object]:
    try:
        text = path.read_text(encoding="utf-8")
    except FileNotFoundError as exc:
        raise FileNotFoundError(f"Missing RMS context artefact: {path}") from exc
    try:
        return json.loads(text, parse_float=Decimal)
    except json.JSONDecodeError as exc:
        raise ValueError(f"Malformed JSON in {path}: {exc}") from exc


def _parse_rational(value: object, *, label: str) -> Fraction:
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


def _fraction_to_str(value: Fraction) -> str:
    if value.denominator == 1:
        return f"{value.numerator}/1"
    return f"{value.numerator}/{value.denominator}"


def _rat_literal(value: Fraction) -> str:
    num = value.numerator
    den = value.denominator
    return f"(({num}) : ℚ) / ({den})"


def _validate_schema(data: Mapping[str, object]) -> Dict[str, object]:
    if data.get("version") != SCHEMA_VERSION:
        raise ValueError(f"Expected version '{SCHEMA_VERSION}', got '{data.get('version')}'")
    n_windows = data.get("n_windows")
    if not isinstance(n_windows, int) or n_windows < 1:
        raise ValueError("n_windows must be a positive integer")
    windows = data.get("windows")
    if not isinstance(windows, list) or len(windows) != n_windows:
        raise ValueError("windows must be a list of length n_windows")
    allowed_keys = {"id", "RMS_mode", "RMS_low", "RMS_tail", "label", "s_min", "s_max"}
    ids = set()
    for entry in windows:
        if not isinstance(entry, Mapping):
            raise TypeError("Each window entry must be an object")
        extra = set(entry.keys()) - allowed_keys
        if extra:
            raise KeyError(f"Unexpected keys in window entry: {sorted(extra)}")
        if "id" not in entry:
            raise KeyError("Each window entry must have an id")
        if not isinstance(entry["id"], int):
            raise TypeError("Window id must be an integer")
        ids.add(entry["id"])
        for key in ("RMS_mode", "RMS_low", "RMS_tail"):
            if key not in entry:
                raise KeyError(f"Window entry missing '{key}'")
        for key in ("s_min", "s_max"):
            if key not in entry:
                raise KeyError(f"Window entry missing '{key}'")
    if ids != set(range(n_windows)):
        raise ValueError("Window ids must cover 0..n_windows-1")
    return dict(data)


def _normalize_payload(data: Mapping[str, object]) -> Dict[str, object]:
    payload = _validate_schema(data)
    n_windows = payload["n_windows"]
    windows = list(payload["windows"])
    windows.sort(key=lambda w: int(w["id"]))

    def normalize_entry(entry: Mapping[str, object]) -> Dict[str, object]:
        out: Dict[str, object] = {"id": int(entry["id"])}
        out["RMS_mode"] = _fraction_to_str(_parse_rational(entry["RMS_mode"], label="RMS_mode"))
        out["RMS_low"] = _fraction_to_str(_parse_rational(entry["RMS_low"], label="RMS_low"))
        out["RMS_tail"] = _fraction_to_str(_parse_rational(entry["RMS_tail"], label="RMS_tail"))
        if "label" in entry:
            out["label"] = entry["label"]
        out["s_min"] = _fraction_to_str(_parse_rational(entry["s_min"], label="s_min"))
        out["s_max"] = _fraction_to_str(_parse_rational(entry["s_max"], label="s_max"))
        return out

    normalized = {
        "version": payload["version"],
        "n_windows": n_windows,
        "C_envelope_ctx": _fraction_to_str(
            _parse_rational(payload["C_envelope_ctx"], label="C_envelope_ctx")
        ),
        "c_low": _fraction_to_str(_parse_rational(payload["c_low"], label="c_low")),
        "c_tail": _fraction_to_str(_parse_rational(payload["c_tail"], label="c_tail")),
        "windows": [normalize_entry(w) for w in windows],
    }
    return normalized


def _emit_list(name: str, values: Sequence[Fraction]) -> List[str]:
    entries = ", ".join(_rat_literal(value) for value in values)
    return [f"def {name} : List ℚ := [{entries}]"]


def _emit_lookup(name: str, list_name: str) -> List[str]:
    return [
        f"def {name} (w : Fin n_windows) : ℚ := by",
        f"  refine {list_name}.get ⟨w.1, ?_⟩",
        f"  simpa [{list_name}, n_windows] using w.isLt",
        "",
    ]


def _emit_cast(name: str, rat_name: str) -> List[str]:
    return [f"def {name} (w : Fin n_windows) : ℝ := ({rat_name} w : ℝ)", ""]


def write_lean_module(payload: Mapping[str, object], lean_path: Path) -> None:
    n_windows = int(payload["n_windows"])
    c_envelope_ctx = _parse_rational(payload["C_envelope_ctx"], label="C_envelope_ctx")
    c_low = _parse_rational(payload["c_low"], label="c_low")
    c_tail = _parse_rational(payload["c_tail"], label="c_tail")
    windows = list(payload["windows"])
    windows.sort(key=lambda w: int(w["id"]))

    rms_mode_vals = [_parse_rational(w["RMS_mode"], label="RMS_mode") for w in windows]
    rms_low_vals = [_parse_rational(w["RMS_low"], label="RMS_low") for w in windows]
    rms_tail_vals = [_parse_rational(w["RMS_tail"], label="RMS_tail") for w in windows]
    window_min_vals = [_parse_rational(w["s_min"], label="s_min") for w in windows]
    window_max_vals = [_parse_rational(w["s_max"], label="s_max") for w in windows]
    window_len_vals = [wmax - wmin for wmin, wmax in zip(window_min_vals, window_max_vals)]
    window_len_max = max(window_len_vals)
    window_min_max = max(window_min_vals)
    window_min_max_index = window_min_vals.index(window_min_max)

    lines: List[str] = []
    lines.append("-- This file is auto-generated by tools.make_rms_context.py")
    lines.append("-- Do not edit manually.")
    lines.append("")
    lines.append("import Mathlib")
    lines.append("import ERURH.ERURH_A2Hypotheses")
    lines.append("")
    lines.append(f"def n_windows : Nat := {n_windows}")
    lines.append("")
    lines.append(f"@[simp] def cEnvelopeCtxRat : ℚ := {_rat_literal(c_envelope_ctx)}")
    lines.append(f"@[simp] def cLowRat : ℚ := {_rat_literal(c_low)}")
    lines.append(f"@[simp] def cTailRat : ℚ := {_rat_literal(c_tail)}")
    lines.append(f"@[simp] def windowLenMaxRat : ℚ := {_rat_literal(window_len_max)}")
    lines.append(f"@[simp] def windowMinMaxRat : ℚ := {_rat_literal(window_min_max)}")
    lines.append("")
    lines.append("def cEnvelopeCtx : ℝ := (cEnvelopeCtxRat : ℝ)")
    lines.append("def cLow : ℝ := (cLowRat : ℝ)")
    lines.append("def cTail : ℝ := (cTailRat : ℝ)")
    lines.append("def windowLenMax : ℝ := (windowLenMaxRat : ℝ)")
    lines.append("def windowMinMax : ℝ := (windowMinMaxRat : ℝ)")
    lines.append(
        f"def windowMinMaxIndex : Fin n_windows := ⟨{window_min_max_index}, by decide⟩"
    )
    lines.append("")
    lines += _emit_list("rmsModeList", rms_mode_vals)
    lines += _emit_list("rmsLowList", rms_low_vals)
    lines += _emit_list("rmsTailList", rms_tail_vals)
    lines += _emit_list("windowMinList", window_min_vals)
    lines += _emit_list("windowMaxList", window_max_vals)
    lines.append("")
    lines += _emit_lookup("rmsModeRat", "rmsModeList")
    lines += _emit_lookup("rmsLowRat", "rmsLowList")
    lines += _emit_lookup("rmsTailRat", "rmsTailList")
    lines += _emit_lookup("windowMinRat", "windowMinList")
    lines += _emit_lookup("windowMaxRat", "windowMaxList")
    lines.append("")
    lines += _emit_cast("rmsMode", "rmsModeRat")
    lines += _emit_cast("rmsLow", "rmsLowRat")
    lines += _emit_cast("rmsTail", "rmsTailRat")
    lines += _emit_cast("windowMin", "windowMinRat")
    lines += _emit_cast("windowMax", "windowMaxRat")
    lines.append("def window_interval (w : Fin n_windows) : Set ℝ := Set.Icc (windowMin w) (windowMax w)")
    lines.append("")
    lines.append("theorem window_min_le_max (w : Fin n_windows) : windowMin w ≤ windowMax w := by")
    lines.append(
        "  fin_cases w <;> norm_num [windowMin, windowMax, windowMinRat, windowMaxRat,"
        " windowMinList, windowMaxList, n_windows]"
    )
    lines.append("")
    lines.append("theorem window_interval_nonempty (w : Fin n_windows) : Set.Nonempty (window_interval w) := by")
    lines.append("  refine ⟨windowMin w, ?_⟩")
    lines.append("  exact ⟨le_rfl, window_min_le_max w⟩")
    lines.append("")
    lines.append("theorem windowMinMax_eq : windowMinMax = windowMin windowMinMaxIndex := by")
    lines.append(
        "  simp [windowMinMax, windowMinMaxRat, windowMin, windowMinRat, windowMinList,"
        " windowMinMaxIndex, n_windows]"
    )
    lines.append("")
    lines.append("def ctx_real : _root_.ERURH.RMSLocalContext :=")
    lines.append("  { Window := Fin n_windows")
    lines.append("    RMS_alpha := fun _ => cEnvelopeCtx")
    lines.append("    RMS_mode := rmsMode")
    lines.append("    RMS_low := rmsLow")
    lines.append("    RMS_tail := rmsTail")
    lines.append("    c_low := cLow")
    lines.append("    c_tail := cTail")
    lines.append("    c_low_nonneg := by")
    lines.append("      norm_num [cLow, cLowRat]")
    lines.append("    c_tail_nonneg := by")
    lines.append("      norm_num [cTail, cTailRat]")
    lines.append("    RMS_tail_bound_simple := by")
    lines.append("      intro w")
    lines.append(
        "      fin_cases w <;> norm_num [rmsTail, rmsTailRat, rmsTailList, cTail, cTailRat, n_windows]"
    )
    lines.append("    RMS_decomp := by")
    lines.append("      intro w")
    lines.append(
        "      fin_cases w <;> norm_num [rmsMode, rmsLow, rmsTail, rmsModeRat, rmsLowRat,"
        " rmsTailRat, rmsModeList, rmsLowList, rmsTailList, cEnvelopeCtx, cEnvelopeCtxRat,"
        " n_windows]"
    )
    lines.append("  }")
    lines.append("")
    lines.append("theorem ctx_real_A2Low : _root_.ERURH.A2Low_RMS ctx_real := by")
    lines.append("  dsimp [_root_.ERURH.A2Low_RMS, ctx_real]")
    lines.append("  intro w")
    lines.append(
        "  fin_cases w <;> norm_num [rmsLow, rmsLowRat, rmsLowList, cLow, cLowRat, n_windows]"
    )
    lines.append("")
    lines.append("theorem ctx_real_A2Tail : _root_.ERURH.A2Tail_RMS ctx_real := by")
    lines.append("  simpa [_root_.ERURH.A2Tail_RMS] using ctx_real.RMS_tail_bound_simple")
    lines.append("")
    lines.append(
        "abbrev ERURH.Alpha.GeneratedRMSContext.ctx_real : _root_.ERURH.RMSLocalContext :="
        " _root_.ctx_real"
    )
    lines.append(
        "abbrev ERURH.Alpha.GeneratedRMSContext.ctx_real_A2Low :"
        " _root_.ERURH.A2Low_RMS ERURH.Alpha.GeneratedRMSContext.ctx_real :="
        " _root_.ctx_real_A2Low"
    )
    lines.append(
        "abbrev ERURH.Alpha.GeneratedRMSContext.ctx_real_A2Tail :"
        " _root_.ERURH.A2Tail_RMS ERURH.Alpha.GeneratedRMSContext.ctx_real :="
        " _root_.ctx_real_A2Tail"
    )
    lines.append(
        "abbrev ERURH.Alpha.GeneratedRMSContext.ctx_real_window_interval :"
        " ERURH.Alpha.GeneratedRMSContext.ctx_real.Window -> Set ℝ :="
        " _root_.window_interval"
    )
    lines.append(
        "abbrev ERURH.Alpha.GeneratedRMSContext.ctx_real_window_interval_nonempty :"
        " ∀ w, Set.Nonempty (ERURH.Alpha.GeneratedRMSContext.ctx_real_window_interval w) :="
        " _root_.window_interval_nonempty"
    )
    lines.append("")

    lean_path.write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate RMS context artefacts for ERURH.")
    parser.add_argument(
        "--release-dir",
        type=Path,
        default=DEFAULT_RELEASE_DIR,
        help="Directory containing frozen RMS context JSON.",
    )
    parser.add_argument(
        "--in",
        dest="in_file",
        type=str,
        default=DEFAULT_IN_FILE,
        help="Input RMS context JSON filename (within release-dir).",
    )
    parser.add_argument(
        "--out-json",
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

    input_path = args.release_dir / args.in_file
    payload = _load_json(input_path)
    normalized = _normalize_payload(payload)

    args.out_json.resolve().parent.mkdir(parents=True, exist_ok=True)
    args.out_json.resolve().write_text(json.dumps(normalized, indent=2), encoding="utf-8")

    if args.lean_out:
        args.lean_out.resolve().parent.mkdir(parents=True, exist_ok=True)
        write_lean_module(normalized, args.lean_out.resolve())


if __name__ == "__main__":
    main()
