# RB41 missing bridge fact (B.1)

Observation
- In `ctx_real`, `RMS_mode` is a fixed table (`rmsModeList`) and `RMS_alpha` is the constant `cEnvelopeCtx`.
- There is no definitional link between `logR_alpha` (from `ERU_mode_beta`) and `RMS_mode`.

Missing bridge (proposed lemma)
A new analytic lemma is required to connect pointwise growth of `logR_alpha` on a window
with the numerical RMS-mode table for `ctx_real`. A minimal statement would be:

```lean
lemma rms_mode_lower_bound_of_pointwise
  (w : ERURH.Alpha.GeneratedRMSContext.ctx_real.Window)
  (K : ℝ)
  (hpoint : ∀ s ∈ window_interval w,
    |ERURH.logR_alpha s| ≥ K) :
  ERURH.Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≥ K
```

where `window_interval` is the analytic window underlying `RMS_mode`.

Interpretation
- Without a formal definition that ties `RMS_mode w` to an L2/L∞ norm of `logR_alpha` on
  the window, the inequality above is not derivable in Lean.
- This is the atomic bridge fact needed to complete Lemma B.1 and thus `mode_to_rms_mode`.

Proposed Lean home
- `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_PointwiseToRMS.lean` or a new
  `lean/formal_proofs/ERURH/Alpha/RMSModeBounds.lean` that formalizes window intervals.
