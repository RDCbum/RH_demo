ERURH RMSLocal Hypothesis Proof (Plan B)
========================================

1. Setup and decomposition
--------------------------
- Normalized observable: \(\widetilde J_\alpha(s) = e^{s/2} J_{\mathrm{rel},\alpha}(s) / s^2\).
- Decomposition: \(\widetilde J_\alpha = \widetilde J_0 + \widetilde J_{\mathrm{low}} + \widetilde J_{\mathrm{tail}}\).
- RMS on \([S, S+L]\):
  - \(\mathrm{RMS}(S,L) := \sqrt{\tfrac{1}{L} \int_{S}^{S+L} |\widetilde J_\alpha(s)|^2 ds}\).
  - \(\mathrm{RMS}_0, \mathrm{RMS}_{\mathrm{low}}, \mathrm{RMS}_{\mathrm{tail}}\) defined analogously for the pieces.

2. Noise bounds (A2-low and A2-tail)
------------------------------------
- **A2-low:** \(\exists M_{\mathrm{low}}\) such that \(\mathrm{RMS}_{\mathrm{low}}(S,L) \le M_{\mathrm{low}}\) for large \(S\), \(1 \ll L \ll S^\alpha\).
- **A2-tail:** \(\exists M_{\mathrm{tail}}\) such that \(\mathrm{RMS}_{\mathrm{tail}}(S,L) \le M_{\mathrm{tail}}\) for large \(S\), \(1 \ll L \ll S^\alpha\).
- Let \(M_{\mathrm{noise}} := M_{\mathrm{low}} + M_{\mathrm{tail}}\).

3. A1-mode
----------
- Hypotheses: \(\rho = \beta + i\gamma\) with \(\beta > 1/2\); mode contribution \(J(s) = a e^{(\rho-1)s}\); ERU normalization \(\widetilde J(s) = a s^{-2} e^{(\beta-1/2)s} e^{i\gamma s}\); windows \([S,S+L]\) with \(1 \ll L \ll S^\alpha\), \(0<\alpha<1\).
- A1-mode theorem: ∃ \(c>0\), \(S_0>0\) s.t. for \(S ≥ S_0\) and \(1 ≤ L ≤ S^\alpha\),
  \[
    \mathrm{RMS}_0(S,L) \gtrsim c\, e^{(\beta-1/2)S} / S^2.
  \]
- Sketch: \(|\widetilde J(s)|^2 = |a|^2 s^{-4} e^{2(\beta-1/2)s}\); on \([S,S+L]\), \(s^{-4} \gtrsim S^{-4}\) and \(e^{2(\beta-1/2)s} \gtrsim e^{2(\beta-1/2)S}\); integrate and take square roots. The Lean development tracks this with existential constants (`ERURH_ModeGrowthAlpha.lean`), leaving the analytic proof as a gap.

4. Proof of `RMSLocalHypothesis`
--------------------------------
- By the triangle inequality in L²: \(\mathrm{RMS}(S,L) \ge \mathrm{RMS}_0(S,L) - M_{\mathrm{noise}}\).
- Pick \(S\) large so \(\mathrm{RMS}_0(S,L) > 2 M_{\mathrm{noise}} + C_{\mathrm{env}}\); then \(\mathrm{RMS}(S,L) > C_{\mathrm{env}}\).
- Conclusion: if a mode with \(\beta > 1/2\) exists and A2-low/A2-tail hold, there is a window with RMS above the envelope (`RMSLocalHypothesis`). This is the analytic input consumed by the Plan B master theorem to force gate opening and rule out β > 1/2 modes.
