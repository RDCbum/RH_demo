# Inventario de axiomas ERU (energía/inercia, caso alpha)

Este documento resume los axiomas ERU vigentes relacionados con energía e inercia en el caso alpha, su clasificación, la interfaz actual de certificados y el objetivo de desaxiomatización.

## 1. Mapa de axiomas ERU (por archivo)

- **formal_proofs/ERURH/EnergyCertificatesAlpha.lean**
  - Tipo A (existencia): `GlobalEnergyCertificate_exists_alpha`, `KernelBlowupCertificate_exists_alpha`.
  - Tipo B (implicaciones): `ERU_energy_global_dominates_kernel_of_certificate` (lemma), `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` (external via BetaInertiaAssumptions).
  - Legacy: ninguno (ya certificados).

- **formal_proofs/ERURH/EnergyBoundsAlpha.lean**
  - Tipo B: `ERU_energy_alpha_bounded_of_checklist` (lemma, probado vía checklist + flujo).
  - Lemas de soporte: `EnergyBoundChecklist_alpha_of_hypotheses`, `ERU_energy_alpha_supported_by_flux`.
  - Legacy: ninguno.

- **formal_proofs/ERURH/ERUEnergyAlpha.lean**
  - Legacy (tipo C): `ERU_energy_global_dominates_kernel_legacy` (lemma via certificate).

- **formal_proofs/ERURH/ERUModesAlpha.lean**
  - Legacy (tipo C): `ERU_energy_kernel_blowup_of_mode_beta_legacy`, `ERU_energy_blowup_of_mode_beta` (ambos ahora lemas vía ruta certificada).
  - Lemas actuales: `alphaBridge_inertia_of_no_modes`, `InertiaERU_alpha_strong_of_no_modes` (apoyados en certificados).

- **formal_proofs/ERURH/ERUInertia.lean**
  - Legacy (tipo C): `InertiaERU_alpha_strong_of_bridge_inertia_legacy`, `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha`, `RH_to_E_bound_alpha`.

- **formal_proofs/ERURH/InertiaCertificatesAlpha.lean**
  - Tipo A: `BridgeInertiaCertificate_exists_alpha`, `StrongInertiaCertificate_exists_alpha`.
  - Tipo B: `InertiaERU_alphaBridge_of_certificate`, `InertiaERU_alpha_strong_of_bridge_inertia_of_certificate`.
  - Legacy: ninguno.

- **Otros módulos analíticos clásicos** (AlphaAssumptions, ExplicitDecomposition, ExplicitCoreBridge, EToRHChecklist, AlphaAxioms): contienen axiomas de fórmula explícita/RH clásicos, fuera del foco ERU.

## 2. Interfaz de certificados (estado actual)

- **GlobalEnergyCertificate_alpha**
  - Campos: `kappa_book : ℚ`, `L_global : ℚ`, igualdades con auto-generados (`h_kappa`, `h_L`).
  - Correct: identidades + desigualdad `kappaLowFormalRat ≤ kappa_book`.

- **KernelBlowupCertificate_alpha**
  - Campos: `kappa_book : ℚ`, igualdad `h_kappa`.
  - Correct: identidad `h_kappa` (sin desigualdad aún).

- **BridgeInertiaCertificate_alpha**
  - Campo: `inertia_proof : InertiaERU alphaBridge`.
  - Correct: igualdad con el testigo `alphaBridge_inertia`.

- **StrongInertiaCertificate_alpha**
  - Campo: marcador `marker : Unit` (placeholder).
  - Correct: `True` (placeholder).

## 3. Objetivo de desaxiomatización y prioridades

- Migrar los axiomas legacy (tipo C) a rutas certificadas:
  - Proveer certificados concretos `_true` con datos numéricos (ventanas, κ, L_global) y lemas `*_true_correct_alpha`.
  - Reemplazar axiomas directos (energía/inercia/modes) por lemas que consuman certificados correctos.
  - Mantener una capa mínima de axiomas solo donde no haya certificados auto-generados.
- Prioridades:
  1) Energía kernel/global: certificados con κ/L + desigualdades numéricas.
  2) Inercia bridge: empaquetar `alphaFluxCertificate`/ventanas en un certificado de datos.
  3) Inercia fuerte: enlazar certificados prefactor/zeta/bridge-to-logR_alpha.
  4) Eliminar gradualmente axiomas legacy (`*_legacy`, `*_of_no_modes`) sustituyéndolos por rutas certificadas.
