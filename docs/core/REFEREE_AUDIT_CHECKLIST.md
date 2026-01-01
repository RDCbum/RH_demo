# Referee Audit Checklist (1-page)

Purpose: a compact checklist to audit the ERURH submission without hunting
through the repo. The central summary is `docs/core/P27_REFEREE_PACKET.md`.

## 1) Formal core (Lean)

- [ ] Build succeeds: `LAKE_JOBS=1 lake build ERURH`  
  Evidence: `docs/core/POST_MERGE_BUILD.txt`.
- [ ] No project axioms: NOAX guard passes.  
  Evidence: `docs/core/POST_MERGE_GATE_FULL.txt`.
- [ ] Master theorem axioms are Lean-core only.  
  Evidence: `arxiv_submission/lean_master_axioms.txt`.
- [ ] Gap statements are exported (no hidden hypotheses).  
  Evidence: `arxiv_submission/lean_gap_statements.txt`.

## 2) Paper analytic inputs

- [ ] A1 (legacy window-free) proof is complete and matches Lean statement.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a1-from-supercritical`),
  `docs/core/A1_PROOF_AUDIT.md` (audit map).
- [ ] A2 derivation from A/B/C is explicit.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a2-from-abc`).
- [ ] Theorems A/B/C have full proofs.  
  Evidence: `arxiv_submission/Theorem_ABC_preprint.tex` and
  `docs/core/ABC_PROOF_AUDIT.md`.
- [ ] Explicit-formula normalization is stated and consistent.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption `assm:explicit`,
  Appendix "Buchstab kernel factor for the alpha bridge").

## 3) Gate reproducibility (numeric certificates)

- [ ] Gate pipeline runs cleanly (no skips).  
  Evidence: `docs/core/POST_MERGE_GATE_FULL.txt`.
- [ ] RMS envelope bound matches formal constant.  
  Evidence: `docs/core/POST_MERGE_GATE_FULL.txt`.
- [ ] `ctx_real_logR_alpha_upper` verified by interval arithmetic.  
  Evidence: `docs/core/POST_MERGE_GATE_FULL.txt`,
  `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md`.
- [ ] `ctx_real_rms_mode_ge_semantic` certificate present.  
  Evidence: `docs/core/P15_NOTES.md`, `docs/core/P15_GATE_FULL.txt`.
- [ ] Version/hash manifest present in bundle.  
  Evidence: `arxiv_submission/reproducibility_manifest.txt`.
- [ ] Trust boundary is explicit in the paper.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex` (Reproducibility / Gate).

## 4) Editorial consistency

- [ ] Ledger matches paper statements (no drift).  
  Evidence: `docs/core/ASSUMPTIONS_LEDGER.md`,
  `arxiv_submission/assumptions_ledger.tex`.
- [ ] Route framing is consistent (legacy primary, fixed-window alternative).  
  Evidence: `docs/core/ROUTES_COMPARISON.md`,
  `arxiv_submission/ERURH_Conditional_Proof.tex`.
- [ ] Referee summary is centralized (no duplication).  
  Evidence: `docs/core/P27_REFEREE_PACKET.md`,
  `docs/core/REFEREE_FAQ.md`.

## 5) Reproduce (single block)

```
python tools/make_rational_bounds.py
python tools/make_certificate_values.py
python tools/make_rms_context.py
python tools/make_rms_mode_bridge.py
python tools/make_beta_certificate.py

LAKE_JOBS=1 lake build ERURH
python scripts/verify_gate.py

lake env lean docs/core/PrintFinalStatement.lean > docs/core/POST_MERGE_FINAL_STATEMENTS.txt
lake env lean docs/core/PrintGapStatements.lean > arxiv_submission/lean_gap_statements.txt
lake env lean docs/core/PrintMasterAxioms.lean > arxiv_submission/lean_master_axioms.txt
```

## Outcome statement (if all boxes are checked)

If the analytic proofs (A1, A/B/C) are correct and the gate verifies the
certificates, then the Lean formal core yields RH for `xiAlpha` with no project
axioms.
