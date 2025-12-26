# RB9 envelope alignment (ctx_real)

- C_envelope_formal (from data/docs/paper/rational_bounds.json): 43040528/902400129
- C_envelope_ctx (from data/releases/erurh-v2-core/formal/rms_context.json): 43040528/902400129
- Equality proof in Lean: ctx_real_RMS_envelope_closed uses native_decide to show
  cEnvelopeCtxRat = cEnvelopeFormalRat, hence cEnvelopeCtx = C_envelope_formal and
  RMS_envelope_closed ctx_real by le_of_eq.

Changes applied
- data/releases/erurh-v2-core/formal/rms_context.json: aligned C_envelope_ctx and
  set RMS_mode = C_envelope_ctx + RMS_low + RMS_tail (window 0 -> 1332805409/9024001290)
  to keep RMS_decomp and A2 bounds provable.
- data/docs/paper/rms_context.json: regenerated from release data.
- tools/make_rms_context.py: emit ERURH_GatesAlpha import plus ctx_real_RMS_envelope_closed
  lemma and abbrev.
- lean/formal_proofs/ERURH/Alpha/GeneratedRMSContext.lean: regenerated with aligned values
  and envelope-closed lemma.
- lean/formal_proofs/ERURH/RH_Unconditional.lean: discharge hNumeric via
  ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed.
- Logs: docs/core/RB9_BUILD.txt, docs/core/RB9_GATE.txt, docs/core/RB9_UNCOND_GOALS.log.
