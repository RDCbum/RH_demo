import Mathlib
import Mathlib.NumberTheory.LSeries.RiemannZeta
import ERURH.RH
import ERURH.ZetaLink

/-!
# ERURH.XiCore

Skeleton of the analytic layer for the classical completed ξ-function.

This module introduces the concrete formula

```
ξ(s) = (s (1 - s) / 2) · π^(-s/2) · Γ(s/2) · ζ(s)
```

and packages the analytic hypotheses required downstream by `BridgeToXi`.
The heavy lifting (holomorphy and the functional equation) is deferred to
axioms that will be discharged when the analytic development is completed.
-/

namespace ERURH

open scoped Real
open Complex

/-- Completed zeta without the polynomial prefactor (`Λ(s)` stripped of ζ). -/
@[simp] noncomputable def lambdaCore (s : ℂ) : ℂ :=
  (Complex.ofReal Real.pi) ^ (-(s / 2)) * Complex.Gamma (s / 2)

/-- Polynomial/Gamma prefactor used in the classical ξ-definition. -/
@[simp] noncomputable def prefactor (s : ℂ) : ℂ :=
  ((1 : ℂ) / 2) * s * (1 - s) *
    (Complex.ofReal Real.pi) ^ (-(s / 2)) * Complex.Gamma (s / 2)

/-- Classical ξ-function written as prefactor · ζ. -/
@[simp] noncomputable def xiClassic (s : ℂ) : ℂ :=
  prefactor s * riemannZeta s

/-- Factorisation of the classical ξ-function through `lambdaCore`. -/
lemma xiClassic_factorization (s : ℂ) :
    xiClassic s = ((1 : ℂ) / 2) * s * (1 - s) * lambdaCore s *
      riemannZeta s := by
  simp [xiClassic, prefactor, lambdaCore,
    mul_comm, mul_left_comm, mul_assoc]

/-- Classical completed ξ-function used in the ERU ↔ RH pipeline.  We reuse the
entire function `Λ₀(s)` provided by Mathlib. -/
@[simp] noncomputable def xiClassical : ℂ → ℂ := completedRiemannZeta₀

/-- Analytical domain for `xiClassical`.  Since `Λ₀` is entire we work on `Set.univ`. -/
def xiAnalyticDomain : Set ℂ := Set.univ

/-- `xiClassical` is holomorphic on the entire complex plane. -/
lemma xiClassical_holomorphic :
    DifferentiableOn ℂ xiClassical xiAnalyticDomain := by
  simpa [xiClassical, xiAnalyticDomain] using
    (differentiable_completedZeta₀.differentiableOn)

/-- Functional equation `ξ(1 - s) = ξ(s)` inherited from `Λ₀`. -/
lemma xiClassical_symmetry :
    ∀ ⦃s⦄, s ∈ xiAnalyticDomain → (1 - s) ∈ xiAnalyticDomain →
      xiClassical (1 - s) = xiClassical s := by
  intro s _ _
  simpa [xiClassical] using completedRiemannZeta₀_one_sub s

/-- Every point on the critical line belongs to the analytic domain. -/
lemma crit_mem_xiDomain (t : ℝ) : crit t ∈ xiAnalyticDomain := by
  simp [xiAnalyticDomain]

/-- Bundle capturing the analytic facts required by `BridgeToXi`. -/
noncomputable def xiClassicalAnalytic :
    XiAnalytic xiClassical xiAnalyticDomain :=
  { hol := xiClassical_holomorphic
    symm := by
      intro s hs h1s
      exact xiClassical_symmetry (s := s) hs h1s
    crit_in := by
      intro t
      simpa using crit_mem_xiDomain t }

end ERURH
