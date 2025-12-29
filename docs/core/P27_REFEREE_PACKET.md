# P27 Referee packet (readiness summary)

## What is proved in Lean

- `ERURH.RH_from_ERURH_conditional` (conditional master theorem).
- Route B core theorems, with explicit hypotheses:
  - `ERURH.RH_unconditional_core`
  - `ERURH.RH_unconditional_assuming` (if present)
  - `ERURH.RH_unconditional_core_window_free` (legacy window-free core)

Step-by-step walkthrough: `docs/core/LEGACY_WINDOW_FREE_PROOF_WALKTHROUGH.md`.
Referee FAQ: `docs/core/REFEREE_FAQ.md`.

See:
- `docs/core/P20_FINAL_STATEMENT.txt`
- `docs/core/P20_PRINT_AXIOMS_MASTER.txt`
- `docs/core/P20_PRINT_AXIOMS_UNCOND.txt`

## What is verified by the gate (computational certificates)

- Numeric artifacts regenerated and diff-checked:
  - `data/docs/paper/rational_bounds.json`
  - `data/docs/paper/certificate_values.json`
  - `data/docs/paper/rms_context.json`
  - `data/docs/paper/rms_mode_bridge.json`
  - `data/docs/paper/beta_certificate.json`
- Gate-certified side condition:
  - `ctx_real_logR_alpha_upper` via `tools/check_rms_mode_bridge.py`
  - Evidence: `docs/core/P16_GATE_FULL.txt`, `docs/core/P17_GATE_FULL.txt`,
    `docs/core/P24_GATE_FULL.txt`, `docs/core/P35_GATE_FULL.txt`

## What is proved in the paper

- Classical/citable assumptions bundled as `AxiomsShimAccepted`
  (see `arxiv_submission/assumptions_ledger.tex`).
- Legacy window-free analytic lemmas:
  - `A1_from_supercritical` (Lemma `a1-from-supercritical` in
    `arxiv_submission/ERURH_Conditional_Proof.tex`).
  - `A2-low`/`A2-tail` derivation from Theorems A/B/C (Lemma `a2-from-abc`).
- Classical analytic packages:
  - Theorems A, B, C (spectral decay + large-sieve bounds) as stated in the paper.
  - Explicit formula package and zeta-theory assumptions (Assumption~`assm:classical`,
    `assm:explicit`).

## Reproduction commands (single block)

```bash
python tools/make_rational_bounds.py
python tools/make_certificate_values.py
python tools/make_rms_context.py
python tools/make_rms_mode_bridge.py
python tools/make_beta_certificate.py

LAKE_JOBS=1 lake build ERURH
python scripts/verify_gate.py

lake env lean docs/core/PrintFinalStatement.lean > docs/core/NOAX_FINAL_STATEMENTS.txt
lake env lean docs/core/PrintGapStatements.lean > arxiv_submission/lean_gap_statements.txt
lake env lean docs/core/PrintMasterAxioms.lean > arxiv_submission/lean_master_axioms.txt

./scripts/make_arxiv_bundle.ps1
```
