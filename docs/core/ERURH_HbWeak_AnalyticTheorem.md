Classical Theorem H_b^weak (L² tail of \(b_\rho\))
==================================================

Statement
---------
Let \(b_\rho\) be the explicit coefficients attached to non-trivial zeros \(\rho = \beta + i\gamma\) of \(\zeta\), built from the ERU explicit formula (`HbExplicitData`). There exist constants \(C, A, T_0 > 0\) such that for every \(T \ge T_0\),
\[
  \sum_{\rho:\,T < |\gamma| \le 2T} |b_\rho|^2 \le C\,T\,(\log T)^A.
\]
This dyadic L² tail bound is the hypothesis \(H_b^{\mathrm{weak}}\); in Lean it is required as the assumed field `hb_tail : H_b_L2_tail` (alias `HbWeak_L2_tail`) inside `SpectralAssumptionsAlpha` (not proved internally).

Classical inputs
----------------
- Explicit formula for \(\psi\) / \( \log R \) / \( j_{\mathrm{rel}} \) (package `ClassicalZetaAssumptions`).
- Stirling bounds for \(\Gamma(\rho/2)\) and \(\pi^{-\rho/2}\) in the critical strip.
- Bounds for \( \zeta'/\zeta(s) \) on \(\Re s \ge 1/2 + \varepsilon\).
- Riemann–von Mangoldt zero counts for bands \((T, 2T]\).
- Smoothness and support properties of the ERU kernel (test function).

Proof sketch
------------
1. Use `H_b_explicit` to write \(b_\rho = \text{prefactor}(\rho)\,(\zeta'/\zeta)(\rho)\,\text{kernel\_ERU}(\rho)\) plus bounded trivial terms.
2. Apply Stirling to bound \(\text{prefactor}(\rho) = \pi^{-\rho/2}\Gamma(\rho/2)\) by a power of \(1 + |\gamma|\) (or \(\log T\)) in the critical strip.
3. Use classical bounds on \( \zeta'/\zeta \) for \(\Re s \ge 1/2 + \varepsilon\).
4. Bound \(\text{kernel\_ERU}(\rho)\) via the smooth, compactly supported test function (uniform in \(T\)).
5. Deduce a polylogarithmic growth bound for \(|b_\rho|\) (Lean lemma `explicit_b_rho_growth_bound`) and combine with Riemann–von Mangoldt to sum over \((T, 2T]\), obtaining \(\sum_{T<|\gamma|\le 2T} |b_\rho|^2 \le C T (\log T)^{2K+1}\) for some \(K\).
6. This yields \(H_b^{\mathrm{weak}}\) with exponent \(A = 2K+1\).

Connection to `SpectralAssumptionsAlpha` and Plan B
---------------------------------------------------
- In Lean, `H_b_L2_tail` is a field of `SpectralAssumptionsAlpha` (`hb_tail`), representing this classical theorem.
- A2-tail and Plan B use `hb_tail` together with `LSGammaAssumptions` and window ranges to control the RMS tail.
- The conditional theorem `RH_from_ERURH_conditional` assumes \(H_b^{\mathrm{weak}}\) as a classical spectral input.

Factorization (G) + (ZB) ⇒ \(H_b^{\mathrm{weak}}\)
--------------------------------------------------
- (G) `explicit_b_rho_growth_bound`: polylogarithmic growth of \(b_\rho\) from the explicit formula (Γ·π prefactor + \( \zeta'/\zeta \) + ERU kernel).
- (ZB) `ZeroBandCountBound`: dyadic zero count \( \#\{\rho : T < |\gamma| \le 2T\} \ll T (\log T)^A \).
- On each band \((T, 2T]\), (G) gives \(|b_\rho|^2 \ll (\log T)^{2B}\) and (ZB) gives \(\#\text{band} \ll T (\log T)^A\); hence
  \[
    \sum_{T<|\gamma|\le 2T} |b_\rho|^2 \ll T (\log T)^{A+2B}.
  \]
  Summing dyadic bands yields \(H_b^{\mathrm{weak}}\). In Lean this appears as `H_b_L2_tail_of_growth_and_bandcount`.
