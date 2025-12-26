# RB19 ctx_real non-vacuity audit

Conclusion: A1_mode is impossible for ctx_real with current numeric data.

Evidence:
- Lean proof: `ctx_real_not_A1_mode` in `lean/formal_proofs/ERURH/Alpha/CtxRealNonVacuityAudit.lean`.
- The proof shows RMS_mode w ≤ c_low + c_tail + C_envelope_formal for the only window, so no K can satisfy A1_mode.
- Compiler log: `docs/core/RB19_CTX_REAL_NONVACUITY.log`.
