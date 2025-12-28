# P28 Window-bridge proof draft (step ii diagnosis)

## Setup (from Lean)

`ERU_mode_beta` (Lean, `lean/formal_proofs/ERURH/ERUModesCore.lean:11-13`) says:
there exists `s0` such that for all `s ≥ s0`,
`|logR_alpha s| ≥ exp((β - 1/2) * s)`.

`SupercriticalModeAppliesOnCtxRealWindow` (Lean, `ModeToRMSMode_WindowBridge.lean:15-18`)
requires the same bound for all `s` in the fixed interval
`I_ctx = ctx_real_window_interval ctx_real_window`.

## Step (ii): windowMin ≥ s0

Goal: show that for the `s0` extracted from `ERU_mode_beta β`,
every `s ∈ I_ctx` satisfies `s ≥ s0`. Equivalently,
`windowMin ctx_real_window ≥ s0`.

This is **not derivable** from the current definition of `ERU_mode_beta`:

- `ERU_mode_beta β` only asserts *existence* of some threshold `s0`.
- There is no constraint that bounds `s0` above or below.
- Hence `s0` could be arbitrarily large, and no fixed window interval
  can be shown to lie above it without an extra hypothesis.

Conclusion: Step (ii) cannot be proved from the current Lean definitions
without introducing a new analytic assumption or changing the definition
of `ERU_mode_beta`.

## Minimal reformulation (if we want derivability)

Two minimal options, each requiring explicit changes:

1) **Strengthen the mode definition** to include the window threshold.
   Define a variant:
   ```
   def ERU_mode_beta_at_window (β : ℝ) : Prop :=
     ∃ s0 ≤ windowMin ctx_real_window, ∀ {s : ℝ}, s ≥ s0 →
       |logR_alpha s| ≥ exp((β - 1/2) * s)
   ```
   Then `SupercriticalModeAppliesOnCtxRealWindow` follows by monotonicity.

   Files to adjust:
   - `lean/formal_proofs/ERURH/ERUModesCore.lean` (new definition or replace usage)
   - `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean`
     (bridge uses the strengthened predicate)
   - any modules referencing `ERU_mode_beta` in Route B.

2) **Add an explicit hypothesis**:
   ```
   def WindowAboveModeThreshold : Prop :=
     ∀ β > 1/2, ERU_mode_beta β → ∀ s ∈ I_ctx, s ≥ s0(β)
   ```
   This is effectively the same analytic content as the current window-bridge.
   It keeps `ERU_mode_beta` unchanged but makes the missing step explicit.

Given the current design, the intended resolution is paper-only:
`SupercriticalModeAppliesOnCtxRealWindow` remains the analytic gap and must be
proved (or cited) in the paper, since it cannot be derived from `ERU_mode_beta`
alone.
