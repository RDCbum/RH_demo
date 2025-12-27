# RB24 status capsule

- Branch: release/routeB_a1_bundle
- Commit: 9e50fd0911c72309a912c89ca007907cb625307b
- Commands:
  - LAKE_JOBS=1 lake build ERURH
  - LAKE_JOBS=1 python scripts/verify_gate.py --skip-pytests
  - lake env lean docs/core/PrintMasterAxioms.lean
  - lake env lean docs/core/PrintAxioms_Numeric.lean
- Master axioms: 'ERURH.RH_from_ERURH_conditional' depends on axioms: [propext,
- Unconditional core axioms: 'ERURH.RH_unconditional_core' depends on axioms: [propext, Classical.choice, ERURH.no_supercritical_beta, Quot.sound]
- Driver note: the only non-numeric driver goal remains AxiomsShimAccepted.
