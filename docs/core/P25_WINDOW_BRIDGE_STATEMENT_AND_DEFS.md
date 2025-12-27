# P25 Window-bridge statement and defs

## Lean statement: SupercriticalModeAppliesOnCtxRealWindow

Source: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean:15-18`

```lean
def SupercriticalModeAppliesOnCtxRealWindow : Prop :=
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
    ∀ s ∈ GeneratedRMSContext.ctx_real_window_interval ctx_real_window,
      |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)
```

## Lean definition: ERU_mode_beta

Source: `lean/formal_proofs/ERURH/ERUModesCore.lean:11-13`

```lean
def ERU_mode_beta (β : ℝ) : Prop :=
  ∃ s0 : ℝ, ∀ {s : ℝ}, s ≥ s0 →
    |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)
```

## What must be proved exactly

Given `β > 1/2` and `ERU_mode_beta β`, we must show the pointwise lower bound
`|logR_alpha s| ≥ exp((β - 1/2) * s)` for every `s` in the fixed window interval
`GeneratedRMSContext.ctx_real_window_interval ctx_real_window`.

Unpacked, this means:

1) From `ERU_mode_beta β`, extract a threshold `s0` such that the bound holds
   for all `s ≥ s0`.
2) Prove that every `s` in the window interval satisfies `s ≥ s0`
   (equivalently, `windowMin ctx_real_window ≥ s0`).
3) Conclude the bound for all `s` in the window interval.
