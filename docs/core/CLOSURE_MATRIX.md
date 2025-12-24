CLOSURE MATRIX (master theorem axioms)

Fuente: docs/core/PRINT_AXIOMS_REAL.txt

| Axioma/assumption | Clasico/citable? | Lo descarga A/B/C? | Lo descarga certificados/gate? | Queda nuevo? | Referencias |
| --- | --- | --- | --- | --- | --- |
| propext | si (axioma clasico de extensionalidad proposicional) | no (nivel logico, no analitico) | no | no | docs/core/PRINT_AXIOMS_REAL.txt, docs/ERURH_ConditionalTheorem_Summary.md |
| Classical.choice | si (eleccion clasica) | no (nivel logico, no analitico) | no | no | docs/core/PRINT_AXIOMS_REAL.txt, docs/ERURH_ConditionalTheorem_Summary.md |
| Quot.sound | si (extensionalidad de cocientes) | no (nivel logico, no analitico) | no | no | docs/core/PRINT_AXIOMS_REAL.txt, docs/ERURH_ConditionalTheorem_Summary.md |

Notas:
- El #print axioms del teorema maestro solo depende de axiomas clasicos de Lean; no aparecen hipotesis A/B/C ni certificados adicionales.
- Los paquetes A/B/C y los certificados se documentan en docs/ERURH_ConditionalTheorem_Summary.md y docs/core/ERURH_Proof_Status.md, pero no figuran como axiomas en la huella de RH_from_ERURH_conditional.
