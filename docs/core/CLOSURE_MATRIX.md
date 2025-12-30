CLOSURE MATRIX (master theorem axioms)

Source: `docs/core/PRINT_AXIOMS_REAL.txt`.

| Axiom/assumption | Classical/citable? | Discharged by A/B/C? | Discharged by certificates/gate? | New gap? | References |
| --- | --- | --- | --- | --- | --- |
| propext | yes (Lean kernel axiom) | no (logical layer) | no | no | `docs/core/PRINT_AXIOMS_REAL.txt`, `docs/notes/ERURH_ConditionalTheorem_Summary.md` |
| Classical.choice | yes (Lean kernel axiom) | no (logical layer) | no | no | `docs/core/PRINT_AXIOMS_REAL.txt`, `docs/notes/ERURH_ConditionalTheorem_Summary.md` |
| Quot.sound | yes (Lean kernel axiom) | no (logical layer) | no | no | `docs/core/PRINT_AXIOMS_REAL.txt`, `docs/notes/ERURH_ConditionalTheorem_Summary.md` |

Notes:
- The `#print axioms` output for the master theorem depends only on Lean core axioms; analytic assumptions A/B/C and numeric certificates do not appear in the axioms footprint.
- A/B/C and the certificate story are documented in `docs/notes/ERURH_ConditionalTheorem_Summary.md` and `docs/core/ERURH_Proof_Status.md`, but they are not axioms of `RH_from_ERURH_conditional`.
