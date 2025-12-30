CLOSURE MATRIX REAL (master theorem hypothesis footprint)

Primary source: `docs/core/ASSUMPTIONS_FOOTPRINT.txt`.

| Hypothesis (field) | Lean type | Where it appears | Discharge path | Evidence |
| --- | --- | --- | --- | --- |
| ERURH_GlobalAssumptions.eru | ERURH.ERURH_Assumptions | ERURH_GlobalAssumptions (footprint) | bundle; see subfields | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ERURH_GlobalAssumptions.window | ERURH.WindowScalingAssumptions | ERURH_GlobalAssumptions (footprint) | A1/A2 bundle; see subfields | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ERURH_Assumptions.classical | ERURH.ClassicalZetaAssumptions | ERURH_Assumptions (footprint) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt, docs/ERURH_ExplicitFormula_Plan.md |
| ERURH_Assumptions.spectral | ERURH.Alpha.SpectralAssumptionsAlpha | ERURH_Assumptions (footprint) | A/B/C (A: Hb data + tail) | docs/core/ASSUMPTIONS_FOOTPRINT.txt, docs/core/ERURH_Analytic_Theorems_ABC.md |
| ERURH_Assumptions.ls_gamma | ERURH.Alpha.LSGammaAssumptions | ERURH_Assumptions (footprint) | A/B/C (B: LS_gamma fine/weak) | docs/core/ASSUMPTIONS_FOOTPRINT.txt, docs/core/ERURH_Analytic_Theorems_ABC.md |
| ERURH_Assumptions.explicit_formula_ERU | ERURH.Alpha.ExplicitFormulaERU | ERURH_Assumptions (footprint) | classical/citable (explicit formula ERU) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ERURH_Assumptions.beta_inert | ERURH.BetaInertiaAssumptions | ERURH_Assumptions (footprint) | certificates/gate (beta) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| WindowScalingAssumptions.ctx | ERURH.RMSLocalContext | WindowScalingAssumptions (footprint) | Lean structure | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| WindowScalingAssumptions.hA1 | ERURH.A1_mode ctx | WindowScalingAssumptions (footprint) | A1 (Plan B) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| WindowScalingAssumptions.hLow | ERURH.A2Low_RMS ctx | WindowScalingAssumptions (footprint) | A2-low (Plan B) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| WindowScalingAssumptions.hTail | ERURH.A2Tail_RMS ctx | WindowScalingAssumptions (footprint) | A/B/C (C: A2-tail) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.explicit_alpha | ERURH.ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.rh_from_E_alpha | ERURH.RHfromE xiAlpha AlphaPsi | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.alphaInterfacesBase | ERURH.AlphaInterfaces | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.explicit_rect_alpha | ERURH.explicit_rect_alpha | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.explicit_core_alpha | Prop | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.xi_bounds_alpha | Prop | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.xi_argument_alpha | Prop | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.flux_to_bridge_bounds_alpha | Prop | ClassicalZetaAssumptions (printed) | classical/citable | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| ClassicalZetaAssumptions.zero_band_count_bound | ERURH.ZeroBandCountBound | ClassicalZetaAssumptions (printed) | classical/citable (zero counting) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.SpectralAssumptionsAlpha.data | ERURH.Alpha.HbExplicitData | Alpha.SpectralAssumptionsAlpha (printed) | A/B/C (A: Hb explicit data) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.SpectralAssumptionsAlpha.prefactor_bound | ERURH.Alpha.gamma_prefactor_growth_bound | Alpha.SpectralAssumptionsAlpha (printed) | classical/citable (gamma prefactor growth) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.SpectralAssumptionsAlpha.explicit_growth | ERURH.Alpha.explicit_b_rho_growth_bound data | Alpha.SpectralAssumptionsAlpha (printed) | A/B/C (A: pointwise growth) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.SpectralAssumptionsAlpha.hb_pointwise | ERURH.Alpha.H_b_pointwise | Alpha.SpectralAssumptionsAlpha (printed) | A/B/C (A: pointwise) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.SpectralAssumptionsAlpha.hb_tail | ERURH.Alpha.H_b_L2_tail data | Alpha.SpectralAssumptionsAlpha (printed) | A/B/C (A: tail) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.SpectralAssumptionsAlpha.hb_pointwise_weak | ERURH.Alpha.H_b_pointwise_weak | Alpha.SpectralAssumptionsAlpha (printed) | derivable from hb_pointwise | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.LSGammaAssumptions.LS_gamma_fine | Prop | Alpha.LSGammaAssumptions (printed) | A/B/C (B: LS_gamma fine) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| Alpha.LSGammaAssumptions.ls_gamma_weak | ERURH.Alpha.LSGammaWeak | Alpha.LSGammaAssumptions (printed) | A/B/C (B: LS_gamma weak) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| BetaInertiaAssumptions.strongInertiaCertificateCorrect_beta_numeric | ERURH.Beta.StrongInertiaCertificateCorrect_beta ... | BetaInertiaAssumptions (printed) | certificates/gate (beta) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| BetaInertiaAssumptions.strongInertiaCompositeCorrect_beta_numeric | ERURH.Beta.StrongInertiaCompositeCorrect_beta ... | BetaInertiaAssumptions (printed) | certificates/gate (beta) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| BetaInertiaAssumptions.energy_kernel_blowup_of_mode_beta_of_certificate | Prop | BetaInertiaAssumptions (printed) | certificates/gate (beta -> alpha kernel) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| AxiomsShimAccepted.explicit_alpha | ERURH.ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi | AxiomsShimAccepted (printed) | classical/citable (alpha axioms) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| AxiomsShimAccepted.rh_from_E_alpha | ERURH.RHfromE xiAlpha AlphaPsi | AxiomsShimAccepted (printed) | classical/citable (RH-from-E) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| AxiomsShimAccepted.alphaInterfacesBase | ERURH.AlphaInterfaces | AxiomsShimAccepted (printed) | classical/citable (interfaces) | docs/core/ASSUMPTIONS_FOOTPRINT.txt |
| CertificatesCorrectAlpha.h_global | ERURH.GlobalEnergyCertificateCorrect_alpha globalEnergyCertificate_true_alpha | CertificatesCorrectAlpha (printed) | certificates/gate (alpha) | docs/core/ASSUMPTIONS_FOOTPRINT.txt, scripts/verify_gate.py |
| CertificatesCorrectAlpha.h_kernel | ERURH.KernelBlowupCertificateCorrect_alpha kernelBlowupCertificate_true_alpha | CertificatesCorrectAlpha (printed) | certificates/gate (alpha) | docs/core/ASSUMPTIONS_FOOTPRINT.txt, scripts/verify_gate.py |
| NumericCoverageAlpha ctx | ERURH.Alpha.RMS_envelope_closed ctx | NumericCoverageAlpha (def) | certificates/gate (RMS envelope coverage) | docs/core/ASSUMPTIONS_FOOTPRINT.txt, lean/formal_proofs/ERURH/ERURH_GatesAlpha.lean |
