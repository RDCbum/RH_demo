"""Check RMS-mode bridge artefacts against RMS context data."""

from __future__ import annotations

import json
import sys
from decimal import Decimal
from fractions import Fraction
from pathlib import Path
from typing import Dict, Iterable, Mapping

try:
    from mpmath import iv, mp
except ImportError:  # pragma: no cover - exercised in gate when dependency missing
    iv = None
    mp = None

REPO_ROOT = Path(__file__).resolve().parents[1]
RELEASE_DIR = REPO_ROOT / "data" / "releases" / "erurh-v2-core" / "formal"
BRIDGE_JSON = RELEASE_DIR / "rms_mode_bridge.json"
RMS_CONTEXT_JSON = RELEASE_DIR / "rms_context.json"
BRIDGE_SCHEMA_VERSION = "rms_mode_bridge_schema_v1"
LOGR_DPS = 80
LOGR_DPS_MAX = 200


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


def _ensure_mpmath_available() -> None:
    if mp is None or iv is None:
        raise RuntimeError("mpmath is required for logR_alpha upper-bound certification")


def _primes_up_to(limit: int) -> Iterable[int]:
    if limit < 2:
        return []
    sieve = bytearray(b"\x01") * (limit + 1)
    sieve[0:2] = b"\x00\x00"
    max_p = int(limit ** 0.5)
    for p in range(2, max_p + 1):
        if sieve[p]:
            step = p
            start = p * p
            sieve[start : limit + 1 : step] = b"\x00" * (((limit - start) // step) + 1)
    return [idx for idx in range(2, limit + 1) if sieve[idx]]


def _fraction_to_interval(value: Fraction, *, dps: int) -> "iv.mpf":
    mp.dps = dps
    iv.dps = dps
    val = mp.mpf(value.numerator) / mp.mpf(value.denominator)
    eps = mp.eps * 4
    return iv.mpf([val - eps, val + eps])


def _fraction_to_mpf(value: Fraction, *, dps: int) -> "mp.mpf":
    mp.dps = dps
    return mp.mpf(value.numerator) / mp.mpf(value.denominator)


def _exp_floor_interval(s_wit: Fraction, *, dps: int, dps_max: int) -> tuple["iv.mpf", int, int]:
    while dps <= dps_max:
        mp.dps = dps
        iv.dps = dps
        s_iv = _fraction_to_interval(s_wit, dps=dps)
        x_iv = iv.exp(s_iv)
        n_lo = int(mp.floor(x_iv.a))
        n_hi = int(mp.floor(x_iv.b))
        if n_lo == n_hi:
            return x_iv, n_lo, dps
        dps *= 2
    raise ValueError(
        "exp(s_wit) interval spans multiple integers; increase precision or adjust s_wit"
    )


def _psi_interval(n_value: int, *, dps: int) -> "iv.mpf":
    mp.dps = dps
    iv.dps = dps
    total = iv.mpf([0, 0])
    for prime in _primes_up_to(n_value):
        logp = iv.log(prime)
        power = prime
        while power <= n_value:
            total += logp
            power *= prime
    return total


def _logr_interval(s_wit: Fraction) -> tuple["iv.mpf", int, "iv.mpf", int]:
    x_iv, n_floor, used_dps = _exp_floor_interval(
        s_wit, dps=LOGR_DPS, dps_max=LOGR_DPS_MAX
    )
    psi_iv = _psi_interval(n_floor, dps=used_dps)
    logr_iv = (psi_iv - x_iv) / x_iv
    return logr_iv, n_floor, x_iv, used_dps


def _check_logr_upper(
    bridge_windows: Mapping[int, Mapping[str, object]],
) -> list[str]:
    errors: list[str] = []
    _ensure_mpmath_available()
    for window_id, entry in bridge_windows.items():
        s_wit = _parse_rational(entry["s_wit"], label="s_wit")
        u_wit = _parse_rational(entry["u_wit"], label="u_wit")
        try:
            logr_iv, n_floor, _x_iv, used_dps = _logr_interval(s_wit)
        except Exception as exc:  # pragma: no cover - diagnostic path
            errors.append(f"window {window_id}: logR_alpha interval failed: {exc}")
            continue

        abs_iv = abs(logr_iv)
        u_wit_val = _fraction_to_mpf(u_wit, dps=used_dps)
        if abs_iv.b > u_wit_val:
            upper = mp.nstr(abs_iv.b, 16)
            u_str = mp.nstr(u_wit_val, 16)
            errors.append(
                "window {wid}: |logR_alpha(s_wit)| upper {upper} > u_wit {u_wit}"
                " (floor exp(s_wit)={n_floor}, dps={dps})".format(
                    wid=window_id,
                    upper=upper,
                    u_wit=u_str,
                    n_floor=n_floor,
                    dps=used_dps,
                )
            )
    return errors


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

    errors.extend(_check_logr_upper(bridge_windows))

    if errors:
        print("RMS mode bridge check failed:", file=sys.stderr)
        for err in errors:
            print(f"  {err}", file=sys.stderr)
        sys.exit(1)

    print("OK: RMS mode bridge certificate matches RMS context data.")


if __name__ == "__main__":
    main()
