import ERURH.ExplicitDecomposition
import ERURH.ExplicitCoreBridge

namespace ERURH

/-- Structured (still axiomatic) implication: from the analytic bundle to `RHfromE`. -/
axiom rh_from_E_alpha_of_hypotheses :
  E_bound_strong_alpha ∧ xi_bounds_alpha ∧ xi_argument_alpha ∧
    explicit_rect_alpha ∧ Nonempty (ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi) →
  RHfromE xiAlpha AlphaPsi

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

/-- Combined analytic hypotheses for deriving `RHfromE` in the alpha case,
parameterized by the axioms bundle. -/
def EToRH_hypotheses_alpha (hAxioms : AxiomsShimAccepted) : Prop :=
  E_bound_strong_alpha ∧ hAxioms.xi_bounds_alpha ∧ hAxioms.xi_argument_alpha ∧
    explicit_rect_alpha ∧ Nonempty (ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi)

noncomputable def axiomsShimAccepted_true : AxiomsShimAccepted := by
  exact
    { alphaInterfacesBase := alphaInterfacesBase
      explicit_alpha_via_stages := explicit_alpha_via_stages_true
      xi_bounds_alpha := xi_bounds_alpha
      h_xi_bounds_alpha := xi_bounds_alpha_true
      xi_argument_alpha := xi_argument_alpha
      h_xi_argument_alpha := xi_argument_alpha_true
      xi_bounds_alpha_of_hypotheses := xi_bounds_alpha_of_hypotheses
      xi_argument_alpha_of_hypotheses := xi_argument_alpha_of_hypotheses
      rh_from_E_alpha_of_hypotheses := rh_from_E_alpha_of_hypotheses }

end ERURH
