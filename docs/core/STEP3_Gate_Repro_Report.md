# STEP3 Gate Repro Report

## Header
```
=== STEP3 HEADER ===
a4691f3c7ad763309e7ec66b8a7da1da9d7a193e
 M .lake/build/ir/ERURH.setup.json
 M .lake/build/ir/ERURH/AlphaInterfaces.c
 M .lake/build/ir/ERURH/AlphaInterfaces.c.hash
 M .lake/build/ir/ERURH/AlphaInterfaces.setup.json
 M .lake/build/ir/ERURH/AnalyticWitness.c
 M .lake/build/ir/ERURH/AnalyticWitness.c.hash
 M .lake/build/ir/ERURH/AnalyticWitness.setup.json
 M .lake/build/ir/ERURH/BridgeToRH.setup.json
 M .lake/build/ir/ERURH/ERUTheory.setup.json
 M .lake/build/ir/ERURH/Equivalence.setup.json
 M .lake/build/ir/ERURH/ExpRect.setup.json
 M .lake/build/ir/ERURH/ExplicitBridge.setup.json
 M .lake/build/ir/ERURH/Numeric/Semantics.c
 M .lake/build/ir/ERURH/Numeric/Semantics.c.hash
 M .lake/build/ir/ERURH/Numeric/Semantics.setup.json
 M .lake/build/ir/ERURH/XiCore.setup.json
 M .lake/build/ir/ERURH/XiPrefactor.c
 M .lake/build/ir/ERURH/XiPrefactor.c.hash
 M .lake/build/ir/ERURH/XiPrefactor.setup.json
 M .lake/build/ir/ERURH/XiWitnessAssembly.c
 M .lake/build/ir/ERURH/XiWitnessAssembly.c.hash
 M .lake/build/ir/ERURH/XiWitnessAssembly.setup.json
 M .lake/build/ir/ERURH/XiZetaIface.c
 M .lake/build/ir/ERURH/XiZetaIface.c.hash
 M .lake/build/ir/ERURH/XiZetaIface.setup.json
 M .lake/build/ir/ERURH/ZetaLink.c
 M .lake/build/ir/ERURH/ZetaLink.c.hash
 M .lake/build/ir/ERURH/ZetaLink.setup.json
 M .lake/build/lib/lean/ERURH.trace
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.ilean
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.ilean.hash
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.olean
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.olean.hash
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.trace
 M .lake/build/lib/lean/ERURH/AnalyticWitness.ilean
 M .lake/build/lib/lean/ERURH/AnalyticWitness.ilean.hash
 M .lake/build/lib/lean/ERURH/AnalyticWitness.olean
 M .lake/build/lib/lean/ERURH/AnalyticWitness.olean.hash
 M .lake/build/lib/lean/ERURH/AnalyticWitness.trace
 M .lake/build/lib/lean/ERURH/BridgeToRH.trace
 M .lake/build/lib/lean/ERURH/ERUTheory.trace
 M .lake/build/lib/lean/ERURH/Equivalence.trace
 M .lake/build/lib/lean/ERURH/ExpRect.trace
 M .lake/build/lib/lean/ERURH/ExplicitBridge.trace
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.ilean
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.ilean.hash
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.olean
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.olean.hash
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.trace
 M .lake/build/lib/lean/ERURH/XiCore.trace
 M .lake/build/lib/lean/ERURH/XiPrefactor.ilean
 M .lake/build/lib/lean/ERURH/XiPrefactor.ilean.hash
 M .lake/build/lib/lean/ERURH/XiPrefactor.olean
 M .lake/build/lib/lean/ERURH/XiPrefactor.olean.hash
 M .lake/build/lib/lean/ERURH/XiPrefactor.trace
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.ilean
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.ilean.hash
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.olean
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.olean.hash
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.trace
 M .lake/build/lib/lean/ERURH/XiZetaIface.ilean
 M .lake/build/lib/lean/ERURH/XiZetaIface.ilean.hash
 M .lake/build/lib/lean/ERURH/XiZetaIface.olean
 M .lake/build/lib/lean/ERURH/XiZetaIface.olean.hash
 M .lake/build/lib/lean/ERURH/XiZetaIface.trace
 M .lake/build/lib/lean/ERURH/ZetaLink.ilean
 M .lake/build/lib/lean/ERURH/ZetaLink.ilean.hash
 M .lake/build/lib/lean/ERURH/ZetaLink.olean
 M .lake/build/lib/lean/ERURH/ZetaLink.olean.hash
 M .lake/build/lib/lean/ERURH/ZetaLink.trace
 M eru_upgrade.egg-info/PKG-INFO
 M eru_upgrade.egg-info/SOURCES.txt
 M eru_upgrade.egg-info/top_level.txt
 M lean/formal_proofs/ERURH/AlphaInterfaces.lean
 M lean/formal_proofs/ERURH/AnalyticSplits.lean
 M lean/formal_proofs/ERURH/AnalyticWitness.lean
 M lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean
 M lean/formal_proofs/ERURH/ERURH_LargeSieveGammaSketch.lean
 M lean/formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean
 M lean/formal_proofs/ERURH/LambdaIntervals_skeleton.lean
 M lean/formal_proofs/ERURH/LambdaSamples_skeleton.lean
 M lean/formal_proofs/ERURH/Numeric/Semantics.lean
 M lean/formal_proofs/ERURH/SmokeTests.lean
 M lean/formal_proofs/ERURH/XiPrefactor.lean
 M lean/formal_proofs/ERURH/XiWitnessAssembly.lean
 M lean/formal_proofs/ERURH/XiZetaIface.lean
 M lean/formal_proofs/ERURH/ZetaLink.lean
?? docs/core/STEP1_LeanAssumptions_Audit.md
?? docs/core/STEP1_LeanPrint_Output.txt
?? docs/core/STEP1_Print.lean
?? docs/core/STEP1_rg_hits.txt
?? docs/core/STEP2_NonVacuity_Audit.md
?? docs/core/STEP2_by_trivial_hits.txt
?? docs/core/STEP2_defaults_hits.txt
?? docs/core/STEP2_lake_build_log.txt
?? docs/core/STEP2_trivial_hits.txt
?? docs/core/STEP3_header.txt
?? formal_proofs/
?? lean/formal_proofs/ERURH/ComplexAbsCompat.lean
Python 3.11.9
Lake version 5.0.0-src+744f980 (Lean version 4.25.0-rc2)
Lean (version 4.25.0-rc2, x86_64-w64-windows-gnu, commit 744f98064b056ee27fc8c97f524797c8cc96f436, Release)
```

## verify_gate.py result
- Status: SUCCESS on rerun (first run failed due to new log file being created during the run; see log).
- Log: `docs/core/STEP3_verify_gate_log.txt`

## Regenerated artifacts
- No tracked outputs changed (`data/docs/paper/rational_bounds.json`, `data/docs/paper/certificate_values.json`, `lean/formal_proofs/ERURH/RationalBounds.lean`, `lean/formal_proofs/ERURH/CertificateValues.lean`).
- Build artifacts and logs were updated (see git status below).

## git status final
```
 M .lake/build/ir/ERURH.setup.json
 M .lake/build/ir/ERURH/AlphaInterfaces.c
 M .lake/build/ir/ERURH/AlphaInterfaces.c.hash
 M .lake/build/ir/ERURH/AlphaInterfaces.setup.json
 M .lake/build/ir/ERURH/AnalyticWitness.c
 M .lake/build/ir/ERURH/AnalyticWitness.c.hash
 M .lake/build/ir/ERURH/AnalyticWitness.setup.json
 M .lake/build/ir/ERURH/BridgeToRH.setup.json
 M .lake/build/ir/ERURH/ERUTheory.setup.json
 M .lake/build/ir/ERURH/Equivalence.setup.json
 M .lake/build/ir/ERURH/ExpRect.setup.json
 M .lake/build/ir/ERURH/ExplicitBridge.setup.json
 M .lake/build/ir/ERURH/Numeric/Semantics.c
 M .lake/build/ir/ERURH/Numeric/Semantics.c.hash
 M .lake/build/ir/ERURH/Numeric/Semantics.setup.json
 M .lake/build/ir/ERURH/XiCore.setup.json
 M .lake/build/ir/ERURH/XiPrefactor.c
 M .lake/build/ir/ERURH/XiPrefactor.c.hash
 M .lake/build/ir/ERURH/XiPrefactor.setup.json
 M .lake/build/ir/ERURH/XiWitnessAssembly.c
 M .lake/build/ir/ERURH/XiWitnessAssembly.c.hash
 M .lake/build/ir/ERURH/XiWitnessAssembly.setup.json
 M .lake/build/ir/ERURH/XiZetaIface.c
 M .lake/build/ir/ERURH/XiZetaIface.c.hash
 M .lake/build/ir/ERURH/XiZetaIface.setup.json
 M .lake/build/ir/ERURH/ZetaLink.c
 M .lake/build/ir/ERURH/ZetaLink.c.hash
 M .lake/build/ir/ERURH/ZetaLink.setup.json
 M .lake/build/lib/lean/ERURH.trace
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.ilean
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.ilean.hash
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.olean
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.olean.hash
 M .lake/build/lib/lean/ERURH/AlphaInterfaces.trace
 M .lake/build/lib/lean/ERURH/AnalyticWitness.ilean
 M .lake/build/lib/lean/ERURH/AnalyticWitness.ilean.hash
 M .lake/build/lib/lean/ERURH/AnalyticWitness.olean
 M .lake/build/lib/lean/ERURH/AnalyticWitness.olean.hash
 M .lake/build/lib/lean/ERURH/AnalyticWitness.trace
 M .lake/build/lib/lean/ERURH/BridgeToRH.trace
 M .lake/build/lib/lean/ERURH/ERUTheory.trace
 M .lake/build/lib/lean/ERURH/Equivalence.trace
 M .lake/build/lib/lean/ERURH/ExpRect.trace
 M .lake/build/lib/lean/ERURH/ExplicitBridge.trace
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.ilean
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.ilean.hash
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.olean
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.olean.hash
 M .lake/build/lib/lean/ERURH/Numeric/Semantics.trace
 M .lake/build/lib/lean/ERURH/XiCore.trace
 M .lake/build/lib/lean/ERURH/XiPrefactor.ilean
 M .lake/build/lib/lean/ERURH/XiPrefactor.ilean.hash
 M .lake/build/lib/lean/ERURH/XiPrefactor.olean
 M .lake/build/lib/lean/ERURH/XiPrefactor.olean.hash
 M .lake/build/lib/lean/ERURH/XiPrefactor.trace
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.ilean
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.ilean.hash
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.olean
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.olean.hash
 M .lake/build/lib/lean/ERURH/XiWitnessAssembly.trace
 M .lake/build/lib/lean/ERURH/XiZetaIface.ilean
 M .lake/build/lib/lean/ERURH/XiZetaIface.ilean.hash
 M .lake/build/lib/lean/ERURH/XiZetaIface.olean
 M .lake/build/lib/lean/ERURH/XiZetaIface.olean.hash
 M .lake/build/lib/lean/ERURH/XiZetaIface.trace
 M .lake/build/lib/lean/ERURH/ZetaLink.ilean
 M .lake/build/lib/lean/ERURH/ZetaLink.ilean.hash
 M .lake/build/lib/lean/ERURH/ZetaLink.olean
 M .lake/build/lib/lean/ERURH/ZetaLink.olean.hash
 M .lake/build/lib/lean/ERURH/ZetaLink.trace
 M eru_upgrade.egg-info/PKG-INFO
 M eru_upgrade.egg-info/SOURCES.txt
 M eru_upgrade.egg-info/top_level.txt
 M lean/formal_proofs/ERURH/AlphaInterfaces.lean
 M lean/formal_proofs/ERURH/AnalyticSplits.lean
 M lean/formal_proofs/ERURH/AnalyticWitness.lean
 M lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean
 M lean/formal_proofs/ERURH/ERURH_LargeSieveGammaSketch.lean
 M lean/formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean
 M lean/formal_proofs/ERURH/LambdaIntervals_skeleton.lean
 M lean/formal_proofs/ERURH/LambdaSamples_skeleton.lean
 M lean/formal_proofs/ERURH/Numeric/Semantics.lean
 M lean/formal_proofs/ERURH/SmokeTests.lean
 M lean/formal_proofs/ERURH/XiPrefactor.lean
 M lean/formal_proofs/ERURH/XiWitnessAssembly.lean
 M lean/formal_proofs/ERURH/XiZetaIface.lean
 M lean/formal_proofs/ERURH/ZetaLink.lean
?? docs/core/STEP1_LeanAssumptions_Audit.md
?? docs/core/STEP1_LeanPrint_Output.txt
?? docs/core/STEP1_Print.lean
?? docs/core/STEP1_rg_hits.txt
?? docs/core/STEP2_NonVacuity_Audit.md
?? docs/core/STEP2_by_trivial_hits.txt
?? docs/core/STEP2_defaults_hits.txt
?? docs/core/STEP2_lake_build_log.txt
?? docs/core/STEP2_trivial_hits.txt
?? docs/core/STEP3_header.txt
?? docs/core/STEP3_lake_build_log.txt
?? docs/core/STEP3_pip_install_log.txt
?? docs/core/STEP3_verify_gate_log.txt
?? formal_proofs/
?? lean/formal_proofs/ERURH/ComplexAbsCompat.lean
```

## SHA256 hashes
```
=== STEP3 FILE HASHES ===
SHA256 13E2270A5C10EF2A4C5D3A62AFE647E5284989C3F858F7E998337AC96A0EC711 C:\Users\duran\RHdemoERU\data\docs\paper\rational_bounds.json
SHA256 AF0C332108EEB2FBAF97630F56D5E44EE81C83FE7406691FC84BA2A481085C6F C:\Users\duran\RHdemoERU\data\docs\paper\certificate_values.json
SHA256 69E2FEE90AF364F304782533C34E2F23EEBF7FEDAEF21D14851B1437ED50FAA4 C:\Users\duran\RHdemoERU\lean\formal_proofs\ERURH\RationalBounds.lean
SHA256 91A648F2D37F7210BC244DD355A304223B2A2516052724598EDD242DB44A55D6 C:\Users\duran\RHdemoERU\lean\formal_proofs\ERURH\CertificateValues.lean
```

## Conclusion
- Reproducible gate: YES (verify_gate.py completed without error on rerun).
- Axioms footprint: NOT reproducible yet (cannot build `ERURH.ERURH_MasterTheoremSummary`; see `docs/core/STEP3_print_axioms_log.txt` and `docs/core/STEP3_lake_build_master_summary_log.txt`).
