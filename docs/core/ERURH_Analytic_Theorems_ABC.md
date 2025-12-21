# ERURH Analytic Theorems A–B–C (Plan B inputs)

These three classical analytic theorems supply the external inputs for the Plan B route in the ERURH → RH conditional implication. They are stated here without proof. Each theorem makes explicit its dependence on standard analytic number theory: the classical explicit formula, Stirling bounds for Γ, bounds on ζ′/ζ in the critical strip, Riemann–von Mangoldt zero counting, and large-sieve–type decorrelation. Together, they deliver the RMS tail control needed for `RMSLocalHypothesis`.

## Theorem A (HbWeak\_L2\_tail — dyadic L² bound for \(b_\rho\))

Let \( \rho = \beta + i\gamma \) run over the non-trivial zeros of ζ, paired as usual under RH. Define the ERU explicit-formula coefficients \(b_\rho\) as in the ERURH explicit-formula plan:
\[
  \log R(s) = \sum_\rho a_\rho\, e^{(\rho-1)s} + \cdots, \qquad
  j_{\mathrm{rel}}(s) = \sum_\rho \frac{\rho-1}{\rho}\, a_\rho\, e^{(\rho-1)s} + \cdots,
\]
and, under the ERU normalization \( \widetilde J_\alpha(s) = e^{s/2} j_{\mathrm{rel}}(s) / s^2\), set
\[
  b_\rho := \frac{\rho-1}{\rho}\, G(\rho),
\]
where \(G(\rho)\) bundles the classical factors \(\pi^{-\rho/2}\Gamma(\rho/2)\), any ζ′/ζ factor coming from the explicit formula, and the ERU kernel normalization (see `docs/notes/ERURH_ExplicitFormula_Plan.md`).

Assume the classical explicit formula for ψ, Stirling bounds for \(\Gamma(\rho/2)\) and \(\pi^{-\rho/2}\), bounds for ζ′/ζ on \(\Re s \ge 1/2 + \varepsilon\), and the Riemann–von Mangoldt zero-counting estimate. Then there exist constants \(C>0\), \(A>0\), \(T_0>0\) such that, for every \(T \ge T_0\),
\[
  \sum_{\,\rho :\, T < |\gamma| \le 2T\,} |b_\rho|^2 \;\le\; C\, T\, (\log T)^A.
\]
The constants \(C,A\) depend only on the classical bounds (Stirling, ζ′/ζ, and zero-counting), not on \(T\).

## Theorem B (LSGammaWeak — LSγ-type RMS bound)

Let \(F(u) = \sum_{T_1<|\gamma|\le T_2} b_\rho\, e^{i\gamma u}\) with coefficients \(b_\rho\) as in Theorem A. Fix an admissible window regime \(1 \ll L \ll S^\alpha\) (with \(0<\alpha<1\)) and dyadic bands \((T_1,T_2] \subseteq (T,2T]\) in the range \(T \asymp S\) (e.g., \(T\) between \(S\) and \(S^B\) for some fixed \(B<4\)).

Assume the zero-counting bound of Riemann–von Mangoldt type on each band and the classical spacing/large-sieve decorrelation (Cauchy–Schwarz plus zero-density/spacing) for the exponentials \(e^{i\gamma u}\) on \([0,L]\). Then there exist constants \(C>0\), \(A>0\), \(T_0>0\) such that, for every admissible band with \(T \ge T_0\),
\[
  \frac{1}{L} \int_0^L \bigl|F(u)\bigr|^2 \, du
    \;\le\; C\,(\log T)^A \cdot \max_{\,\rho \in (T_1,T_2]\,} |b_\rho|^2,
\]
equivalently,
\[
  \frac{1}{L} \int_0^L \bigl|F(u)\bigr|^2 \, du
    \;\le\; C\,(\log T)^A \sum_{\,T_1<|\gamma|\le T_2\,} |b_\rho|^2.
\]
The constants \(C,A\) depend only on the classical zero-counting/spacing inputs and the admissible-range parameters, not on \(T\).

## Theorem C (A2-tail — uniform RMS tail bound)

Let \(S\) be large, \(L\) satisfy \(1 \ll L \ll S^\alpha\) (with \(0<\alpha<1\)), and consider the tail region \(|\gamma| > S^B\) for some fixed \(B<4\). Decompose the tail into dyadic bands \((2^k S, 2^{k+1} S]\), \(k=0,\dots,K\), up to \(2^K S \lesssim S^B\). Define the normalized tail observable
\[
  \widetilde F_{\mathrm{tail}}(s) \;=\; s^{-2} \sum_{\substack{\beta>1/2\\|\gamma|>S^B}} b_\rho\, e^{i\gamma s},
\]
and its windowed RMS
\[
  K_{\mathrm{tail}}(S,L)^2 \;:=\; \frac{1}{L} \int_{S}^{S+L} \bigl|\widetilde F_{\mathrm{tail}}(s)\bigr|^2 \, ds.
\]
Assume Theorem A (HbWeak\_L2\_tail) on each dyadic band, Theorem B (LSGammaWeak) on the admissible range, and the window condition \(1 \ll L \ll S^\alpha\) with \(B<4\). Then there exist constants \(M_{\mathrm{tail}}>0\), \(S_0>0\) such that, for all \(S \ge S_0\) and admissible \(L\),
\[
  K_{\mathrm{tail}}(S,L)^2 \;\le\; M_{\mathrm{tail}}^2,
\]
where \(M_{\mathrm{tail}}\) depends only on the constants in Theorems A and B and on the admissible-range parameters \(B,\alpha\), not on \(S,L\). This is the tail bound needed to supply the A2-tail hypothesis in `RMSLocalHypothesis`.
