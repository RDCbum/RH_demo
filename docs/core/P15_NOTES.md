# P15 notes: RMS semantic-to-table bridge

## What was added
- New certificate JSON: `data/releases/erurh-v2-core/formal/rms_mode_bridge.json`
  (mirrored to `data/docs/paper/rms_mode_bridge.json`).
- New generator: `tools/make_rms_mode_bridge.py` producing
  `lean/formal_proofs/ERURH/Alpha/GeneratedRMSModeBridge.lean`.
- New checker: `tools/check_rms_mode_bridge.py`, wired into `scripts/verify_gate.py`.

## What the bridge provides
- Definitions `sWit` and `uWit` per window, with Lean proofs that:
  - `sWit w` lies in `ctx_real_window_interval w`.
  - `uWit w ≤ ctx_real.RMS_mode w`.
- Lemma `ctx_real_rms_mode_ge_semantic` that proves
  `ctx_real.RMS_mode w ≥ rms_semantic w` **assuming** the explicit bound
  `ctx_real_logR_alpha_upper w : |logR_alpha (sWit w)| ≤ uWit w`.

## Remaining missing piece
- The bridge still needs a proof of `ctx_real_logR_alpha_upper w`.
  This is the analytic inequality connecting `logR_alpha` at the witness point to
  the numeric bound `uWit`. It is not derivable from data alone with current definitions.

## Evidence
- `docs/core/P15_B1_BRIDGE_PROOF.log`: the updated bridge try file now compiles given `ctx_real_logR_alpha_upper`.
- `docs/core/P15_BUILD.txt`, `docs/core/P15_GATE_FULL.txt`: full build and gate run after adding the bridge certificate.
