"""Check RMS-mode bridge artefacts against RMS context data."""

from __future__ import annotations

import json
import sys
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Dict, Mapping

REPO_ROOT = Path(__file__).resolve().parents[1]
RELEASE_DIR = REPO_ROOT / "data" / "releases" / "erurh-v2-core" / "formal"
BRIDGE_JSON = RELEASE_DIR / "rms_mode_bridge.json"
RMS_CONTEXT_JSON = RELEASE_DIR / "rms_context.json"
BRIDGE_SCHEMA_VERSION = "rms_mode_bridge_schema_v1"


def _load_json(path: Path) -> Dict[str, object]:
    text = path.read_text(encoding="utf-8")
    return json.loads(text, parse_float=Decimal)


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


def _index_windows(data: Mapping[str, object], *, required_keys: tuple[str, ...]) -> Dict[int, Mapping[str, object]]:
    windows = data.get("windows")
    if not isinstance(windows, list):
        raise ValueError("windows must be a list")
    out: Dict[int, Mapping[str, object]] = {}
    for entry in windows:
        if not isinstance(entry, Mapping):
            raise TypeError("Window entry must be an object")
        for key in required_keys:
            if key not in entry:
                raise KeyError(f"Window entry missing '{key}'")
        window_id = entry.get("id")
        if not isinstance(window_id, int):
            raise TypeError("Window id must be an integer")
        out[window_id] = entry
    return out


def main() -> None:
    if not BRIDGE_JSON.exists():
        print(f"Missing RMS mode bridge JSON: {BRIDGE_JSON}", file=sys.stderr)
        sys.exit(1)
    if not RMS_CONTEXT_JSON.exists():
        print(f"Missing RMS context JSON: {RMS_CONTEXT_JSON}", file=sys.stderr)
        sys.exit(1)

    bridge_data = _load_json(BRIDGE_JSON)
    if bridge_data.get("version") != BRIDGE_SCHEMA_VERSION:
        print(
            f"Expected bridge version '{BRIDGE_SCHEMA_VERSION}', got '{bridge_data.get('version')}'",
            file=sys.stderr,
        )
        sys.exit(1)

    rms_data = _load_json(RMS_CONTEXT_JSON)
    rms_windows = _index_windows(rms_data, required_keys=("id", "RMS_mode", "s_min", "s_max"))
    bridge_windows = _index_windows(bridge_data, required_keys=("id", "s_wit", "u_wit"))

    errors = []
    for window_id, entry in bridge_windows.items():
        if window_id not in rms_windows:
            errors.append(f"bridge window {window_id} missing from rms_context")
            continue
        rms_entry = rms_windows[window_id]
        s_min = _parse_rational(rms_entry["s_min"], label="s_min")
        s_max = _parse_rational(rms_entry["s_max"], label="s_max")
        rms_mode = _parse_rational(rms_entry["RMS_mode"], label="RMS_mode")
        s_wit = _parse_rational(entry["s_wit"], label="s_wit")
        u_wit = _parse_rational(entry["u_wit"], label="u_wit")

        if not (s_min <= s_wit <= s_max):
            errors.append(
                f"window {window_id}: s_wit {s_wit} not in [{s_min}, {s_max}]"
            )
        if u_wit > rms_mode:
            errors.append(
                f"window {window_id}: u_wit {u_wit} > RMS_mode {rms_mode}"
            )

    if errors:
        print("RMS mode bridge check failed:", file=sys.stderr)
        for err in errors:
            print(f"  {err}", file=sys.stderr)
        sys.exit(1)

    print("OK: RMS mode bridge certificate matches RMS context data.")


if __name__ == "__main__":
    main()
