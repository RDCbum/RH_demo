# Route B status (publishable snapshot)

Statement
- Master conditional theorem: `ERURH.RH_from_ERURH_conditional` (see
  arxiv_submission/lean_master_statement.txt).

Axioms footprint
- Master conditional: Lean core only (propext, Classical.choice, Lean.ofReduceBool,
  Lean.trustCompiler, Quot.sound). Source: docs/core/RB10_PRINT_AXIOMS_MASTER.txt.
- Route B core: Lean core plus `ERURH.A1_mode_of_supercritical`. Source:
  docs/core/RB10_PRINT_AXIOMS_UNCOND.txt.

Remaining Route B hypotheses (driver goals)
- `AxiomsShimAccepted` (lean/formal_proofs/ERURH/AxiomsShimBundle.lean:15): axioms shim
  bundle; external package in the paper and not discharged in Lean.

Remaining gap inside the core
- `AxiomsShimAccepted.a1_mode_of_supercritical`
  (lean/formal_proofs/ERURH/AxiomsShimBundle.lean:40): analytic gap; not proven in paper/Lean yet.

Gate confirmation
- Commands: `LAKE_JOBS=1 lake build ERURH`; `LAKE_JOBS=1 python scripts/verify_gate.py --skip-pytests`.
- Logs: docs/core/RB10_BUILD.txt, docs/core/RB10_GATE.txt.
- Git HEAD: 315f752c6c287dc51cd40b52a243153462f2d76e.
