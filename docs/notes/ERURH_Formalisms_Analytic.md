ERURH Formalisms Analytic (Sketch)
==================================

Overview
--------
Summary of the analytic route for closed bounds in Lemmas A and B, and how these bounds feed the \(\Phi\psi\log R\) bridge and the RH corollary. All analytic inputs are treated as classical assumptions (via `ClassicalZetaAssumptions`/`ERURH_GlobalAssumptions`), not proved in Lean.

Lemma A (global contraction)
----------------------------
1. **Canonical kernel.** Buchstab-type operator on \(u \in [1,3]\): \((Th)(u) = \frac{1}{u} \int_{u/3}^{u/2} h(t)\,dt\); supremum bound \(\|Th\|_\infty \le \tfrac{1}{3}\|h\|_\infty\).
2. **Tiling.** Multi-α patches translate the kernel; the \(\tfrac{1}{3}\) constant persists on each patch \([s_{\min}, s_{\max}]\) with \(s \ge s_0\).
3. **Weighted norms.** On each patch, \(\|h\|_{L^2(w)} \le \sqrt{\max_P w / \min_P w}\,\|h\|_{L^2(\tilde w)}\) for \(w=1\) and \(w=e^{s/2}/s^2\); ratios are recorded per patch.
4. **Uniform bound.** Worst patch \(P^\star\) yields \(L_{\text{global}}^{\text{analytic}} = \frac{1}{3} \max\{1, \sqrt{\max w/\min w}\} < 1\); the runner uses this closed value from `L_analytic_proof.json`.

Lemma B (energy / boundaries)
-----------------------------
1. **Central difference.** \(D_h f(s) = \tfrac{f(s+h)-f(s-h)}{2h}\) obeys \(\|D_h f\|_{L^2(w)}^2 \le \frac{\max_P w}{\min_P w}\frac{1}{h^2}\|f\|_{L^2(w)}^2\).
2. **Closed constants.** With step \(h_{\min}\): \(\kappa_{\text{book}}(1)=1/h_{\min}^2\); for \(w=e^{s/2}/s^2\), \(\kappa_{\text{book}}(w)=\kappa_{\text{book}}(1)\cdot \max w/\min w\); final \(\kappa_{\text{book}}^{\text{closed}}=\max\{\kappa_{\text{book}}(1),\kappa_{\text{book}}(w)\}\).
3. **Boundaries.** Boundary terms for \(j_{\mathrm{rel}}\) on \([s_{\min},s_{\max}]\) are absorbed when \(s \ge s_0\); values come from `kappa_book_proof.json`.

Bridge \(\Phi\psi\log R\) and RH corollary
------------------------------------------
1. **Sources.** `constants_global.json` and bridge reports supply \(\varepsilon_\Phi\), \(\varepsilon_L\), \(\varepsilon_\kappa\), and the operational \(\Phi\) envelope; Lemmas A/B supply \(L_{\text{global}}^{\text{analytic}}\) and \(\kappa_{\text{book}}^{\text{closed}}\).
2. **Closed envelope.** \(C_{\text{envelope}}^{\text{closed}} = C_{\text{operativo}} (1+\varepsilon_\Phi)(1+\varepsilon_L)(1+\varepsilon_\kappa)\); \(s_0\) matches the canonical grid.
3. **RH corollary.** The envelope implies the classical Chebyshev error bound and, with the explicit-formula package, yields `RiemannHypothesis xiAlpha` once strong inertia is obtained.

Path to full formalisation
--------------------------
- Keep `L_analytic_proof.json` and `kappa_book_proof.json` as rational data; formalize the operators, weight ratios, and bounds in Lean.
- Formalize the bridge envelope and margins as theorems over these rationals.
- Integrate with `ERURH_GlobalAssumptions` so Lemmas A/B and bridge bounds are consumed as data, not axioms, in the Lean pipeline to RH.
