# P14 bridge blockers (RMS semantic -> table)

Try file: `docs/core/P14_B1_BRIDGE_Try.lean`
Log: `docs/core/P14_B1_BRIDGE_TRY.log`

## First blocking goal
```lean
⊢ Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window ≥ K
```

## Why this blocks
- `rms_semantic` is defined as the infimum of `|logR_alpha|` over the window interval.
- `ctx_real.RMS_mode` is a numeric table generated from JSON with no semantic linkage.
- There is no lemma (or certificate) stating that the table bounds or equals the semantic RMS.

## Minimal bridge needed
A statement tying the data table to the semantic definition, for example:
```lean
lemma ctx_real_rms_mode_ge_semantic
  (w : Alpha.GeneratedRMSContext.ctx_real.Window) :
  Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≥ Alpha.rms_semantic w
```
or, equivalently, a certified hypothesis that for each window:
```lean
forall s ∈ window_interval w, |logR_alpha s| ≥ K -> ctx_real.RMS_mode w ≥ K
```

## Proposed route (least downstream change)
- Keep the numeric table as is, but add a certificate/prop generated from data that
  `ctx_real.RMS_mode` lower-bounds the semantic RMS on each window.
- This certificate can be added to the JSON and mirrored in Lean, then used to close
  the bridge without introducing new axioms.
