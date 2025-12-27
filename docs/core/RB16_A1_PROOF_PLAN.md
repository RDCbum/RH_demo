# RB16 ModeToRMSMode proof plan (ERURH.Alpha.mode_to_rms_mode)

Lean statement (exact):
```lean
ERURH.Alpha.mode_to_rms_mode
  (β : ℝ) (hβ : β > (1/2 : ℝ)) (hmode : ERURH.ERU_mode_beta β) :
  ∃ w : ERURH.Alpha.GeneratedRMSContext.ctx_real.Window,
    ∃ K : ℝ,
      K > ERURH.Alpha.GeneratedRMSContext.ctx_real.c_low +
          ERURH.Alpha.GeneratedRMSContext.ctx_real.c_tail +
          ERURH.C_envelope_formal ∧
      ERURH.Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≥ K
```

Context and derivation
- `ctx_real_not_A1_mode` (see `docs/core/RB19_CTX_REAL_NONVACUITY.md`) shows
  `¬ ERURH.A1_mode ERURH.Alpha.GeneratedRMSContext.ctx_real`.
- `mode_to_rms_mode` combined with `ctx_real_not_A1_mode` yields
  `ERURH.no_supercritical_beta` in `lean/formal_proofs/ERURH/A1FromSupercriticalMode.lean`.

Dependencies (Lean definitions)
- `ERURH.ERU_mode_beta` in `lean/formal_proofs/ERURH/ERUModesCore.lean`.
- `ERURH.A1_mode` and `ERURH.RMSLocalContext` in `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`.
- `ERURH.Alpha.GeneratedRMSContext.ctx_real` in `lean/formal_proofs/ERURH/Alpha/GeneratedRMSContext.lean`.
- `ctx_real_not_A1_mode` in `lean/formal_proofs/ERURH/Alpha/CtxRealNonVacuityAudit.lean`.

Proof sketch (paper-first, then Lean)
1) Unpack `ERU_mode_beta β`: obtain `s0` such that for all `s ≥ s0`,
   `|logR_alpha s| ≥ exp((β - 1/2) * s)`.
2) Convert the pointwise growth lower bound into a lower bound on the RMS-mode
   functional for `ctx_real` (Lemma B.1).
3) Extract a concrete window `w : ctx_real.Window` that realizes the RMS-mode
   bound (Lemma B.2).
4) Choose `K` from the RMS-mode bound and show
   `K > ctx_real.c_low + ctx_real.c_tail + C_envelope_formal`.
5) Conclude `mode_to_rms_mode`.

Expected intermediate lemmas (RB34 blockers)
- B.1 pointwise growth → RMS-mode lower bound for `ctx_real`.
- B.2 window extraction: existence of a window achieving the RMS-mode bound.

Notes
- This is the remaining Route B analytic gap; once `mode_to_rms_mode` is proven,
  `no_supercritical_beta` is derivable and the gap axiom can be removed.
