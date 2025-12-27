# P16 logR_alpha upper certificate (NOAX)

## Lean-first audit
- `ERURH.logR_alpha` is noncomputable (`ERURH/ERUModesCore.lean`) and defined as `AlphaPsi.E (exp s) / exp s`.
- `AlphaPsi.E` is definitionally `ERURH.NT.E`, and `ERURH.NT.psi` uses `Lambda` with `Classical.choose` (`ERURH/NumberTheory/VonMangoldt.lean`).
- There is no existing lemma in the repo that bounds `|logR_alpha s|` on `ctx_real_window_interval`; `rg -n "logR_alpha"` only finds the mode/inertia scaffolding.
- Conclusion: a direct Lean proof of `|logR_alpha (sWit w)| <= uWit w` is not achievable with the current stack.

## Gate-certified closure
We certify `ctx_real_logR_alpha_upper` externally and fail the gate if it does not hold.

Certificate inputs (frozen data):
- `data/releases/erurh-v2-core/formal/rms_mode_bridge.json` provides `s_wit` and `u_wit`.
- `data/releases/erurh-v2-core/formal/rms_context.json` provides the window interval for `s_wit`.

Checker implementation:
- Script: `tools/check_rms_mode_bridge.py` (extended).
- Method:
  - Compute `x = exp(s_wit)` using interval arithmetic.
  - Verify `floor(x)` is stable across the interval.
  - Compute `psi(floor(x)) = sum_{p^k <= floor(x)} log p` with interval logs.
  - Form `logR_alpha(s_wit) = (psi(x) - x) / x` and check `|logR_alpha(s_wit)| <= u_wit`.
- Implementation uses `mpmath.iv` with `LOGR_DPS=80` for outward-rounded intervals.

Repro commands:
- `python tools/check_rms_mode_bridge.py`
- `python scripts/verify_gate.py`

This keeps NOAX intact: no new `axiom/constant/opaque` declarations are introduced; the inequality is enforced by the gate certificate.
