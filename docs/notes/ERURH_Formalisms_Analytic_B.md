# ERURH Formalisms Analytic — Lemma B

Overview
--------
This note records the closed-form analytic proof of Lemma B (ERU energy inequality), including boundary terms and canonical weights.

Central difference and base formula
-----------------------------------
For the discrete central difference
\[
  D_h f(s) = \frac{f(s+h) - f(s-h)}{2h},
\]
on the canonical grid with step \(h_{\min}\), Cauchy–Schwarz gives
\[
  \|D_h f\|_{L^2(w)}^2 \le \frac{\max w}{\min w} \frac{1}{h_{\min}^2} \|f\|_{L^2(w)}^2,
\]
fixing book constants per weight.

Weights and boundary control
----------------------------
Weights used: \(w_1(s)=1\) and \(w_2(s)=e^{s/2}/s^2\). Boundary terms from discrete integration by parts are evaluated at the endpoints \([s_{\min}, s_{\max}]\) and absorbed into the global constant for \(s \ge s_0\).

Closed constants
----------------
Per weight:
\[
  \kappa_{\text{book}}(1) = \frac{1}{h_{\min}^2}, \qquad
  \kappa_{\text{book}}(w_2) = \frac{1}{h_{\min}^2} \frac{\max w_2}{\min w_2}.
\]
Final constant:
\[
  \kappa_{\text{book}}^{\text{closed}} = \max\!\{\kappa_{\text{book}}(1),\; \kappa_{\text{book}}(w_2)\}.
\]

Verification artifact
---------------------
`formalisms/analytic_B_proof.py` produces `kappa_book_proof.json` with \(h_{\min}\), window endpoints, weight ratios, and boundary terms. This artifact supplies the strict upper bound used in the formal runner and strict gate; its values are consumed as data (`kappaBookClosedRat`) in the Lean development via `SpectralAssumptionsAlpha` / `ERURH_GlobalAssumptions`.
