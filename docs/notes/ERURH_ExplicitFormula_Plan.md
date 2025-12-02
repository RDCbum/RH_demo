ERURH Explicit Formula Plan (Alpha Layer)
=========================================

1. Explicit formula for ψ(x), E(x), and logR(s)
-----------------------------------------------
- Classical explicit formula: \(\psi(x) = x - \sum x^\rho/\rho + (\text{trivial terms} + \text{error})\), over non-trivial zeros \(\rho\) of ζ.
- Define \(E(x) = \psi(x) - x\); then \(\log R(s) = E(e^s) / e^s\). This expresses the ERU observable in terms of zero contributions plus controlled tails.
- Differentiation yields \(jRel(s) = \frac{d}{ds}\log R(s)\) with terms \(e^{(\rho-1)s}\).

2. From ψ to the ERU observable and coefficients \(b_\rho\)
----------------------------------------------------------
- Each zero contributes to \(jRel(s)\) a term \((\rho - 1)/\rho \cdot e^{(\rho-1)s}\).
- On windows \(s = S + u\), factor out the \(S\)-dependent part to obtain sums \(\sum b_\rho e^{i\gamma u}\) where \(\rho = \beta + i\gamma\) and \(b_\rho\) encodes the explicit-formula coefficient.
- These \(b_\rho\) transport the arithmetic/analytic content of the explicit formula into the ERURH RMS analysis.

3. Analytic hypothesis \(H_b\) on \(b_\rho\)
--------------------------------------------
- Hypothesis \(H_b\): coefficients \(b_\rho\) for zeros with \(\beta > 1/2\) satisfy decay, e.g. \(|b_\rho| \le C (1+|\gamma|)^{-1+\varepsilon}\), implying tail bounds \(\sum_{|\gamma|>T} |b_\rho|^2 \le (\log T)^A\).
- \(H_b\) is recorded in Lean as a Prop in `ERURH_ExplicitFormulaAlpha.lean` and is assumed via `SpectralAssumptionsAlpha` (field `hb_tail : H_b_L2_tail`).
- For Plan B, both the explicit formula and \(H_b\) are treated as external analytic inputs (see `docs/core/ERURH_PlanB_Assumptions.md`); future formalisation could internalise these classical ingredients.

4. Role of \(H_b\) in A2-tail and Plan B
----------------------------------------
- \(H_b\), combined with zero-density/zero-counting and LSγ bounds (`LSGammaAssumptions`), yields the tail RMS control (A2-tail) described in `ERURH_A2_AnalyticPlan.md`.
- With A2-tail, A2-low, and A1-mode, one aims to establish `RMSLocalHypothesis`, which feeds the Plan B master theorem `RH_from_planB_RMS`.
- In the current Lean development, \(H_b\) and LSγ^weak are assumed; deriving them from the explicit formula remains a classical analytic task.
