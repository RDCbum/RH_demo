ERURH Preprint: Alpha to Beta Layers
====================================

### 1. Introduction

ERURH se organiza en dos capas complementarias:
- **Alpha**: derivada de ERU para primos, formalmente equivalente a RH. Opera sobre la jRel cruda con certificados fuertes (sup-bounds de orden \(e^{-s/2}s^2\) con constante ~\(10^{-3}\)).
- **Beta**: observable ERU suavizado \(j_{\mathrm{Rel,ERU}} = K * j_{\mathrm{Rel,\alpha}}\), con un funcional energético por ventanas y constante global robusta (~\(10^{-1}\)), claramente distinta en escala de la capa alpha.

Esta dualidad lógica/fenoménica permite separar la equivalencia lógica con RH (alpha) de la fenomenología energética y numérica (beta).

### 2. The Alpha Layer: logical-spectral equivalence

- \(j_{\mathrm{Rel,\alpha}}(s)\) proviene de \(\log R(s)\) y \(E(x)\).
- Certificados alpha (ejemplos): GlobalEnergy, KernelBlowup, BridgeInertia, StrongInertia.
- Bound fuerte:
  \[
    |J_{\mathrm{rel},\alpha}(s)| \le C_{\mathrm{strong},\alpha}\, e^{-s/2}s^2,
  \]
  con \(C_{\mathrm{strong},\alpha}\) en la escala ~\(10^{-3}\).
- Papel: la capa alpha está diseñada para ser equivalente a RH; no busca ajustar la fenomenología numérica del evaluador explícito.

### 3. The Beta Layer: smoothed ERU observable and RMS energy

- \(j_{\mathrm{Rel,ERU}}(s) := (K_{\mathrm{ERU}} * j_{\mathrm{Rel,\alpha}})(s)\), con un kernel ERU fijo (Gauss σ=1.5, radius=5 en la pipeline).
- El suavizado filtra oscilaciones de alta frecuencia y estabiliza energía/RMS.
- Energía RMS por ventana:
  \[
    E_{\mathrm{RMS}}(a,b)
    := \sqrt{\frac{1}{b-a} \int_a^b J_{\mathrm{rel,ERU}}(s)^2\,ds}.
  \]
- Normalización ERU:
  \[
    K_{\mathrm{RMS}}(i)
    = \frac{e^{s_{\mathrm{mid}}/2}}{s_{\mathrm{mid}}^2} E_{\mathrm{RMS}}(a_i,b_i).
  \]
- Pipeline beta: evaluador explícito (parte principal + cola), jRel_ERU suavizada, energía por ventana, y generación automática del certificado beta.

### 4. Empirical Scale: \(C_{\mathrm{RMS},\beta} \approx 0.1\)

- En ventanas alfa (≈4951), se observa \(K_{\mathrm{RMS}}^{\max} \approx 0.046\).
- Barrido de robustez:
  - σ ∈ {1.0, 1.5, 2.0}
  - radius ∈ {3, 5, 7}
  - T ∈ {500, 1000}
  - zeros = first500
- 18/18 combinaciones exitosas.
- Rango \(K_{\mathrm{RMS}}^{\max} \in [0.0349, 0.0578]\).
- Con factor 2.0 y redondeo a una cifra decimal: **\(C_{\mathrm{RMS},\beta} = 0.1\)** estable.

Conclusión: la escala fenomenológica de \(j_{\mathrm{Rel,ERU}}\) vive entre \(3.5 \times 10^{-2}\) y \(6 \times 10^{-2}\), dos órdenes de magnitud por encima de la constante alpha (~\(10^{-3}\)). No es un bug: refleja la estructura del modelo explícito y del observable suavizado.

### 5. Conceptual Interpretation

- Alpha = capa lógica extrema, equivalente a RH, impone un sup-bound duro sobre la jRel cruda.
- Beta = capa física/energética: mide RMS del observable suavizado; captura el régimen fenomenológico del evaluador explícito con datos finitos.
- La brecha alpha/beta refleja la diferencia entre:
  - la estructura espectral requerida por RH,
  - y la fenomenología real que emerge de los datos y del suavizado.
- No hay contradicción: son dos vistas de la misma geometría (primos ↔ ceros) en escalas distintas.

### 6. Summary and Outlook

ERURH-alpha y ERURH-beta son dos caras complementarias:
- alpha: lógica espectral fuerte, equivalente a RH;
- beta: observables ERU energéticos y robustos numéricamente.

La capa beta abre camino a:
- análisis multiescala,
- comparaciones con otros modelos,
- certificados numérico-formales más avanzados (interval arithmetic),
- comprensión más profunda del comportamiento emergente del puente ERU.

### 7. Interval arithmetic pilot (beta layer)

Se implementó un piloto de intervalos en `tools/jrel_eru_interval_pilot.py` que evalúa \(j_{\mathrm{Rel,ERU}}(s)\) con multiprecisión (mp_dps ≈ 80), estima error de cola + error numérico y produce intervalos \([v_{\min}, v_{\max}]\) para cada punto.

En una prueba con \(s \in \{14.5, 15.0, 15.5\}\), zeros_zeta_first500, \(T = 1000\), \(\sigma = 1.5\), radius = 5, se observó:
- \(|j_{\mathrm{Rel,ERU}}(s)|\) en el rango \(\approx 1.5\times 10^{-3}\) a \(1.1\times 10^{-2}\),
- errores estimados \(err_{\text{est}}\) en el rango \(\approx 1.0\times 10^{-7}\) a \(1.5\times 10^{-7}\).

Conclusión: los intervalos son muy estrechos y el error numérico está varios órdenes por debajo de la escala fenomenológica de \(j_{\mathrm{Rel,ERU}}\). La brecha entre las constantes alpha (~\(10^{-3}\), sup de jRel cruda) y beta (~\(10^{-1}\), RMS de jRel_ERU suavizada) no es ruido numérico, sino una diferencia estructural entre los observables.

Perspectiva: este piloto sugiere que certificados numérico-formales más sofisticados (interval arithmetic real) podrían anclar aún más la capa beta a pruebas en Lean; ya hoy confirma que la escala beta es un rasgo estable del modelo explícito.

## The dual structure of ERURH: alpha vs beta

ERURH opera en dos regímenes de observación:
- **Alpha**: lógico-espectral, diseñado para capturar equivalencias fuertes con RH.
- **Beta**: fenomenológico-energético, diseñado para describir la dinámica real del error en rangos accesibles numéricamente.

**Alpha: logical regime and RH equivalence.** Trabaja con la jRel cruda \(j_{\mathrm{Rel,\alpha}}(s)\), impone sup-bounds fuertes \(e^{-s/2}s^2\) con constante ~\(10^{-3}\), y formula certificados formales (Chebyshev/ψ/logR/jRel) que, en Lean, implican RH. Este régimen vive en el mundo ideal/asintótico de la teoría de números.

**Beta: phenomenological ERU regime.** Usa la jRel suavizada \(j_{\mathrm{Rel,ERU}} = K * j_{\mathrm{Rel,\alpha}}\), mide energía/RMS por ventana, observa una constante robusta \(C_{\mathrm{RMS},\beta} \approx 0.1\), y no pretende implicar RH; describe el comportamiento numérico estable del modelo explícito. Este régimen vive en el mundo real/finito de las computaciones.

No hay conflicto entre capas: ambas miran el mismo sistema a distintas escalas de resolución. La escala alpha (~\(10^{-3}\) en el bound normalizado) está ligada a RH y a equivalencias lógicas; la escala beta (~\(10^{-2}\)–\(10^{-1}\)) refleja el comportamiento efectivo de \(j_{\mathrm{Rel,ERU}}\) en rangos finitos. La diferencia es esperable por el carácter asintótico de las cotas RH y no contradice la teoría: alpha asegura suficiencia lógica, beta documenta la fenomenología numérica.

Numerical diagnostics (explicit-formula, unsmoothed) on the first alpha windows (e.g. wAlpha49–51) show \(K_{\max}(w) = \max_{s \in w} e^{s/2} |J_{\mathrm{rel},\alpha}(s)|/s^2 \approx 0.35{-}0.49\), far above the ideal alpha target \(C_{\mathrm{strong},\alpha} \sim 10^{-3}\). With tail bounds v2-lite remaining tiny, this indicates the strong alpha envelope is a logical RH-equivalent condition, not a literal description of the explicit-formula numerics on finite ranges.

### The auxiliary role of the beta layer

La capa beta mide energía RMS de \(j_{\mathrm{Rel,ERU}}\), exhibe una escala numérica estable (~0.1) y sirve para:
- validar la implementación del evaluador explícito,
- estudiar la contribución low/tail de los ceros,
- diseñar y calibrar kernels ERU,
- explorar robustez frente a parámetros.

No entra en la cadena lógica ERURH-alpha ⇒ RH, ni se usa como hipótesis del teorema principal. Es un laboratorio fenomenológico: explora el comportamiento explícito en rangos finitos, mientras la capa alpha expresa las condiciones exactas suficientes para implicar RH.
