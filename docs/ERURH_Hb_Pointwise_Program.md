ERURH: Programa para el bound puntual de \(H_b\)
===============================================

Objetivo
--------
Precisar el bound puntual buscado para los coeficientes \(b_\rho\) de la fórmula explícita ERU:
\[
  |b_\rho| \le C \,(1+|\gamma|)^{-(1-\varepsilon)}, \quad \beta>1/2,\ \varepsilon>0.
\]
En Lean, `H_b_pointwise` codifica la existencia de \(C,\varepsilon>0\) con esta propiedad. El objetivo es conectar esta formulación con la representación explícita de \(b_\rho\) en `HbExplicitData`.

Descomposición analítica
------------------------
**Paso A.** Usar `HbExplicitData` para escribir
\[
  b_\rho = \text{prefactor}_1(\rho)\, \text{prefactor}_2(\rho)\, \text{kernelERU}(\rho),
\]
donde los prefactores provienen de la fórmula explícita (Γ, \(\pi^{-\rho/2}\), etc.) y `kernelERU` viene de la normalización ERU (\(e^{s/2}/s^2\) aplicada a \(jRel\)).

**Paso B.** Separar el origen de cada factor:
- Prefactores clásicos: \(\Gamma(\rho/2)\), \(\pi^{-\rho/2}\), \(\zeta'/\zeta\) (si aparece).
- Normalización ERU: factores como \(e^{(\rho-1/2)s}\) y divisiones por \(s^2\) que aparecen en \(\widetilde J_\alpha\).
- Test function y posibles regularizaciones del kernel.

**Paso C.** Bounds esperados:
- Stirling: \(|\Gamma(\sigma + i\gamma)| \asymp |\gamma|^{\sigma-1/2} e^{-\pi|\gamma|/2}\) en la franja.
- Bounds de \(\zeta'/\zeta\) y zero-free region en \(\Re s \ge 1/2+\varepsilon\).
- Concluir que el producto de prefactores decae como \((1+|\gamma|)^{-(1-\varepsilon)}\) (o, en versiones más suaves, como \((1+|\gamma|)^{-B}\) para algún \(B\) grande).

Dependencias externas
---------------------
- De `ClassicalZetaAssumptions`: fórmula explícita en la franja, bounds de \(\zeta\)/\(\zeta'\), zero-free region/densidad de ceros.
- De mathlib/clásico: Stirling para Γ, bounds de \(\pi^{-\rho/2}\).

Versiones debilitadas
---------------------
Una versión inicial podría asumir un exponente grosero:
\[
  |b_\rho| \le C (1+|\gamma|)^{-B}
\]
con \(B\) grande, como paso intermedio hacia el exponente \(1-\varepsilon\).

Relación con `H_b_L2_tail`
--------------------------
El bound puntual se combinará con Riemann–von Mangoldt/densidad de ceros para obtener la cota de cola
\(\sum_{|\gamma|>T} |b_\rho|^2 \ll (\log T)^A\) (`H_b_L2_tail`), usando sumas sobre bandas dyádicas.

Notas sobre la versión débil en Lean
------------------------------------
- Se ha introducido `H_b_pointwise_weak` en Lean: existen \(C,B>0\) tales que \(|b_\rho| \le C (1+|\gamma|)^B\).
- El lema `H_b_pointwise_implies_weak` muestra que el bound fuerte implica el débil.
- Se definió `gamma_prefactor := π^{-ρ/2} Γ(ρ/2)` y el objetivo `gamma_prefactor_bound` (cota polinómica provisional).
- El lema `explicit_b_rho_growth_bound` es el objetivo de acotar `explicit_b_rho` combinando `gamma_prefactor_bound` con los demás factores (actualmente placeholder).
- `H_b_pointwise_weak_of_explicit_and_growth` conecta `H_b_explicit` + growth grosero ⇒ `H_b_pointwise_weak`.
