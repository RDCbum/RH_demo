# Buchstab coefficient bridge: blockers

## Try file
- `docs/core/P40_BuchstabCoeff_Try.lean`
- Log: `docs/core/P40_BuchstabCoeff_Try.log`

## First missing lemma
Current goal (from the log):

```
⊢ ERURH.SupercriticalModeCoefficient
    (ERURH.Alpha.beta ρ)
    (ERURH.Alpha.gamma ρ)
    (ERURH.Alpha.b_rho ρ)
```

Expanded, this requires a lemma of the form:

```
∃ c_struct : ℂ, c_struct ≠ 0 ∧
  ERURH.Alpha.b_rho ρ = c_struct * ERURH.buchstab_m (ERURH.Alpha.beta ρ) (ERURH.Alpha.gamma ρ)
```

## Why it is missing
The explicit-formula layer (`lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean`)
introduces `b_rho` as an abstract coefficient attached to a zero, but there is no
lemma connecting `b_rho` to the Buchstab multiplier `m(ρ)` or to the averaging
operator used in the ERU smoothing.

## Proposed minimal new lemma (Lean home)
Suggested location: `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean`.

```
lemma b_rho_equals_structural_times_buchstab
  (ρ : ERURH.Alpha.ZeroOfZeta) :
  ∃ c_struct : ℂ, c_struct ≠ 0 ∧
    ERURH.Alpha.b_rho ρ = c_struct * ERURH.buchstab_m (ERURH.Alpha.beta ρ) (ERURH.Alpha.gamma ρ)
```

This is exactly the analytic bridge required to close the Buchstab gap in Lean.
It should be justified in the paper from the explicit formula for the ERU
observable and the averaging operator.
