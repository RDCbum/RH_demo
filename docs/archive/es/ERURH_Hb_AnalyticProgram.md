ERURH: Programa Analítico para \(H_b\)
=====================================

1. Contexto
-----------
El paquete \(H_b\) encapsula propiedades espectrales de los coeficientes \(b_\rho\) que aparecen al expandir el observable ERU (`logR`/`jRel`) vía la fórmula explícita. En el código ya hemos separado tres componentes:
- `H_b_explicit`: estructura explícita de \(b_\rho\).
- `H_b_pointwise`: cota puntual de decaimiento de \(b_\rho\).
- `H_b_L2_tail`: cota de cola en norma \(L^2\) para \(\sum_{|\gamma|>T} |b_\rho|^2\).

2. Forma explícita de \(b_\rho\) (`H_b_explicit`)
-------------------------------------------------
A partir de la fórmula explícita para \(\psi(x)\) y el cambio \(x = e^s\), se obtiene una expansión del tipo
\[
\log R(s) = \sum_\rho a_\rho\, e^{(\rho-1)s} + (\text{términos triviales}),\qquad
 \text{y derivando}\quad
  jRel(s) = \sum_\rho \rho\, a_\rho\, e^{(\rho-1)s} + \cdots
\]
Bajo la normalización ERU
\[
\widetilde J_\alpha(s) = e^{s/2}\, jRel(s) / s^2,
\]
aparecen coeficientes del tipo
\[
 b_\rho = (\rho-1)\rho^{-1} \, G(\rho),
\]
donde \(G(\rho)\) incluye factores \(\Gamma(\rho/2)\), \(\pi^{-\rho/2}\) y posibles regularizaciones del kernel. El objetivo de `H_b_explicit` es formalizar en Lean un lema que diga que \(b_\rho\) coincide con una fórmula cerrada \(F(\rho)\), derivada de la fórmula explícita de \(\psi\) (paquete `ClassicalZetaAssumptions`) y la normalización ERU (kernel/logR/jRel).

3. Bound puntual (`H_b_pointwise`)
-----------------------------------
La forma típica buscada es
\[
 |b_\rho| \le C\,(1+|\gamma|)^{-1+\varepsilon},
\]
para \(\Re(\rho)=\beta>1/2\). Debería seguir de `H_b_explicit`, Stirling/bounds de \(\Gamma\), bounds de \(\zeta'/\zeta\) en la franja crítica y quizá una región libre de ceros. Esta parte es analítica profunda; en Lean requeriría formalizar fragmentos de Titchmarsh/Ivić.

4. Cola \(L^2\) (`H_b_L2_tail`)
-------------------------------
La cota empleada es
\[
 \sum_{|\gamma|>T} |b_\rho|^2 \ll (\log T)^A.
\]
Conceptualmente se deduce de `H_b_pointwise` combinada con Riemann–von Mangoldt/densidad de ceros y una suma sobre bandas dyádicas. Es formalizable en Lean si se dispone de RvM formalizado y de los bounds de prefactores.

5. Plan de ataque y separación de responsabilidades
---------------------------------------------------
- **Paso 1**: formalizar `H_b_explicit` como lema estructural (fórmula para \(b_\rho\)), usando solo `ClassicalZetaAssumptions` + normalización ERU.
- **Paso 2**: aislar `H_b_pointwise` como supuesto clásico sobre \(\zeta\) + test function (prefactores, Stirling, zero-free region).
- **Paso 3**: derivar `H_b_L2_tail` a partir de `H_b_pointwise` + conteo de ceros (idealmente como lema Lean bajo supuestos externos mínimos).

Las partes ERURH (lemmas del kernel, normalización) viven en `H_b_explicit`; las partes clásicas permanecen en `ClassicalZetaAssumptions` y en los supuestos analíticos profundos para `H_b_pointwise` y `H_b_L2_tail`.
