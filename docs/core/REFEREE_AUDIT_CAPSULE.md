# Referee Audit Capsule (Paper/Lean Alignment)

Sources:
- `arxiv_submission/ERURH_Conditional_Proof.tex`
- `arxiv_submission/lean_master_statement.txt`
- `arxiv_submission/lean_master_axioms.txt`
- `arxiv_submission/lean_gap_statements.txt`
- `arxiv_submission/lean_axioms_shim_bundle.txt`
- `arxiv_submission/assumptions_ledger.tex`
- `docs/core/ASSUMPTIONS_LEDGER.md`
- `docs/core/RH_CLOSURE_CHECKLIST.md`
- `docs/core/P9_PAPER_PROOF_MAP.md`
- `arxiv_submission/reproducibility_manifest.txt`

## A. Identity of the master theorem and inputs
- A1 (inputs match Lean): PASS. Paper lists analytic packages + certificates/coverage and explicitly notes the Lean statement includes `AxiomsShimAccepted` and separates `CertificatesCorrectAlpha` vs `NumericCoverageAlpha`.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex:100-113`, `arxiv_submission/lean_master_statement.txt:1-2`.
- A2 (explicit separation of blocks): PASS. The paper distinguishes the shim package and exports it as a separate bundle.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex:133-151`.

## B. Global hypothesis package (G)
- B1 (G = `ERURH_Assumptions` + `WindowScalingAssumptions`): PASS.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex:100-105, 739-813`; Lean: `arxiv_submission/lean_master_statement.txt:14-18`.
- B2 (no extra hypotheses in prose): PASS.

## C. RMS windows and non-vacuity
- C1 (ctx + hA1/hLow/hTail reflected): PASS (`arxiv_submission/ERURH_Conditional_Proof.tex:795-813`).
- C2 (A2-low/tail as ≤): PASS (`:807-810`).
- C3 (decomposition as ≥): PASS (`:811-818`).
- C4 (A1 is conditional bridge): PASS (`:801-809`, remark `:939-956`).
- C5 (RMS-violation lemma conditional): PASS (`:883-890`).

## D. No supercritical modes and main theorem
- D1 (conditional statement): PASS (`:170-173`).
- D2 (standard contradiction chain): PASS (`:176-184`).
- D3 (main theorem uses Proposition no-supercritical): PASS (`:917-922`).

## E. Shim axioms and RH bridge
- E1 (shim content exported): PASS (`arxiv_submission/ERURH_Conditional_Proof.tex:133-151`, `arxiv_submission/lean_axioms_shim_bundle.txt`).
- E2 (no circular RH→E usage in paper): PASS (`arxiv_submission/ERURH_Conditional_Proof.tex:917-922`).

## F. Declared gaps
- F1 (Lean gap statements listed): PASS (`arxiv_submission/lean_gap_statements.txt:1-4`).
- F2 (ledger classification): PASS (`docs/core/ASSUMPTIONS_LEDGER.md:47-53`).

## G. Certificates and numeric coverage
- G1 (coverage vs certificates distinguished): PASS (`arxiv_submission/ERURH_Conditional_Proof.tex:861-866`).
- G2 (quantifiers aligned: ∀ for gate closed vs ∃ for violation): PASS (`:861-866`, `:883-890`).
- G3 (reproducibility hashes present): PASS (`arxiv_submission/ERURH_Conditional_Proof.tex:488-491`, `arxiv_submission/reproducibility_manifest.txt`).

## H. Lean trust base
- H1 (axioms/trust base explicit): PASS (`arxiv_submission/ERURH_Conditional_Proof.tex:129-137`, `arxiv_submission/lean_master_axioms.txt:1-5`).

## Micro-checks (semantics alignment)
- ERU_mode_beta semantics (mode vs total): PASS. Fixed-window uses `log R_α` to match Lean; paper notes mode interpretation for A1.  
  Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex:830-844`, `docs/core/P9_PAPER_PROOF_MAP.md:37-52`.
- Coverage vs window family: PASS (`arxiv_submission/ERURH_Conditional_Proof.tex:861-866`).
- Gap vs paper/ledger alignment: PASS (`arxiv_submission/lean_gap_statements.txt`, `docs/core/ASSUMPTIONS_LEDGER.md`).
