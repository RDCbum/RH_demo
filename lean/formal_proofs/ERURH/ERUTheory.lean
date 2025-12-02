import ERURH.BridgeToRH
import ERURH.Inertia
import ERURH.PsiLayer
import ERURH.ExplicitBridge

namespace ERURH

/-- Sistema teórico ERU que empaqueta bridge, función `ξ`, capa `ψ` y las
    interfaces analíticas necesarias para aplicar el teorema puente. -/
structure ERUTheoreticSystem :=
  (B   : ERUBridge)
  (ξ   : ℂ → ℂ)
  (P   : PsiLayer)
  (link : BridgeToXi B ξ)
  (laws : ExplicitFormulaLaws B ξ P)
  (rh_from_E : RHfromE ξ P)

/-- En cualquier sistema ERU teórico, la inercia del bridge implica la Hipótesis
    de Riemann para la función `ξ` asociada. -/
theorem ERUTheory_proves_RH
  (S : ERUTheoreticSystem)
  (hI : InertiaERU S.B) :
  RiemannHypothesis S.ξ := by
  have := eru_to_rh S.B S.ξ S.P S.link S.laws S.rh_from_E hI
  simpa using this

end ERURH
