ERURH Assumptions Report (Conditional RH)
=========================================

This report lists the external assumption bundles used by the conditional ERURH→RH theorem, their Lean names, roles, and status. All bundles are assumed classical or numeric inputs; the Lean development does not yet formalize the full analytic theory that would discharge them.

ClassicalZetaAssumptions
------------------------
| Field (Lean) | Informal description | Type | Status |
| --- | --- | --- | --- |
| `explicit_alpha` | Explicit-formula laws for the alpha bridge (ζ/ψ/xi) | classical analytic theorem | assumed external |
| `rh_from_E_alpha` | Equivalence RH ↔ bound on \(E\) (Chebyshev error) | classical analytic theorem | assumed external |
| `alphaInterfacesBase` | Packaged analytic witnesses (prefactor/zeta/lambda) | classical analytic input | assumed external |
| `explicit_rect_alpha_true` | Existence of analytic rectangle / witness | classical analytic input | assumed external |
| `explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge_bounds_alpha` (+ `of_*` variants) | Staged explicit-formula decomposition and xi/flux bounds | classical analytic theorem | assumed external |
| `EToRH_L1_alpha_of_explicit`, `EToRH_L2_alpha_of_bounds`, `EToRH_L3_alpha_of_argument`, `EToRH_no_offline_zeros_alpha_of_stages`, `RHfromE_alpha_of_no_offline_zeros`, `rh_from_E_alpha_of_hypotheses` | Checklist from explicit pieces to RH | classical analytic theorem | assumed external |
| `RH_to_E_bound_alpha`, `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha` | ERU inertia ↔ Chebyshev error links | classical analytic theorem | assumed external |

SpectralAssumptionsAlpha
------------------------
| Field (Lean) | Informal description | Type | Status |
| --- | --- | --- | --- |
| `data : HbExplicitData` | Explicit realization of \(b_\rho\) coefficients | structured spectral consequence | assumed external |
| `prefactor_bound : gamma_prefactor_growth_bound` | Growth bound for π^{-ρ/2}Γ(ρ/2) | classical analytic theorem | assumed external |
| `explicit_growth : explicit_b_rho_growth_bound data` | Growth of explicit \(b_\rho\) | structured spectral consequence | assumed external |
| `hb_pointwise : H_b_pointwise` | Pointwise decay of \(b_\rho\) | classical analytic theorem | assumed external |
| `hb_tail : H_b_L2_tail data` | Dyadic L² tail (HbWeak_L2_tail) | structured spectral consequence | assumed external |
| `hb_pointwise_weak : H_b_pointwise_weak` | Weak decay (derivable from pointwise) | derived from `hb_pointwise` | assumed external (auto-filled from `hb_pointwise`) |

LSGammaAssumptions
------------------
| Field (Lean) | Informal description | Type | Status |
| --- | --- | --- | --- |
| `LS_gamma_fine` | Refined LSγ inequality on spectral sums | classical analytic theorem | assumed external |
| `ls_gamma_weak` | LSγ^weak RMS bound (default via `LSGammaWeak_of_simple`) | structured spectral consequence | assumed external |
| `admissible_range` | Placeholder range predicate for LSγ | placeholder window condition | placeholder / to be refined |

BetaInertiaAssumptions
----------------------
| Field (Lean) | Informal description | Type | Status |
| --- | --- | --- | --- |
| `strongInertiaCompositeCorrect_beta_numeric` | Numeric correctness of beta strong-inertia composite certificate | numeric input / certificate | assumed external |
| `strongInertiaCertificateCorrect_beta_numeric` | Numeric correctness of beta strong inertia certificate | numeric input / certificate | assumed external |
| `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` (when bundled) | Kernel blow-up for β>1/2 from beta certificate | numeric input / certificate | assumed external |

Window / RMS assumptions (A1/A2) — WindowScalingAssumptions
-----------------------------------------------------------
| Field (Lean) | Informal description | Type | Status |
| --- | --- | --- | --- |
| `ctx : RMSLocalContext` | RMS decomposition context (mode/low/tail, envelope) | structural context | proved in Lean (structure) |
| `hA1 : A1_mode ctx` | A1-mode growth hypothesis (β>1/2 mode forces RMS growth) | window hypothesis | paper-level lemma for the legacy window-free route |
| `hLow : A2Low_RMS ctx` | RMS bound for low part | window hypothesis | discharged by gate data for `ctx_real` via `Alpha.GeneratedRMSContext.ctx_real_A2Low` |
| `hTail : A2Tail_RMS ctx` | RMS bound for tail part | window hypothesis | discharged by gate data for `ctx_real` via `Alpha.GeneratedRMSContext.ctx_real_A2Tail` |

Numeric coverage / certificate correctness
------------------------------------------
| Field (Lean) | Informal description | Type | Status |
| --- | --- | --- | --- |
| `CertificatesCorrectAlpha` | Bundle of alpha certificates (global energy, kernel blow-up) with correctness proofs | numeric input / certificate | proved in Lean using published data (`*_true_correct_alpha`) |
| `NumericCoverageAlpha ctx` | Coverage assumption over windows/tail for RMS normalization | numeric input / certificate | discharged for `ctx_real` by `Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed` |

Summary and alignment
---------------------
- The conditional theorem `RH_from_ERURH_conditional` in `ERURH_MasterTheoremSummary.lean` consumes `ERURH_GlobalAssumptions = { eru : ERURH_Assumptions; window : WindowScalingAssumptions }` plus `CertificatesCorrectAlpha` and `NumericCoverageAlpha`.
- All classical analytic inputs (explicit formula, ζ-growth, zero counting, HbWeak_L2_tail, LSγ^weak) are assumed external; none are formalized in Lean.
- Numeric certificate data for alpha are instantiated and proved correct in Lean; beta certificate correctness remains assumed.
- Window/RMS hypotheses A1/A2 are assumed in the abstract window bundle. For the concrete gate context `ctx_real`, A2-low/tail and RMS envelope closure are discharged by generated Lean lemmas from the published data.
