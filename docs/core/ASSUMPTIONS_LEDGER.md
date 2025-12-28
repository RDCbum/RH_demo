# Assumptions Ledger (release/arxiv)

This ledger summarizes what is discharged by which external layer after beta gate integration and inertia/E bundling.

## Axiom footprint note
- No project axioms: there are no `axiom`/`constant` declarations in `lean/formal_proofs/ERURH`.
- Lean kernel axioms still appear in `#print axioms` (e.g., `propext`, `Classical.choice`, `Quot.sound`,
  `Lean.ofReduceBool`, `Lean.trustCompiler`) due to classical reasoning and kernel computation reflection.

## A/B/C (analytic packages, discharged externally)
- A: `Alpha.SpectralAssumptionsAlpha` and related spectral bounds (hb tail / pointwise data) from the paper A package.
- B: `Alpha.LSGammaAssumptions` (LS_gamma_weak / LS_gamma_fine) from the paper B package.
- C: reserved (RMS window bounds now frozen in gate/data; see below).

## Analytic gap (Route B)
- explicit hypothesis `ERURH.Alpha.ModeThresholdControlOnCtxRealWindow`
  (`docs/core/P30_ModeThresholdControl.lean:10-14`). This states that the
  supercritical-mode threshold can be chosen below the fixed window; it implies
  `SupercriticalModeAppliesOnCtxRealWindow` and closes the window-compatibility
  step in Lemma B.1.
- gate-certified side condition `ctx_real_logR_alpha_upper ctx_real_window`
  (`lean/formal_proofs/ERURH/Alpha/GeneratedRMSModeBridge.lean:35`), enforced by
  `tools/check_rms_mode_bridge.py` using interval arithmetic
  (see `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md`, `docs/core/P16_GATE_FULL.txt`,
  `docs/core/P17_GATE_FULL.txt`).

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
