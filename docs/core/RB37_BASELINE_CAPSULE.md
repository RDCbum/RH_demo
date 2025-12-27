# RB37 baseline capsule

Commit: 5fa5accee945ba44d250c1e93e111a64a949faf8

Master theorem axioms (from `docs/core/RB37_PRINT_AXIOMS_MASTER.txt`):
- 'ERURH.RH_from_ERURH_conditional' depends on axioms: [propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
- 'ERURH.RH_from_ERURH_assumptions' depends on axioms: [propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]

Unconditional core axioms (from `docs/core/RB37_PRINT_AXIOMS_UNCOND.txt`):
- 'ERURH.RH_unconditional_core' depends on axioms: [propext, Classical.choice, Quot.sound, ERURH.Alpha.mode_to_rms_mode]

Unique current gap: ERURH.Alpha.mode_to_rms_mode.
