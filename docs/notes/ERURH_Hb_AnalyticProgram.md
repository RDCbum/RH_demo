ERURH: Analytic Program for \(H_b\)
===================================

1. Context
----------
The \(H_b\) package encapsulates spectral properties of the coefficients \(b_\rho\) that arise when expanding the ERU observables (\(\log R\)/\(jRel\)) via the explicit formula. It separates:
- `H_b_explicit`: explicit structure of \(b_\rho\);
- `H_b_pointwise`: pointwise decay of \(b_\rho\);
- `H_b_L2_tail`: dyadic L² tail bound \(\sum_{|\gamma|>T} |b_\rho|^2 \ll (\log T)^A\) (assumed as `hb_tail` in `SpectralAssumptionsAlpha`).

2. Explicit form of \(b_\rho\) (`H_b_explicit`)
-----------------------------------------------
From the explicit formula for \(\psi(x)\) and \(x=e^s\),
\[
\log R(s) = \sum_\rho a_\rho e^{(\rho-1)s} + \text{trivial terms},\qquad
jRel(s) = \sum_\rho (\rho-1)\rho^{-1} a_\rho e^{(\rho-1)s} + \cdots
\]
Under ERU normalization \(\widetilde J_\alpha(s) = e^{s/2} jRel(s) / s^2\), coefficients take the form \(b_\rho = (\rho-1)\rho^{-1} G(\rho)\) with \(G(\rho)\) capturing \(\Gamma(\rho/2)\), \(\pi^{-\rho/2}\), and kernel regularization. `H_b_explicit` aims to state in Lean (as a classical assumption) that \(b_\rho\) equals a closed-form expression derived from the explicit formula (via `ClassicalZetaAssumptions`) and ERU normalization.

3. Pointwise bound (`H_b_pointwise`)
------------------------------------
Target shape:
\[
 |b_\rho| \le C (1+|\gamma|)^{-1+\varepsilon}, \quad \Re(\rho)=\beta>1/2,
\]
expected from `H_b_explicit`, Stirling/Γ bounds, ζ′/ζ bounds in the critical strip, and zero-free regions. This remains classical analytic input; Lean treats it as an assumed field in `SpectralAssumptionsAlpha`.

4. L² tail (`H_b_L2_tail`)
--------------------------
Desired bound:
\[
 \sum_{|\gamma|>T} |b_\rho|^2 \ll (\log T)^A.
\]
Conceptually from `H_b_pointwise` + Riemann–von Mangoldt / zero-density and dyadic summation. In Lean this tail is assumed directly as `hb_tail : H_b_L2_tail` within `SpectralAssumptionsAlpha`.

5. Plan and separation
----------------------
- **Step 1:** Treat `H_b_explicit` as the structural link from the explicit formula + ERU normalization to \(b_\rho\).
- **Step 2:** Keep `H_b_pointwise` as classical ζ-analytic input (Stirling, ζ′/ζ) within `ClassicalZetaAssumptions` or its extensions.
- **Step 3:** Encode `H_b_L2_tail` as the packaged spectral consequence (assumed field `hb_tail`); future formalisation could derive it from `H_b_pointwise` once classical theory is mechanized.
