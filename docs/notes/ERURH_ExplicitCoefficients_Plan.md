ERURH Explicit Coefficients Plan
================================

1. From ψ(x) to logR(s) and jRel(s)
-----------------------------------
- Explicit formula sketch: \(\psi(x) = x - \sum x^\rho/\rho + (\text{trivial terms} + \text{error})\).
- Define \(E(x) = \psi(x) - x\), \( \log R(s) = E(e^s)/e^s \), and \( jRel(s) = \frac{d}{ds} \log R(s)\).
- Unfolding yields sums over zeros: \(jRel(s) \approx \sum c_\rho e^{(\rho-1)s}\) with coefficients \(c_\rho\) from the explicit formula.

2. Definition of \(b_\rho\) for the ERU observable
--------------------------------------------------
- On windows \([S, S+L]\) with \(s = S + u\), \(e^{(\rho-1)s} = e^{(\rho-1)S} \cdot e^{(\rho-1)u} = (\text{S-factor}) \cdot e^{i\gamma u} \cdot (\text{u-factor})\).
- The factor of \(e^{i\gamma u}\) defines coefficients \(b_\rho\) (rational/smooth functions of \(\rho\), e.g., \((\rho-1)/\rho\) combinations).
- These \(b_\rho\) carry the explicit-formula contribution of each zero into the ERU RMS analysis.

3. Target lemma: explicit coefficients ⇒ \(H_b\)
------------------------------------------------
- Desired analytic lemma: under explicit-formula control for ψ/logR/jRel, zeros with β > 1/2 have coefficients satisfying \(|b_\rho| \le C (1+|\gamma|)^{-1+\varepsilon}\), yielding \(\sum_{|\gamma|>T} |b_\rho|^2 \le (\log T)^A\).
- In Lean this bridge is sketched (with a gap) from an explicit-formula hypothesis to `H_b`; currently `H_b` is assumed via `SpectralAssumptionsAlpha` (field `hb_tail : H_b_L2_tail`).

4. Placement in Plan B
----------------------
- `H_b` compresses the explicit-formula hypothesis on \(b_\rho\).
- `A2Tail_RMS` is intended to follow from `H_b` plus LSγ/zero-density inputs (see `ERURH_A2_AnalyticPlan.md`), and feeds the Plan B route to RH.
