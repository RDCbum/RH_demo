# RB16 A1 proof plan (AxiomsShimAccepted.a1_mode_of_supercritical)

Lean statement (exact):
```lean
ERURH.AxiomsShimAccepted.a1_mode_of_supercritical : ∀ β > 1 / 2,
  ERURH.ERU_mode_beta β → ERURH.A1_mode ERURH.Alpha.GeneratedRMSContext.ctx_real
```

Dependencies (Lean definitions)
- `ERURH.ERU_mode_beta` in `lean/formal_proofs/ERURH/ERUModesCore.lean`.
- `ERURH.A1_mode` and `ERURH.RMSLocalContext` in `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`.
- `ERURH.Alpha.GeneratedRMSContext.ctx_real` in `lean/formal_proofs/ERURH/Alpha/GeneratedRMSContext.lean`.

Proof sketch (paper-first, then Lean)
1) Unpack `ERU_mode_beta β`: obtain `s0` such that for all `s ≥ s0`,
   `|logR_alpha s| ≥ exp((β - 1/2) * s)`.
2) Relate `logR_alpha` to the RMS decomposition for `ctx_real` by isolating a
   window `w : ctx_real.Window` where the mode contribution dominates the
   low/tail terms. This is the key analytic step: produce `w` and `K` with
   `ctx_real.RMS_mode w ≥ K`.
3) Show `K > ctx_real.c_low + ctx_real.c_tail + C_envelope_formal` using the
   growth bound from step (1) plus the concrete gate/data constants in
   `ctx_real` (from `rms_context.json`).
4) Conclude `A1_mode ctx_real` by exhibiting `w` and `K`.

Expected intermediate lemmas
- A bridge lemma from `ERU_mode_beta` to a lower bound on `RMS_mode` for the
  fixed RMS context (Route B gate/data). Proposed form:
  ```lean
  lemma mode_to_rms_mode
    (β : ℝ) (hβ : β > 1/2) (hmode : ERU_mode_beta β) :
    ∃ w : ERURH.Alpha.GeneratedRMSContext.ctx_real.Window,
      ∃ K : ℝ, K > ctx_real.c_low + ctx_real.c_tail + C_envelope_formal ∧
        ctx_real.RMS_mode w ≥ K
  ```

Notes
- This is the remaining Route B analytic gap; once this lemma is proven, the
  A1 field can be discharged from the paper and/or formalized directly in Lean.
