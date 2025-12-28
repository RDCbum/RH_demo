# P29 Closure Next (window-bridge + axioms shim + packaging)

## Blocking summary (≤10 lines)
1) The window-bridge goal is `SupercriticalModeAppliesOnCtxRealWindow` (`lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean:15-18`).
2) It requires a pointwise bound on `ctx_real_window_interval` (`docs/core/P25_WINDOW_BRIDGE_STATEMENT_AND_DEFS.md:7-12`).
3) `ERU_mode_beta` only gives `∃ s0, ∀ s ≥ s0, ...` (`lean/formal_proofs/ERURH/ERUModesCore.lean:11-13`).
4) To apply it on the fixed window, we must show `windowMin ≥ s0` (`docs/core/P25_WINDOW_BRIDGE_STATEMENT_AND_DEFS.md:32-35`).
5) This exact step is the only logical blocker (`docs/core/P28_WINDOW_BRIDGE_PROOF_DRAFT.md:13-27`).
6) There is no bound on `s0` in the current definition (`docs/core/P28_WINDOW_BRIDGE_PROOF_DRAFT.md:19-24`).

## (i) Window-bridge (ABIERTO)

- `ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow`
  - Lean location: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean:15-18`
  - TeX location: `arxiv_submission/ERURH_Conditional_Proof.tex` (No supercritical ERU modes, Window-compatibility bridge)
  - Missing evidence: proof of the window-above-threshold step `windowMin ≥ s0`.

## (ii) AxiomsShimAccepted (ABIERTO)

No ABIERTO rows in `docs/core/RH_CLOSURE_CHECKLIST.md`; all fields are mapped to
explicit paper statements in `arxiv_submission/assumptions_ledger.tex`.

## (iii) Lean packaging (ABIERTO)

No ABIERTO rows in `docs/core/RH_CLOSURE_CHECKLIST.md`; packaging fields are
closed once the corresponding paper statements are explicit.
