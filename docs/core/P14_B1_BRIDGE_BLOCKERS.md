# P14 bridge blockers (RMS semantic -> table)

Try file: `docs/core/P14_B1_BRIDGE_Try.lean`
Log: `docs/core/P14_B1_BRIDGE_TRY.log`

## First blocking goal (updated)
```lean
⊢ Alpha.SupercriticalModeAppliesOnCtxRealWindow
```

## Why this blocks
- `ERU_mode_beta` only provides lower bounds for `s ≥ s0`, while the RMS window interval
  is a fixed compact interval coming from gate data.
- The explicit bridge now isolates the missing analytic step:
  `SupercriticalModeAppliesOnCtxRealWindow` states that a supercritical mode forces
  the pointwise lower bound on the **specific** window interval.
- The table/semantic bridge is now handled by the gate-certified lemma
  `GeneratedRMSModeBridge.ctx_real_rms_mode_ge_semantic`, assuming
  `ctx_real_logR_alpha_upper`.

## Minimal bridge needed
The remaining analytic bridge is now explicit:
```lean
def SupercriticalModeAppliesOnCtxRealWindow : Prop :=
  ∀ β, β > 1/2 → ERU_mode_beta β →
    ∀ s ∈ ctx_real_window_interval ctx_real_window,
      |logR_alpha s| ≥ exp((β - 1/2) * s)
```

## Proposed route (least downstream change)
- Keep the numeric table as is (already certified by gate).
- Treat `ctx_real_logR_alpha_upper` as a gate-certified side condition.
- Leave `SupercriticalModeAppliesOnCtxRealWindow` as the sole remaining analytic gap
  in Lean (explicit hypothesis, no axioms).
