# Especificación de certificados de inercia (ERURH-alpha)

## 1. Introducción

En el pipeline ERURH-alpha, la ruta hacia la hipótesis de Riemann sigue, a nivel conceptual:

```
ERU_energy + (no modes β > 1/2)
  ⇒ InertiaERU alphaBridge
  ⇒ InertiaERU_alpha_strong
  ⇒ RH (vía la equivalencia ERU_RH_equiv_alpha y axiomas analíticos clásicos)
```

La capa de energía y kernel ya está modelada con certificados racionales. Este documento fija la especificación deseada para los certificados de inercia del puente y de la inercia fuerte, de modo que, en el futuro, `Correct` exprese condiciones finitas (ventanas, bounds racionales, etc.) suficientes para sostener la ruta ERU → RH.

## 2. BridgeInertiaCertificate_alpha — Especificación deseada

**Concepto.** Representa un certificado finito de que el puente numérico `alphaBridge` satisface la inercia ERU (`InertiaERU alphaBridge`). Debe reflejar:
- La estructura del puente (s0, logR, jRel) y su cobertura por ventanas/tail.
- Las cotas racionales por ventana y cola (provenientes de FluxWindows/FluxBounds).
- La conexión con el certificado canónico `alphaBridge_inertia`.

**Condiciones que debería encapsular `BridgeInertiaCertificateCorrect_alpha`:**
- Igualdad con el testigo canónico: la prueba de inercia coincide con `alphaBridge_inertia` (obtenido de `alphaFluxLaws` + `alphaFluxCertificate`).
- Cobertura finita de `[s0, +∞)` mediante una familia de ventanas con extremos racionales (`alphaWindows`) y un punto tail racional (`tailStart`).
- Para cada ventana: bounds racionales (p.ej. `logRBoundWindow`, `jRelBoundWindow`) que acotan `|logR|` y `|jRel|` en esa ventana.
- Para la cola: bounds racionales (`logRBoundTail`, `jRelBoundTail`) que controlan `|logR|`, `|jRel|` a partir de `tailStart`.
- Coherencia de ventanas y cola: continuidad/monotoneidad mínima para que las cotas ventana/cola impliquen el predicado `InertiaERU`.
- Opcional a futuro: referencia explícita al certificado de flujo/energía (`flux_energy_alpha_true`) que sustenta las cotas.

Estas condiciones deben ser finitas y expresables como igualdades/desigualdades racionales y pertenencia a coberturas discretas.

## 3. StrongInertiaCertificate_alpha — Especificación deseada

**Concepto.** Captura el paso analítico desde `InertiaERU alphaBridge` hasta la inercia fuerte `InertiaERU_alpha_strong` (bound asintótico de `logR_alpha`), empaquetado como un morphismo certificado `bridge_to_strong`.

**Condiciones que debería encapsular `StrongInertiaCertificateCorrect_alpha`:**
- Igualdad con el morphismo canónico ya certificado (`InertiaERU_alpha_strong_of_bridge_inertia_certified`), que realiza el paso bridge → inercia fuerte.
- Parámetros racionales del bound fuerte: prefactor `C`, umbral `S0` y la forma `|logR_alpha s| ≤ C * exp(-s/2) * (log(exp s))^2` para `s ≥ S0`.
- Monotoneidad/dominio: el bound aplica a todo `s ≥ S0`; cualquier condición sobre continuidad/monotonicidad necesaria para propagar el bound.
- Posible conexión con constantes globales (L_global, κ) si el paso bridge → fuerte requiere armonizar cotas de energía con el decay asintótico.

Al igual que en el caso del bridge, todo debe reducirse a un conjunto finito de parámetros y desigualdades racionales verificables.

## 4. Conexión con el teorema ERURH-alpha

La meta de diseño es que la conjunción de correctitud de los cuatro certificados:

- `GlobalEnergyCertificateCorrect_alpha`
- `KernelBlowupCertificateCorrect_alpha`
- `BridgeInertiaCertificateCorrect_alpha`
- `StrongInertiaCertificateCorrect_alpha`

sea suficiente para deducir `RiemannHypothesis xiAlpha`, asumiendo los axiomas analíticos clásicos (ERU ↔ E ↔ RH). Este documento fija la **spec**: qué condiciones finitas se pretende capturar en `Correct`. Aunque hoy algunas se reflejen de forma simplificada (igualdades con testigos), la intención es enriquecerlas progresivamente con las desigualdades racionales y coberturas que ya existen en FluxWindows, FluxBounds y los bounds fuertes de `logR_alpha`.
