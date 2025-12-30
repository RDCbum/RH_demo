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
  Detailed proofs live in `arxiv_submission/Theorem_ABC_preprint.tex`.

## Analytic gap (Route B)
Two bridges are maintained: the fixed-window bridge (primary route)
and the Buchstab bridge (alternative route). Only one is required for a
complete Route B chain.
- explicit hypothesis `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`
  (`lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge_Legacy.lean:34`; paper Assumption
  `assm:threshold-control` in `arxiv_submission/ERURH_Conditional_Proof.tex`). This states that the
  supercritical-mode threshold can be chosen no later than `windowMinMax` for the ctx_real
  window family; it yields the existence of a ctx_real window where the ERU-mode lower bound holds
  and closes the window-compatibility step in Lemma B.1. The paper supplies only a proof outline;
  the full analytic bound on the threshold remains deferred.
- gate-certified side condition `∀ w, ctx_real_logR_alpha_upper w`
  (`lean/formal_proofs/ERURH/Alpha/GeneratedRMSModeBridge.lean:35`), enforced by
  `tools/check_rms_mode_bridge.py` using interval arithmetic
  (see `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md`, `docs/core/P16_GATE_FULL.txt`,
  `docs/core/P17_GATE_FULL.txt`, `docs/core/P35_GATE_FULL.txt`).
- numeric threshold check `windowMinMax ≥ s0` from `formal_report_analytic.json`,
  enforced by `tools/check_rms_context.py` (see `docs/core/P26_WINDOWMIN_THRESHOLD_CERT.md`,
  `docs/core/P35_GATE_FULL.txt`).

## Alternative Buchstab gap (Route B, existential window)
- explicit hypothesis `ERURH.A1_from_supercritical_buchstab ctx_real`
  (`lean/formal_proofs/ERURH/ERURH_A1_BuchstabBridge.lean`; exported in
  `arxiv_submission/lean_gap_statements.txt`; Lemma
  `a1-from-supercritical-buchstab` and
  `buchstab-coefficient` in `arxiv_submission/ERURH_Conditional_Proof.tex`).
  This packages the Buchstab
  multiplier non-vanishing with a structural coefficient lower bound and
  implies `ERURH.A1_from_supercritical` via
  `A1_from_supercritical_of_buchstab`. The remaining analytic obligation is
  the coefficient non-vanishing / lower-bound bridge. The coefficient
  non-vanishing is derived in Lean from the explicit-formula identification
  `ERURH.ExplicitBRhoExpression` using
  `buchstab_coefficient_nonzero_of_explicit_b_rho_expr`.

## Legacy window-free route (abstract ctx)
- The analytic gap is `ERURH.A1_from_supercritical_buchstab ctx`
  (machine-exported in `arxiv_submission/lean_gap_statements.txt`; Lemma
  `a1-from-supercritical-buchstab` and
  `buchstab-coefficient` in `arxiv_submission/ERURH_Conditional_Proof.tex`).
  Lean derives `ERURH.A1_from_supercritical ctx` from this via
  `A1_from_supercritical_of_buchstab`.
- The paper proof isolates the Buchstab multiplier non-vanishing and the
  structural coefficient lower bound as the only external inputs. The
  coefficient non-vanishing is reduced to the explicit-formula identification
  `ERURH.ExplicitBRhoExpression`.
- A2-low and A2-tail are derived from the classical packages via
  Lemma `a2-from-abc` in `arxiv_submission/ERURH_Conditional_Proof.tex`.
- `RMS_envelope_closed ctx` remains as the numeric/gate side condition if
  a concrete context is instantiated.
- No window-cofinality or threshold-control lemma is needed in this route.
  The A1 lemma is stated in `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Lemma `a1-from-supercritical-buchstab`).

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
