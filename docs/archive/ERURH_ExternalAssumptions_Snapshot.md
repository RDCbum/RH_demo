ERURH External Assumptions Snapshot
===================================

1. Resumen de alto nivel
------------------------
ERURH controla el observable `logR(s) = E(e^s)/e^s` y su derivada `jRel(s)` mediante una energia
ERU definida en ventanas `[S, S+L]`, con certificados racionales de flujo, energia, inercia y RMS.

El nucleo Lean ya formaliza esa maquinaria: certificados de ventana, gates de renormalizacion,
inercia ERU y equivalencia ERURH -> RH en la capa `xiAlpha`.

El teorema `RH_from_ERURH_conditional` afirma que, si se aceptan paquetes externos clasicos y
espectrales mas las hipotesis de ventana, se concluye `RiemannHypothesis xiAlpha`.

Todo lo no demostrado se encapsula en cuatro paquetes externos (zeta clasica, espectral `H_b`,
large-sieve en gamma, certificados beta) mas los supuestos de escalado de ventana y cobertura
numerica.

`ClassicalZetaAssumptions` aporta la formula explicita para `psi`, equivalencias RH <-> E, densidad
de ceros y bounds para `xi`, tratadas como axiomas de teoria clasica.

`SpectralAssumptionsAlpha` empaqueta la hipotesis `H_b`: forma explicita de `b_rho`, bound
puntual y bound de cola `L^2` para los coeficientes espectrales en la expansion ERU.

`LSGammaAssumptions` introduce una desigualdad tipo large-sieve fina en la variable de altura
`gamma`, usada para controlar colas RMS en el modo A2-tail.

`BetaInertiaAssumptions` recoge la correccion numerica de certificados beta y el blow-up del kernel
cuando aparece un modo con `beta > 1/2`, garantizando la clausura de inercia.

`WindowScalingAssumptions` fija el contexto RMS y las hipotesis A1/A2 sobre el crecimiento del modo,
la parte low y la cola tail en cada ventana.

Los certificados (flux, energia, gates) ya estan codificados en Lean como datos racionales y
controlan la clausura de ventanas y el sobre `L_global` en cada `RMSLocalContext`.

`AxiomsShimAccepted`, `CertificatesCorrectAlpha` y `NumericCoverageAlpha` certifican que usamos el
shim de axiomas clasicos, que los certificados ERU alpha son correctos y que hay cobertura numerica
para las ventanas relevantes.

Con todo el paquete externo + ventanas se activa `PlanB_AnalyticAssumptions`, se cierran los gates
y se obtiene inercia fuerte; la equivalencia ERURH -> RH entrega `RiemannHypothesis xiAlpha`.

2. Paquetes externos
--------------------
### 2.1 ClassicalZetaAssumptions
- Incluye la formula explicita para `psi`, traducida a la capa ERU (`explicit_alpha`, `explicit_core`
  y descomposiciones `Explicit_L1`...`L4`), y la equivalencia analitica `rh_from_E_alpha`.
- Recoge densidad de ceros y Riemann–von Mangoldt, argumentos y bounds para `xi` y `xi'/xi`, mas
  el rectangulo analitico (`explicit_rect_alpha_true`).
- Se apoya en resultados clasicos (Titchmarsh, Ivic, Stirling) y se trata como un paquete estandar
  externo exportado via shim, sin axiomas sueltos dentro de ERURH.

### 2.2 SpectralAssumptionsAlpha (H_b)
- `H_b_explicit`: existencia de `HbExplicitData` y formula explicita para `b_rho` derivada de la
  formula explicita de `psi` y la normalizacion del kernel ERU.
- `H_b_pointwise`: bound fuerte `|b_rho| <= C (1 + |gamma|)^( -1 + eps )` para `beta > 1/2`,
  dependiente de prefactores `Gamma/pi`, bounds de `zeta'/zeta` y region libre de ceros.
- `H_b_L2_tail`: cola cuadratica `sum_{|gamma|>T} |b_rho|^2 << (log T)^A`, deducible de
  `H_b_pointwise` + conteo de ceros (Riemann–von Mangoldt).
- `H_b_pointwise_weak`: version polinomica `|b_rho| <= C (1 + |gamma|)^B` ya presente como escalon
  intermedio; `H_b_pointwise` implica la version debil en Lean.
- Partes estructurales: `H_b_explicit` (kernel + prefactores) proviene de la formula explicita.
- Partes analiticas profundas: `H_b_pointwise` y `H_b_L2_tail` requieren bounds clasicos y
  densidad de ceros; la version debil sirve como placeholder de crecimiento controlado.

### 2.3 LSGammaAssumptions
- Paquete de una desigualdad tipo large-sieve en la variable de altura `gamma` para sumas
  `sum b_j exp(i * gamma_j * u)` con pesos ERU.
- Se usa para controlar la cola A2-tail en Plan B (propagando bounds RMS a partir de `H_b`).
- La version simple ya esta demostrada; la version fina entra como hipotesis externa en este
  paquete.

### 2.4 BetaInertiaAssumptions
- Contiene la correccion numerica de los certificados beta (valores racionales verificados fuera de
  Lean) y el blow-up certificado de la energia del kernel cuando existe un modo con `beta > 1/2`.
- Alimenta los lemas `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` y wrappers de inercia
  que descartan modos supercriticos en la cadena ERURH -> RH.

3. Supuestos de ventana y numericos
-----------------------------------
### 3.1 WindowScalingAssumptions
- Paquete que fija `RMSLocalContext` (ventanas `[S, S+L]`, sobre `L_global`, normalizacion RMS).
- Incluye `A1_mode` (crecimiento RMS del modo con `beta > 1/2`), `A2Low_RMS` (control de la parte
  low) y `A2Tail_RMS` (control tail, alimentado por `H_b` + LS_gamma).
- Contiene rangos `H_range`/`H_range` segun el contexto (altura, paso dyadico) para garantizar que
  las ventanas exploradas cubren los `S` relevantes.

### 3.2 AxiomsShimAccepted, CertificatesCorrectAlpha, NumericCoverageAlpha
- `AxiomsShimAccepted`: aceptar el shim que importa los axiomas clasicos (explicita, E<->RH,
  prefactores) en Lean.
- `CertificatesCorrectAlpha`: afirma que los certificados ERU alpha (flux, energia, gates, valores
  racionales) coinciden con los artefactos numericos publicados.
- `NumericCoverageAlpha`: cobertura numerica de ventanas y parametros para el contexto RMS (las
  ventanas usadas en los certificados cubren el rango requerido por Plan B).

4. Cadena logica hacia RH_from_ERURH_conditional
------------------------------------------------
- `ERURH_GlobalAssumptions` = `ClassicalZetaAssumptions` + `SpectralAssumptionsAlpha` (`H_b`) +
  `LSGammaAssumptions` + `BetaInertiaAssumptions` + `WindowScalingAssumptions`.
- `AxiomsShimAccepted` + `CertificatesCorrectAlpha` + `NumericCoverageAlpha` cargan el shim y los
  artefactos numericos.
- Con esas entradas se activa `PlanB_AnalyticAssumptions ctx` y se obtiene `RMSLocalHypothesis ctx`
  (A1 + A2-low/tail + LS_gamma sobre `H_b`).
- `RMSLocalHypothesis` + gates cerrados -> no hay modos con `beta > 1/2` (inercia fuerte).
- Inercia ERU fuerte + equivalencia ERURH -> `RiemannHypothesis xiAlpha`.
- Teorema Lean de referencia: `RH_from_ERURH_conditional (G : ERURH_GlobalAssumptions) :
  RiemannHypothesis xiAlpha`.

5. Que parte es ERU interno y que parte es externa
--------------------------------------------------
- Demostrado internamente en Lean: energia ERU (certificados y checklist), RMS/gates, bridges de
  inercia, equivalencia ERURH <-> RH bajo el paquete clasico, y wrappers condicionales de Plan B.
- Externo/analitico: `H_b_pointwise` y `H_b_L2_tail` (growth de `b_rho` y cola), large-sieve fino
  (`LSGammaAssumptions`), densidad de ceros y bounds clasicos (`ClassicalZetaAssumptions`), y el
  blow-up certificado beta (`BetaInertiaAssumptions`).
- Las versiones debiles (`H_b_pointwise_weak`, `gamma_prefactor_bound`,
  `explicit_b_rho_growth_bound`) sirven para aislar crecimiento polinomico y allanar el camino para
  reemplazar supuestos fuertes por lemas estructurales a medida que se formalicen bounds
  clasicos y estimaciones de prefactores.
