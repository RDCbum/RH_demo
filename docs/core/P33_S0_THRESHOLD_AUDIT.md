# P33 s0 threshold audit

## Relevant hits

- `lean/formal_proofs/ERURH/ERUModesCore.lean:11-13`
  - `ERU_mode_beta` is `∃ s0, ∀ s ≥ s0, ...` (no bound on `s0`).
- `docs/core/P25_WINDOW_BRIDGE_STATEMENT_AND_DEFS.md:32-35`
  - Explicitly calls out `windowMin ≥ s0` as the missing step.
- `docs/core/P28_WINDOW_BRIDGE_PROOF_DRAFT.md:19-24`
  - Notes there is no constraint on `s0` in the definition.
- `docs/core/P30_MODE_THRESHOLD_CONTROL.md`
  - Proposed lemma that chooses `s0 ≤ windowMin`.
- `docs/archive/es/ERURH_Formalisms.md:15,20`
  - Mentions an `s0` value in archived/formal pipeline notes (not part of Lean or paper).
- `docs/archive/es/ERURH_IndustrialPipeline_Alpha.md:29-30`
  - Mentions `s0_unified.json` in the historical pipeline (not used in current Lean).
- `docs/notes/ERURH_InertiaCertificates_Spec.md:21`
  - Mentions coverage of `[s0, +∞)` in notes (not a Lean lemma).

## What would close `windowMin ≥ s0`

We need a lemma (paper or Lean) that either:
- bounds the `s0` from `ERU_mode_beta` by a fixed constant, or
- asserts the window interval lies above that threshold.

No such lemma exists in the current Lean code or TeX.

## Missing material

There is no explicit bound or citation connecting the existential `s0` in
`ERU_mode_beta` to `windowMin ctx_real_window`. The only available references
to `s0` are archival notes, not formal statements.
