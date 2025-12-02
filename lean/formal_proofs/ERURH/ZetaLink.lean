import Mathlib
import ERURH.Inertia
import ERURH.RH
import ERURH.BoundsConfig
import ERURH.FluxWindows
import ERURH.Numeric.Semantics

namespace ERURH

open Complex Real

/-- Propiedades analíticas mínimas de una función `ξ` en un dominio `Ω`. -/
structure XiAnalytic (ξ : ℂ → ℂ) (Ω : Set ℂ) : Prop where
  hol : DifferentiableOn ℂ ξ Ω
  symm :
    ∀ ⦃s⦄, s ∈ Ω → (1 - s) ∈ Ω → ξ (1 - s) = ξ s
  crit_in : ∀ t : ℝ, crit t ∈ Ω

/-- Enlace entre un bridge ERU y una función `ξ`, expresando las cotas de borde
    necesarias para aplicar una fórmula explícita. -/
structure BridgeToXi (B : ERUBridge) (ξ : ℂ → ℂ) where
  Ω : Set ℂ
  an : XiAnalytic ξ Ω
  log_bound :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ ERURH.boundsTcapReal →
      Real.log (Complex.abs (ξ (crit t))) ≤ B.logR t
  arg_variation :
    ∀ {a b : ℝ}, B.s0R ≤ a → a ≤ b →
      |Complex.arg (ξ (crit b)) - Complex.arg (ξ (crit a))| ≤
        B.jRel b - B.jRel a

end ERURH
