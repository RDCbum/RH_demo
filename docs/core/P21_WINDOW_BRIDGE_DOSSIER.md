# P21 Window-bridge dossier

## What it asserts

`ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow` says:

For every real `β` with `β > 1/2`, if `ERURH.ERU_mode_beta β` holds, then for every
`s` in the fixed interval `GeneratedRMSContext.ctx_real_window_interval ctx_real_window`,
we have the pointwise lower bound:

`|logR_alpha s| ≥ exp((β - 1/2) * s)`.

## What must be proved to close it

- Show that the supercritical-mode hypothesis (`ERU_mode_beta β`) implies the same
  pointwise growth lower bound on the *specific* window interval used by `ctx_real`.
- This is a window-compatibility statement: the mode's lower bound must apply on the
  interval picked by the gate data, not just beyond some threshold `s0`.

## Constants and data involved

- `ctx_real_window` is the unique window for `ctx_real` (`n_windows = 1`).
- `GeneratedRMSContext.ctx_real_window_interval` is `window_interval` over that window.
- `window_interval` is `Set.Icc (windowMin w) (windowMax w)` with `windowMin/windowMax`
  coming from gate data (`windowMinList`, `windowMaxList` in
  `lean/formal_proofs/ERURH/Alpha/GeneratedRMSContext.lean`).

## Where it is used in the chain

- Definition: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean`
  (`SupercriticalModeAppliesOnCtxRealWindow`).
- Bridge lemma: `pointwise_to_RMS_mode_of_ctx_real_logR_alpha_upper_and_window_bridge`
  in the same file, used to derive `PointwiseToRMSMode` for `ctx_real`.
- Route B core: `lean/formal_proofs/ERURH/RH_Unconditional_Core.lean` depends on the
  derived `PointwiseToRMSMode` via the window-bridge hypothesis.
