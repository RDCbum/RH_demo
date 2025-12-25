# Assumptions Ledger (release/arxiv)

This ledger summarizes what is discharged by which external layer after the beta de-axiomatization.

## A/B/C (analytic packages, discharged externally)
- A: `Alpha.SpectralAssumptionsAlpha` and related spectral bounds (hb tail / pointwise data) from the paper A package.
- B: `Alpha.LSGammaAssumptions` (LS_gamma_weak / LS_gamma_fine) from the paper B package.
- C: `A2Tail_RMS` and window-tail controls from the paper C package (RMS tail / band counting).

## Classical / citable
- `ClassicalZetaAssumptions` (zeta zeros and classical explicit-formula framework).
- Explicit-formula objects and bounds used by the alpha interface:
  - `ERURH.Alpha.ZeroOfZeta`, `ERURH.Alpha.beta`, `ERURH.Alpha.gamma`, `ERURH.Alpha.b_rho`.
- ERU inertia / E-bound equivalences:
  - `ERURH.ERU_inertia_to_E_bound_alpha`, `ERURH.ERU_inertia_of_E_bound_alpha`, `ERURH.RH_to_E_bound_alpha`.

## Gate + certificates (alpha + RMS)
- `CertificatesCorrectAlpha` discharges the alpha numeric certificates (global energy + kernel blowup).
- `NumericCoverageAlpha` discharges RMS coverage (`Alpha.RMS_envelope_closed`).
- These are regenerated and checked by `scripts/verify_gate.py`.

## Beta (explicit assumptions)
- `BetaInertiaAssumptions` is now explicit and carries a bundle of beta certificates and correctness proofs.
- There is no frozen beta input in `data/releases/erurh-v2-core/formal/`, so beta remains external.
- See `docs/core/STEP9C_BETA_GAP.md` for the missing beta inputs and expected JSON schema.
