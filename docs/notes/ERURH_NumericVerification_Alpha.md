# ERURH-alpha · Nota de verificación numérica (esqueleto)

## 1. Introducción
Esta nota describe cómo, en principio, se pueden verificar numéricamente y de forma independiente las condiciones de los cuatro certificados ERURH-alpha. El objetivo es guiar a un lector técnico sobre qué comprobar, qué scripts generan los datos y qué métodos numéricos alternativos podrían usarse para auditar los artefactos publicados.

## 2. Resumen de certificados y condiciones
- **GlobalEnergyCertificateCorrect_alpha**: controla κ (kappa_book), `L_global`, `kappa_low` y su relación (bandas de energía).
- **KernelBlowupCertificateCorrect_alpha**: focalizado en `kappa_book` y el comportamiento ante modos β > 1/2 que provocan blow-up de kernel.
- **BridgeInertiaCertificateCorrect_alpha**: requiere cobertura de ventanas, bounds por ventana/cola para `logR`/`jRel`, hipótesis de flujo+energía (`flux_energy_hypotheses_alpha_instantiated`, `flux_energy_alpha`).
- **StrongInertiaCertificateCorrect_alpha**: incluye el morphismo `bridge_to_strong`, parámetros `C_strong`, `S0_strong`, dominio razonable, alineación con `cEnvelopeClosedRat` y testigo `XiWitnessOn` (prefactor/λ/ζ/logbridge).

### BridgeInertiaCertificate_alpha: plan de verificación detallado
- **Condiciones a verificar numéricamente**:
  - *Ventanas/cobertura*: los intervalos `alphaWindows = [a_i, b_i]` y el `tailStart` cubren sin huecos desde `s0` hasta el tope usado en los bounds.
  - *Bounds por ventana/cola*: para cada ventana `W_i`, las cotas `logRBoundWindow`, `jRelBoundWindow` mayoran `|logR(s)|`, `|J_rel(s)|` dentro de `W_i`; para la cola, `logRBoundTail`, `jRelBoundTail` mayoran en `[tailStart, ∞)`.
  - *Soporte flujo/energía*: las hipótesis `flux_energy_hypotheses_alpha_instantiated` y `flux_energy_alpha` son razonables numéricamente (conexión entre contracción, control de energía y leyes de flujo).
- **Procedimientos numéricos propuestos**:
  - *Ventanas*:
    - Extraer `s0Bridge` y `tailStart` de los artefactos; extraer cada `[a_i, b_i]` de `alphaWindows`.
    - Verificar orden y superposición: `a_i ≤ b_i`, `b_i` solapa o toca `a_{i+1}`, y `s0 ≥ a_0`.
    - Chequear cobertura: elegir un `T` (por ejemplo, el máximo `b_i` o `tailStart + Δ`) y verificar que `[s0, T] ⊆ ⋃ [a_i, b_i] ∪ [tailStart, T]`.
  - *Bounds por ventana/cola*:
    - Para cada ventana `W_i = [a, b]`, construir una malla (extremos + puntos intermedios uniformes o Chebyshev). Evaluar numéricamente `logR(s)` y `J_rel(s)` con alta precisión/intervalos; comprobar `|logR(s)| ≤ logRBoundWindow`, `|J_rel(s)| ≤ jRelBoundWindow` en todos los nodos.
    - Para la cola `[tailStart, T_tail]`, evaluar en una malla creciente (p. ej., puntos geométricos) y verificar `|logR(s)| ≤ logRBoundTail`, `|J_rel(s)| ≤ jRelBoundTail`.
    - Métodos sugeridos: mpmath/arb para alta precisión; interval arithmetic para certificar desigualdades. Criterio de éxito: todas las evaluaciones satisfacen la cota con un margen positivo; opcionalmente, inflar cotas si se usan intervalos.
  - *Flujo/energía*:
    - Recalcular numéricamente las magnitudes asociadas a `flux_contraction_alpha`, `flux_energy_control_alpha` y `flux_laws_alpha` en la malla de ventanas: verificar que las cantidades de energía/contracción están por debajo de los thresholds publicados.
    - Comparar energía integrada sobre las ventanas con `kappaBookClosedRat`, `kappaLowFormalRat` y `L_global_formal` para ver si las desigualdades de energía se respetan; usar margen de seguridad (tolerancia relativa).
- **Scripts y artefactos relevantes**:
  - Ventanas y bounds vienen de `tools/make_flux_bounds.py`; usa `releases/erurh-v2-core/alpha_cover_report.json`, `studies/buchstab_pointfix/out/logR_series.csv`, `equivalence_report_check.json`. Las cotas se reflejan en `formal_proofs/ERURH/FluxWindows.lean` (`logRBoundWindow`, `jRelBoundWindow`, `logRBoundTail`, `jRelBoundTail`) y `FluxBounds.lean`.
  - `s0Bridge` y `tailStart` están en `formal_proofs/ERURH/FluxWindows.lean`; los datos numéricos de soporte están en `studies/...` y caches JSON.
  - Las hipótesis de flujo/energía se relacionan con `flux_energy_hypotheses_alpha_instantiated` y `flux_energy_alpha` (ver `FluxEnergyBridge.lean`); los valores numéricos de κ y L provienen de `make_rational_bounds.py`/`make_certificate_values.py`.

## 3. Scripts Python y artefactos numéricos
Basado en `docs/ERURH_IndustrialPipeline_Alpha.md`:
- `tools/make_rational_bounds.py`, `tools/make_certificate_values.py`: generan κ, `L_global`, `kappa_low`, `cEnvelopeClosedRat`, `tailStart` (JSON + `.lean`).
- `tools/make_flux_bounds.py`: produce bounds de ventanas/cola para `logR`/`jRel` y alimenta `alphaFluxLaws`.
- `tools/make_lambda_bounds.py`, `tools/make_prefactor_bounds.py`, `tools/make_zeta_bounds.py` + `gen_w*close.py`: generan bounds de prefactor/zeta/lambda y testigos que sustentan `alphaXiOn_concrete`.
- Artefactos en CSV/JSON (`studies/...`, `tools/cache/...`) y módulos `.lean` auto-generados (`formal_proofs/ERURH/*.lean`, `staging/ERURH/Staging/*.lean`).
- Cada `*_Correct_alpha` consume parte de estos artefactos: GlobalEnergy/KernelBlowup usan racionales; BridgeInertia usa bounds de ventanas/flux; StrongInertia usa parámetros y el testigo `XiWitnessOn` derivado de prefactor/zeta/lambda.
- Opcionalmente, las ventanas pueden enriquecerse con colas v2-lite por ventana usando `tools/enrich_windows_with_tail_bounds_alpha.py` y consumirse en `make_flux_bounds.py` mediante `--tail-bounds-csv` y `--tail-mode` (static/v2-lite/combined). Por defecto, `make_flux_bounds.py` conserva la cola estática publicada.

### Sup-normalised scale of jRel_alpha vs alpha target

`tools/numeric_jRel_sup_envelope_alpha.py` evalúa por ventana la cantidad
\[
  K_{\max}(w) = \max_{s \in w} \frac{e^{s/2}}{s^2} |J_{\mathrm{rel},\alpha}(s)|.
\]
En las ventanas wAlpha49–wAlpha51 se observan \(K_{\max}\) ≈ 0.35–0.49, medias \(K\) ≈ 0.09–0.12, y en la cola \(K_{\max}\) ≈ 0.08. Estas escalas están dos órdenes de magnitud por encima del objetivo alpha ideal (\(\sim 10^{-3}\)) del bound fuerte. Las colas v2-lite son pequeñas (logR_tail \(\sim 10^{-3}\!-\!10^{-2}\), jRel_tail \(\sim 10^{-5}\)) y no explican la discrepancia; el cuerpo principal de ceros domina. Por tanto, estos diagnósticos numéricos sugieren leer el envelope fuerte alpha como una condición lógica/ideal para implicar RH, no como una propiedad numéricamente verificada de ζ en los rangos accesibles.

## 4. Esquema de verificación independiente
- **GlobalEnergy**: recomputar κ, `L_global`, `kappa_low` con código alternativo (Python multiprecisión, Julia, interval arithmetic) y comparar con los racionales publicados.
- **KernelBlowup**: verificar numéricamente el bound del kernel para β > 1/2 en una malla/familia finita; usar intervalos para certificar el máximo permitido por `kappa_book`.
- **BridgeInertia**: comprobar que las ventanas cubren el rango (`alphaWindows`), y que los bounds de `logR`/`jRel` por ventana/cola dominan los valores numéricos en una malla; usar interval arithmetic/mpmath de alta precisión.
- **StrongInertia**: auditar que `C_strong`, `S0_strong` y `XiWitnessOn` cumplen los bounds teóricos: validar prefactor (pad/log), zeta (log/arg) y la cadena log-to-bridge; posibles métodos con bibliotecas de intervalos (Arb), diferenciación automática, o validación de lemas Msamp/Lip generados.
- Salida esperada: certificados numéricos (p.ej. JSON/CSV) que demuestren que cada desigualdad se cumple en la malla o por intervalos, alineados con los valores racionales que usan los certificados.

#### Explicit evaluator v1 (zeros-based, exploratory)

Además de los evaluadores basados en ψ(p^k), se añadió un modo exploratorio
`explicit` en los checkers `numeric_check_bridge_bounds_logR.py`
y `numeric_check_bridge_bounds_jRel.py`. Este modo usa la fórmula explícita
truncada a una altura finita T, vía el módulo auxiliar
`tools/explicit_bridge_evaluator.py`, y evalúa logR(s) y J_rel(s) a partir de
un CSV con ceros no triviales.

En esta fase el modo explícito es exploratorio: opera en coma flotante y trata
la cola |γ| > T con un stub. Sirve como peldaño hacia un futuro evaluador v2 con
aritmética de intervalos y cotas analíticas de cola.

## 5. Conexión con el statement maestro
Una vez verificados numéricamente los cuatro certificados, el enunciado maestro “certificados finitos ⇒ RH (alpha)” traduce esas verificaciones en una demostración condicional de RH para `xiAlpha`. El paso pendiente hacia una demostración totalmente incondicional es formalizar en Lean los axiomas analíticos clásicos (equivalencia ERU↔E↔RH) que aquí se asumen.

## 6. Trabajo futuro
- Automatizar pipelines de verificación numérica independientes de los generadores actuales.
- Publicar bundles de datos certificados (checksums, intervalos) para auditores externos.
- Comparar implementaciones independientes (otros lenguajes/labs) y consolidar resultados en artefactos auditable/reproducibles.

### Experimento logR v0.5 · tolerancias estrictas y malla refinada

| samples/ventana | tol  | evaluaciones | violaciones | notas |
| --- | --- | --- | --- | --- |
| 20 | 0.20 | 140 | 0 | cache primes hasta 1e7, sin warnings |
| 20 | 0.10 | 140 | 0 | cache primes hasta 1e7, sin warnings |
| 20 | 0.05 | 140 | 0 | cache primes hasta 1e7, sin warnings |
| 20 | 0.00 | 140 | 0 | cache primes hasta 1e7, sin warnings |
| 100 | 0.05 | 700 | 0 | cache primes hasta 1e7, sin warnings |

Con la aproximación ψ(e^s) incluyendo potencias p^k y x_max=1e7, no se observaron violaciones de los bounds de logR (~0.175) ni con tolerancia 0 ni con malla refinada (100 puntos por ventana). Esto sugiere compatibilidad numérica del bound con esta aproximación exploratoria; sigue pendiente reemplazarla por un evaluador certificado (fórmula explícita/intervalos).

### Experimento jRel v0.1 · derivada de logR con ψ(p^k)

Setup: jRel se aproxima mediante derivada central de la misma logR exploratoria (ψ con potencias p^k), x_max=1e7, h=0.01, ventanas de `out/alpha_windows.csv`.

| samples/ventana | tol  | h    | evaluaciones | violaciones | notas |
| --- | --- | --- | --- | --- | --- |
| 20 | 0.20 | 0.01 | 140 | 103 | cache primes 1e7; muchas violaciones |
| 20 | 0.05 | 0.01 | 140 | 105 | cache primes 1e7; muchas violaciones |
| 100 | 0.05 | 0.01 | 700 | 530 | cache primes 1e7; muchas violaciones |
| 20 | 0.20 | 0.05 | 140 | 74  | cache primes 1e7; violaciones, menos que h=0.01 |
| 20 | 0.05 | 0.05 | 140 | 74  | cache primes 1e7; violaciones similares |
| 20 | 0.20 | 0.10 | 140 | 34  | cache primes 1e7; violaciones bajan pero persisten |
| 20 | 0.05 | 0.10 | 140 | 40  | cache primes 1e7; violaciones en rango similar |

Referencia: el experimento logR v0.5 (tolerancias 0.20–0.00, 20/100 muestras) no mostró violaciones.

Sensibilidad en h: al aumentar h a 0.05 y 0.10 el número de violaciones disminuye (de ~100 a 34–74 según tol), pero siguen siendo numerosas; esto sugiere que el error de derivación numérica domina más que una discrepancia real con las cotas.

Conclusión: con la derivada central y la aproximación ψ(p^k), los bounds de jRel (~7.9e-4 en ventanas) no se satisfacen en la malla explorada; los |jRel| aproximados superan la cota. Las violaciones parecen atribuibles a la combinación de evaluador exploratorio de logR y derivada central sensible al ruido. Se necesita una versión futura con fórmula explícita/interval arithmetic y control de error en la derivada para una verificación fiable; no se interpreta esto como evidencia contra los bounds certificados.
