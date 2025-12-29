# Lean formalization: ctx_real window cofinality (conditional)

We formalized the trivial implication that if the threshold is below the maximal
ctx_real window minimum, then a ctx_real window sits above that threshold.

Files:
- lean/formal_proofs/ERURH/Alpha/CtxRealWindowCofinality.lean

Key lemma:
- `ERURH.Alpha.ctx_real_window_above_of_le_windowMinMax`:
  if `s0 <= windowMinMax`, then there exists a ctx_real window `w` with
  `s in I_w -> s >= s0`.

This does not solve the analytic step (bounding the existential `s0` from
`ERU_mode_beta`), but it packages the final window-selection step cleanly in Lean.
