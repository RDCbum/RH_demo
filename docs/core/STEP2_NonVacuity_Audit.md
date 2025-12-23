# STEP2 Non-Vacuity Audit

## A) Trivial/default hits
- `docs/core/STEP2_trivial_hits.txt`: no matches for `:= trivial` in `lean/formal_proofs/ERURH`.
- `docs/core/STEP2_by_trivial_hits.txt`: no matches for `by trivial` in `lean/formal_proofs/ERURH`.
- `docs/core/STEP2_defaults_hits.txt`: no defaults with `:= trivial` or `:= by` in `lean/formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean`.

## B) Non-vacuity patches applied
- Removed the default certificate bundle from:
  - `lean/formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean`:
    - `RH_from_ERURH_assumptions` and `RH_from_ERURH_conditional` now require explicit `hCerts`.
- `hAxioms` and `hNumeric` were already explicit (no defaults to remove).
- `makePlanBAnalyticBundle` already requires `explicit_formula_ERU` as an explicit argument; no placeholder present, so no change was needed.

## C) Build fix (Mathlib compatibility)
- Added `lean/formal_proofs/ERURH/ComplexAbsCompat.lean` to define `Complex.abs` as an alias of `Complex.norm` with minimal lemmas (`abs.ofReal`, `abs.mul`, `abs.pos`).
- Imported the compat module into the 12 files that use `Complex.abs` (including `lean/formal_proofs/ERURH/ZetaLink.lean`, `lean/formal_proofs/ERURH/AnalyticSplits.lean`, `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean`, `lean/formal_proofs/ERURH/LambdaIntervals_skeleton.lean`, and `lean/formal_proofs/ERURH/LambdaSamples_skeleton.lean`).

## D) Build status
- `lake build ERURH` completed successfully (7521 jobs).
- Only linter warnings remain (unused simp args, unnecessary simpa, deprecated `structure :=`).
- Full log: `docs/core/STEP2_lake_build_log.txt`.
