import ERURH.ERUModesCore
import ERURH.ExplicitToRHBridge
import ERURH.EToRHChecklist
import ERURH.AxiomsShimBundle
import ERURH.ERUInertiaCore
import ERURH.Inertia
import ERURH.FluxWindows

namespace ERURH

/-- From strong ERU inertia for the alpha bridge we can derive the Riemann
    Hypothesis for `xiAlpha`, by passing through the classical `E`-bound
    and the `E → RH` checklist, parameterized by the axioms bundle. -/
theorem ERU_to_RH_alpha_of_axioms
  (hAxioms : AxiomsShimAccepted)
  (h_inertia : InertiaERU_alpha_strong) :
  RiemannHypothesis xiAlpha :=
by
  -- 1) ERU inertia ⇒ strong `E`-bound
  have hE : E_bound_strong_alpha :=
    hAxioms.h_inertia_to_E h_inertia
  -- 2) strong `E`-bound + analytic certificates ⇒ fine bundle
  have hBundle : EToRH_hypotheses_alpha hAxioms :=
    EToRH_hypotheses_alpha_of_E_bound hAxioms hE
  -- 3) bundle ⇒ RH
  exact RH_from_EToRH_hypotheses_alpha hAxioms hBundle

/-- Classical direction: from the Riemann Hypothesis for `xiAlpha` we obtain
    strong ERU inertia for the alpha bridge, using the axioms bundle. -/
theorem RH_to_ERU_alpha_of_axioms
  (hAxioms : AxiomsShimAccepted)
  (hRH : RiemannHypothesis xiAlpha) :
  InertiaERU_alpha_strong :=
by
  have hE : E_bound_strong_alpha := hAxioms.h_RH_to_E hRH
  exact hAxioms.h_inertia_of_E hE

/-- Equivalence between the strong ERU inertia hypothesis for the alpha
    bridge and the Riemann Hypothesis for `xiAlpha`, parameterized by the
    axioms bundle. -/
theorem ERU_RH_equiv_alpha_of_axioms
  (hAxioms : AxiomsShimAccepted) :
  InertiaERU_alpha_strong ↔ RiemannHypothesis xiAlpha :=
⟨ERU_to_RH_alpha_of_axioms hAxioms, RH_to_ERU_alpha_of_axioms hAxioms⟩

end ERURH
