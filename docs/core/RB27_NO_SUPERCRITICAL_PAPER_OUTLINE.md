# RB27 no-supercritical paper outline

Goal (Lean): `ERURH.no_supercritical_beta` in `lean/formal_proofs/ERURH/A1FromSupercriticalMode.lean`.

Lemma A (mode growth)
- Statement: unpack `ERU_mode_beta` to obtain pointwise bounds on `|logR_alpha s|` for `s ≥ s0`.
- Lean home: `lean/formal_proofs/ERURH/ERUModesCore.lean` (definition) and a new lemma in `lean/formal_proofs/ERURH/ERUModesAlpha.lean`.
- Paper anchor: Section \ref{sec:no-supercritical}, Lemma A.

Lemma B (bridge to RMS mode)
- Statement: `mode_to_rms_mode` (see `docs/core/RB22_NoSupercritical_Blockers.md`).
- Lean home: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode.lean` (proposed).
- Dependencies: `ERURH.Alpha.GeneratedRMSContext.ctx_real` in `lean/formal_proofs/ERURH/Alpha/GeneratedRMSContext.lean`,
  and `ERURH.A1_mode` in `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`.
- Paper anchor: Section \ref{sec:no-supercritical}, Lemma B.

Lemma C (contradiction with ctx_real)
- Statement: `ctx_real_not_A1_mode`.
- Lean home: `lean/formal_proofs/ERURH/Alpha/CtxRealNonVacuityAudit.lean`.
- Paper anchor: Section \ref{sec:no-supercritical}, Lemma C.

Conclusion
- Combine Lemma B + Lemma C to show `¬ ERU_mode_beta β` for all `β > 1/2`.
- This replaces the older A1 framing; equivalence recorded in `docs/core/RB20_A1_EQUIVALENCE.md`.
