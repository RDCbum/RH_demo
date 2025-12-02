# ERURH-alpha · jRel Audit (Lean ↔ Python)

Formal `jRel_alpha` (Lean)
--------------------------
- Core object: `ERUBridge.jRel : ℝ → ℝ` (see `formal_proofs/ERURH/Inertia.lean`), an abstract bridge field alongside `logR`; the certificate does not fix an explicit formula.
- Bounds enter through flux/inertia certificates: per window \(|B.jRel x| ≤ |algebraMap ℚ ℝ (jRel_q w)|\); tail bound \(|B.jRel x| ≤ |algebraMap ℚ ℝ jRel_q_tail|\).
- Released alpha constants (`FluxWindows.lean`):
  - `jRelBoundWindow = 49287667 / 62500000000 ≈ 7.886×10^{-4}`,
  - `jRelBoundTail   = 1363890281 / 200000000000 ≈ 6.819×10^{-3}`.
  These are pointwise absolute-value bounds; no smoothing/kernel appears in the certificate.
- Bridge/inertia certificates propagate these constants; strong inertia then consumes them in the conditional RH proof (assumptions packaged in `ERURH_GlobalAssumptions`).

Python `jRel` evaluators
------------------------
- `tools/numeric_check_bridge_bounds_jRel.py` (psi mode): central difference of exploratory \(\logR_{\psi}(s) = (\psi(e^s)-e^s)/e^s\); noisy, heuristic.
- `tools/explicit_bridge_evaluator.py` (explicit mode): `jRel_main(s) = -2 Re((ρ-1)/ρ · e^{(ρ-1)s})` summed over positive γ (ρ = 1/2 + iγ, |γ| ≤ T), paired for RH; tail handled separately; trivial/correction terms currently 0.
- Diagnostics (`numeric_check_bridge_bounds_jRel_smoothed.py`, `numeric_check_bridge_energy_jRel.py`, `numeric_chebyshev_jRel.py`, `numeric_cauchy_bound_jRel.py`) consume `jRel_main`; any smoothing/convolution is diagnostic only, not part of the formal object.

Alignment / discrepancies
-------------------------
- Variable/normalization: both use real `s` and the derivative of `logR(s)`; Lean predicates are raw pointwise bounds, no weights or smoothing.
- Definition: Lean leaves `jRel` abstract and certified only by bounds; Python instantiates `jRel` as a truncated explicit derivative, omitting trivial/correction terms and using heuristic tails.
- Tail/constants: Lean bounds are fixed rationals; Python tail bounds are heuristic, and trivial terms are ignored, so Python values are not certified upper bounds.
- Conclusion: Python evaluators approximate the intended derivative-of-logR on the real line but are not the certified Lean object; they drop terms, truncate, and smooth, whereas the certificates require only pointwise bounds and rely on the assumed classical analytic packages (`ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha`, `LSGammaAssumptions`) bundled in `ERURH_GlobalAssumptions`.
