# Legacy Rebuild Notes (Definitions + Current Gap)

## Definitions in use
- `ERURH.ERU_mode_beta` (supercritical mode hypothesis): `lean/formal_proofs/ERURH/ERUModesCore.lean:11`.
- `ERURH.A1_mode` (existential RMS-mode witness): `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean:42`.
- `ERURH.RMSLocalHypothesis_of_A2` (A1 + A2 -> RMSLocalHypothesis): `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean:54`.

## Current window-bridge gap (legacy branch)
- `ERURH.Alpha.SupercriticalModeAppliesOnSomeCtxRealWindow`: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge_Legacy.lean:27`.
- `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge_Legacy.lean:34`.
- `ERURH.Alpha.PointwiseToRMSModeSomeWindow`: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge_Legacy.lean:83`.

## Where the gap is wired in
- `ERURH.RH_unconditional_core` currently assumes `ModeThresholdControlOnCtxRealWindowFamily` and derives
  `PointwiseToRMSModeSomeWindow`, then `A1_mode`: `lean/formal_proofs/ERURH/RH_Unconditional_Core.lean:12-34`.

## Legacy route target (existential window)
Goal is to re-derive `A1_mode` from `ERU_mode_beta` using an existential window argument,
without needing a fixed ctx_real window or a threshold-control lemma tied to `windowMinMax`.
That should remove the window-min >= s0 blocker while keeping A2 + gates intact.
