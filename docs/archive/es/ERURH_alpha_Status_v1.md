# ERURH-alpha — Estado v1 (certificación vía certificados racionales)

## 1. Visión general

Pipeline actual (caso alpha):

```
ERU_energy + (no modos β > 1/2)
  ⇒ InertiaERU alphaBridge
  ⇒ InertiaERU_alpha_strong
  ⇒ RH (vía la equivalencia ERU_RH_equiv_alpha y axiomas analíticos clásicos)
```

La ruta ERU → RH está ahora reescrita en términos de cuatro certificados racionales:
1. `GlobalEnergyCertificate_alpha`
2. `KernelBlowupCertificate_alpha`
3. `BridgeInertiaCertificate_alpha`
4. `StrongInertiaCertificate_alpha`

Cada certificado tiene:
- un testigo `_true_alpha`,
- un predicado `Correct` estructurado como conjunción de condiciones,
- un teorema `*_exists_alpha` probado (ya no axiomático).

Los axiomas ERU inventados (energía/blowup) ya no intervienen en la ruta principal; solo permanecen los axiomas analíticos clásicos (ERUERH) como caja negra.

## 2. Partes completamente certificadas

- **GlobalEnergyCertificateCorrect_alpha**
  - Campos: κ-book, L_global.
  - Correct: igualdades con las constantes auto-generadas (`kappaBookClosedRat`, `lGlobalFormalRat`) y desigualdad `kappaLowFormalRat ≤ kappa_book` (via `lemmaB_energy`).

- **KernelBlowupCertificateCorrect_alpha**
  - Campo: κ-book.
  - Correct: igualdad con `kappaBookClosedRat`.

- **BridgeInertiaCertificateCorrect_alpha**
  - Igualdad `cert.inertia_proof = alphaBridge_inertia` (certificado de inercia del puente).
  - `BridgeInertiaWindows_ok_alpha`: testigo de cobertura por ventanas/tail (`∃ cover, cover = alphaCoverCertificate alphaBridge rfl`).
  - Bounds/flux aún placeholders (ver sección 3).

- **StrongInertiaCertificateCorrect_alpha**
  - Igualdad `bridge_to_strong = InertiaERU_alpha_strong_of_bridge_inertia_certified` (morphism puente → inercia fuerte).
  - Campos `C_strong`, `S0_strong` presentes como placeholders (valores 0 por ahora).

## 3. Partes especificadas pero aún TODO

- **BridgeInertiaBounds_ok_alpha**: placeholder `True`. Pendiente incluir cotas por ventana/cola (`logRBoundWindow`, `jRelBoundWindow`, `logRBoundTail`, `jRelBoundTail`).
- **BridgeInertiaFluxSupport_ok_alpha**: placeholder `True`. Pendiente anclar explícitamente a `flux_contraction_alpha_true`, `flux_energy_control_alpha_true`, `flux_laws_alpha_true`, `flux_energy_alpha_true`.
- **Subprops de StrongInertiaCertificateCorrect_alpha**:
  - Parámetros del bound fuerte (`C_strong`, `S0_strong`) y forma asintótica.
  - Dominio (`s ≥ S0_strong`).
  - Relación (si aplica) con constantes globales de energía (L_global, κ).
  - Conexión con interfaces analíticas (prefactor/zeta/log_to_bridge).

## 4. Dependencias axiomáticas

Ruta a RH (caso alpha):
- 100% certificada en la parte ERU (energía, kernel, puente, inercia fuerte) usando los certificados y sus teoremas de existencia.
- Axiomas analíticos clásicos aceptados como caja negra:
  - `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha`, `RH_to_E_bound_alpha` (ERUInertia.lean).
  - Axiomas de fórmula explícita / equivalencias RH en módulos AlphaAssumptions/Explicit* (no alterados).

## 5. Estado v1 (qué está hecho y qué queda)

Hecho:
- Certificados de energía global y kernel con testigos y Correct no triviales.
- Certificado de inercia del puente con igualdad al testigo y cobertura por ventanas/tail.
- Certificado de inercia fuerte con morphismo canónico bridge → strong y placeholders de parámetros.
- Ruta principal `RH_from_ERU_energy` ya no usa axiomas ERU legacy; se apoya en certificados y en axiomas analíticos clásicos.

En curso / TODO (especificado):
- Completar `BridgeInertiaBounds_ok_alpha` y `BridgeInertiaFluxSupport_ok_alpha` con las cotas y certificados existentes.
- Completar los subpredicados de `StrongInertiaCertificateCorrect_alpha` (parámetros del bound fuerte, dominio, relaciones globales, interfaces analíticas).

Pendiente (futuro):
- Migrar los axiomas ERU legacy remanentes a rutas certificadas completas (bounds de puente y bound fuerte parametrizado).
- Integrar prefactor/zeta/log_to_bridge en el certificado fuerte.
