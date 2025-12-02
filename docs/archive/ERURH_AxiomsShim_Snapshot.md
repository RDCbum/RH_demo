ERURH AxiomsShim Snapshot
=========================

Qué es
------
`ERURH_AxiomsShim` es el hub Lean que centraliza los axiomas y supuestos
externos usados en la capa alpha. No define axiomas nuevos; reexporta, en un
único espacio de nombres (`ERURH.AxiomsShim`), los paquetes clásicos de ζ
(explicita/RH), energía e inercia (certificados/blow-up), y las implicaciones
de checklist que aún son axiomas.

Paquetes y grupos reexportados
------------------------------
- **Explícita / RH clásicos**: `explicit_alpha`, `rh_from_E_alpha`,
  `alphaInterfacesBase`, `explicit_rect_alpha_true`, descomposición explícita
  (`Explicit_L1...L4`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge...`),
  checklist `EToRH_*`. Corresponden a `ClassicalZetaAssumptions` (paquete
  externo clásico).
- **Energía / blow-up**: `ERU_energy_global_dominates_kernel_of_certificate`,
  `ERU_energy_kernel_blowup_of_mode_beta_of_certificate`, legacy wrappers
  (`*_legacy`, `ERU_energy_blowup_of_mode_beta`), certificados global/kernel
  (`EnergyCertificatesAlpha`), y lemas puente `ERU_energy_alpha_supported_by_flux`.
- **Inercia / modos**: `alphaBridge_inertia_of_no_modes`,
  `InertiaERU_alpha_strong_of_no_modes`, legacy `InertiaERU_alpha_strong_of_bridge_inertia_legacy`,
  `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha`, `RH_to_E_bound_alpha`,
  y certificados de inercia (`InertiaCertificatesAlpha`).
- **Checklist de energía**: `ERU_energy_alpha_bounded_of_checklist`,
  `EnergyBoundChecklist_alpha_of_hypotheses`.

Relación con GlobalAssumptions
------------------------------
- `ERURH_GlobalAssumptions` (en `formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean`)
  empaqueta cuatro paquetes externos (`ClassicalZetaAssumptions`,
  `SpectralAssumptionsAlpha`, `LSGammaAssumptions`, `BetaInertiaAssumptions`)
  y las hipótesis de ventanas `WindowScalingAssumptions`. Los axiomas que estos
  paquetes representan son los que se reexportan vía `AxiomsShim`.
- Los master theorems (`RH_from_planB_RMS`, `RH_from_ERURH_conditional`) piden
  un marcador `AxiomsShimAccepted : Prop := True` para dejar explícita la
  dependencia en esta colección centralizada.

Documentación relacionada
-------------------------
- Vista externa: `docs/ERURH_ExternalAssumptions_Snapshot.md`.
- Beta: `docs/ERURH_BetaAssumptions_Snapshot.md`.
- Espectral H_b: `docs/ERURH_Hb_AnalyticProgram.md`, `docs/ERURH_Hb_Pointwise_Program.md`.
- Inventario de axiomas: `docs/ERURH_Energy_AxiomInventory.md`,
  `docs/ERURH_RemainingAxioms_Internal.md`.

Filosofía
---------
Todo lo externo entra por paquetes (clásico/ζ, espectral H_b, LS_γ, beta,
ventanas/numerics). El shim sólo los centraliza y reexporta; el objetivo a
medio plazo es ir reemplazando cada axioma por un lema formal o moverlo al
paquete externo correspondiente.
