ERURH Plan B Gaps Map (Lean status)
===================================

Explicit formula layer (`ERURH_ExplicitFormulaAlpha.lean`)
----------------------------------------------------------
- Defined: abstract types/constants `ZeroOfZeta`, `beta`, `gamma`, `is_tail_zero`, `b_rho`; Prop `H_b`; package `SpectralAssumptionsAlpha` carrying `H_b` (assumed fields `hb_tail`, etc.).
- Axioms only: `H_b` remains an external hypothesis (assumed via `SpectralAssumptionsAlpha`); classical ζ-package recorded in `ClassicalZetaAssumptions`.
- Sorrys: none here; the bridge `H_b_from_explicit_formula` lives in `ERURH_ExplicitCoefficientsSketch.lean`.
- Role: supplies coefficient decay hypotheses to A2-tail.

Large-sieve layer (`ERURH_LargeSieveGammaSketch.lean`)
------------------------------------------------------
- Proven: simple bounds `LS_gamma_simple_pointwise`, `LS_gamma_simple_pointwise_sq`, `LS_gamma_simple_RMS`.
- Axioms only: `LSGammaAssumptions` carries the refined LSγ hypothesis (`ls_gamma_weak` assumed, defaulted by `LSGammaWeak_of_simple`).
- Role: LSγ feeds A2-tail; refined LSγ is assumed, not proved.

Mode growth layer (`ERURH_ModeGrowthAlpha.lean`)
------------------------------------------------
- Proven: mode contribution squared, pointwise lower bound on `[S, S+L]`, RMS-squared lower bound.
- Sorrys: none; provides the A1-mode growth bound for `RMSLocalHypothesis`.

RMS-local layer (`ERURH_RMSLocalLemma.lean`)
--------------------------------------------
- Defined: delegates to `RMSLocalContext` and `PlanB_AnalyticAssumptions`; `RMS_local_lemma` (and beta variant) produce `RMSLocalHypothesis` via `RMSLocalHypothesis_of_A2`.
- Sorrys: none; the bridge is formal once A2 is available.

A2/Tail/RMS bridge (`ERURH_A2Hypotheses.lean`)
----------------------------------------------
- Defined: `RMSLocalContext`, `A2Low_RMS`, `A2Tail_RMS`, `A1_mode`, `RMSLocalHypothesis`, and `RMSLocalHypothesis_of_A2` (A1-mode + A2-low/tail ⇒ RMSLocalHypothesis).
- `A2Tail_RMS_from_Hb_LS_simple` currently uses the context’s `RMS_tail_bound_simple`; it is a placeholder rather than a derived tail bound from `H_b` + LSγ.

RMS→gates bridge (`ERURH_GatesFromRMS.lean`)
--------------------------------------------
- Defined: structural setup; `gate_opens_from_RMS_alpha/beta` give gate opening from RMS violation.
- Sorrys: none; depends on the RMS clause inside gate definitions.

Coefficient decay bridge (`ERURH_ExplicitCoefficientsSketch.lean`)
------------------------------------------------------------------
- Gap: `H_b_from_explicit_formula` (explicit formula ⇒ `H_b`).
- Role: derives coefficient decay from explicit-formula hypotheses; currently assumed via `SpectralAssumptionsAlpha`.

Master bundle (`ERURH_MasterTheoremPlanB.lean` and `ERURH_MasterTheoremSummary.lean`)
-------------------------------------------------------------------------------------
- Proven: conditional wrappers `RH_from_planB_RMS`, `RH_from_planB_A2`, `RH_from_planB_bundle`; summary `RH_from_ERURH_conditional` packages external bundles (`ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha`, `LSGammaAssumptions`, `BetaInertiaAssumptions`) plus window assumptions and certificates into RH.
- Axioms only: `PlanB_AnalyticAssumptions` is a Prop bundling assumed fields; `NumericCoverageAlpha` is a placeholder coverage assumption.

Logical chain to `RH xiAlpha`
-----------------------------
1. Explicit formula + coefficient decay (`H_b`) + LSγ^weak (assumed) ⇒ A2Tail_RMS (gap: `H_b_from_explicit_formula`; tail lemma currently a placeholder).
2. A2Low_RMS + A2Tail_RMS + A1-mode growth ⇒ `RMSLocalHypothesis` (proved abstractly).
3. `RMSLocalHypothesis` + RMS→gate bridge ⇒ gates contradiction if β > 1/2 (proved).
4. Gates closed from certificates + assumed coverage ⇒ no modes β > 1/2 (proved conditional chain).
5. No modes + ERURH equivalence ⇒ `RiemannHypothesis xiAlpha` (proved conditional chain, classical packages assumed).
