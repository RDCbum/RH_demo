import Mathlib
import ERURH.Inertia
import ERURH.RH
import ERURH.PsiLayer
import ERURH.ExpRect

namespace ERURH

open Real

/-- Witness supplying the analytic ingredients for the explicit formula layer. -/
structure ExplicitWitness (B : ERUBridge) (ξ : ℂ → ℂ) (P : PsiLayer) where
  rect : ExpRect ξ
  C : ℚ
  estimate :
    ∀ {x : ℝ}, P.x0 ≤ x →
      |P.E x| ≤ (algebraMap ℚ ℝ C) * Real.sqrt x * (Real.log x) ^ 2

/-- Interfaz que convierte `InertiaERU` en un testigo explícito. -/
structure ExplicitFormulaLaws (B : ERUBridge) (ξ : ℂ → ℂ) (P : PsiLayer) where
  from_inertia : InertiaERU B → ExplicitWitness B ξ P

/-- Interfaz clásica: la cota `|E(x)| ≤ C √x (log x)^2` implica la Hipótesis de Riemann
    para la función `ξ`. -/
structure RHfromE (ξ : ℂ → ℂ) (P : PsiLayer) : Prop where
  of_bound :
    (∃ C : ℚ, ∀ {x : ℝ}, P.x0 ≤ x →
        |P.E x| ≤ (algebraMap ℚ ℝ C) * Real.sqrt x * (Real.log x) ^ 2) →
      RiemannHypothesis ξ

end ERURH
