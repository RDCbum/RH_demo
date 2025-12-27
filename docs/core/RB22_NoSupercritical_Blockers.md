# RB22 blockers

First missing lemma (goal from `docs/core/RB22_NoSupercritical_Try.log`):
```lean
⊢ ∃ w,
    ∃ K > Alpha.GeneratedRMSContext.ctx_real.c_low + Alpha.GeneratedRMSContext.ctx_real.c_tail + C_envelope_formal,
      Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≥ K
```

Proposed Lean home: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode.lean` (or adjacent to `ERURH/ERUModesAlpha.lean`).
Paper mapping: RB16_A1_PROOF_PLAN step 2 (mode growth -> RMS_mode window); currently a new analytic result if not already in the paper.
