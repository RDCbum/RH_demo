# STEP7 Axiom Footprint (Numeric + Coverage)

## Master theorem: `ERURH.RH_from_ERURH_conditional`
- Logical/Lean core: `propext`, `Classical.choice`, `Quot.sound`, `Lean.ofReduceBool`, `Lean.trustCompiler`.
- ERURH-specific axioms/consts used by the theorem:
  - `ERURH.ERU_inertia_to_E_bound_alpha` -> `lean/formal_proofs/ERURH/ERUInertia.lean:26`
  - `ERURH.ERU_inertia_of_E_bound_alpha` -> `lean/formal_proofs/ERURH/ERUInertia.lean:31`
  - `ERURH.RH_to_E_bound_alpha` -> `lean/formal_proofs/ERURH/ERUInertia.lean:53`
  - `ERURH.alphaInterfacesBase` -> `lean/formal_proofs/ERURH/AlphaAxioms.lean:14`
  - `ERURH.explicit_alpha_via_stages_true` -> `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:220`
  - `ERURH.rh_from_E_alpha_of_hypotheses` -> `lean/formal_proofs/ERURH/EToRHChecklist.lean:95`
  - `ERURH.xi_bounds_alpha` -> `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:47`
  - `ERURH.xi_argument_alpha` -> `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:62`
  - `ERURH.xi_bounds_alpha_of_hypotheses` -> `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:126`
  - `ERURH.xi_argument_alpha_of_hypotheses` -> `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:130`
  - `ERURH.Alpha.ZeroOfZeta` -> `lean/formal_proofs/ERURH/ERURH_ClassicalZetaAssumptions.lean:23`
  - `ERURH.Alpha.beta` -> `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:26`
  - `ERURH.Alpha.gamma` -> `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:29`
  - `ERURH.Alpha.b_rho` -> `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:58`
  - `ERURH.Beta.strongInertiaCertificate_beta_numeric` -> `lean/formal_proofs/ERURH/Beta/InertiaCertificatesBeta.lean:49`

## Alpha certificates
- `ERURH.GlobalEnergyCertificateCorrect_alpha`
- `ERURH.globalEnergyCertificate_true_alpha`
- `ERURH.KernelBlowupCertificateCorrect_alpha`
- `ERURH.kernelBlowupCertificate_true_alpha`

Axiom footprint: only `propext`, `Classical.choice`, `Quot.sound`.

## RMS coverage (Alpha)
- `ERURH.Alpha.RMS_envelope_closed`

Axiom footprint: only `propext`, `Classical.choice`, `Quot.sound`.

## Beta certificates (if present)
- `ERURH.Beta.StrongInertiaCertificateCorrect_beta`
- `ERURH.Beta.StrongInertiaCompositeCorrect_beta`
- `ERURH.Beta.strongInertiaCertificate_beta_numeric`
- `ERURH.Beta.strongInertiaComposite_beta_numeric`

Axiom footprint:
- Correctness props depend only on `propext`, `Classical.choice`, `Quot.sound`.
- `ERURH.Beta.strongInertiaCertificate_beta_numeric` is an axiom (`lean/formal_proofs/ERURH/Beta/InertiaCertificatesBeta.lean:49`).
- `ERURH.Beta.strongInertiaComposite_beta_numeric` depends on `strongInertiaCertificate_beta_numeric` (`lean/formal_proofs/ERURH/Beta/CompositeCertificateBeta.lean:22`).
