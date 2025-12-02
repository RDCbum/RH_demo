Teorema clásico LS_γ^weak
=========================

Enunciado (conceptual)
----------------------
Sea `F(u) = ∑_{ρ : T < |γ| ≤ 2T} b_ρ e^{i γ u}` la suma espectral en una banda
`(T, 2T]`, con coeficientes `b_ρ` provenientes de `HbExplicitData` (fórmula
explícita ERU). Para ventanas `u ∈ [0, L]` con `1 ≪ L ≪ S^α`, existe
`C, B, T0 > 0` tales que para todo `T ≥ T0`:
\[
  \frac{1}{L} \int_0^L \Big|F(u)\Big|^2 \,du \;\ll\; T \, (\log T)^B \cdot
    \max_{\rho \in (T,2T]} |b_\rho|^2,
\]
o equivalentemente,
\[
  \frac{1}{L} \int_0^L \Big|F(u)\Big|^2 \,du \;\ll\;
    \sum_{T<|γ|≤2T} |b_\rho|^2 \cdot (\log T)^B.
\]
Esta cota LS_γ^weak suministra el control RMS de la cola A2-tail. En Lean se
modela como `LSGammaWeak : Prop` y se incluye como campo `ls_gamma_weak` en
`LSGammaAssumptions`.

Dependencias clásicas
---------------------
- `H_b^weak` (cola L² de `b_ρ` por bandas) para controlar la masa cuadrática.
- Cauchy–Schwarz en `u` (la forma simple `LS_gamma_simple_RMS` ya está en Lean).
- Riemann–von Mangoldt para contar ceros en `(T,2T]`.
- Estructura de ventanas ERU (`H_range`: 1 ≪ L ≪ S^α, cortes dyádicos en T).

Esbozo de demostración
----------------------
1. Fijar una banda `(T,2T]` y escribir `F(u)`.
2. Aplicar la versión simple de LS_γ / Cauchy–Schwarz:
   \[
     \frac{1}{L}\int_0^L |F(u)|^2 du \;\le\;
       \Big(\sum_{T<|γ|≤2T} |b_\rho|\Big)^2.
   \]
3. Usar Cauchy–Schwarz de nuevo:
   \[
     \Big(\sum |b_\rho|\Big)^2 \le \#\{\rho\} \cdot \sum |b_\rho|^2.
   \]
4. Invocar RvM: `#\{\rho \in (T,2T]\} ≪ T log T`.
5. Insertar `H_b^weak`: `∑_{T<|γ|≤2T} |b_\rho|^2 ≪ T (log T)^A`.
6. Combinar factores y absorber logaritmos en `(log T)^B` (para algún `B`),
   obteniendo la cota LS_γ^weak requerida para A2-tail.

Rol en la cadena ERURH
----------------------
- `LSGammaWeak` es la hipótesis clásica que se espera de la teoría de ceros
  (Cauchy–Schwarz + RvM + H_b^weak).
- En Lean se almacena como `ls_gamma_weak` dentro de `LSGammaAssumptions` y es
  tratada como Prop externa, análoga a `H_b_L2_tail`.
- A2-tail y Plan B dependen de esta cota RMS de la cola para controlar la
  contribución tail; el teorema condicional `RH_from_ERURH_conditional` la
  consume vía `LSGammaAssumptions`.
