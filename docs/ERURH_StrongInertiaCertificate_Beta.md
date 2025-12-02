ERURH-beta: StrongInertiaCertificate_beta (borrador informal)
============================================================

Contexto y señal suavizada
--------------------------
- La capa beta usa la corriente suavizada \(j_{\mathrm{Rel,ERU}}(s) = (K_{\mathrm{ERU}} * j_{\mathrm{Rel,\alpha}})(s)\) descrita en `docs/ERURH_jRel_ERU_Design_AlphaToBeta.md`.
- Para cada ventana alfa \([a_i, b_i]\) con \(s_{\mathrm{mid},i} = (a_i + b_i)/2\), definimos la energía RMS suavizada:
  \[
    E_{\mathrm{RMS}}(a_i,b_i)
    = \sqrt{\frac{1}{b_i - a_i}\int_{a_i}^{b_i} J_{\mathrm{rel,ERU}}(s)^2\,ds}.
  \]
- Normalización ERU por ventana:
  \[
    K_{\mathrm{RMS}}(i) =
    \frac{e^{s_{\mathrm{mid},i}/2}}{s_{\mathrm{mid},i}^2} \, E_{\mathrm{RMS}}(a_i,b_i).
  \]

Qué es el certificado beta
--------------------------
- `StrongInertiaCertificate_beta` postula la existencia de una constante global \(C_{\mathrm{RMS},\beta}\) tal que, para todas las ventanas en el régimen de interés,
  \[
    E_{\mathrm{RMS}}(a_i,b_i)
    \le C_{\mathrm{RMS},\beta}\,e^{-s_{\mathrm{mid},i}/2}s_{\mathrm{mid},i}^2.
  \]
- Es un objeto fenomenológico ERU: captura la escala energética observada de la jRel suavizada con un kernel \(K_{\mathrm{ERU}}\) (por ejemplo, gaussiano discreto). No se usa en el teorema alfa ni implica equivalencia con RH.
- Sirve de puente conceptual entre los artefactos numéricos (`tools/eru_jrel_smooth_numeric_alpha.py`, `tools/eru_jrel_energy_windows_beta.py`) y un posible certificado formal de energía en Lean dentro del namespace beta.

Instanciación numérica inicial (beta)
-------------------------------------
- El pipeline `eru_jrel_energy_windows_beta.py` + `make_strong_inertia_beta_certificate.py` genera un primer certificado numérico:
  `strongInertiaCertificate_beta_numeric` con \(C_{\mathrm{RMS},\beta} = 0.1\), \(S0_\beta = 14.0\), 6 ventanas y `tailRMSBound = 0`.
- Este objeto es fenomenológico: documenta la escala RMS observada (~0.1) para la jRel suavizada y sirve de ancla narrativa en la capa ERURH-beta, sin impacto en los certificados alfa.

### Robustness scan (beta layer)

Un barrido de parámetros sobre la corriente suavizada ERU consideró:
- σ ∈ {1.0, 1.5, 2.0},
- radius ∈ {3, 5, 7},
- T ∈ {500, 1000},
- dataset de ceros: `zeros_zeta_first500`.

En 18/18 combinaciones exitosas, la escala RMS normalizada
\[
  K_{\mathrm{RMS}}(i)
  = \frac{e^{s_{\mathrm{mid}}/2}}{s_{\mathrm{mid}}^{2}} E_{\mathrm{RMS}}(a_i,b_i)
\]
se mantuvo en el rango
\[
  0.0349 \;\lesssim\; K_{\mathrm{RMS}}^{\max} \;\lesssim\; 0.0578.
\]

Tras aplicar factor 2.0 y redondeo a una cifra decimal, la constante beta del pipeline fue siempre
\[
  C_{\mathrm{RMS},\beta} = 0.1.
\]

Conclusión: la señal suavizada jRel_ERU muestra una escala energética estable frente a variaciones de suavizado y cutoff T. La capa beta captura así un régimen fenomenológico coherente, separado de la capa alfa donde el control sup es RH-equivalente.
