# Paper Proof Completion Plan

Goal: convert all "proof outline"/"proof sketch" blocks in the main paper into complete proofs (given the stated analytic inputs), and document any remaining external assumptions precisely.

## Scope
- Main paper: `arxiv_submission/ERURH_Conditional_Proof.tex`.
- Companion preprint: `arxiv_submission/Theorem_ABC_preprint.tex` (A/B/C proofs).

## Targets
1) Proposition "No supercritical ERU modes" (Route B summary proof).
2) Lemma "A1 from supercritical mode (Buchstab bridge)".
3) Lemma "A2-low and A2-tail from classical inputs".
4) Any remaining proof blocks labeled "outline" or "sketch".

## Completion criteria
- Each target has a full proof text in the main paper, with explicit references to the lemmas and assumptions used.
- Any reliance on external analytic results is stated explicitly and traced to either:
  - Theorem A/B/C preprint, or
  - Assumptions listed in `assumptions_ledger.tex`.

## Implementation notes
- For (1): reference Lemma `a1-from-supercritical` (legacy) or Assumption `assm:threshold-control` (fixed-window), then Lemma `a2-from-abc`, then RMS contradiction.
- For (2): make Step 2 explicit with Assumption `assm:explicit`, Lemma `buchstab-coefficient`, and Remark `rem:Hs-mapping` for normalization.
- For (3): cite Theorem A/B/C preprint as the source of A2-tail and explicitly state the cutoff dependence for A2-low.

## Status
- Steps (1)–(3) upgraded from outline/sketch to full proofs in `arxiv_submission/ERURH_Conditional_Proof.tex` (post-review edits).
- Remaining tasks: scan for any other `proof outline` or `proof sketch` blocks and upgrade if found.
