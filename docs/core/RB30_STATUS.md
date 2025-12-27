# RB30 status capsule

- Branch: release/routeB_a1_bundle
- Commit: 312ee55a59fa25387d1acc8926d818e3a714a795
- Commands:
  - LAKE_JOBS=1 lake build ERURH
  - LAKE_JOBS=1 python scripts/verify_gate.py --skip-pytests
  - lake env lean docs/core/PrintMasterAxioms.lean
  - lake env lean docs/core/PrintAxioms_Numeric.lean
- Master axioms: 'ERURH.RH_from_ERURH_conditional' depends on axioms: [propext,
- Unconditional core axioms: 'ERURH.RH_unconditional_core' depends on axioms: [propext, Classical.choice, ERURH.no_supercritical_beta, Quot.sound]
- Driver note: RH_Unconditional still requires AxiomsShimAccepted (driver-level gap).
