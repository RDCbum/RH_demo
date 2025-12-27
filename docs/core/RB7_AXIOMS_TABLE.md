# RB7 axioms inventory

## Lean-core axioms

| Axiom | Notes |
| --- | --- |
| `propext` | propositional extensionality |
| `Classical.choice` | choice for classical reasoning |
| `Quot.sound` | quotient soundness |
| `Lean.ofReduceBool` | compiler trust bridge |
| `Lean.trustCompiler` | compiler trust axiom |

## Explicit gap axioms

| Axiom | Location | Paper status |
| --- | --- | --- |
| `ERURH.no_supercritical_beta` | `lean/formal_proofs/ERURH/A1FromSupercriticalMode.lean` | analytic gap: exclude supercritical ERU modes (Route B) |

Deprecated framing (derived):
- `ERURH.A1_mode_of_supercritical` is now derived vacuously from `ERURH.no_supercritical_beta` using `ctx_real_not_A1_mode` (see `docs/core/RB20_A1_EQUIVALENCE.md`).
