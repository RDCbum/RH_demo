# P22 Window-bridge blockers

## First failing goal (Lean)

From `docs/core/P22_WINDOW_BRIDGE_TRY.log`:

Goal:
`|logR_alpha s| ≥ Real.exp ((β - 1 / 2) * s)`
with
`β : ℝ`, `hβ : β > 1/2`, `hmode : ERU_mode_beta β`,
`s ∈ GeneratedRMSContext.ctx_real_window_interval ctx_real_window`.

## Minimal missing fact

We need a lemma that transports the supercritical-mode bound to the fixed
`ctx_real` window interval. Concretely, either:

- `ERU_mode_beta β` implies the pointwise lower bound for all
  `s ∈ ctx_real_window_interval ctx_real_window`, or
- `ERU_mode_beta β` provides a threshold `s0`, and we can prove that the window
  interval lies above `s0` (i.e. `windowMin` is large enough).

This is exactly the content of `ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow`.
