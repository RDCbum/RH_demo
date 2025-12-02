ERURH Plan B Conditional Theorem (Mini-Paper)
=============================================

1. Introducción y contexto
--------------------------
- Plan B ofrece una ruta RMS/gates hacia RH en la capa ERURH-alpha: combinar crecimiento de modos β > 1/2 con cotas A2 (low/tail) y gates cerrados para excluir modos supercríticos.
- Véanse `ERURH_Preprint_AlphaToBeta.md` y `ERURH_Proof_Status.md` para el panorama general y la ruta A.

2. Setup ERU y equivalencia ERURH↔RH
------------------------------------
- `logR(s) = E(e^s)/e^s`, `jRel(s) = d/ds logR(s)`, normalización ERU de las observables.
- Equivalencia formal: cuatro certificados alpha ⇒ Inertia_ERU ⇒ `RiemannHypothesis xiAlpha` (ver docs/preprints existentes; no se reponen las pruebas aquí).

3. Gates y certificados
-----------------------
- RenormGateClosed y EnergyGateClosed capturan el régimen donde envelope/κ/energía global cumplen las cotas (ver `docs/ERURH_Gates_Conceptual.md`).
- Certificados alpha correctos + NumericCoverage ⇒ gates cerrados (formalizado en `ERURH_GatesAlpha.lean`).

4. Paquete analítico Plan B
---------------------------
- Fórmula explícita y coeficientes `b_ρ` (ver `docs/ERURH_ExplicitFormula_Plan.md`).
- A2-low y A2-tail (ver `docs/ERURH_A2_AnalyticPlan.md`).
- LS_γ simple RMS (ver `docs/ERURH_LSgamma_and_Mode_Demos.md` y LS_γ docs).
- A1-mode (ver `docs/ERURH_LSgamma_and_Mode_Demos.md`).
- Lema RMSLocalHypothesis (ver `docs/ERURH_RMSLocal_Proof.md`).

5. Teorema condicional Plan B
-----------------------------
- Teorema (Plan B, versión condicional). Bajo las hipótesis analíticas externas H_ζ,standard sobre ζ, las hipótesis explícitas H_ERU,explicit sobre el observable ERU, las cotas A2-low/A2-tail y el modo A1, junto con certificados alpha correctos y cobertura numérica, se tiene `RiemannHypothesis xiAlpha`.
- Cadena lógica: H_ζ,standard + H_ERU,explicit + H_LS/A2 + H_certs+num ⇒ PlanB_AnalyticAssumptions + gates cerrados ⇒ RMSLocalHypothesis + gates cerrados ⇒ no hay modos β > 1/2 ⇒ RH.
