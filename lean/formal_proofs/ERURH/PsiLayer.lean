import Mathlib

namespace ERURH

/-- Abstract container for the Chebyshev layer: the function `psi`, its error `E`,
    and a working threshold `x₀`.  Further bounds will be supplied by
    `ExplicitFormulaLaws.from_inertia`. -/
structure PsiLayer where
  psi : ℝ → ℝ
  E : ℝ → ℝ
  x0 : ℝ
  E_is_error : ∀ x, E x = psi x - x

namespace PsiLayer

variable (P : PsiLayer)

/-- Helper rewriting `E + x` back to the Chebyshev function. -/
lemma E_add (x : ℝ) : P.E x + x = P.psi x := by
  simp [P.E_is_error x, add_comm, add_left_comm, add_assoc]

end PsiLayer

end ERURH
