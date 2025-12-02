ERURH A2 Analytic Plan (Ideas 1 & 2)
====================================

1. Statement of A2 (low + tail)
--------------------------------
- **A2-low:** Uniform control of the RMS contribution from the low part of \(jRel\) (small zeros / bounded spectrum), yielding a normalized RMS bound on every window in range.
- **A2-tail:** Uniform control of the RMS contribution from the tail \((|\gamma| > T)\) in the ERU-normalized RMS. The tail bound is assembled from classical analytic packages: zero-density / zero-counting, growth of the explicit-formula coefficients, simple LSγ decorrelation, and residual non-zero terms.

2. Classical analytic inputs for A2-tail
----------------------------------------
- **H_b (dyadic quadratic mass):** For dyadic bands \((T, 2T]\), \(\sum_{(T,2T]} |b_\rho|^2 \ll (\log T)^A\). In Lean this is assumed as `hb_tail : H_b_L2_tail` inside `SpectralAssumptionsAlpha`.
- **H_range (windows and bands):** Windows \([S, S+L]\) with \(1 \ll L \ll S^\alpha\) (0 < α < 1), and spectral bands \((2^k S, 2^{k+1} S]\) up to \(2^K S \lesssim S^B\) with \(B < 4\).
- **LSγ (simple RMS bound):** Almost-orthogonality of \(e^{i\gamma u}\) on \(u \in [0,L]\); in Lean this is assumed via `ls_gamma_weak` in `LSGammaAssumptions` (defaulted by `LSGammaWeak_of_simple`).
- **Residual tail terms:** Analytic control of contributions not tied directly to zeros (smooth weights, normalization factors); the simple LSγ bound is implemented in `ERURH_LargeSieveGammaSketch.lean`.

3. A2-tail statement (refined)
------------------------------
- Normalized tail observable: \(\tilde F_{\mathrm{tail}}(s) = s^{-2} \sum_{\beta>1/2,\,|\gamma|>T_0} b_\rho e^{i\gamma s}\).
- Tail RMS on a window: \(K_{\mathrm{tail}}(S,L)^2 := \frac{1}{L} \int_{S}^{S+L} |\tilde F_{\mathrm{tail}}(s)|^2\,ds\).
- Under H_b, H_range, and LSγ, there exists \(M_{\mathrm{tail}} > 0\) such that for \(S\) large and \(L\) in range, \(K_{\mathrm{tail}}(S,L)^2 \le M_{\mathrm{tail}}^2\) uniformly.
- Sketch: factor out \(S^{-4}\); set \(s = S+u\); decompose into dyadic bands \((T_1(k), T_2(k)]\) with \(T_1(k) \approx 2^k S\) up to \(S^B\); apply the simple LSγ RMS bound on each band using H_b; sum over bands (using \(B<4\) and normalization); control the residual tail \(|\gamma| > S^B\) via H_b decay.

4. Link to RMSLocalHypothesis and Plan B
----------------------------------------
- Combining **A2-low** + **A2-tail** with **A1-mode** (mode with β > 1/2) should produce a window whose RMS exceeds the formal envelope, i.e. establish `RMSLocalHypothesis`.
- With `RMSLocalHypothesis` in hand, the Plan B master theorem (`RH_from_planB_RMS`) uses gate closure (from the alpha certificates and numeric coverage) to rule out modes β > 1/2 and, via the ERURH equivalence, conclude `RiemannHypothesis xiAlpha`.
