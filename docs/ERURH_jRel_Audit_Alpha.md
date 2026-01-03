# ERURH-alpha · jRel Audit (Lean ↔ Python)

Status: technical audit note. For the current proof narrative and assumptions,
see `arxiv_submission/ERURH_Conditional_Proof.tex` and
`docs/core/ASSUMPTIONS_LEDGER.md`.

## Formal jRel_alpha (Lean)

- The core object is `ERUBridge.jRel : ℝ → ℝ` (see `formal_proofs/ERURH/Inertia.lean`), an analytic bridge field alongside `logR`. No explicit formula is fixed at the certificate level; `jRel` is treated abstractly as a real function on the `s` axis.
- Bounds enter through flux/inertia certificates: `Flux.lean` specifies window/tail predicates
  \(|B.jRel x| ≤ |algebraMap ℚ ℝ (jRel_q w)|\) on each window and \(|B.jRel x| ≤ |algebraMap ℚ ℝ jRel_q_tail|\) on the tail.
- In the released alpha windows (`FluxWindows.lean`), the rational constants are
  - `jRelBoundWindow = 49287667 / 62500000000 ≈ 7.886×10^{-4}`,
  - `jRelBoundTail   = 1363890281 / 200000000000 ≈ 6.819×10^{-3}`,
  and the window/tail laws assert pointwise absolute-value bounds (no extra kernels or integrals).
- Bridge/inertia certificates (`InertiaCertificatesAlpha.lean`, `FluxBounds.lean`) propagate these per-window/tail constants; the strong-inertia machinery then consumes these pointwise bounds as part of the conditional RH proof. No smoothing kernel is applied inside the certificate; it is a raw pointwise inequality on `jRel` over the `s`-intervals.

## Python jRel evaluators

- `tools/numeric_check_bridge_bounds_jRel.py` (psi mode): `approx_jRel_alpha_psi(s)` = central difference of an exploratory `logR_psi(s) = (ψ(e^s) - e^s)/e^s` with prime powers; noisy and not aligned with the formal `jRel` beyond sharing the “derivative of logR” motif.
- `tools/explicit_bridge_evaluator.py` (explicit mode): `jRel_main(s)` = paired-zero explicit derivative
  \(-2 Re((ρ-1)/ρ · e^{(ρ-1)s})\) summed over positive γ (ρ = 1/2 + iγ, |γ| ≤ T), using a compensated real sum. Tail handling is separate; `jRel` returns the main term (tail can be queried as a refined heuristic bound). The evaluator omits trivial/correction terms (currently set to 0.0).
- Diagnostics (`numeric_check_bridge_bounds_jRel_smoothed.py`, `numeric_check_bridge_energy_jRel.py`, `numeric_chebyshev_jRel.py`, `numeric_cauchy_bound_jRel.py`) all consume `jRel_main` from the explicit evaluator; smoothing/convolution is a post-processing step for scale estimation and is not part of the formal object.

## Alignment / discrepancies

- **Variable/normalization:** Lean’s `jRel` lives on the real `s` axis with pointwise bounds; Python uses the same real `s` and the derivative of `logR(s)` with no extra scaling. There is no kernel or window weight in the Lean predicate; Python’s smoothers are diagnostic only.
- **Definition:** Lean leaves `jRel` abstract; the certificate only assumes pointwise bounds. Python instantiates `jRel` as the analytic derivative of the truncated explicit logR (non-trivial zeros, RH pairing), omitting trivial/correction terms and using a finite T. Thus Python is a concrete, non-rigorous instantiation consistent in spirit but lacking corrections and rigor.
- **Tail/const factors:** Lean bounds are absolute-value bounds with fixed rationals. Python’s explicit evaluator uses a refined heuristic tail bound for |γ| > T (RMS-style), and ignores trivial-zero/constants; any missing constant terms or tail rigor means Python values are not certified upper bounds.
- **Conclusion:** The current Python evaluators approximate the intended `jRel_alpha(s)` as “(d/ds) logR(s)” on the real line, but they are **not** a faithful implementation of the Lean-certified object: they drop trivial/correction terms, truncate at T with heuristic tails, and add optional smoothing that is absent from the formal statement. They match the variable/derivative convention but not the rigor or full formula used implicitly by the certificate.
