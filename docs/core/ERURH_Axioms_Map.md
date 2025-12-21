ERURH Axioms Map (Alpha Layer)
==============================

This note lists the external assumptions and key lemmas used by the ERURH alpha development, together with their Lean locations and roles in the chain “certificates → inertia → RH”.

Main axioms and predicates
--------------------------
| Name (Lean) | Kind | Category | Lean location | Purpose |
| --- | --- | --- | --- | --- |
| `explicit_alpha` | axiom | analytic_standard | formal_proofs/ERURH/AlphaAxioms.lean | Explicit-formula laws for the alpha bridge |
| `rh_from_E_alpha` | axiom | analytic_standard | formal_proofs/ERURH/AlphaAxioms.lean | Equivalence RH ↔ bound on `E` |
| `alphaInterfacesBase` | axiom | eru_specific | formal_proofs/ERURH/AlphaAxioms.lean | Packaged analytic witnesses (cover/prefactor/zeta/lambda) |
| `explicit_rect_alpha_true` | axiom | analytic_standard | formal_proofs/ERURH/ExplicitCoreBridge.lean | Existence of analytic rectangle witness |
| `explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge_bounds_alpha` (+ `of_*` variants) | axioms | analytic_standard | formal_proofs/ERURH/ExplicitDecomposition.lean | Staged explicit-formula decomposition |
| `EToRH_L1_alpha_of_explicit`, `EToRH_L2_alpha_of_bounds`, `EToRH_L3_alpha_of_argument`, `EToRH_no_offline_zeros_alpha_of_stages`, `RHfromE_alpha_of_no_offline_zeros`, `rh_from_E_alpha_of_hypotheses` | axioms | analytic_standard | formal_proofs/ERURH/EToRHChecklist.lean | Checklist from explicit pieces to RH |
| `ERU_energy_global_dominates_kernel_legacy` | lemma | eru_specific | formal_proofs/ERURH/ERUEnergyAlpha.lean | Kernel energy threshold ⇒ global blow-up (legacy route) |
| `ERU_energy_global_dominates_kernel_of_certificate` | lemma | eru_specific | formal_proofs/ERURH/EnergyCertificatesAlpha.lean | Certificate-based global energy blow-up |
| `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` | lemma (bundle) | beta_numeric | formal_proofs/ERURH/ERURH_BetaInertiaAssumptions.lean | Kernel blow-up from beta certificate |
| `ERU_energy_kernel_blowup_of_mode_beta_legacy`, `ERU_energy_blowup_of_mode_beta` | lemmas | eru_specific | formal_proofs/ERURH/ERUModesAlpha.lean | Mode β>1/2 ⇒ kernel/global blow-up (legacy wrappers) |
| `alphaBridge_inertia_of_no_modes`, `InertiaERU_alpha_strong_of_no_modes`, `InertiaERU_alphaBridge_of_certificate` | lemmas | eru_specific | formal_proofs/ERURH/ERUModesAlpha.lean; InertiaCertificatesAlpha.lean | Bridge/strong inertia from certificates or no-modes hypothesis |
| `InertiaERU_alpha_strong_of_bridge_inertia_legacy`, `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha`, `RH_to_E_bound_alpha` | axioms | analytic_standard / eru_specific | formal_proofs/ERURH/ERUInertia.lean | Links between inertia, E-bounds, and RH |
| `ERU_energy_alpha_bounded_of_checklist` | lemma | numeric_pipeline | formal_proofs/ERURH/EnergyBoundsAlpha.lean | Flux checklist ⇒ global energy bound |
| Certificate predicates `*_Correct_alpha` | predicates | eru_specific | formal_proofs/ERURH/EnergyCertificatesAlpha.lean; InertiaCertificatesAlpha.lean | Finite certificate conditions (GlobalEnergy, KernelBlowup, BridgeInertia, StrongInertia) |

How to use this map
-------------------
This table complements `docs/core/ERURH_Proof_Status.md` by showing where each external hypothesis lives and how it feeds the certificate → inertia → RH chain. The shim module (`ERURH_AxiomsShim.lean`) re-exports these assumptions so downstream proofs import a single hub while we work to discharge or formalize them. Gate propositions (`RenormGateClosed`, `EnergyGateClosed` in `formal_proofs/ERURH/ERURH_GatesAlpha.lean`) are derived targets, not axioms, and are expected to follow from the analytic and ERU-specific bundles once certificate data is in place.
