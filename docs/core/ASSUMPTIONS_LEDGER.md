# Assumptions Ledger (release/arxiv)

This ledger summarizes what is discharged by which external layer after beta gate integration and inertia/E bundling.

## A/B/C (analytic packages, discharged externally)
- A: `Alpha.SpectralAssumptionsAlpha` and related spectral bounds (hb tail / pointwise data) from the paper A package.
- B: `Alpha.LSGammaAssumptions` (LS_gamma_weak / LS_gamma_fine) from the paper B package.
- C: `A2Tail_RMS` and window-tail controls from the paper C package (RMS tail / band counting).

## Classical / citable
- `ClassicalZetaAssumptions` (zeta zeros and classical explicit-formula framework).
- Explicit-formula objects and bounds used by the alpha interface:
  - `ERURH.Alpha.ZeroOfZeta`, `ERURH.Alpha.beta`, `ERURH.Alpha.gamma`, `ERURH.Alpha.b_rho`.
- ERU inertia / E-bound implications are now explicit fields in `AxiomsShimAccepted` (no global axioms).

## Gate + certificates (alpha + RMS + beta)
- `CertificatesCorrectAlpha` discharges the alpha numeric certificates (global energy + kernel blowup).
- `NumericCoverageAlpha` discharges RMS coverage (`Alpha.RMS_envelope_closed`).
- `BetaInertiaAssumptions` is discharged from frozen beta JSON via `tools/make_beta_certificate.py` in `verify_gate.py`.
