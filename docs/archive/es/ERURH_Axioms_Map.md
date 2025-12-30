ERURH Axioms Map (Alpha Layer)
==============================

Purpose: centralize the external/axiomatic assumptions used by ERURH-alpha, their Lean locations, and their role in the certificates  inertia  RH chain.

Main axioms and predicates

| Name (Lean) | Kind | Category | Lean location | Used for |
| --- | --- | --- | --- | --- |
| `explicit_alpha` | axiom | analytic_standard | formal_proofs/ERURH/AlphaAxioms.lean | explicit formula laws for alpha bridge |
| `rh_from_E_alpha` | axiom | analytic_standard | formal_proofs/ERURH/AlphaAxioms.lean | RH-from-E bridge (analytic equivalence) |
| `alphaInterfacesBase` | axiom | eru_specific | formal_proofs/ERURH/AlphaAxioms.lean | packaged analytic witnesses (cover/prefactor/zeta/lambda) |
| `explicit_rect_alpha_true` | axiom | analytic_standard | formal_proofs/ERURH/ExplicitCoreBridge.lean | rectangle/explicit core witness |
| `explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge_bounds_alpha` (+ "of_*" variants) | axioms (props) | analytic_standard | formal_proofs/ERURH/ExplicitDecomposition.lean | staged explicit-formula decomposition |
| `EToRH_L1_alpha_of_explicit`, `EToRH_L2_alpha_of_bounds`, `EToRH_L3_alpha_of_argument`, `EToRH_no_offline_zeros_alpha_of_stages`, `RHfromE_alpha_of_no_offline_zeros`, `rh_from_E_alpha_of_hypotheses` | axioms | analytic_standard | formal_proofs/ERURH/EToRHChecklist.lean | staged checklist from explicit pieces to RH |
| `ERU_energy_global_dominates_kernel_legacy` | lemma | eru_specific/numeric_pipeline | formal_proofs/ERURH/ERUEnergyAlpha.lean | kernel energy threshold ⇒ global blow-up (legacy route via certificates) |
| `ERU_energy_global_dominates_kernel_of_certificate` | lemma | eru_specific | formal_proofs/ERURH/EnergyCertificatesAlpha.lean | certificate-based global energy blow-up |
| `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` | external bundle | beta_numeric | formal_proofs/ERURH/ERURH_BetaInertiaAssumptions.lean | certificate-based kernel blow-up (beta numeric) |
| `ERU_energy_kernel_blowup_of_mode_beta_legacy`, `ERU_energy_blowup_of_mode_beta` | lemmas | eru_specific | formal_proofs/ERURH/ERUModesAlpha.lean | mode á>1/2  kernel/global blow-up (legacy wrappers) |
| `alphaBridge_inertia_of_no_modes`, `InertiaERU_alpha_strong_of_no_modes`, `InertiaERU_alphaBridge_of_certificate` | lemmas | eru_specific | formal_proofs/ERURH/ERUModesAlpha.lean, InertiaCertificatesAlpha.lean | bridge/strong inertia derived from certificates or no-modes hypothesis |
| `InertiaERU_alpha_strong_of_bridge_inertia_legacy`, `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha`, `RH_to_E_bound_alpha` | axioms | analytic_standard/eru_specific | formal_proofs/ERURH/ERUInertia.lean | bridge/strong inertia links and E-bounds |
| `ERU_energy_alpha_bounded_of_checklist` | lemma | numeric_pipeline | formal_proofs/ERURH/EnergyBoundsAlpha.lean | checklist -> global energy bound; flux unpacking lemmas live here |
| Certificate predicates `*_Correct_alpha` | predicates | eru_specific | formal_proofs/ERURH/EnergyCertificatesAlpha.lean, InertiaCertificatesAlpha.lean | finite certificate conditions (GlobalEnergy, KernelBlowup, BridgeInertia, StrongInertia) |

How this map is used

This table complements `docs/ERURH_Proof_Status.md` by listing where each external assumption lives and how it feeds the certificates  inertia  RH chain. It is a roadmap for progressively replacing axioms with formal theorems or certified numeric bounds: the shim module (ERURH_AxiomsShim.lean) re-exports these axioms so downstream proofs can depend on a single import while we work to discharge or formalize them. Gate props `RenormGateClosed` and `EnergyGateClosed` (see `formal_proofs/ERURH/ERURH_GatesAlpha.lean`) are not axioms; they are derived targets expected to follow from the eru_specific and analytic_standard bundles once the certificate data exposes the necessary inequalities.***
