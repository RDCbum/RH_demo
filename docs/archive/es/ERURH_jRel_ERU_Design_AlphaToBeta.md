ERURH-beta: jRel_ERU (K * jRel_alpha)
======================================

Contexto
--------
- ERURH-alpha permanece como formalismo central: equivalencia ERU ↔ RH con jRel cruda.
- ERURH-beta introduce una capa fenomenológica suavizada jRel_ERU para diagnósticos numéricos
  y energía/RMS por ventana, sin modificar certificados ni axiomas alfa.

Familia de kernels ERU aceptables
---------------------------------
- No negatividad: K(s) ≥ 0.
- Normalización puntual: K(0) = 1 (unidad de referencia en s = 0).
- Simetría: K(s) = K(-s).
- Regularidad mínima: continuo en s (C¹ opcional si se necesita suavidad adicional).
- Soporte compacto |s| ≤ L o, en su defecto, decaimiento rápido tipo gaussiano.
- Normalización probabilística opcional: ∫ℝ K(s) ds = 1 cuando el soporte o el decaimiento
  lo permiten (útil para comparabilidad entre núcleos).

Definición formal (beta)
------------------------
- jRel_alpha(s): observable alfa original (objeto usado en el teorema formal).
- jRel_ERU(s) := (K_ERU * jRel_alpha)(s) = ∫ℝ K_ERU(t) · jRel_alpha(s - t) dt.
- jRel_ERU es solo un observable beta (fenomenológico). jRel_alpha sigue siendo el único
  objeto alfa válido para el formalismo y los certificados.

Relación con la discretización gaussiana actual
-----------------------------------------------
- El kernel ERU puede elegirse gaussiano discreto (σ, radio) para alinear con el suavizado
  implementado en los scripts numéricos existentes.
- El smoothing atenúa oscilaciones de alta frecuencia de jRel_alpha, reduce sensibilidad
  a aliasing de la malla y estabiliza el cálculo de RMS/energía.
- Ventanas y bordes: usar padding por replicación/reflectancia en los extremos evita fugas de
  energía por truncamiento del kernel; con soporte compacto, basta con forzar K(s)=0 fuera
  del radio elegido.

Motivación del smoothing
------------------------
- Estabilidad numérica: menor varianza en estimaciones de energía y RMS por ventana.
- Filtrado espectral: supresión de modos rápidos que no afectan a la inercia macroscópica.
- Robustez de RMS: al suavizar antes de elevar al cuadrado se limitan picos locales que pueden
  dominar la integral en ventanas cortas.

Diferencia conceptual alpha vs beta
-----------------------------------
- ERURH-alpha: jRel cruda, equivalencia ERU ↔ RH, única base formal y de certificados.
- ERURH-beta: jRel_ERU suavizada (K * jRel_alpha), función energética/RMS y diagnósticos
  numéricos; NO es aún equivalente a RH, ni modifica el formalismo alfa.

### 4. A beta RMS–style inertia certificate for `jRel_ERU`

In the alpha layer, the strong inertia certificate is formulated as a **sup–norm** bound on the raw bridge current
`jRel_alpha(s)`, of the form
\[
  |J_{\mathrm{rel},\alpha}(s)| \le C_{\mathrm{strong},\alpha}\,e^{-s/2}s^2,
\]
with a very small constant \(C_{\mathrm{strong},\alpha}\) chosen to match the RH–equivalent Chebyshev-type error bounds.

The beta layer replaces both the observable and the functional:

1. The observable is the **smoothed ERU current**
   \[
     J_{\mathrm{rel,ERU}}(s) := (K_{\mathrm{ERU}} * J_{\mathrm{rel},\alpha})(s),
   \]
   where \(K_{\mathrm{ERU}}\) is a fixed ERU kernel (nonnegative, symmetric, unit mass, rapidly decaying).

2. Instead of a pure sup–norm bound, we consider a **windowed RMS/energy bound**.

For each alpha window \([a,b]\) with midpoint \(s_{\mathrm{mid}} := (a+b)/2\), define the RMS energy of
the smoothed current by
\[
  E_{\mathrm{RMS}}(a,b)
  := \sqrt{\frac{1}{b-a}\int_a^b J_{\mathrm{rel,ERU}}(s)^2\,ds}.
\]

The ERURH–beta RMS certificate would assert that there exists a constant \(C_{\mathrm{RMS},\beta} > 0\) such that,
for all alpha windows \([a,b]\) in the regime of interest,
\[
  E_{\mathrm{RMS}}(a,b)
  \;\le\;
  C_{\mathrm{RMS},\beta}\,e^{-s_{\mathrm{mid}}/2}s_{\mathrm{mid}}^2.
\]

Numerically, using the current explicit–bridge evaluator (500 zeros, \(T=1000\)) and the Gaussian smoothing
parameters \(\sigma = 1.5\), `radius = 5`, we observe, for the alpha windows \(w\mathrm{Alpha}49\)–\(w\mathrm{Alpha}51\),

- a maximum normalized RMS scale
  \[
    \max_{[a,b]} 
    \frac{e^{s_{\mathrm{mid}}/2}}{s_{\mathrm{mid}}^{2}} E_{\mathrm{RMS}}(a,b)
    \;\approx\; 0.046,
  \]
- and a maximum normalized sup scale
  \[
    \max_{s \in [a,b]}
    \frac{e^{s/2}}{s^2} |J_{\mathrm{rel,ERU}}(s)|
    \;\approx\; 0.21.
  \]

As a **first beta–scale candidate**, we may therefore tentatively take
\[
  C_{\mathrm{RMS},\beta} := 0.1,
\]
which is safely above the current RMS observations (roughly a factor of 2) while remaining in the same
order of magnitude as the normalized sup scale of the smoothed current.

At this stage, `C_RMS_beta` is **purely phenomenological**: it is not used in the alpha formal theorem
`4 certificates ⇒ RH_alpha`. The beta certificate is intended as a robust, ERU–native energetic description
of the smoothed current, informed by the explicit–formula numerics, but not yet connected to a formal
implication toward RH in Lean.
