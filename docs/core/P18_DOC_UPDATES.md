# P18 doc updates (window-bridge gap)

- Updated `docs/core/ASSUMPTIONS_LEDGER.md` to replace the B.1 gap with the explicit window-bridge
  hypothesis `SupercriticalModeAppliesOnCtxRealWindow` and to mark `ctx_real_logR_alpha_upper` as
  gate-certified (interval arithmetic).
- Updated `docs/core/RH_CLOSURE_CHECKLIST.md` to list the window-bridge hypothesis and the
  gate-certified upper bound as the remaining Route B obligations.
- Regenerated `arxiv_submission/lean_gap_statements.txt` via `docs/core/PrintGapStatements.lean` and
  rebuilt the arXiv bundle (`docs/core/P18_TARBALL_LIST.txt`).
