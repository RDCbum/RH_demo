ERURH-alpha · Analytic Tails (v2-lite)
======================================

Objective
---------
Bound the contribution of non-trivial zeros with \(|\gamma| > T\) in the explicit sums for \(\log R(s)\) and \(j_{\mathrm{rel}}(s)\) under RH, to supply a simple analytic tail mode (v2-lite) and a path to rational, interval-certified bounds.

Target tail bounds for \(\log R_\alpha\)
---------------------------------------
Desired bound:
\[
  |\log R_{\mathrm{tail}}(s; T)| \le B_{\log R}(s, T),
\]
for \(s \ge S_0\), \(T \ge T_0\), where \(B_{\log R}\) comes from the \(|\gamma|>T\) part of the explicit formula. Structure:
- leading factor \(e^{-s/2}\) (and possibly low-degree polynomials in \(s\));
- \(T\)-dependence via integrals/sums over \(|\gamma|>T\);
- goal: rational constants suitable for interval arithmetic and Lean export;
- current: heuristic v2-lite model with \(\sum_{|\gamma|>T} 1/|\gamma|\).

Starting formulas (ρ = 1/2 + iγ, RH)
------------------------------------
For each zero:
- \(\log R\): term \(\exp((\rho-1)s)/\rho\) has magnitude \(\approx 2 e^{-s/2} / |\gamma|\).
- \(j_{\mathrm{rel}}\): term \((\rho-1)/\rho \cdot \exp((\rho-1)s)\) has comparable magnitude.
Thus the tail reduces to bounding \(\sum_{|\gamma|>T} 1/|\gamma|\).

Zero counting and sum → integral
--------------------------------
Using \(N(t) \sim t \log t / (2\pi)\) and integration by parts (rough draft),
\[
  \sum_{\gamma > T} \frac{1}{\gamma} \approx \int_T^\infty \frac{1}{t} \, dN(t)
  \le \frac{\log T}{2\pi} + \frac{(\log T)^2}{4\pi}.
\]

Common tail bound for \(\log R\) and \(j_{\mathrm{rel}}\)
---------------------------------------------------------
Heuristic v2-lite bound:
```
E_tail(s, T) = 2 * exp(-s/2) * [ (log T)/(2π) + (log T)^2/(4π) ].
```
- Applies to both \(\log R\) and \(j_{\mathrm{rel}}\) at the L1 level.
- Rough but structured for later refinement; avoid using \(T \le 1\).

Refined tail model for \(j_{\mathrm{rel}}\) (v2-lite)
------------------------------------------------------
The L1 bound based on \(\sum_{|\gamma|>T} 1/|\gamma|\) is too coarse for \(j_{\mathrm{rel}}\). An RMS model leverages oscillations \(\cos(\gamma s)\):
```
J_tail(s)^2  ≈  e^{-s} * Σ_{|γ|>T} 1/γ^2,
Σ_{|γ|>T} 1/γ^2  ≈ (log T + 1) / (2π T),
E_tail_J(s, T) = exp(-s/2) * sqrt((log T + 1)/(2π T)).
```
This is still heuristic (v2-lite) but far smaller and better aligned with certified \(jRel\) bounds.

Target tail bounds for \(jRel_\alpha\)
--------------------------------------
Goal:
\[
  |J_{\mathrm{rel,tail}}(s; T)| \le B_J(s, T),
\]
with \(e^{-s/2}\) scaling and \(T\)-dependence via \(\sum 1/\gamma^2\) (RMS model) or \(\sum 1/|\gamma|\) (L1 fallback). Objectives:
- Derive \(B_J\) from \(B_{\log R}\) by differentiating, or bound the \(j_{\mathrm{rel}}\) series directly.
- Integrate constants \(C_{\text{tail}}\) into the \(e^{-s/2}s^2\) scheme for compatibility with strong \(jRel\) bounds.
- Deliver an optimized RMS/L2 bound with rational constants, interval-certified.
- Current: heuristic RMS model \(e^{-s/2} \sqrt{(\log T + 1)/(2\pi T)}\).

Current analytic status
-----------------------
- **Final targets:** explicit/rationalizable \(B_{\log R}(s,T)\) and \(B_J(s,T)\) (RMS/L2-based) for \(s \ge S_0\), \(T \ge T_0\).
- **v2-lite (current):** L1 bound for \(\log R\); RMS heuristic for \(j_{\mathrm{rel}}\); floating-point only.
- **Next steps:** replace rough integrals with effective bounds using zero density and classical inputs; produce rational bounds; add interval arithmetic; connect \(B_J\) to the \(e^{-s/2}s^2\) scheme for calibration (`cEnvelopeClosedRat`).

Context with Lean assumptions
-----------------------------
- Tail mass control ultimately depends on classical inputs (explicit formula, growth of Γ and ζ′/ζ, zero counts) and their structured consequences (`hb_tail` in `SpectralAssumptionsAlpha`, `ls_gamma_weak` in `LSGammaAssumptions`), which are assumed, not proved, in the current Lean development.
