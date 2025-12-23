# STEP3 Axioms Footprint

## Print axioms log (extract)
```
docs\core\STEP3_PrintAxioms.lean:2:0: error: object file 'C:\Users\duran\RHdemoERU\.lake\build\lib\lean\ERURH\ERURH_MasterTheoremSummary.olean' of module ERURH.ERURH_MasterTheoremSummary does not exist
```

## Axiom/constant classification table
| Axiom/constant | File origin | Classification | Notes |
| --- | --- | --- | --- |
| ERURH.RH_from_ERURH_conditional | lean/formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean | unknown (print axioms failed) | `ERURH.ERURH_MasterTheoremSummary` did not build. |
| ERURH.RH_from_ERURH_assumptions | lean/formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean | unknown (print axioms failed) | `ERURH.ERURH_MasterTheoremSummary` did not build. |
| Mathlib.Data.Real.NNReal | .lake/packages/mathlib/Mathlib/Data/Real (missing file) | build blocker | Import missing in current mathlib pin. |
| Mathlib.Analysis.SpecialFunctions.Gamma | .lake/packages/mathlib/Mathlib/Analysis/SpecialFunctions (missing file) | build blocker | Import missing in current mathlib pin. |
| ERURH.ClassicalZetaAssumptions | lean/formal_proofs/ERURH (missing file) | build blocker | Import path mismatch (`ClassicalZetaAssumptions.lean` not present). |
| ERURH.EToRHChecklist cycle | lean/formal_proofs/ERURH/EToRHChecklist.lean | build blocker | Cycle involving `ERURH_MasterTheoremSummary`. |
| ERURH.ERUModesAlpha | lean/formal_proofs/ERURH/ERUModesAlpha.lean | build blocker | Missing Mathlib imports for `Real.exp`/`ℕ`/namespaces. |
| ERURH.ERURH_GrowthProfiles | lean/formal_proofs/ERURH/ERURH_GrowthProfiles.lean | build blocker | Missing Mathlib imports and unsolved goals. |
| ERURH.XiZetaIfaceOn | lean/formal_proofs/ERURH/XiZetaIfaceOn.lean | build blocker | Unresolved `Staging.zeta_*` identifiers. |
| ERURH.ZetaBounds | lean/formal_proofs/ERURH/ZetaBounds.lean | build blocker | Unsolved numeric inequalities. |

## Priority blockers (top 5-10)
1) Missing Mathlib modules (`Mathlib.Data.Real.NNReal`, `Mathlib.Analysis.SpecialFunctions.Gamma`).
2) Import path mismatch for `ERURH.ClassicalZetaAssumptions`.
3) Cycle involving `ERURH_MasterTheoremSummary` and `EToRHChecklist`.
4) Missing basic imports / namespaces in `ERURH_ModeGrowthAlpha` and `ERURH_GrowthProfiles`.
5) Unresolved staging identifiers in `ERURH.XiZetaIfaceOn`.
6) Unsolved numeric goals in `ERURH.ZetaBounds`.
