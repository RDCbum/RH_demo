**NOAX Guard Specification**
- Scope: scans `lean/formal_proofs/ERURH/**/*.lean` before generators/build in `scripts/verify_gate.py`.
- Hard failures (gate stops):
  - `^\s*(axiom|constant|opaque)\b` top-level declarations.
  - `\b(sorry|admit)\b` tokens anywhere in a line.
- Soft signal (does not fail):
  - `^\s*noncomputable\b` declarations are reported to stderr for visibility.
- Rationale: enforce zero project-level axioms/constants/opaque placeholders and prevent accidental sorry/admit usage, while allowing noncomputable definitions when required by Lean's classical logic.
