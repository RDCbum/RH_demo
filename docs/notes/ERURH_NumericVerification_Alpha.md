# ERURH-alpha · Numerical Verification Note (skeleton)

## 1. Introduction
Outline of how one could independently verify the four ERURH-alpha certificates. Goal: guide a technical reader on what to check, which scripts generate data, and alternative numerical methods to audit the published artifacts. All formal implications remain conditional on the classical analytic packages (`ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha` with `hb_tail`, `LSGammaAssumptions`) and on the certified numeric inputs bundled in `ERURH_GlobalAssumptions`.

## 2. Certificates and conditions
- **GlobalEnergyCertificateCorrect_alpha:** κ (`kappa_book`), `L_global`, `kappa_low` and their relations.
- **KernelBlowupCertificateCorrect_alpha:** κ-book threshold versus β > 1/2 modes.
- **BridgeInertiaCertificateCorrect_alpha:** window coverage; per-window/tail bounds for `logR`/`jRel`; flux+energy hypotheses (`flux_energy_hypotheses_alpha_instantiated`, `flux_energy_alpha`).
- **StrongInertiaCertificateCorrect_alpha:** bridge→strong morphism, parameters `C_strong`, `S0_strong`, alignment with `cEnvelopeClosedRat` and `XiWitnessOn`.

BridgeInertia verification plan (numerical)
- **Coverage:** windows `alphaWindows=[a_i,b_i]` + `tailStart` cover \([s0, +∞)\); check order/overlap and coverage up to a chosen \(T\).
- **Per-window/tail bounds:** build meshes per window/tail, evaluate `logR`/`jRel` with high precision/intervals, check \(|\cdot|\) ≤ published bounds (`logRBoundWindow`, `jRelBoundWindow`, `logRBoundTail`, `jRelBoundTail`).
- **Flux/energy sanity:** recompute quantities tied to `flux_contraction_alpha`, `flux_energy_control_alpha`, `flux_laws_alpha`, compare against `kappaBookClosedRat`, `kappaLowFormalRat`, `lGlobalFormalRat`.

Suggested procedures
- Use mpmath/Arb/interval arithmetic for certified inequalities; inflate bounds if needed.
- Tail meshes: geometric points from `tailStart` upward.
- Tolerances: enforce strict positivity of margins; document any inflation.

Scripts and artifacts
- `tools/make_rational_bounds.py`, `tools/make_certificate_values.py`: generate κ, `L_global`, `kappa_low`, `cEnvelopeClosedRat`, `tailStart` (JSON + `.lean`).
- `tools/make_flux_bounds.py`: window/tail bounds for `logR`/`jRel` (`alphaFluxLaws`).
- `tools/make_lambda_bounds.py`, `tools/make_prefactor_bounds.py`, `tools/make_zeta_bounds.py` (+ helpers): prefactor/ζ/λ bounds feeding `XiWitnessOn`.
- Artifacts: CSV/JSON (`studies/...`, `tools/cache/...`) and generated `.lean` modules (`formal_proofs/ERURH/*.lean`, `staging/ERURH/Staging/*.lean`).
- Optional window enrichment via `tools/enrich_windows_with_tail_bounds_alpha.py` (tail modes static/v2-lite/combined).

Sup-normalized scale of `jRel_alpha` vs alpha target
- `tools/numeric_jRel_sup_envelope_alpha.py` computes \(K_{\max}(w) = \max_{s \in w} e^{s/2}s^{-2}|J_{\mathrm{rel},\alpha}(s)|\).
- On windows wAlpha49–wAlpha51: \(K_{\max} \approx 0.35\!-\!0.49\), averages \(0.09\!-\!0.12\); tail \(K_{\max} \approx 0.08\). These exceed the strong-alpha target (\(\sim 10^{-3}\)); tails (v2-lite) are small, so main zeros dominate. Interpretation: the strong envelope is a logical condition for RH, not numerically observed with the exploratory evaluator.

Independent verification outline
- **GlobalEnergy:** recompute κ, `L_global`, `kappa_low` via independent code and compare to published rationals.
- **KernelBlowup:** check kernel bound for β > 1/2 on finite meshes; certify maxima against `kappa_book`.
- **BridgeInertia:** validate window coverage and per-window/tail bounds with high-precision/interval evaluations.
- **StrongInertia:** audit `C_strong`, `S0_strong`, `XiWitnessOn` (prefactor/zeta/bridge); interval libraries (Arb), automatic differentiation, and Msamp/Lip lemmas can support this.

Exploratory explicit evaluator (zeros-based)
- `explicit` mode in `numeric_check_bridge_bounds_logR.py` / `numeric_check_bridge_bounds_jRel.py` uses truncated explicit sums (`tools/explicit_bridge_evaluator.py`) over zeros up to \(T\), with heuristic tails; floats only; serves as a stepping stone toward interval-certified evaluators.

Experiments (summary)
- **logR v0.5 (ψ with prime powers, x_max=1e7):** 20–100 samples/window, tolerances 0.20–0.00; no violations of \(\logR\) bounds (~0.175) observed.
- **jRel v0.1 (central difference of same logR, h=0.01–0.10, x_max=1e7):** many violations of `jRel` bounds (~7.9e-4); counts ranged from ~100 down to ~34 as h increased; likely dominated by derivative noise of the exploratory evaluator. Conclusion: current exploratory jRel checks are not reliable evidence against the certified bounds; certified checks require explicit-formula/interval arithmetic.

Link to the master statement
----------------------------
Once the four certificates are numerically justified, the master implication “finite certificates ⇒ RH (alpha)” applies, conditional on the classical analytic packages. A fully unconditional result would still require formalizing those classical analytic theorems in Lean.
