ERURH Plan B Gaps Map (Lean status)
===================================

Explicit formula layer (ERURH_ExplicitFormulaAlpha.lean)
-------------------------------------------------------
- Proven/defined: abstract types and constants: `ZeroOfZeta`, `beta`, `gamma`, `is_tail_zero`, `b_rho`; Prop `H_b`; package `SpectralAssumptionsAlpha` carrying `H_b`.
- Axioms/Props only: `H_b` is an external hypothesis; no proof provided (packaged via `SpectralAssumptionsAlpha`); classical ζ-package recorded in `ClassicalZetaAssumptions`.
- Sorrys: none in this file; the bridge `H_b_from_explicit_formula` lives in ERURH_ExplicitCoefficientsSketch.lean.
- Role: supplies coefficient decay hypothesis to A2-tail and beyond.

Large-sieve layer (ERURH_LargeSieveGammaSketch.lean)
----------------------------------------------------
- Proven: simple bounds `LS_gamma_simple_pointwise`, `LS_gamma_simple_pointwise_sq`, `LS_gamma_simple_RMS`.
- Axioms/Props only: predicate `AdmissibleRange` (placeholder); package `LSGammaAssumptions` carrying the refined LS_γ hypothesis.
- Sorrys: none in-code; the refined LS_γ inequality is now an external hypothesis via `LSGammaAssumptions`.
- Role: LS_γ feeds A2-tail control; simple RMS bound already available; refined LS_γ supplied externally.

Mode growth layer (ERURH_ModeGrowthAlpha.lean)
----------------------------------------------
- Proven: mode contribution squared (`mode_contrib_sq`), pointwise lower bound on `[S, S+L]` (`mode_kernel_lower_bound`), RMS-squared lower bound (`mode_RMS_sq_lower_bound`).
- Axioms/Props only: none.
- Sorrys: none in this layer now.
- Idea of proof: express the integrand as `a^2 s^{-4} exp(2(β-1/2)s)`, use `L ≤ S` to bound `s^{-4} ≥ (2S)^{-4}`, monotonicity of the exponential on `[S, S+L]`, integrate the uniform lower bound over the interval, and divide by `L`.
- Role: provides the A1-mode growth bound needed for RMSLocalHypothesis.

RMS-local layer (ERURH_RMSLocalLemma.lean)
------------------------------------------
- Proven/defined: delegates to the abstract context (`RMSLocalContext`) and `PlanB_AnalyticAssumptions`; `RMS_local_lemma` (and beta variant) now produce `RMSLocalHypothesis ctx` via `RMSLocalHypothesis_of_A2`.
- Sorrys: none in this layer now.
- Role: bundles the analytic assumptions into `RMSLocalHypothesis` for a given context.

A2/Tail/RMS bridge (ERURH_A2Hypotheses.lean)
--------------------------------------------
- Proven/defined: abstract RMS context `RMSLocalContext`; `A2Low_RMS`, `A2Tail_RMS`, `A1_mode`, `RMSLocalHypothesis`, and the bridge `RMSLocalHypothesis_of_A2` (A1-mode + A2-low/tail ⇒ RMSLocalHypothesis).
- Proven: `A2Tail_RMS_from_Hb_LS_simple` (packages the simple LS_γ/H_b route to tail RMS via the context bound).
- Role: connects coefficient decay + LS_γ + A1-mode to RMSLocalHypothesis in an abstract RMS decomposition.

RMS→gates bridge (ERURH_GatesFromRMS.lean)
------------------------------------------
- Proven/defined: structural setup.
- Sorrys: none; `gate_opens_from_RMS_alpha/beta` now contradict the RMS clause inside gate closure.
- Role: RMSLocalHypothesis ⇒ gates contradiction.

Coefficient decay bridge (ERURH_ExplicitCoefficientsSketch.lean)
----------------------------------------------------------------
- Sorrys: `H_b_from_explicit_formula` (explicit formula ⇒ H_b).
- Role: derives coefficient decay from explicit formula hypotheses.

Master bundle (ERURH_MasterTheoremPlanB.lean)
---------------------------------------------
- Proven: conditional wrappers `RH_from_planB_RMS`, `RH_from_planB_A2`, `RH_from_planB_bundle` (consume PlanB_AnalyticAssumptions plus axioms/certificates/numeric coverage).
- Axioms/Props only: `PlanB_AnalyticAssumptions` lives in ERURH_PlanB_Assumptions.lean (no sorry).
- Role: assembles the analytic bundle into RH under the remaining gaps.
- Summary wrapper: `RH_from_ERURH_conditional` (ERURH_MasterTheoremSummary.lean) packages external bundles (`ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha`, `LSGammaAssumptions`, `BetaInertiaAssumptions`) plus window assumptions into RH.

Logical chain to RH_xiAlpha
---------------------------
1. Explicit formula + coefficient decay (H_b) + LS_γ (refined) ⇒ A2Tail_RMS (gap: `H_b_from_explicit_formula`; refined LS_γ supplied via `LSGammaAssumptions`; simple tail bound already packaged).
2. A2Low_RMS + A2Tail_RMS + A1-mode growth ⇒ RMSLocalHypothesis (proved abstractly).
3. RMSLocalHypothesis + RMS→gate bridge ⇒ gates contradiction if β > 1/2 (proved).
4. Gates closed from certificates + axioms ⇒ no modes β > 1/2 (proved conditional chain).
5. No modes + ERURH equivalence axioms ⇒ `RiemannHypothesis xiAlpha` (proved conditional chain).

