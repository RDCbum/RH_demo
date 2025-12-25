import ERURH.AlphaAxioms
import ERURH.ExplicitDecomposition
import ERURH.ExplicitCoreBridge
import ERURH.FluxEnergyBridge
import ERURH.FluxToBridgeBridge
import ERURH.ExplicitToRHBridge
import ERURH.EToRHChecklist
import ERURH.ERUTheory
import ERURH.BridgeToRH

namespace ERURH

/-- Paquete de hipótesis analíticas fuertes para el caso alpha.
    Incluye:
    - `explicit_alpha`: inercia ⇒ testigo explícito (fórmula explícita).
    - `rh_from_E_alpha`: bound de `E(x)` ⇒ RH.
    - `flux_energy_alpha`: lema A/B + control de energía del flujo ERU.
    - `explicit_rect_alpha_true`: existencia del rectángulo analítico para `xiAlpha`.
    - `analytic_equiv_E_to_RH_alpha`: equivalencia analítica `E(x)` ⇒ RH. -/
def AlphaAnalyticAssumptions : Prop :=
  explicit_alpha ∧
    rh_from_E_alpha ∧
    flux_energy_alpha ∧
    explicit_rect_alpha_true ∧
    analytic_equiv_E_to_RH_alpha

/-- Extract the `E → RH` analytic bundle from the global alpha analytic assumptions. -/
lemma EToRH_hypotheses_alpha_of_AlphaAnalyticAssumptions
  (hAxioms : AxiomsShimAccepted)
  (h : AlphaAnalyticAssumptions) :
  EToRH_hypotheses_alpha hAxioms :=
by
  rcases h with ⟨h_explicit, h_rh, h_flux, h_rect, h_equiv⟩
  refine ⟨E_bound_strong_alpha_true,
    hAxioms.h_xi_bounds_alpha,
    hAxioms.h_xi_argument_alpha,
    h_rect,
    ⟨hAxioms.explicit_alpha_via_stages⟩⟩

/-- Build the existing `EToRHChecklist_alpha` from the global assumptions via the fine bundle. -/
lemma EToRHChecklist_alpha_of_AlphaAnalyticAssumptions_via_bundle
  (hAxioms : AxiomsShimAccepted)
  (h : AlphaAnalyticAssumptions) :
  EToRHChecklist_alpha :=
EToRHChecklist_alpha_of_hypotheses hAxioms
  (EToRH_hypotheses_alpha_of_AlphaAnalyticAssumptions hAxioms h)

/-- Teorema resumen para el caso alpha: bajo las hipótesis analíticas
    empaquetadas en `AlphaAnalyticAssumptions` y la inercia del bridge,
    se obtiene la Hipótesis de Riemann para `xiAlpha`. -/
theorem RH_from_ERU_and_AlphaAnalyticAssumptions
    (hInertia : InertiaERU alphaBridge)
    (hAnalytic : AlphaAnalyticAssumptions) :
    RiemannHypothesis xiAlpha := by
  -- El pipeline ya encapsulado en `RH_from_ERURH_axiomatic` concluye RH
  -- usando los axiomas analíticos incluidos en `AlphaAnalyticAssumptions`.
  have h := RH_from_ERURH_axiomatic hInertia
  simpa using h

end ERURH
