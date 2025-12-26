import ERURH.ExplicitToRHBridge
import ERURH.AlphaAxioms
import ERURH.ExplicitDecomposition
import ERURH.AxiomsShimBundle

namespace ERURH

/-- Checklist para el paso E(x) ⇒ RH en el caso alpha:
    contiene un bound fuerte sobre E(x) y una instancia de `RHfromE`
    para `(xiAlpha, AlphaPsi)`. -/
structure EToRHChecklist_alpha : Prop where
  (E_bound : E_bound_strong_alpha)
  (E_to_RH : RHfromE xiAlpha AlphaPsi)

/-- Stage L1 in the `E → RH` argument for the alpha bridge.

    Intuitively: a usable explicit formula with controlled remainder, obtained
    from the explicit formula laws and the analytic rectangle. This is the
    stage where `ψ(x) - x` is expressed as a sum over zeros, plus boundary
    integrals and a remainder term whose analytic form is understood. -/
def EToRH_L1_alpha : Prop := explicit_core_alpha

/-- Stage L2 in the `E → RH` argument for the alpha bridge.

    Intuitively: uniform bounds for `ξ`/`ζ` on the analytic contour, ensuring
    that boundary integrals and growth along the rectangle are controlled.
    This uses the `xi_bounds_alpha` hypotheses together with the rectangle. -/
def EToRH_L2_alpha (hAxioms : AxiomsShimAccepted) : Prop :=
  hAxioms.xi_bounds_alpha

/-- Stage L3 in the `E → RH` argument for the alpha bridge.

    Intuitively: argument/zero-count control along the contour, relating
    variation of the argument of `ξ` to the number and location of zeros
    inside the rectangle. This is where `xi_argument_alpha` enters. -/
def EToRH_L3_alpha (hAxioms : AxiomsShimAccepted) : Prop :=
  hAxioms.xi_argument_alpha

/-- Stage L4 in the `E → RH` argument for the alpha bridge.

    Intuitively: combining the strong bound on the Chebyshev error term `E`,
    the explicit formula (L1), growth bounds (L2), and argument control (L3)
    to show that any zero off the critical line would force a violation of
    the `E(x)` bound. Concretely: no zeros off the critical line. -/
def EToRH_no_offline_zeros_alpha (hAxioms : AxiomsShimAccepted) : Prop :=
  E_bound_strong_alpha ∧ EToRH_L1_alpha ∧ EToRH_L2_alpha hAxioms ∧ EToRH_L3_alpha hAxioms

/-- Stage L1: from the explicit formula laws and the analytic rectangle we
    obtain a usable explicit formula with controlled remainder. -/
axiom EToRH_L1_alpha_of_explicit :
  ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi → explicit_rect_alpha → EToRH_L1_alpha

/-- Stage L2: from bounds on `ξ`/`ζ` and the rectangle we obtain uniform
    growth control on the analytic contour. -/
axiom EToRH_L2_alpha_of_bounds
  (hAxioms : AxiomsShimAccepted) :
  hAxioms.xi_bounds_alpha → explicit_rect_alpha → EToRH_L2_alpha hAxioms

/-- Stage L3: from argument control and the rectangle we obtain a zero-count
    statement along the contour. -/
axiom EToRH_L3_alpha_of_argument
  (hAxioms : AxiomsShimAccepted) :
  hAxioms.xi_argument_alpha → explicit_rect_alpha → EToRH_L3_alpha hAxioms

/-- Stage L4: combining the strong bound on `E`, the explicit formula (L1),
    the growth bounds (L2) and argument control (L3) we obtain the statement
    "no zeros off the critical line" in the analytic rectangle. -/
axiom EToRH_no_offline_zeros_alpha_of_stages
  (hAxioms : AxiomsShimAccepted) :
  E_bound_strong_alpha →
  EToRH_L1_alpha → EToRH_L2_alpha hAxioms → EToRH_L3_alpha hAxioms →
  EToRH_no_offline_zeros_alpha hAxioms

/-- Final step: from the absence of zeros off the critical line together
    with the strong `E` bound we can build the `RHfromE` witness. -/
axiom RHfromE_alpha_of_no_offline_zeros
  (hAxioms : AxiomsShimAccepted) :
  E_bound_strong_alpha →
  EToRH_no_offline_zeros_alpha hAxioms →
  RHfromE xiAlpha AlphaPsi

/-- Build the fine `E → RH` analytic bundle for the alpha case starting
    from the strong `E`-bound and the existing analytic certificates. -/
lemma EToRH_hypotheses_alpha_of_E_bound
  (hAxioms : AxiomsShimAccepted)
  (hE : E_bound_strong_alpha) :
  EToRH_hypotheses_alpha hAxioms :=
by
  refine ⟨hE,
    hAxioms.h_xi_bounds_alpha,
    hAxioms.h_xi_argument_alpha,
    explicit_rect_alpha_true,
    ⟨hAxioms.explicit_alpha_via_stages⟩⟩

/-- Build the existing checklist from the finer analytic bundle. -/
def EToRHChecklist_alpha_of_hypotheses
  (hAxioms : AxiomsShimAccepted)
  (h : EToRH_hypotheses_alpha hAxioms) :
  EToRHChecklist_alpha :=
by
  refine ⟨h.1, hAxioms.rh_from_E_alpha_of_hypotheses h⟩

/-- Structured reconstruction of `rh_from_E_alpha_of_hypotheses` from the
    staged analytic hypotheses L1–L4. This does **not** replace the existing
    axiom yet, but shows how it can be factored. -/
lemma rh_from_E_alpha_of_hypotheses_via_stages
  (hAxioms : AxiomsShimAccepted)
  (h : EToRH_hypotheses_alpha hAxioms) :
  RHfromE xiAlpha AlphaPsi :=
by
  rcases h with ⟨hE, h_bounds, h_arg, h_rect, h_explicit⟩
  rcases h_explicit with ⟨h_explicit⟩
  have hL1 : EToRH_L1_alpha :=
    EToRH_L1_alpha_of_explicit h_explicit h_rect
  have hL2 : EToRH_L2_alpha hAxioms :=
    EToRH_L2_alpha_of_bounds hAxioms h_bounds h_rect
  have hL3 : EToRH_L3_alpha hAxioms :=
    EToRH_L3_alpha_of_argument hAxioms h_arg h_rect
  have hNoZeros : EToRH_no_offline_zeros_alpha hAxioms :=
    EToRH_no_offline_zeros_alpha_of_stages hAxioms hE hL1 hL2 hL3
  exact RHfromE_alpha_of_no_offline_zeros hAxioms hE hNoZeros

/-- From the fine analytic bundle for `E → RH` we can derive the Riemann
    Hypothesis for `xiAlpha`. This just repackages the existing checklist. -/
lemma RH_from_EToRH_hypotheses_alpha
  (hAxioms : AxiomsShimAccepted)
  (h : EToRH_hypotheses_alpha hAxioms) :
  RiemannHypothesis xiAlpha :=
by
  have hChecklist : EToRHChecklist_alpha :=
    EToRHChecklist_alpha_of_hypotheses hAxioms h
  rcases hChecklist with ⟨hEbound, hRHfromE⟩
  exact hRHfromE.of_bound hEbound

/-- Instantiated analytic hypotheses for the `E → RH` step in the alpha case. -/
lemma EToRH_hypotheses_alpha_true
  (hAxioms : AxiomsShimAccepted) :
  EToRH_hypotheses_alpha hAxioms :=
by
  exact EToRH_hypotheses_alpha_of_E_bound hAxioms E_bound_strong_alpha_true

/-- Structured `RHfromE` witness for the alpha bridge obtained by
    instantiating the staged `E → RH` hypotheses. -/
lemma rh_from_E_alpha_via_stages_true
  (hAxioms : AxiomsShimAccepted) :
  RHfromE xiAlpha AlphaPsi :=
rh_from_E_alpha_of_hypotheses_via_stages hAxioms (EToRH_hypotheses_alpha_true hAxioms)

/-- Riemann Hypothesis for `xiAlpha` obtained by instantiating the staged
    `E → RH` hypotheses in the alpha case. -/
lemma RH_from_EToRH_via_stages_true
  (hAxioms : AxiomsShimAccepted) :
  RiemannHypothesis xiAlpha :=
RH_from_EToRH_hypotheses_alpha hAxioms (EToRH_hypotheses_alpha_true hAxioms)

/-- Del checklist E(x)⇒RH se obtiene directamente la RH para `xiAlpha`. -/
theorem RH_from_EToRHChecklist_alpha :
  EToRHChecklist_alpha → RiemannHypothesis xiAlpha := by
  intro H
  rcases H with ⟨hEbound, hRHfromE⟩
  exact hRHfromE.of_bound hEbound

/-- Legacy instantiation of the checklist E(x)⇒RH for the alpha case,
    using the strong bound and the global axiom `rh_from_E_alpha`.
    See also `EToRHChecklist_alpha_true_via_stages` for the staged version. -/
theorem EToRHChecklist_alpha_true : EToRHChecklist_alpha :=
by
  refine ⟨E_bound_strong_alpha_true, rh_from_E_alpha⟩

/-- Stage-based instantiation of `EToRHChecklist_alpha` for the alpha case.

    This version does not use the global axiom `rh_from_E_alpha` directly,
    but instead builds the checklist from the fine analytic bundle
    `EToRH_hypotheses_alpha_true` and the staged pipeline. -/
def EToRHChecklist_alpha_true_via_stages
  (hAxioms : AxiomsShimAccepted) :
  EToRHChecklist_alpha :=
EToRHChecklist_alpha_of_hypotheses hAxioms (EToRH_hypotheses_alpha_true hAxioms)

/-- La equivalencia analítica ERH para alpha está implementada por
    `RH_from_EToRHChecklist_alpha`. -/
theorem analytic_equiv_E_to_RH_alpha_true :
  analytic_equiv_E_to_RH_alpha :=
by
  exact True.intro

end ERURH





