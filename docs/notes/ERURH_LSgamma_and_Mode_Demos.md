ERURH LSγ and A1-mode Demonstrations
====================================

1. Simple LSγ lemma (Cauchy–Schwarz version)
--------------------------------------------
- For heights \(\{\gamma_j\}\), coefficients \(\{b_j\}\), let \(F(u) = \sum b_j e^{i\gamma_j u}\). Then \(|F(u)| \le \sum |b_j|\), so for \(L>0\),
  \[
    \frac{1}{L}\int_0^L |F(u)|\,du \le \sum |b_j|.
  \]
- With Riemann–von Mangoldt, \(\#\{\gamma_j \in (T_1,T_2]\} \lesssim (T_2-T_1)\log T_2\); combined with ERU normalization (\(S^{-4}\) factors), this suffices for tail RMS control in A2-tail.
- In Lean: `LS_gamma_simple_pointwise` and `LS_gamma_simple_RMS` live in `ERURH_LargeSieveGammaSketch.lean`; the refined LSγ^weak is assumed via `ls_gamma_weak` in `LSGammaAssumptions`.

2. A1-mode lemma (β > 1/2 ⇒ exploding RMS)
------------------------------------------
- Hypotheses: \(\rho=\beta+i\gamma\) with \(\beta>1/2\); mode contribution \(J(s)=a e^{(\rho-1)s}\); ERU normalization \(\widetilde J(s)=a s^{-2} e^{(\beta-1/2)s} e^{i\gamma s}\); windows \([S,S+L]\) with \(1 \ll L \ll S^\alpha\), \(0<\alpha<1\).
- Conclusion: ∃\(c>0\), \(S_0>0\) such that for \(S \ge S_0\), \(1 \le L \le S^\alpha\),
  \[
    \mathrm{RMS}_0(S,L) := \sqrt{\tfrac{1}{L}\int_S^{S+L} |\widetilde J(s)|^2 ds}
      \gtrsim c\, e^{(\beta-1/2)S}/S^2.
  \]
- Sketch: \(|\widetilde J(s)|^2 = |a|^2 s^{-4} e^{2(\beta-1/2)s}\); on \([S,S+L]\), \(s^{-4} \gtrsim S^{-4}\) and \(e^{2(\beta-1/2)s} \gtrsim e^{2(\beta-1/2)S}\); integrate to get the bound and take square roots. Lean tracks this in `ERURH_ModeGrowthAlpha.lean` with existential constants (`S0`, `c0`), leaving the analytic proof as a gap.

3. Integration in Plan B
------------------------
- Simple LSγ + \(H_b\) (`hb_tail` in `SpectralAssumptionsAlpha`) + ERU normalization ⇒ A2-tail control.
- A1-mode + A2-low + A2-tail ⇒ `RMSLocalHypothesis`.
- RMSLocalHypothesis + gate closure + master theorem excludes β > 1/2 modes and yields `RiemannHypothesis xiAlpha` under the classical packages assumed in `ERURH_GlobalAssumptions`.
