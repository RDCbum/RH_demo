import ERURH.ERUModesCore
import ERURH.ExplicitToRHBridge
import ERURH.EToRHChecklist
import ERURH.AxiomsShimBundle
import ERURH.Inertia
import ERURH.FluxWindows

namespace ERURH

/-- Strong ERU inertia hypothesis for the alpha bridge.

    Intuitively: the ERURH residual `logR_alpha(s)` decays like
    `C * e^{-s/2} * s^2` for large `s`, i.e. the ERU flow is
    compatible with the Riemann-type square-root barrier. -/
def InertiaERU_alpha_strong : Prop :=
  ∃ C : ℚ, ∃ S0 : ℝ, ∀ {s : ℝ}, S0 ≤ s →
    |logR_alpha s| ≤
      (algebraMap ℚ ℝ C) * Real.exp (-s / 2) * (Real.log (Real.exp s)) ^ 2

-- Legacy wrapper moved to `InertiaCertificatesAlpha` to avoid import cycles.

/-- From strong ERU inertia (bound on `logR_alpha`) we can derive the
    classical strong bound on `E(x)` for the alpha Chebyshev layer.

    This axiom models the change-of-variable argument `x = e^s` in the
    ERU_RH equivalence documents. -/
axiom ERU_inertia_to_E_bound_alpha :
  InertiaERU_alpha_strong → E_bound_strong_alpha

/-- Conversely, a classical strong bound on `E(x)` yields a strong ERU
    inertia bound for `logR_alpha`. -/
axiom ERU_inertia_of_E_bound_alpha :
  E_bound_strong_alpha → InertiaERU_alpha_strong

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
    ERU_inertia_to_E_bound_alpha h_inertia
  -- 2) strong `E`-bound + analytic certificates ⇒ fine bundle
  have hBundle : EToRH_hypotheses_alpha hAxioms :=
    EToRH_hypotheses_alpha_of_E_bound hAxioms hE
  -- 3) bundle ⇒ RH
  exact RH_from_EToRH_hypotheses_alpha hAxioms hBundle

/-- Legacy wrapper using the global axioms bundle. -/
theorem ERU_to_RH_alpha
  (h_inertia : InertiaERU_alpha_strong) :
  RiemannHypothesis xiAlpha :=
by
  exact ERU_to_RH_alpha_of_axioms axiomsShimAccepted_true h_inertia

/-- Classical direction: from the Riemann Hypothesis for `xiAlpha` we obtain
    the strong `E`-bound for the alpha Chebyshev error term. This models the
    classical implication RH ⇒ `E(x) = O(x (log x)^2)`. -/
axiom RH_to_E_bound_alpha :
  RiemannHypothesis xiAlpha → E_bound_strong_alpha

/-- From the Riemann Hypothesis for `xiAlpha` we obtain strong ERU inertia
    for the alpha bridge. -/
theorem RH_to_ERU_alpha
  (hRH : RiemannHypothesis xiAlpha) :
  InertiaERU_alpha_strong :=
by
  have hE : E_bound_strong_alpha := RH_to_E_bound_alpha hRH
  exact ERU_inertia_of_E_bound_alpha hE

/-- Equivalence between the strong ERU inertia hypothesis for the alpha
    bridge and the Riemann Hypothesis for `xiAlpha`, parameterized by the
    axioms bundle. -/
theorem ERU_RH_equiv_alpha_of_axioms
  (hAxioms : AxiomsShimAccepted) :
  InertiaERU_alpha_strong ↔ RiemannHypothesis xiAlpha :=
⟨ERU_to_RH_alpha_of_axioms hAxioms, RH_to_ERU_alpha⟩

/-- Equivalence between the strong ERU inertia hypothesis for the alpha
    bridge and the Riemann Hypothesis for `xiAlpha`. -/
theorem ERU_RH_equiv_alpha :
  InertiaERU_alpha_strong ↔ RiemannHypothesis xiAlpha :=
⟨ERU_to_RH_alpha, RH_to_ERU_alpha⟩

end ERURH
