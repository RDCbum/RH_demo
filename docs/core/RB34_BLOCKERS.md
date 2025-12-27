# RB34 ModeToRMSMode blockers

First failing goal (from `docs/core/RB34_ModeToRMSMode_Try.log`):
```lean
⊢ ∃ w,
    ∃ K > Alpha.GeneratedRMSContext.ctx_real.c_low + Alpha.GeneratedRMSContext.ctx_real.c_tail + C_envelope_formal,
      Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≥ K
```

Missing lemma candidates:
- `ERURH.Alpha.mode_to_rms_mode` (Lemma B): bridge from `ERU_mode_beta` growth to an RMS_mode witness for `ctx_real`.
- Sublemma B.1 (pointwise growth → RMS lower bound): from `∀ s ≥ s0, |logR_alpha s| ≥ exp((β-1/2)s)` to a bound on the RMS-mode functional.
- Sublemma B.2 (window extraction): existence of a window `w` where the RMS_mode bound is realized.

Proposed Lean home:
- Primary lemma: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode.lean` (Lemma B).
- Potential sublemmas: `lean/formal_proofs/ERURH/ERUModesAlpha.lean` or a new `Alpha/RMSModeBounds.lean`.

Paper anchor:
- `arxiv_submission/ERURH_Conditional_Proof.tex`, Section~\ref{sec:no-supercritical}, Lemma B (see `docs/core/RB27_NO_SUPERCRITICAL_PAPER_OUTLINE.md`).
