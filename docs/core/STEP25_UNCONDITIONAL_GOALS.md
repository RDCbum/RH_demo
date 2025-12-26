# STEP25 Unconditional Goals (post gate discharge)

## Goals reported by Lean

From `docs/core/STEP25_UNCONDITIONAL_GOALS.log`:

- `ClassicalZetaAssumptions`
- `Alpha.SpectralAssumptionsAlpha`
- `Alpha.LSGammaAssumptions`
- `Alpha.ExplicitFormulaERU`
- `RMSLocalContext`
- `A1_mode ctx`
- `A2Low_RMS ctx`
- `A2Tail_RMS ctx`
- `AxiomsShimAccepted`
- `NumericCoverageAlpha ctx`

## Comparison vs STEP18

- Removed: `BetaInertiaAssumptions` (now discharged by `betaInertiaAssumptions_true`).
- Removed: `CertificatesCorrectAlpha` (now discharged by `certificatesCorrectAlpha_true`).
- Remaining analytic gaps: classical package + A/B/C + AxiomsShimAccepted.
- Remaining numeric gap: `NumericCoverageAlpha ctx` (RMS envelope hypothesis for the chosen context).
