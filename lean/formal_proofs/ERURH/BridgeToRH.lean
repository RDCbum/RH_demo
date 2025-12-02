import Mathlib
import ERURH.Inertia
import ERURH.RH
import ERURH.ZetaLink
import ERURH.PsiLayer
import ERURH.ExplicitBridge

namespace ERURH

/-- Teorema puente: de `InertiaERU` y las interfaces analíticas a la Hipótesis de Riemann. -/
theorem eru_to_rh
    (B : ERUBridge) (ξ : ℂ → ℂ) (P : PsiLayer)
    (_link : BridgeToXi B ξ)
    (X : ExplicitFormulaLaws B ξ P)
    (R : RHfromE ξ P)
    (hI : InertiaERU B) :
    RiemannHypothesis ξ := by
  let witness := X.from_inertia hI
  exact R.of_bound ⟨witness.C, witness.estimate⟩

namespace Equivalence

/-- Re-export of `ERURH.eru_to_rh` under the `Equivalence` namespace. -/
theorem eru_to_rh
    (B : ERUBridge) (ξ : ℂ → ℂ) (P : PsiLayer)
    (_link : BridgeToXi B ξ)
    (X : ExplicitFormulaLaws B ξ P)
    (R : RHfromE ξ P)
    (hI : InertiaERU B) :
    RiemannHypothesis ξ :=
  ERURH.eru_to_rh B ξ P _link X R hI

end Equivalence

end ERURH
