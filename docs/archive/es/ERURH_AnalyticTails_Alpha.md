# ERURH-alpha · Analytic tails (v2-lite)

## Objetivo

Acotar la contribución de los ceros no triviales con `|γ| > T` en las sumas
explícitas de `logR(s)` y `J_rel(s)` bajo RH, para ofrecer un modo de cola
analítica sencillo (v2-lite) en el evaluador explícito y apuntar a cotas finales
con constantes racionales e interval arithmetic.

### Target tail bounds for logR_alpha

Bound deseado:
\[
  |\log R_{\mathrm{tail}}(s; T)| \le B_{\log R}(s, T),
\]
para \(s \ge S_0\), \(T \ge T_0\), donde \(B_{\log R}(s, T)\) proviene de la contribución
de \(|\gamma| > T\) en la fórmula explícita. Estructura:
- factor \(e^{-s/2}\) y, si procede, polinomios en \(s\);
- dependencia en \(T\) basada en integrales/sumas sobre \(|\gamma| > T\);
- objetivo final: constantes racionales, aptas para interval arithmetic y export a Lean;
- estado actual: modelo heurístico v2-lite con \(\sum_{|\gamma|>T} 1/|\gamma|\).

## Fórmulas de partida (ρ = 1/2 + iγ, RH)

Para cada cero:

- `logR`: término `exp((ρ-1)s)/ρ` tiene módulo `≈ 2 * exp(-s/2) / |γ|`.
- `J_rel`: término `(ρ-1)/ρ * exp((ρ-1)s)` tiene módulo comparable,
  `≈ 2 * exp(-s/2) / |γ|`.

Así, la cola se reduce a acotar `Σ_{|γ|>T} 1/|γ|`.

## Conteo de ceros y suma → integral

Usamos `N(t) ~ t log t / (2π)` para `t` grande. Con integración por partes
(borrador grueso):

```
Σ_{γ>T} 1/γ  ≈  ∫_T^∞ (1/t) dN(t)
             ≤ (log T)/(2π) + (log T)^2 / (4π).
```

## Bound común para logR y J_rel

Definimos el bound heurístico

```
E_tail(s, T) = 2 * exp(-s/2) * [ (log T)/(2π) + (log T)^2/(4π) ].
```

- Se aplica tanto a `logR` como a `J_rel`.
- Es una cota v2-lite: gruesa, pero estructurada para refinarla.
- Evitar usarla con `T <= 1` (no es significativa); ahí devolvemos 0 en el código.

### Refined tail model for J_rel (v2-lite)

Para `J_rel(s)` la cota L1 gruesa basada en Σ_{|γ|>T} 1/|γ| suele ser demasiado grande:
la cola analítica resultante puede dominar las cotas certificadas de jRel. Un modelo más
realista considera el comportamiento RMS, donde las oscilaciones cos(γ s) se cancelan en
promedio. Usamos:

```
J_tail(s)^2  e^{-s} * Σ_{|γ|>T} 1/γ^2,
Σ_{|γ|>T} 1/γ^2  (log T + 1) / (2π T),
E_tail_J(s, T) = exp(-s/2) * sqrt((log T + 1)/(2π T)).
```

Esta cota sigue siendo heurística (v2-lite), pero es mucho más pequeña y adecuada para
`J_rel(s)` que la cota L1 común. Actualmente `logR` conserva la cota gruesa L1, mientras
`J_rel` usa este modelo RMS para la cola.

### Target tail bounds for jRel_alpha

Queremos
\[
  |J_{\mathrm{rel,tail}}(s; T)| \le B_J(s, T),
\]
con estructura \(e^{-s/2}\) y dependencia en \(T\) vía \(\sum_{|\gamma|>T} 1/\gamma^2\) (modelo RMS) o \(\sum 1/|\gamma|\) (modelo L1) cuando sea inevitable. Ideas:
- Derivar \(B_J\) desde \(B_{\log R}\) controlando derivadas; o acotar directamente la serie de \(J_{\mathrm{rel}}\).
- Integrar constantes tipo \(C_{\text{tail}}\) en el esquema \(e^{-s/2}s^2\) para compatibilidad con bounds fuertes de jRel.
- Objetivo final: bound RMS/L2 optimizado, con constantes racionales, listo para interval arithmetic.
- Estado actual: modelo RMS heurístico \(\exp(-s/2) \sqrt{(\log T + 1)/(2\pi T)}\).

### Current analytic status

- **Final targets**:
  - \( |\log R_{\mathrm{tail}}(s;T)| \le B_{\log R}(s,T) \) con \(B_{\log R}\) explícito/racionalizable.
  - \( |J_{\mathrm{rel,tail}}(s;T)| \le B_J(s,T) \) basado en RMS/L2, con constantes optimizadas.
- **v2-lite (actual)**:
  - `logR`: cota L1 basada en \(\sum 1/|\gamma|\) \(\Rightarrow\) \(E_{\text{tail}}(s,T)\).
  - `J_rel`: cota RMS heurística \(\exp(-s/2) \sqrt{(\log T + 1)/(2\pi T)}\).
  - Flotante, sin interval arithmetic; sin constantes racionales refinadas.
- **Analytic steps needed**:
  - Reemplazar las integrales aproximadas por cotas efectivas usando densidad de ceros y bounds clásicos.
  - Derivar versiones racionales para \(s \ge S_0\), \(T \ge T_0\).
  - Integrar interval arithmetic (Arb/mpmath) para certificar \(B_{\log R}\) y \(B_J\).
  - Conectar \(B_J\) con el esquema \(e^{-s/2}s^2\) para calibrar `cEnvelopeClosedRat`.

## Estado v2-lite

- Implementación flotante, sin interval arithmetic ni optimización fina.
- Cola analítica opcional (`tail_mode="analytic"`); el evaluador sigue devolviendo
  la parte truncada, y expone `E_tail` como bound complementario.
- Pensado como escalón hacia una versión futura con intervalos + cotas optimizadas.
