Teorema clásico H_b^weak (cola L² de b_ρ)
=========================================

Enunciado
---------
Sean `b_ρ` los coeficientes explícitos asociados a los ceros no triviales
`ρ = β + iγ` de ζ, construidos a partir de la fórmula explícita ERU
(`HbExplicitData`). Existe `C, A, T0 > 0` tales que para todo `T ≥ T0`:
\[
  \sum_{\rho:\,T < |\gamma| \le 2T} |b_\rho|^2 \;\le\; C\,T\,(\log T)^A.
\]
Esta es la versión “H_b^weak” de la cola L² por bandas diádicas; en Lean se
modela como `H_b_L2_tail` y se aliasa como `HbWeak_L2_tail`.

Dependencias clásicas
---------------------
- Fórmula explícita para ψ/logR/jRel (capa `ClassicalZetaAssumptions`).
- Bounds de Γ(ρ/2) y π^{-ρ/2} (Stirling en la franja crítica).
- Bounds de ζ'/ζ(s) en la banda `Re s ≥ 1/2 + ε`.
- Riemann–von Mangoldt / densidad de ceros para contar ceros en `(T, 2T]`.
- Propiedades de suavidad/soporte del kernel ERU (test function).

Esbozo de demostración
----------------------
1. Usar `H_b_explicit` para escribir `b_ρ` como
   `prefactor(ρ) * (ζ'/ζ)(ρ) * kernel_ERU(ρ)` (más términos triviales acotados).
2. Aplicar Stirling para acotar `prefactor(ρ) = π^{-ρ/2} Γ(ρ/2)` por una potencia
   de `(1 + |γ|)` o `log T` en la banda crítica.
3. Usar bounds clásicos de `ζ'/ζ` en `Re s ≥ 1/2 + ε` para acotar la parte
   aritmética.
4. Acotar el factor `kernel_ERU(ρ)` usando la suavidad/soporte de la test
   function (factor fijo en T).
5. Concluir un bound polinómico para `|b_ρ|` (capturado en Lean por
   `explicit_b_rho_growth_bound`), y combinar con Riemann–von Mangoldt para
   sumar sobre la banda `(T, 2T]`, obteniendo
   `sum_{T<|γ|≤2T} |b_ρ|^2 ≤ C T (log T)^{2K+1}` para algún `K`.
6. Este resultado se identifica con `H_b^weak` (aquí con exponente `A = 2K+1`).

Conexión con SpectralAssumptionsAlpha y Plan B
----------------------------------------------
- En Lean, `H_b_L2_tail` (alias `HbWeak_L2_tail`) es un campo de
  `SpectralAssumptionsAlpha` (`hb_tail`), representando este teorema clásico.
- A2-tail y Plan B consumen `hb_tail` junto con `LSGammaAssumptions` y los
  rangos de ventanas para acotar la RMS de la cola.
- Por tanto, el teorema condicional `RH_from_ERURH_conditional` depende de
  `H_b^weak` como hipótesis externa clásica encapsulada en el paquete espectral.

Factorización (G) + (ZB) ⇒ H_b^weak
------------------------------------
- (G) `explicit_b_rho_growth_bound`: growth polilogarítmico de `b_ρ` a partir de
  la fórmula explícita (prefactor Γ·π + ζ'/ζ + kernel ERU).
- (ZB) `ZeroBandCountBound`: conteo de ceros en bandas dyádicas
  `# {ρ : T < |γ| ≤ 2T} ≪ T (log T)^A`.
- En cada banda `(T, 2T]`, (G) da `|b_ρ|^2 ≪ (log T)^{2B}` y (ZB) da
  `#band ≪ T (log T)^A`, así
  \[
    \sum_{T<|γ|≤2T} |b_ρ|^2 \ll T (\log T)^{A+2B}.
  \]
  Sumando bandas se obtiene `H_b^weak`. En Lean esto se refleja en el lema
  `H_b_L2_tail_of_growth_and_bandcount`.
