# Assumptions Ledger (release/arxiv)

This ledger summarizes what is discharged by which external layer after beta gate integration and inertia/E bundling.

## A/B/C (analytic packages, discharged externally)
- A: `Alpha.SpectralAssumptionsAlpha` and related spectral bounds (hb tail / pointwise data) from the paper A package.
- B: `Alpha.LSGammaAssumptions` (LS_gamma_weak / LS_gamma_fine) from the paper B package.
- C: reserved (RMS window bounds now frozen in gate/data; see below).

## Analytic gap (Route B)
- `ERURH.Alpha.pointwise_to_RMS_mode` (`lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_PointwiseToRMS.lean:10`;
  exported in `arxiv_submission/lean_gap_statements.txt`). This is Lemma B.1 (pointwise-to-RMS bridge),
  and it implies `ERURH.no_supercritical_beta` via Lemma B and `ctx_real_not_A1_mode`
  (see `docs/core/RB20_A1_EQUIVALENCE.md`).

## Classical / citable
- `ClassicalZetaAssumptions` (zeta zeros and classical explicit-formula framework).
- Explicit-formula objects and bounds used by the alpha interface:
  - `ERURH.Alpha.ZeroOfZeta`, `ERURH.Alpha.beta`, `ERURH.Alpha.gamma`, `ERURH.Alpha.b_rho`.
- ERU inertia / E-bound implications are now explicit fields in `AxiomsShimAccepted` (no global axioms).

## Gate + certificates (alpha + RMS + beta)
- `CertificatesCorrectAlpha` discharges the alpha numeric certificates (global energy + kernel blowup).
- `NumericCoverageAlpha` (RMS envelope closed), `A2Low_RMS`, and `A2Tail_RMS` are discharged from frozen
  `rms_context.json` via `tools/make_rms_context.py`.
- `BetaInertiaAssumptions` is discharged from frozen beta JSON via `tools/make_beta_certificate.py` in `verify_gate.py`.
