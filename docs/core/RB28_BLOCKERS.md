# RB28 blockers

Lean attempt output: `docs/core/RB28_ModeToRMSMode_Try.log`.

First missing lemma (goal):
```lean
⊢ ∃ w,
    ∃ K > Alpha.GeneratedRMSContext.ctx_real.c_low + Alpha.GeneratedRMSContext.ctx_real.c_tail + C_envelope_formal,
      Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≥ K
```

This is the analytic bridge `mode_to_rms_mode` from RB22/RB27. It is not derivable from the current Lean infrastructure (only `ERU_mode_beta` and `ctx_real` definitions are available), so a new analytic lemma is required.
Proposed Lean home: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode.lean`.
Paper mapping: Section \ref{sec:no-supercritical}, Lemma B in `arxiv_submission/ERURH_Conditional_Proof.tex`.
