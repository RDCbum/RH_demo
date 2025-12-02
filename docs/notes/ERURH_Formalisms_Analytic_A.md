ERURH Formalisms Analytic — Lemma A
===================================

Overview
--------
This note summarizes the closed-form analytic proof of Lemma A (global contraction) for the Buchstab-type operator, keeping notation in ASCII.

Canonical operator and tiling
-----------------------------
On the canonical patch \(u \in [1,3]\), define
\[
  (Th)(u) = \frac{1}{u} \int_{u/3}^{u/2} h(t)\,dt.
\]
The multi-α tiling translates the renormalized variable; each patch inherits the same kernel, and overlaps ensure full coverage.

Supremum norm bound
-------------------
The operator satisfies
\[
  \|Th\|_\infty \le \tfrac{1}{3} \|h\|_\infty,
\]
independently of discretization. The constant \(1/3\) comes from the mean integral and is uniform across translated patches.

Weighted norm equivalence
-------------------------
For a patch with window \([s_{\min}, s_{\max}]\), length \(\ell = s_{\max} - s_{\min}\), and weights \(w_1(s)=1\), \(w_2(s)=e^{s/2}/s^2\),
\[
  \|h\|_{L^2(w_i)} \le \sqrt{\frac{\max_{[s_{\min}, s_{\max}]} w_i}{\min_{[s_{\min}, s_{\max}]} w_i}}\,\|h\|_{L^2(\tilde w_i)}.
\]
The correction factor depends only on patch endpoints.

Composition and global bound
----------------------------
Combining the \(1/3\) bound with the weight equivalence yields, per patch,
\[
  L_A^{\text{closed}}(P) = \frac{1}{3} \max\!\left\{1,\; \sqrt{\frac{\max w_2}{\min w_2}}\right\}.
\]
Overlapping patches ensure coverage; the worst patch gives
\[
  L_{\text{global}}^{\text{analytic, closed}} = \max_{P} L_A^{\text{closed}}(P) < 1.
\]
The proof artifacts (`L_analytic_proof.json`) record per-patch length, weight ratios, and the critical patch. These feed `SpectralAssumptionsAlpha`/`ERURH_GlobalAssumptions` as external analytic inputs (assumed, not proved, in Lean).
