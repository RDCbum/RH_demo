# STEP18 Unconditional Goals

## Lean goals (from STEP18_UNCONDITIONAL_GOALS.log)

```
case classical
⊢ ClassicalZetaAssumptions

case spectral
⊢ Alpha.SpectralAssumptionsAlpha

case ls_gamma
⊢ Alpha.LSGammaAssumptions

case explicit_formula_ERU
⊢ Alpha.ExplicitFormulaERU

case beta_inert
⊢ BetaInertiaAssumptions

case ctx
⊢ RMSLocalContext

case hA1
⊢ A1_mode ?ctx

case hLow
⊢ A2Low_RMS ?ctx

case hTail
⊢ A2Tail_RMS ?ctx

case hAxioms
⊢ AxiomsShimAccepted

case hCerts
⊢ CertificatesCorrectAlpha

case hNumeric
⊢ NumericCoverageAlpha { eru := sorry, window := sorry }.window.ctx
```

## Classification

- ClassicalZetaAssumptions — classical/citable
- Alpha.SpectralAssumptionsAlpha — A/B/C (spectral)
- Alpha.LSGammaAssumptions — A/B/C (LSγ)
- Alpha.ExplicitFormulaERU — classical/citable (explicit formula package)
- BetaInertiaAssumptions — beta
- RMSLocalContext — A/B/C (RMS context)
- A1_mode ?ctx — A/B/C (A1)
- A2Low_RMS ?ctx — A/B/C (A2 low)
- A2Tail_RMS ?ctx — A/B/C (A2 tail)
- AxiomsShimAccepted — refactor/axioms bundle (explicit/checklist axioms)
- CertificatesCorrectAlpha — gate/certs
- NumericCoverageAlpha {..}.window.ctx — gate/certs
