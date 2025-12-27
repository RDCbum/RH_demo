# RB34 ModeToRMSMode blockers

First failing goal (after RB40 window extraction):
```lean
⊢ ∃ K > Alpha.GeneratedRMSContext.ctx_real.c_low + Alpha.GeneratedRMSContext.ctx_real.c_tail + C_envelope_formal,
    Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window ≥ K
```

Missing lemma candidates:
- Sublemma B.1 (pointwise growth → RMS lower bound): bridge from the pointwise bound
  `∀ s ≥ s0, |logR_alpha s| ≥ exp((β-1/2)s)` to a lower bound on
  `Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window`.

Proposed Lean home:
- `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_PointwiseToRMS.lean` (B.1).
- A separate `Alpha/RMSModeBounds.lean` if we need window-interval formalization.

Paper anchor:
- `arxiv_submission/ERURH_Conditional_Proof.tex`, Section~\ref{sec:no-supercritical}, Lemma B.
  See `docs/core/RB41_MISSING_BRIDGE_FACT.md` for the missing bridge fact.
