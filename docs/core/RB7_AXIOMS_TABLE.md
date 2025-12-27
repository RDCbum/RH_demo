# RB7 axioms inventory

## Lean-core axioms

| Axiom | Notes |
| --- | --- |
| `propext` | propositional extensionality |
| `Classical.choice` | choice for classical reasoning |
| `Quot.sound` | quotient soundness |
| `Lean.ofReduceBool` | compiler trust bridge |
| `Lean.trustCompiler` | compiler trust axiom |

## Explicit gap hypotheses

| Hypothesis | Location | Paper status |
| --- | --- | --- |
| `ERURH.Alpha.PointwiseToRMSMode` | `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_PointwiseToRMS.lean:10` | analytic gap: pointwise-to-RMS bridge (Lemma B.1, Route B) |

Deprecated framing (derived):
- `ERURH.no_supercritical_beta` is derived from Lemma B and `ctx_real_not_A1_mode`.
- `ERURH.A1_mode_of_supercritical` follows vacuously from `ERURH.no_supercritical_beta` (see `docs/core/RB20_A1_EQUIVALENCE.md`).
