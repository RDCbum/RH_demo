ERURH Conditional Theorem toward RH (summary)
=============================================

Introduction and context
------------------------
ERURH-alpha models the observable \(\log R(s) = E(e^s)/e^s\) and its derivative \(j_{\mathrm{rel}}(s) = \frac{d}{ds}\log R(s)\), and defines an ERU energy on windows \([S, S+L]\) to control decay and regularity. The Lean core encapsulates flux, energy, inertia, and RMS certificates that enforce rational bounds on windows and tails. Plan B adds RMS decomposition hypotheses: A1 controls a mode with \(\beta>1/2\); A2 controls low/tail parts. Renormalization/energy gates close when certificates and A1/A2 hold, eliminating supercritical modes; the ERURH ↔ RH equivalence then yields RH for \(\xi_\alpha\). This is formalized in Lean as a chain of lemmas conditional on classical analytic packages (ζ-theory, spectral decay, LSγ) and certified numeric inputs.

External assumption packages
----------------------------
- **Classical ζ-theory** (`ClassicalZetaAssumptions`): explicit formula for \(\psi\), zero-counting, RH↔E equivalences, bounds for \(\xi\), argument control; packaged as axioms in Lean.
- **Spectral assumptions** (`SpectralAssumptionsAlpha`, `H_b`): decay/control of coefficients \(b_\rho\); the dyadic L² tail `hb_tail : H_b_L2_tail` is assumed as a field.
- **LSγ assumptions** (`LSGammaAssumptions`): LSγ^weak bound on spectral sums; assumed via `ls_gamma_weak` (defaulted by `LSGammaWeak_of_simple`).
- **Beta numeric assumptions** (`BetaInertiaAssumptions`): correctness of beta certificates and certificate-based kernel blow-up for β>1/2 modes.
These packages form `ERURH_Assumptions` and, together with A1/A2 window hypotheses, `ERURH_GlobalAssumptions`.

Window hypotheses (A1/A2) and RMS context
-----------------------------------------
`RMSLocalContext` fixes windows \([S, S+L]\) with \(1 \ll L \ll S^\alpha\) and the RMS pieces (mode/low/tail). **A1-mode** asserts a mode with β > 1/2 yields RMS growth. **A2-low** and **A2-tail** bound the low/tail parts. In Lean these reside in `WindowScalingAssumptions` (fields `ctx`, `hA1`, `hLow`, `hTail`) inside `ERURH_GlobalAssumptions`.

Conditional theorem (mathematical statement)
--------------------------------------------
Assume:
1. `ClassicalZetaAssumptions` on ζ and the explicit formula (explicit formula, zero density/counting, RH↔E equivalences, bounds for \(\xi\), etc.).
2. `SpectralAssumptionsAlpha` guaranteeing \(H_b\) (including `hb_tail : H_b_L2_tail`).
3. `LSGammaAssumptions` providing LSγ^weak (`ls_gamma_weak`).
4. `BetaInertiaAssumptions` validating beta certificates and kernel energy blow-up for β>1/2 modes.
5. `WindowScalingAssumptions` (A1/A2/H_range) in the RMS context.
Then `RiemannHypothesis xiAlpha` holds. In Lean:
```lean
theorem RH_from_ERURH_conditional (G : ERURH_GlobalAssumptions) :
  RiemannHypothesis xiAlpha
```
where `ERURH_GlobalAssumptions` bundles exactly the classical, spectral, LSγ, beta, and A1/A2 window hypotheses.

Logical chain (sketch)
----------------------
1. External packages + ERU certificates ⇒ `PlanB_AnalyticAssumptions ctx`.
2. `PlanB_AnalyticAssumptions ctx` + closed gates ⇒ `RMSLocalHypothesis ctx` (a β>1/2 mode would force an RMS window above the envelope).
3. `RMSLocalHypothesis ctx` + gate definitions ⇒ contradiction if a β>1/2 mode existed.
4. Thus no β>1/2 modes; hence `InertiaERU_alpha_strong`.
5. Using the ERURH↔RH equivalence (under `ClassicalZetaAssumptions`), conclude `RiemannHypothesis xiAlpha`.

Lean references
---------------
`RH_from_ERURH_conditional` lives in `formal_proofs/ERURH/ERURH_MasterTheoremSummary.lean`. Supporting files: `ERURH_PlanB_Assumptions.lean`, `ERURH_A2Hypotheses.lean`, `ERURH_ClassicalZetaAssumptions.lean`, `ERURH_ExplicitFormulaAlpha.lean`, `ERURH_LargeSieveGammaSketch.lean`, `ERURH_BetaInertiaAssumptions.lean`. Internal energy/RMS/gate/inertia components are proved in Lean; the unproved pieces are the classical analytic packages listed above.
