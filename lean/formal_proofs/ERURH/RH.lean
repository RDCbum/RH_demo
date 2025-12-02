import Mathlib

namespace ERURH

open Complex

/-- Punto de la línea crítica asociado a la altura `t`. -/
noncomputable def crit (t : ℝ) : ℂ :=
  (1 / 2 : ℝ) + (Complex.I : ℂ) * t

/-- Predicado abstracto de Hipótesis de Riemann para una función entera `ξ`. -/
def RiemannHypothesis (ξ : ℂ → ℂ) : Prop :=
  ∀ s : ℂ, ξ s = 0 → s.re = (1 / 2 : ℝ)

end ERURH

