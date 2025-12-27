**Context**
- Branch: release/routeB_no_noncore_axioms
- Commit: e2a0fe949cbf8e3a27c9179290864c1fd51a08ae
- git status --porcelain --untracked-files=no: (no output)

**Commands**
```text
set LAKE_JOBS=1
lake build ERURH
python scripts/verify_gate.py --skip-pytests
lake env lean docs/core/PrintMasterAxioms.lean
lake env lean docs/core/PrintAxioms_Numeric.lean
rg -n "^\s*axiom\b" lean/formal_proofs/ERURH
rg -n "^\s*constant\b" lean/formal_proofs/ERURH
rg -n "^\s*opaque\b" lean/formal_proofs/ERURH
rg -n "admit|sorry" lean/formal_proofs/ERURH
```

**Axioms Footprint (from NOAX prints)**
```text
'ERURH.RH_from_ERURH_conditional' depends on axioms: [propext,
 Classical.choice,
 Lean.ofReduceBool,
 Lean.trustCompiler,
 Quot.sound]

'ERURH.RH_unconditional_core' depends on axioms: [propext, Classical.choice, Quot.sound]
```

**Scan Results (lean/formal_proofs/ERURH)**
- NOAX_SCAN_AXIOM.txt: empty
- NOAX_SCAN_CONSTANT.txt: empty
- NOAX_SCAN_OPAQUE.txt: empty
- NOAX_SCAN_SORRY.txt: 1 hit (substring match in prose)
```text
lean/formal_proofs/ERURH\EnergyCertificatesAlpha.lean:96:admits a finite certificate witnessing that off-line exponential modes
```
