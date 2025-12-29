# Legacy window-free proof walkthrough (paper-first)

This document gives a step-by-step walkthrough of the legacy window-free route.
Each step lists (a) what is proven, (b) why it is needed, and (c) where the
evidence lives (Lean / paper / gate).

Scope: the abstract-context theorem
`ERURH.RH_unconditional_core_window_free` in
`lean/formal_proofs/ERURH/RH_Unconditional_Core_WindowFree.lean`.

## Inputs and where they live

- Lean (formal chain):
  - `lean/formal_proofs/ERURH/ERUModesCore.lean`
  - `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`
  - `lean/formal_proofs/ERURH/Alpha/RMS_Incompatibility.lean`
  - `lean/formal_proofs/ERURH/RH_Unconditional_Core_WindowFree.lean`
- Paper (analytic lemmas):
  - A1: Lemma `a1-from-supercritical` in `arxiv_submission/ERURH_Conditional_Proof.tex`
  - A2: Lemma `a2-from-abc` in `arxiv_submission/ERURH_Conditional_Proof.tex`
  - Classical A/B/C packages: same paper (Theorems A, B, C).
- Gate (certificates and numeric coverage):
  - `scripts/verify_gate.py`, `tools/make_*`
  - `data/releases/erurh-v2-core/formal/` (frozen inputs)

## Step-by-step chain

### Step 1: Define the ERU mode and observable
- Statement: `ERU_mode_beta β` is the existence of a threshold `s0` with a
  pointwise lower bound on `|logR_alpha s|` for all `s >= s0`.
- Why needed: this is the formal representation of a supercritical mode.
- Evidence:
  - Lean definition: `lean/formal_proofs/ERURH/ERUModesCore.lean`.
  - Paper: Section "No supercritical ERU modes".

### Step 2: Define the RMS-local context and A1/A2 hypotheses
- Statement: `RMSLocalContext` packages windowed RMS decomposition and constants.
  A1/A2 are props: `A1_mode`, `A2Low_RMS`, `A2Tail_RMS`.
- Why needed: this is the abstract interface for the Plan B RMS argument.
- Evidence:
  - Lean: `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`.

### Step 3: A1-from-supercritical (analytic lemma)
- Statement: a supercritical mode implies `A1_mode` for the chosen context:
  `A1_from_supercritical ctx`.
- Why needed: this is the analytic bridge from `ERU_mode_beta` to the RMS local
  contradiction.
- Evidence:
  - Paper: Lemma `a1-from-supercritical` in
    `arxiv_submission/ERURH_Conditional_Proof.tex`.
  - Lean (statement only): `lean/formal_proofs/ERURH/A1FromSupercriticalMode_Legacy.lean`.

### Step 4: A2-low/A2-tail from A/B/C (analytic lemma)
- Statement: Theorems A/B/C imply uniform bounds for `RMS_low` and `RMS_tail`,
  i.e. `A2Low_RMS` and `A2Tail_RMS`.
- Why needed: A2 controls the low and tail noise in the RMS decomposition.
- Evidence:
  - Paper: Lemma `a2-from-abc` in
    `arxiv_submission/ERURH_Conditional_Proof.tex`.
  - Background: Theorems A/B/C (same paper).

### Step 5: A1 + A2 imply RMS violation
- Statement: `RMSLocalHypothesis_of_A2` shows that A1/A2 imply an RMS window
  exceeds the envelope constant.
- Why needed: this is the formal RMS-local contradiction trigger.
- Evidence:
  - Lean: `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`
    (lemma `RMSLocalHypothesis_of_A2`).

### Step 6: Closed RMS envelope contradicts A1/A2
- Statement: `A1A2_decomp_envelope_inconsistent` shows A1/A2 plus a closed
  envelope yields `False`.
- Why needed: this yields "no supercritical modes" from A1/A2 plus gates.
- Evidence:
  - Lean: `lean/formal_proofs/ERURH/Alpha/RMS_Incompatibility.lean`.
  - Gate: envelope closure (`RMS_envelope_closed`) is discharged by certificates
    if a concrete context is instantiated.

### Step 7: No supercritical modes -> strong inertia (Lean)
- Statement: `InertiaERU_alpha_strong_of_no_modes_via_certificates` turns
  "no supercritical modes" plus certificate assumptions into strong inertia.
- Why needed: strong inertia is the formal bridge to RH for `xiAlpha`.
- Evidence:
  - Lean: `lean/formal_proofs/ERURH/ERUModesAlpha.lean` and related files.
  - Paper: certificates and gate assumptions (Assumption `assm:certs`).

### Step 8: Strong inertia -> RH (Lean)
- Statement: `ERU_RH_equiv_alpha_of_axioms` converts strong inertia into RH,
  assuming the classical package bundled in `AxiomsShimAccepted`.
- Why needed: this is the final logical implication to RH.
- Evidence:
  - Lean: `lean/formal_proofs/ERURH/ERUModesAlpha.lean` (via the axioms shim).
  - Paper: assumptions ledger and classical zeta package.

### Step 9: Final theorem (window-free core)
- Statement: `RH_unconditional_core_window_free` composes all steps above.
- Evidence:
  - Lean: `lean/formal_proofs/ERURH/RH_Unconditional_Core_WindowFree.lean`.

## Why each step is necessary

- Steps 1-2 set the formal objects (ERU modes, RMS context).
- Steps 3-4 supply analytic content (A1, A2) that is not derived in Lean.
- Steps 5-6 turn A1/A2 plus a closed envelope into a contradiction.
- Steps 7-8 translate "no supercritical modes" into RH.
- Step 9 packages the chain into the final Lean theorem.

## Current status (legacy window-free route)

- Lean: fully checks the logical chain.
- Paper: must supply A1 (Lemma `a1-from-supercritical`) and A2 (Lemma `a2-from-abc`),
  and the classical A/B/C theorems.
- Gate: supplies numeric certificates if a concrete context is instantiated.
