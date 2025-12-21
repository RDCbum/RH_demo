Classical Theorem LS\_\γ\^weak
=============================

Conceptual statement
--------------------
Let \(F(u) = \sum_{\rho : T < |\gamma| \le 2T} b_\rho e^{i \gamma u}\) be the spectral sum on the dyadic band \((T, 2T]\), with coefficients \(b_\rho\) from `HbExplicitData` (ERU explicit formula). For windows \(u \in [0, L]\) with \(1 \ll L \ll S^\alpha\), there exist \(C, B, T_0 > 0\) such that for all \(T \ge T_0\),
\[
  \frac{1}{L} \int_0^L |F(u)|^2 \,du \;\ll\; T\,(\log T)^B \cdot \max_{\rho \in (T,2T]} |b_\rho|^2,
\]
equivalently,
\[
  \frac{1}{L} \int_0^L |F(u)|^2 \,du \;\ll\; \sum_{T<|\gamma|\le 2T} |b_\rho|^2 \, (\log T)^B.
\]
This LS\_\γ\^weak bound supplies the RMS control for A2-tail. In Lean it is assumed as the proposition `LSGammaWeak`, stored as field `ls_gamma_weak` in `LSGammaAssumptions` (not proved internally).

Classical dependencies
----------------------
- \(H_b^{\mathrm{weak}}\) (dyadic L² tail of \(b_\rho\)) to control quadratic mass.
- Cauchy–Schwarz in \(u\) (`LS_gamma_simple_RMS` is already in Lean).
- Riemann–von Mangoldt to count zeros in \((T, 2T]\).
- ERU window structure (`H_range`: \(1 \ll L \ll S^\alpha\), dyadic cuts in \(T\)).

Proof sketch
------------
1. Fix a band \((T, 2T]\) and write \(F(u)\).
2. Apply the simple LS\_\γ / Cauchy–Schwarz inequality:
   \[
     \frac{1}{L}\int_0^L |F(u)|^2\,du \le \Big(\sum_{T<|\gamma|\le 2T} |b_\rho|\Big)^2.
   \]
3. Apply Cauchy–Schwarz again:
   \[
     \Big(\sum |b_\rho|\Big)^2 \le \#\{\rho\} \cdot \sum |b_\rho|^2.
   \]
4. Insert RvM: \(\#\{\rho \in (T,2T]\} \ll T \log T\).
5. Insert \(H_b^{\mathrm{weak}}\): \(\sum_{T<|\gamma|\le 2T} |b_\rho|^2 \ll T (\log T)^A\).
6. Combine factors, absorb logs into \((\log T)^B\), and obtain LS\_\γ\^weak for A2-tail.

Role in the ERURH chain
-----------------------
- `LSGammaWeak` is the expected classical hypothesis (Cauchy–Schwarz + RvM + \(H_b^{\mathrm{weak}}\)).
- In Lean it is stored as `ls_gamma_weak` in `LSGammaAssumptions` and treated as an external proposition alongside `H_b_L2_tail`.
- A2-tail and Plan B rely on this RMS tail bound; the conditional theorem `RH_from_ERURH_conditional` consumes it via `LSGammaAssumptions`.
