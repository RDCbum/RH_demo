ERURH-beta: jRel_ERU (K * jRel_alpha)
======================================

Context
-------
- ERURH-alpha is the formal core: ERU ↔ RH equivalence with raw `jRel` and alpha certificates.
- ERURH-beta introduces a phenomenological smoothed `jRel_ERU` for numerical diagnostics and RMS/energy-by-window analysis; it does not alter alpha certificates or axioms.

Acceptable ERU kernels
----------------------
- Nonnegative, symmetric, \(K(s)=K(-s)\), with \(K(0)=1\).
- Continuous (C¹ optional); compact support \(|s| ≤ L\) or rapidly decaying Gaussian.
- Optional probabilistic normalization \(\int_{\mathbb{R}} K(s)\,ds = 1\) for comparability.

Formal beta definition
----------------------
- `jRel_alpha(s)`: original alpha observable (used in the formal theorem).
- `jRel_ERU(s) := (K_ERU * jRel_alpha)(s) = ∫ K_ERU(t) · jRel_alpha(s - t) dt`.
- `jRel_ERU` is purely phenomenological; `jRel_alpha` remains the only formal object and is bounded pointwise by the alpha certificates.

Relation to the current Gaussian discretization
-----------------------------------------------
- An ERU kernel may be chosen as a discrete Gaussian (σ, radius) to match existing numerical smoothing.
- Smoothing attenuates high-frequency oscillations of `jRel_alpha`, reducing aliasing and stabilizing RMS/energy estimates.
- Padding (replication/reflectance) prevents boundary leakage when using compact support.

Motivation for smoothing
------------------------
- Numerical stability: lower variance in windowed energy/RMS.
- Spectral filtering: suppresses fast modes irrelevant to macroscopic inertia.
- RMS robustness: smoothing before squaring mitigates local spikes.

Alpha vs beta (conceptual)
--------------------------
- Alpha: raw `jRel`, formal ERU ↔ RH, certificate-based.
- Beta: smoothed `jRel_ERU = K * jRel_alpha`, RMS/energy diagnostics; not a formal RH implication.

Beta RMS-style inertia certificate for `jRel_ERU`
-------------------------------------------------
- Alpha strong inertia uses a sup-norm bound on raw `jRel_alpha`:
  \(|J_{\mathrm{rel},\alpha}(s)| \le C_{\mathrm{strong},\alpha} e^{-s/2} s^2\).
- Beta replaces the observable and functional:
  1. Observable: \(J_{\mathrm{rel,ERU}}(s) = (K_{\mathrm{ERU}} * J_{\mathrm{rel},\alpha})(s)\).
  2. Functional: windowed RMS/energy. For \([a,b]\) with midpoint \(s_{\mathrm{mid}}=(a+b)/2\),
     \[
       E_{\mathrm{RMS}}(a,b) := \sqrt{\tfrac{1}{b-a}\int_a^b J_{\mathrm{rel,ERU}}(s)^2\,ds }.
     \]
- A beta RMS certificate would assert \(\exists\,C_{\mathrm{RMS},\beta} > 0\) such that
  \[
    E_{\mathrm{RMS}}(a,b) \le C_{\mathrm{RMS},\beta}\,e^{-s_{\mathrm{mid}}/2}s_{\mathrm{mid}}^2
  \]
  for all alpha windows in range.
- Current numerics (explicit-bridge evaluator, 500 zeros, \(T=1000\), Gaussian σ=1.5, radius=5) on windows \(w\mathrm{Alpha}49\)–\(w\mathrm{Alpha}51\):
  - Max normalized RMS \(\approx 0.046\),
  - Max normalized sup \(\approx 0.21\).
  A tentative phenomenological choice is \(C_{\mathrm{RMS},\beta} := 0.1\).
- This beta constant is not used in the alpha formal theorem; it is a diagnostic scale informed by explicit-formula numerics. The formal RH implication remains in the alpha layer, under the classical analytic packages assumed in `ERURH_GlobalAssumptions`.
