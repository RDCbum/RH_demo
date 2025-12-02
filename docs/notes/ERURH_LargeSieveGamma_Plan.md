ERURH Large-Sieve-on-γ Plan
===========================

1. Setup for the γ-large-sieve lemma
------------------------------------
- Zeros \(\rho_j = \beta_j + i\gamma_j\) with \(\beta_j > 1/2\) in the tail regime.
- Coefficients \(b_j = b_{\rho_j}\) satisfy the decay hypothesis \(H_b\) (assumed via `SpectralAssumptionsAlpha`).
- Consider window variables \(u \in [0, L]\) and band-limited sums \(F_{(T_1, T_2]}(u) = \sum_{T_1<|\gamma_j|\le T_2} b_j e^{i \gamma_j u}\).

2. Target inequality (LSγ)
-------------------------
Desired bound (schematic):
\[
\frac{1}{L} \int_0^L \big|F_{(T_1, T_2]}(u)\big|^2 \, du
  \le C \bigl(1 + L \log T_2\bigr) \sum_{T_1<|\gamma_j|\le T_2} |b_j|^2,
\]
for admissible \(T\) (e.g., \(T \ge S\), \(T \le S^B\), \(L\) in the window range).

3. Sketch of the analytic argument
----------------------------------
- Expand the square, integrate over \(u \in [0, L]\), separate diagonal/off-diagonal terms.
- Evaluate \(\int_0^L e^{i(\gamma_j - \gamma_k)u} du\) and use zero-density estimates to control small \(|\gamma_j - \gamma_k|\).
- Combine to obtain \((1/L)\int |F|^2 \le (1 + L \log T)\sum |b_j|^2\).

4. Role in A2-tail and Plan B
-----------------------------
- LSγ, together with \(H_b\) and zero-density, yields the RMS control for the tail (A2-tail).
- In Lean, LSγ^weak is assumed as `ls_gamma_weak` inside `LSGammaAssumptions` (defaulted via `LSGammaWeak_of_simple`); it feeds `A2Tail_RMS` and, via Plan B, the exclusion of modes with \(\beta > 1/2\).
