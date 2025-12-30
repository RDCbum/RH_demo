# Referee FAQ (anticipated objections and responses)

This FAQ collects likely referee objections and points to the precise evidence
in the paper, Lean, or gate logs. Each item links to a concrete file.

## 1) "Is this unconditional RH?"
**Objection.** The paper may appear to claim unconditional RH.  
**Response.** The result is conditional: Lean proves the logical chain, while
the paper supplies analytic lemmas (A1 and A2) and classical packages (A/B/C),
and the gate validates finite certificates.  
**Evidence.**
- `arxiv_submission/ERURH_Conditional_Proof.tex` (Theorem `thm:main`, Section “Formal status and gaps”).  
- `docs/core/P24_CLAIM_WORDING.md` (recommended claim text).

## 2) "Where is A1 proved?"
**Objection.** The supercritical mode ⇒ A1\_mode step is not formalized in Lean.  
**Response.** A1 is supplied by paper lemmas. The primary route is the legacy
window-free lemma `a1-from-supercritical` (proved in the paper); the fixed-window
route is an alternative computational bridge, and the Buchstab bridge is an
optional analytic derivation of A1. The gate only checks numeric side conditions
for the fixed-window route; it does not prove the analytic implication from
`ERU_mode_beta` to the threshold. The fixed-window step remains a proof outline.
**Evidence.**
- `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a1-from-supercritical`,
  Assumption `assm:threshold-control`, optional Lemma `a1-from-supercritical-buchstab`).  
- `lean/formal_proofs/ERURH/A1FromSupercriticalMode_Legacy.lean` (legacy statement).  
- `arxiv_submission/lean_gap_statements.txt` (machine export).

## 3) "A2 is assumed, not derived"
**Objection.** A2-low/A2-tail look like assumptions without proof.  
**Response.** A2 is derived from the classical A/B/C packages in the paper.  
**Evidence.**
- `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a2-from-abc`).  
- `docs/ERURH_A2_AnalyticPlan.md` (analytic plan).

## 4) "A/B/C are not standard"
**Objection.** Theorems A/B/C may hide new analytic content.  
**Response.** They are stated explicitly with classical dependencies; they are
the only non-ERURH analytic inputs.  
**Evidence.**
- `arxiv_submission/ERURH_Conditional_Proof.tex` (Theorems A/B/C).  
- `docs/core/ERURH_Analytic_Theorems_ABC.md` (companion statements).

## 5) "RMS_mode in Lean is not the analytic RMS"
**Objection.** The paper uses RMS integrals but Lean uses an abstract context.  
**Response.** The fixed-window route uses a concrete gate context and includes
a certificate that the numeric `ctx_real.RMS_mode` lower-bounds the semantic
infimum `rms_semantic` on each window (see the gate bridge notes). The legacy
window-free route uses an abstract RMS context and does not depend on any fixed
window semantics.  
**Evidence.**
- `docs/core/LEGACY_WINDOW_FREE_PROOF_WALKTHROUGH.md` (Step 2–6).  
- `docs/core/ROUTES_COMPARISON.md` (procedure and route separation).
- `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean` (abstract `RMSLocalContext`).
 - `docs/core/P15_NOTES.md` (semantic bridge certificate).

## 6) "Gate certificates are opaque"
**Objection.** Numerical certificates might hide errors.  
**Response.** The gate regenerates all artifacts and checks inequalities exactly
from frozen inputs; logs are kept in `docs/core/`.  
**Evidence.**
- `scripts/verify_gate.py` and `tools/` (reproducible pipeline).  
- `docs/core/LEGACY_WINDOW_FREE_BUILD_FULL.txt`, `docs/core/LEGACY_WINDOW_FREE_GATE_FULL.txt`.

## 7) "Axioms shim hides project axioms"
**Objection.** The Lean development may rely on project axioms.  
**Response.** A NOAX guard enforces no `axiom/constant/opaque/sorry` under
`lean/formal_proofs/ERURH`.  
**Evidence.**
- `tools/check_no_noncore_axioms.py` (guard).  
- `docs/core/NOAX_FINAL_AUDIT.md`.

## 8) "Is the legacy window-free route consistent?"
**Objection.** It may rely on a hidden window cofinality assumption.  
**Response.** The legacy route is explicitly window-free and uses an abstract
RMS context. In the paper, cofinality is part of the definition of an
admissible window family, not an extra analytic assumption.  
**Evidence.**
- `docs/core/LEGACY_WINDOW_FREE_PROOF_WALKTHROUGH.md`.  
- `lean/formal_proofs/ERURH/RH_Unconditional_Core_WindowFree.lean`.

## 9) "Are you mixing routes?"
**Objection.** The paper might mix the fixed-window route with the legacy one.  
**Response.** The checklist separates the legacy window-free route (primary)
from the fixed-window computational route (alternative) and marks their gaps
explicitly; the Buchstab bridge is an optional derivation of A1.  
**Evidence.**
- `docs/core/RH_CLOSURE_CHECKLIST.md`.
- `docs/core/ROUTES_COMPARISON.md`.
