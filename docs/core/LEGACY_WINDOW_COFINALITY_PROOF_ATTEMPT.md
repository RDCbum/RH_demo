# Window Cofinality Proof Attempt (Legacy Route)

## Goal
Justify the step: for the existential threshold `s0` from `ERU_mode_beta`, there exists a
ctx_real window `w` such that `s in I_w` implies `s >= s0`.

## Outcome
The argument reduces to a single inequality:

- Required: `s0 <= windowMinMax` where `windowMinMax` is the maximum of the minima of the
  ctx_real window family.

Given this inequality, the proof is immediate by choosing the window with minimum
`windowMinMax` (Lean: `windowMinMaxIndex`).

## Blocker
`ERU_mode_beta` only asserts the *existence* of `s0` and does not provide any bound on it.
Therefore `s0 <= windowMinMax` does not follow from definitions or from A/B/C, and must be
proved analytically or assumed as an additional hypothesis.

## Note on a tempting (but circular) route
The strong classical bound `E_bound_strong_alpha` implies
`|logR_alpha s| <= C * exp(-s/2) * s^2` for large `s`, which contradicts
`|logR_alpha s| >= exp((β-1/2)s)` for any `β>1/2`. This would force
no supercritical modes outright, but `E_bound_strong_alpha` is essentially
equivalent to RH and is not available without circularity. Therefore it cannot
be used to bound `s0` in the legacy route.

## References
- Paper lemma: `Lemma 6.?? (Window cofinality for ctx_real)` in
  `arxiv_submission/ERURH_Conditional_Proof.tex`.
- Lean helper: `lean/formal_proofs/ERURH/Alpha/CtxRealWindowCofinality.lean`.
