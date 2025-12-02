import ERURH.AlphaAxioms
import ERURH.ExplicitCoreBridge
import ERURH.ExplicitDecomposition
import ERURH.EToRHChecklist
import ERURH.EnergyCertificatesAlpha
import ERURH.ERUEnergyAlpha
import ERURH.ERUInertia
import ERURH.ERUModesAlpha
import ERURH.InertiaCertificatesAlpha
import ERURH.EnergyBoundsAlpha

/-
# Axioms shim (ERURH-alpha)

Punto de verdad para los axiomas y supuestos externos que consume la capa alpha.
Re-exporta en un único espacio de nombres (`ERURH.AxiomsShim`) los paquetes
clásicos (fórmula explícita/RH), energía/inercia (certificados/blow-up),
implicaciones checklist y herencias legacy. No introduce axiomas nuevos; sólo
centraliza los ya declarados en otros módulos.
-/

namespace ERURH
namespace AxiomsShim

-- Explicit formula / analytic equivalences
export ERURH (explicit_alpha rh_from_E_alpha alphaInterfacesBase explicit_rect_alpha_true)
export ERURH (explicit_core_alpha xi_bounds_alpha xi_argument_alpha flux_to_bridge_bounds_alpha)
export ERURH (Explicit_L1_alpha_of_explicit_core Explicit_L1_alpha_strong_to_L1 Explicit_L2_alpha_of_bounds
  Explicit_L3_alpha_of_argument Explicit_L4_alpha_of_flux explicit_alpha_of_stages explicit_alpha_of_pieces
  rh_from_E_alpha_of_pieces flux_to_bridge_alpha_of_hypotheses xi_bounds_alpha_of_hypotheses
  xi_argument_alpha_of_hypotheses)
export ERURH (EToRH_L1_alpha_of_explicit EToRH_L2_alpha_of_bounds EToRH_L3_alpha_of_argument
  EToRH_no_offline_zeros_alpha_of_stages RHfromE_alpha_of_no_offline_zeros rh_from_E_alpha_of_hypotheses)

-- Energy / blow-up axioms
export ERURH (ERU_energy_global_dominates_kernel_legacy ERU_energy_alpha_supported_by_flux)
export ERURH (ERU_energy_global_dominates_kernel_of_certificate ERU_energy_kernel_blowup_of_mode_beta_of_certificate)
export ERURH (ERU_energy_kernel_blowup_of_mode_beta_legacy ERU_energy_blowup_of_mode_beta)

-- Inertia / mode assumptions
export ERURH (alphaBridge_inertia_of_no_modes InertiaERU_alpha_strong_of_no_modes)
export ERURH (InertiaERU_alpha_strong_of_bridge_inertia_legacy ERU_inertia_to_E_bound_alpha
  ERU_inertia_of_E_bound_alpha RH_to_E_bound_alpha)
export ERURH (InertiaERU_alphaBridge_of_certificate)

-- Energy bounds checklist
export ERURH (ERU_energy_alpha_bounded_of_checklist EnergyBoundChecklist_alpha_of_hypotheses)

end AxiomsShim
end ERURH
