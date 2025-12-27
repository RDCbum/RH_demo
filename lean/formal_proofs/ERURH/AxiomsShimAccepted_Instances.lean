import ERURH.AxiomsShimBundle

namespace ERURH

/-- Bundle instance populated from explicit arguments (paper lemmas as hypotheses). -/
def axiomsShimAccepted_from_paper
    (alphaInterfacesBase : AlphaInterfaces)
    (explicit_alpha_via_stages : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi)
    (xi_bounds_alpha : Prop)
    (h_xi_bounds_alpha : xi_bounds_alpha)
    (xi_argument_alpha : Prop)
    (h_xi_argument_alpha : xi_argument_alpha)
    (xi_bounds_alpha_of_hypotheses : xi_bounds_hypotheses_alpha → xi_bounds_alpha)
    (xi_argument_alpha_of_hypotheses : xi_argument_hypotheses_alpha → xi_argument_alpha)
    (rh_from_E_alpha_of_hypotheses :
      E_bound_strong_alpha ∧ xi_bounds_alpha ∧ xi_argument_alpha ∧
        explicit_rect_alpha ∧ Nonempty (ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi) →
      RHfromE xiAlpha AlphaPsi)
    (h_inertia_to_E : InertiaERU_alpha_strong → E_bound_strong_alpha)
    (h_inertia_of_E : E_bound_strong_alpha → InertiaERU_alpha_strong)
    (h_RH_to_E : RiemannHypothesis xiAlpha → E_bound_strong_alpha) :
    AxiomsShimAccepted :=
  { alphaInterfacesBase := alphaInterfacesBase
    explicit_alpha_via_stages := explicit_alpha_via_stages
    xi_bounds_alpha := xi_bounds_alpha
    h_xi_bounds_alpha := h_xi_bounds_alpha
    xi_argument_alpha := xi_argument_alpha
    h_xi_argument_alpha := h_xi_argument_alpha
    xi_bounds_alpha_of_hypotheses := xi_bounds_alpha_of_hypotheses
    xi_argument_alpha_of_hypotheses := xi_argument_alpha_of_hypotheses
    rh_from_E_alpha_of_hypotheses := rh_from_E_alpha_of_hypotheses
    h_inertia_to_E := h_inertia_to_E
    h_inertia_of_E := h_inertia_of_E
    h_RH_to_E := h_RH_to_E }

end ERURH
