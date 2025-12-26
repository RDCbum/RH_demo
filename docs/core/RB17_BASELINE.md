# RB17 Baseline Capsule (Route B)

- Branch: release/routeB_a1_bundle
- Commit: d991a9bbdb868b95ac5397c0fb4a28e72b457428
- JSON SHA256:
  - data/docs/paper/rational_bounds.json: DB061BE2D5633EDFEE627500A70F100BBB9744A10C62A8D43336E174C6562EF6
  - data/docs/paper/certificate_values.json: D422545FCEC4AC951384491E6ACBDE6726E6CAB67E9E36E8BD05CEB090F4CB58
  - data/docs/paper/beta_certificate.json: 79937ED5901C033B6179A5A70C2B8F1C2939F03B92D5D16116090F9FB5749D7C
  - data/docs/paper/rms_context.json: 6D0D0EAAF305ABA29A998A8D911536421A4AC6FF33EEEFD50B2122507E5898D5
- Master theorem axioms: Lean-core only (per docs/core/RB13_PRINT_AXIOMS.txt)
  - 'ERURH.RH_from_ERURH_conditional' depends on axioms: [propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]
