import ERURH.ExplicitDecomposition
import ERURH.ExplicitCoreBridge
import ERURH.ERUModesCore
import ERURH.ERUInertiaCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext
import ERURH.RH

namespace ERURH

/-- Structured (still axiomatic) implication: from the analytic bundle to `RHfromE`. -/
theorem rh_from_E_alpha_of_hypotheses
    (h_rh_from_E_alpha_of_hypotheses :
      E_bound_strong_alpha ∧ xi_bounds_alpha ∧ xi_argument_alpha ∧
        explicit_rect_alpha ∧ Nonempty (ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi) →
      RHfromE xiAlpha AlphaPsi) :
    E_bound_strong_alpha ∧ xi_bounds_alpha ∧ xi_argument_alpha ∧
      explicit_rect_alpha ∧ Nonempty (ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi) →
    RHfromE xiAlpha AlphaPsi :=
  h_rh_from_E_alpha_of_hypotheses

/-- Acceptance of the centralized alpha axioms, bundled as explicit data. -/
structure AxiomsShimAccepted where
  alphaInterfacesBase : AlphaInterfaces
  explicit_alpha_via_stages : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi
  xi_bounds_alpha : Prop
  h_xi_bounds_alpha : xi_bounds_alpha
  xi_argument_alpha : Prop
  h_xi_argument_alpha : xi_argument_alpha
  xi_bounds_alpha_of_hypotheses :
    xi_bounds_hypotheses_alpha → xi_bounds_alpha
  xi_argument_alpha_of_hypotheses :
    xi_argument_hypotheses_alpha → xi_argument_alpha
  rh_from_E_alpha_of_hypotheses :
    E_bound_strong_alpha ∧ xi_bounds_alpha ∧ xi_argument_alpha ∧
      explicit_rect_alpha ∧ Nonempty (ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi) →
    RHfromE xiAlpha AlphaPsi
  /-- ERU inertia implies the classical strong E-bound. -/
  h_inertia_to_E : InertiaERU_alpha_strong → E_bound_strong_alpha
  /-- Classical strong E-bound implies ERU inertia. -/
  h_inertia_of_E : E_bound_strong_alpha → InertiaERU_alpha_strong
  /-- RH implies the classical strong E-bound. -/
  h_RH_to_E : RiemannHypothesis xiAlpha → E_bound_strong_alpha

/-- Combined analytic hypotheses for deriving `RHfromE` in the alpha case,
parameterized by the axioms bundle. -/
def EToRH_hypotheses_alpha (hAxioms : AxiomsShimAccepted) : Prop :=
  E_bound_strong_alpha ∧ hAxioms.xi_bounds_alpha ∧ hAxioms.xi_argument_alpha ∧
    explicit_rect_alpha ∧ Nonempty (ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi)

end ERURH
