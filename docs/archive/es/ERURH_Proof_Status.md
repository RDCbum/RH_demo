ERURH Proof Status (Alpha Route to RH)
=====================================

## 1. Overview: the ERURH-alpha route to RH

ERURH-alpha packages four finite certificates-GlobalEnergy, KernelBlowup, BridgeInertia, StrongInertia. In Lean there is a master implication: if these four alpha certificates are correct, then `RiemannHypothesis xiAlpha` holds. The ERU layer re-expresses classical ?/logR/jRel conditions in an energy/inertia language, but the logical equivalence to RH depends on classical spectral analysis (explicit formula, etc.). The end goal is to instantiate those certificates with exact data (rational constants, windows, tails) and analytic proofs so that RH is established in Lean without extra axioms.

## 2. What is formally proved in Lean

- The structures and predicates for the alpha certificates are defined: `GlobalEnergyCertificate_alpha`, `KernelBlowupCertificate_alpha`, `BridgeInertiaCertificate_alpha`, `StrongInertiaCertificate_alpha` and their `*_Correct_alpha` predicates.
- The master theorem (`RH_from_certificates_alpha` / `RH_from_ERU_energy` chain) states that, assuming the `Correct` predicates, one derives `RiemannHypothesis xiAlpha`. This is implemented as a chain of lemmas from energy dominance and mode blow-up through bridge/strong inertia to RH.
- Gate propositions `RenormGateClosed` and `EnergyGateClosed` live in `formal_proofs/ERURH/ERURH_GatesAlpha.lean`. They abstract the “alpha regime is stable” conditions (κ-band, envelope, global energy) and include skeleton lemmas indicating how the alpha certificates should close the gates; some inequalities remain TODOs until the certificates expose the needed bounds.
- The logical chain "energy/global constraints  kernel/bridge/strong inertia  RH" is formalized in Lean, albeit with some intermediate axioms. In this section we are only stating logical implications: if the certificate conditions hold, RH follows.
- All ERURH-specific axioms are now re-exported from `formal_proofs/ERURH/ERURH_AxiomsShim.lean`, so downstream proofs can depend on a single import while we work to discharge or formalize them.

## 3. External analytic assumptions and numeric pipelines

### 3.1 Analytic assumptions (outside Lean)

- Global properties of ?(s): Dirichlet series, analytic continuation, functional equation, explicit formula for ?.
- Classical equivalences: RH  bounds on ?(x)  bounds on logR/jRel.
- ERURH-specific axioms: modes with á > 1/2 force kernel/energy blow-up; connections between witnesses (prefactor, zeta, lambda) and bounds on logR/jRel; tail bounds, envelopes, and related analytic hypotheses. These are assumed as classical mathematics, not re-proved in Lean.

### 3.2 Numeric pipelines

- Python scripts produce window bounds, v2-lite tails, beta RMS energies, and sup diagnostics for jRel_alpha. They rely on floats/multiprecision and heuristic models (v2-lite), not yet on interval arithmetic with formal proofs.
- Constants used in the alpha certificates (?, L_global, cEnvelopeClosedRat, tailStart, etc.) are aligned with these numerics but are not yet certified with formal proofs.

## 4. What would be needed for a fully unconditional proof

### 4.1 Analytic formalisation

- Formalize (or import sufficiently from mathlib) the analytic theory of ?(s): series, analytic continuation, functional equation, explicit formula.
- Show inside Lean that all current ERURH axioms (mode á>1/2 ? kernel/energy blow-up, tails, prefactors, etc.) follow from those foundations.

### 4.2 Certified numeric constants

- Build an interval-arithmetic pipeline for logR/jRel and tails.
- Generate scripts that output rational constants plus proofs they are valid bounds, and window-wise bounds with certified errors.
- Provide a mechanism to import these certified bounds into Lean as theorems or verified data.

### 4.3 Removing axioms and legacy assumptions

- Replace all current axioms in ERURH-alpha with proved lemmas; remove dependence on legacy axioms in `ERUModesAlpha`.
- Aim for a theorem: within Lean (ZFC foundations of mathlib) plus certified scripts, deduce `RiemannHypothesis xiAlpha` without extra analytic axioms.
- At present, ERURH-alpha gives a fully formal conditional route to RH (once analytic assumptions are accepted) and a roadmap to make it unconditional by replacing analytic axioms and numeric heuristics with formally verified theorems and certified bounds.
- Route A aims to obtain a clean conditional theorem of the form `ERURH_AxiomsShim + CertificatesCorrect + NumericCoverage  RiemannHypothesis xiAlpha`, making all external assumptions explicit and centralized. In parallel, Route B plans to derive closed gates from the alpha certificates and eventually show that any zero with `β > 1/2` would force at least one gate to open.

## 5. Plan B (RMS-local route)

- A new conditional master theorem `RH_from_planB_RMS` (formal_proofs/ERURH/ERURH_MasterTheoremPlanB.lean) states: assuming the centralized axioms, correct alpha certificates, numeric coverage, and an abstract `RMSLocalHypothesis` (intended to follow from `RMS_local_lemma`), there is no mode with `β > 1/2`, and by the ERURH equivalence `RiemannHypothesis xiAlpha` follows.
- `RMSLocalHypothesis` captures the analytic output of Ideas 1&2: any ERU mode with `β > 1/2` forces a window whose RMS exceeds the formal envelope. Its proof is pending (lives as a `sorry` in `ERURH_RMSLocalLemma.lean`).
- `ERURH_GatesFromRMS` connects such an RMS violation to the opening of renormalization gates; combined with the certificates-driven gate closure (`ERURH_GatesAlpha`), this yields the contradiction needed to rule out dominant modes.
- Route A (certificates + AxiomsShim) and Route B (RMS-local + gates) share the same axiomatic backbone; Route B adds the RMS-local analytic ingredient to reach the same RH conclusion via “β > 1/2 ⇒ gate opens ⇒ contradiction with closed gates”.
- An A2-focused wrapper `RH_from_planB_A2` allows replacing `RMSLocalHypothesis` with abstract A2-low/A2-tail controls (`formal_proofs/ERURH/ERURH_A2Hypotheses.lean`), mirroring the analytic roadmap in `docs/ERURH_A2_AnalyticPlan.md`.
