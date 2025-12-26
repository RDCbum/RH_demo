# RB20 A1 equivalence capsule

A1_mode is defined at `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean:42` with threshold `K > ctx.c_low + ctx.c_tail + C_envelope_formal` (see `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean:44`).
The audit lemma `ctx_real_not_A1_mode` is at `lean/formal_proofs/ERURH/Alpha/CtxRealNonVacuityAudit.lean:16` and proves `¬ A1_mode ctx_real`.
Therefore any map `∀ β > 1/2, ERU_mode_beta β → A1_mode ctx_real` implies `∀ β > 1/2, ¬ ERU_mode_beta β` by contradiction.
Conversely, `∀ β > 1/2, ¬ ERU_mode_beta β` implies `A1_mode_of_supercritical` vacuously via `False.elim`.
Hence, under `ctx_real_not_A1_mode`, the gap statement is equivalent to ruling out supercritical ERU modes.
