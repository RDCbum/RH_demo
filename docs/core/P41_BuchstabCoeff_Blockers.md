# Buchstab coefficient bridge: Lean attempt (P41)

## Try file
- `docs/core/P41_BuchstabCoeff_Try.lean`
- Log: `docs/core/P41_BuchstabCoeff_Try.log`

## Result
The Lean proof succeeds *assuming* a nonzero coefficient hypothesis
`b_rho ρ ≠ 0`. The only missing input is therefore a proof (or explicit
formula lemma) that `b_rho ρ` is nonzero for the relevant supercritical mode.

## Minimal missing lemma
Suggested Lean statement (paper-level input):

```
lemma b_rho_ne_zero_of_supercritical
  (ρ : ERURH.Alpha.ZeroOfZeta) (hβ : ERURH.Alpha.beta ρ > (1/2 : ℝ)) :
  ERURH.Alpha.b_rho ρ ≠ 0
```

This would close the Buchstab coefficient bridge in Lean by instantiating
`buchstab_coeff_of_nonzero`.
