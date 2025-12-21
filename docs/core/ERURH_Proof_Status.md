ERURH Proof Status (Alpha Route to RH)
=====================================

## 1. Overview: the ERURH-alpha route to RH

ERURH-alpha packages four finite certificates—GlobalEnergy, KernelBlowup, BridgeInertia, StrongInertia. In Lean there is a master implication: if these four alpha certificates are correct, then `RiemannHypothesis xiAlpha` holds. The ERU layer restates classical ψ/logR/jRel conditions in an energy/inertia language, but the equivalence to RH depends on classical spectral analysis (explicit formula, etc.). The goal is to instantiate the certificates with exact data (rational constants, windows, tails) and analytic proofs so that RH is obtained in Lean without extra axioms.

## 2. What is formally proved in Lean

- Structures and predicates for the alpha certificates are defined: `GlobalEnergyCertificate_alpha`, `KernelBlowupCertificate_alpha`, `BridgeInertiaCertificate_alpha`, `StrongInertiaCertificate_alpha` and their `*_Correct_alpha` predicates.
- The master theorem (`RH_from_certificates_alpha` / `RH_from_ERU_energy` chain) states that, assuming the `Correct` predicates, one derives `RiemannHypothesis xiAlpha` via lemmas from energy dominance and mode blow-up through bridge/strong inertia to RH.
- Gate propositions `RenormGateClosed` and `EnergyGateClosed` live in `formal_proofs/ERURH/ERURH_GatesAlpha.lean`. They abstract the “alpha regime is stable” conditions (κ-band, envelope, global energy); skeleton lemmas show how alpha certificates should close the gates, with some inequalities still pending until the certificates expose the required bounds.
- The logical chain “energy/global constraints → kernel/bridge/strong inertia → RH” is formalized (with intermediate axioms). All ERURH-specific axioms are re-exported from `formal_proofs/ERURH/ERURH_AxiomsShim.lean` so downstream proofs import a single hub.

## 3. External analytic assumptions and numeric pipelines

### 3.1 Analytic assumptions (outside Lean)
- Global properties of ζ(s): Dirichlet series, analytic continuation, functional equation, explicit formula.
- Classical equivalences: RH ⇔ bounds on \(E(x) = \psi(x) - x\) ⇔ bounds on \( \log R \) and \( j_{\mathrm{rel}} \).
- ERURH-specific axioms: modes with β > 1/2 force kernel/energy blow-up; links between witnesses (prefactor, zeta, lambda) and bounds on \( \log R / j_{\mathrm{rel}} \); tail bounds, envelopes, and related analytic hypotheses. These are treated as classical mathematics, not reproved in Lean.

### 3.2 Numeric pipelines
- Python scripts produce window bounds, v2-lite tails, beta RMS energies, and sup diagnostics for `jRel_alpha`. They currently rely on floating-point / multiprecision and heuristic models (v2-lite), not yet on interval arithmetic with formal proofs.
- Constants used in the alpha certificates (κ, `L_global`, `cEnvelopeClosedRat`, tail start, etc.) align with these numerics but are not yet certified by formal proofs.

## 4. What would be needed for a fully unconditional proof

### 4.1 Analytic formalisation
- Formalize (or import from mathlib) the analytic theory of ζ(s): series, analytic continuation, functional equation, explicit formula.
- Show inside Lean that all current ERURH axioms (β > 1/2 ⇒ kernel/energy blow-up, tails, prefactors, etc.) follow from those foundations.

### 4.2 Certified numeric constants
- Build an interval-arithmetic pipeline for \( \log R / j_{\mathrm{rel}} \) and tails.
- Generate scripts that output rational constants with proofs of validity, and window-wise bounds with certified errors.
- Provide a mechanism to import these certified bounds into Lean as theorems or verified data.

### 4.3 Removing axioms and legacy assumptions
- Replace all current axioms in ERURH-alpha with proved lemmas; remove dependence on legacy axioms in `ERUModesAlpha`.
- Target theorem: within Lean (mathlib foundations) plus certified scripts, deduce `RiemannHypothesis xiAlpha` without additional analytic axioms.
- Route A aims for a clean conditional theorem `ERURH_AxiomsShim + CertificatesCorrect + NumericCoverage → RiemannHypothesis xiAlpha`, centralizing all external assumptions. In parallel, Route B seeks gate closure from the alpha certificates and shows any zero with β > 1/2 would force a gate to open.

## 5. Plan B (RMS-local route)

- The conditional master theorem `RH_from_planB_RMS` (`formal_proofs/ERURH/ERURH_MasterTheoremPlanB.lean`) states: assuming the centralized axioms, correct alpha certificates, numeric coverage, and an abstract `RMSLocalHypothesis` (intended to follow from `RMS_local_lemma`), there is no mode with β > 1/2, hence `RiemannHypothesis xiAlpha`.
- `RMSLocalHypothesis` captures the analytic output of Ideas 1&2: any ERU mode with β > 1/2 forces a window whose RMS exceeds the formal envelope. Its proof is pending (`ERURH_RMSLocalLemma.lean`).
- `ERURH_GatesFromRMS` connects an RMS violation to opening renormalization gates; combined with certificate-driven gate closure (`ERURH_GatesAlpha`), this gives the contradiction needed to rule out dominant modes.
- Route A (certificates + AxiomsShim) and Route B (RMS-local + gates) share the same axiomatic backbone; Route B adds the RMS-local analytic ingredient to reach the same RH conclusion via “β > 1/2 ⇒ gate opens ⇒ contradiction with closed gates”.
- An A2-focused wrapper `RH_from_planB_A2` lets one replace `RMSLocalHypothesis` with abstract A2-low/A2-tail controls (`formal_proofs/ERURH/ERURH_A2Hypotheses.lean`), mirroring the analytic roadmap in `docs/notes/ERURH_A2_AnalyticPlan.md`.
