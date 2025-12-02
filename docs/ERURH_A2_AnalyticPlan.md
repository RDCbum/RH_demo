ERURH A2 Analytic Plan (Ideas 1&2)
==================================

1. Statement of A2 (low + tail)
--------------------------------
- **A2-low:** Control of the RMS contribution from the finite “low” part of jRel (small zeros and bounded spectrum). This delivers a uniform bound on the normalized RMS over the low range.
- **A2-tail:** Control of the RMS contribution from the “tail” (|γ| > T) in the ERU-normalized RMS. Tail control is split into classical analytic packages (zero density, second moments, almost-orthogonality, and non-zero tails).

2. Classical analytic inputs for A2-tail
----------------------------------------
- **H_b (bandwise quadratic decay).** For dyadic bands `(T, 2T]`, the quadratic mass of coefficients satisfies `∑_{(T,2T]} |b_ρ|^2 ≲ (log T)^A`.
- **H_range (windows and bands).** Windows `[S, S+L]` with `1 ≪ L ≪ S^α` (0 < α < 1), and spectral bands `(2^k S, 2^{k+1} S]` up to `2^K S ≲ S^B` with `B < 4`.
- **Package 3: large-sieve type bound on heights γ.** Almost-orthogonality of `e^{iγu}` over `u ∈ [0, L]` (or the simple LS_γ RMS bound) to decorrelate zero contributions across windows.
- **Package 4: tail terms not tied to zeros.** Analytic control of residual tail pieces (non-zero terms, smooth weights, normalization factors).
  A simple LS_γ bound is implemented in Lean (`ERURH_LargeSieveGammaSketch.lean`, `LS_gamma_simple_pointwise`, `LS_gamma_simple_RMS`); the refined bound is recorded as a sketch.

3. A2-tail statement (refined)
------------------------------
- Normalized tail observable: \tilde F_tail(s) = s^{-2} ∑_{β>1/2, |γ|>T0} b_ρ e^{iγs}.
- Tail RMS on a window: K_tail(S, L)^2 := (1/L) ∫_{s ∈ [S, S+L]} | \tilde F_tail(s) |^2 ds.
- Under H_b, H_range, and LS_γ (simple RMS bound), there exists M_tail > 0 such that for S large (and L in range) one has K_tail(S, L)^2 ≤ M_tail^2 uniformly.
- Proof sketch: extract the S^{-4} factor; change variables s = S + u; decompose into dyadic bands (T_1(k), T_2(k)] with T_1(k) ≈ 2^k S up to S^B; apply LS_γ simple RMS on each band with H_b; sum over bands and use B < 4 and the normalization to bound the total; control the residual tail |γ| > S^B via H_b decay.

4. Link to RMSLocalHypothesis and Plan B
----------------------------------------
- Combining **A2-low** + **A2-tail** with **A1-mode** (a mode β > 1/2 contributing positively) should force an RMS-window above the formal envelope, i.e. establish `RMSLocalHypothesis`.
- Once `RMSLocalHypothesis` holds, the Plan B master theorem (`RH_from_planB_RMS`) uses gate closure to rule out modes β > 1/2, and via existing ERURH equivalences concludes `RiemannHypothesis xiAlpha`.
  The A1-mode growth lemma is recorded in `formal_proofs/ERURH/ERURH_ModeGrowthAlpha.lean`.
