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
| `ERURH.A1_mode_of_supercritical` | `lean/formal_proofs/ERURH/A1FromSupercriticalMode.lean` | analytic gap: show supercritical mode implies A1 (Route B) |
