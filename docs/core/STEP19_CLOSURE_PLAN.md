# STEP19 Closure Plan

## Master theorem axiom footprint

From `arxiv_submission/lean_master_axioms.txt`:

```
'ERURH.RH_from_ERURH_conditional' depends on axioms: [propext,
 Classical.choice,
 ERURH.ERU_inertia_of_E_bound_alpha,
 ERURH.ERU_inertia_to_E_bound_alpha,
 ERURH.RH_to_E_bound_alpha,
 Lean.ofReduceBool,
 Lean.trustCompiler,
 Quot.sound,
 ERURH.Alpha.ZeroOfZeta,
 ERURH.Alpha.b_rho,
 ERURH.Alpha.beta,
 ERURH.Alpha.gamma]
```

## Legend (Category)

- D = discharged by existing artifacts/pipeline (Lean proof or gate/certs)
- C = conditional external result (paper proof, A/B/C analytic, classical/citable, or beta input)
- N/A = structural context parameter (must be instantiated but not a theorem)

## Obligations from STEP18

| Obligation (Lean type) | Category (D/C/N/A) | Where lives | How discharged | Evidence |
| --- | --- | --- | --- | --- |
| `ClassicalZetaAssumptions` | C | `lean/formal_proofs/ERURH/ERURH_ClassicalZetaAssumptions.lean` | Classical/citable zeta facts in paper | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `Alpha.SpectralAssumptionsAlpha` | C | `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean` | A/B/C spectral package (paper) | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `Alpha.LSGammaAssumptions` | C | `lean/formal_proofs/ERURH/ERURH_LargeSieveGammaSketch.lean` | A/B/C LSγ package (paper) | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `Alpha.ExplicitFormulaERU` | C | `lean/formal_proofs/ERURH/ERURH_ExplicitCoefficientsSketch.lean` | Explicit formula package (paper/refs); currently `def ... := True` (placeholder) | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `BetaInertiaAssumptions` | C | `lean/formal_proofs/ERURH/ERURH_BetaInertiaAssumptions.lean` | Beta bundle; explicit assumption until beta data is frozen | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `RMSLocalContext` | N/A | `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean` | Instantiate RMS context from analytic/numeric setup | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `A1_mode ?ctx` | C | `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean` | A/B/C analytic A1 bound | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `A2Low_RMS ?ctx` | C | `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean` | A/B/C analytic A2 low RMS bound | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `A2Tail_RMS ?ctx` | C | `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean` | A/B/C analytic A2 tail bound | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `AxiomsShimAccepted` | C | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean` | Explicit/checklist axioms bundle; discharge via explicit formula/bridge pipeline | `docs/core/STEP18_UNCONDITIONAL_GOALS.log` |
| `CertificatesCorrectAlpha` | D | `lean/formal_proofs/ERURH/ERURH_MasterTheoremPlanB.lean` | Gate/certs (`certificatesCorrectAlpha_true`) from frozen JSON + `verify_gate.py` | `docs/core/STEP16_PRINT_AXIOMS_NUMERIC.txt` |
| `NumericCoverageAlpha {{ eru := sorry, window := sorry }}.window.ctx` | D | `lean/formal_proofs/ERURH/ERURH_MasterTheoremPlanB.lean` / `lean/formal_proofs/ERURH/ERURH_GatesAlpha.lean` | RMS envelope coverage from gate pipeline | `docs/core/STEP16_PRINT_AXIOMS_NUMERIC.txt` |
