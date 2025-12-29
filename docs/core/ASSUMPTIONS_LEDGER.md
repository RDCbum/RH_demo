# Assumptions Ledger (release/arxiv)

This ledger summarizes what is discharged by which external layer after beta gate integration and inertia/E bundling.

## Axiom footprint note
- No project axioms: there are no `axiom`/`constant` declarations in `lean/formal_proofs/ERURH`.
- Lean kernel axioms still appear in `#print axioms` (e.g., `propext`, `Classical.choice`, `Quot.sound`,
  `Lean.ofReduceBool`, `Lean.trustCompiler`) due to classical reasoning and kernel computation reflection.

## A/B/C (analytic packages, discharged externally)
- A: `Alpha.SpectralAssumptionsAlpha` and related spectral bounds (hb tail / pointwise data) from the paper A package.
- B: `Alpha.LSGammaAssumptions` (LS_gamma_weak / LS_gamma_fine) from the paper B package.
- C: uniform RMS tail control (Theorem C in `arxiv_submission/ERURH_Conditional_Proof.tex`), used to discharge A2-tail for the legacy window-free route.

## Analytic gap (Route B)
- explicit hypothesis `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`
  (`lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge_Legacy.lean:34`; paper Assumption
  `assm:threshold-control` in `arxiv_submission/ERURH_Conditional_Proof.tex`). This states that the
  supercritical-mode threshold can be chosen no later than `windowMinMax` for the ctx_real
  window family; it yields the existence of a ctx_real window where the ERU-mode lower bound holds
  and closes the window-compatibility step in Lemma B.1.
- gate-certified side condition `∀ w, ctx_real_logR_alpha_upper w`
  (`lean/formal_proofs/ERURH/Alpha/GeneratedRMSModeBridge.lean:35`), enforced by
  `tools/check_rms_mode_bridge.py` using interval arithmetic
  (see `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md`, `docs/core/P16_GATE_FULL.txt`,
  `docs/core/P17_GATE_FULL.txt`).
- numeric threshold check `windowMinMax ≥ s0` from `formal_report_analytic.json`,
  enforced by `tools/check_rms_context.py` (see `docs/core/P26_WINDOWMIN_THRESHOLD_CERT.md`).

## Legacy experimental gap (Route B, existential window)
- explicit hypothesis `ERURH.A1_from_supercritical ctx_real`
  (`lean/formal_proofs/ERURH/A1FromSupercriticalMode_Legacy.lean:7`; used by
  `lean/formal_proofs/ERURH/RH_Unconditional_Core_Legacy.lean`).
  This removes the fixed-window threshold-control requirement but leaves the
  analytic A1 implication as a paper-level obligation.

## Legacy window-free route (abstract ctx)
- `ERURH.A1_from_supercritical ctx` is proved in the paper
  (Lemma `a1-from-supercritical` in `arxiv_submission/ERURH_Conditional_Proof.tex`).
- A2-low and A2-tail are derived from the classical packages via
  Lemma `a2-from-abc` in `arxiv_submission/ERURH_Conditional_Proof.tex`.
- `RMS_envelope_closed ctx` remains as the numeric/gate side condition if
  a concrete context is instantiated.
- No window-cofinality or threshold-control lemma is needed in this route.
  The A1 lemma is stated in `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Lemma `a1-from-supercritical`).

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
