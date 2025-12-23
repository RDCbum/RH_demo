import ERURH.ERURH_A2Hypotheses
import ERURH.ERURH_ExplicitCoefficientsSketch
import ERURH.ERURH_ClassicalZetaAssumptions

/-
# Plan B analytic assumptions bundle

This module groups the analytic-side hypotheses for the conditional Plan B
route to RH: explicit formula for the ERU observable, decay of explicit
coefficients (`H_b`), A1-mode growth, and RMS controls (A2 low/tail). In
practice, `explicit_formula_ERU` and `coeff_decay_Hb` are expected to follow
from external analytic-number-theory hypotheses (H_ζ,standard / H_ERU,explicit)
as described in `docs/ERURH_PlanB_Assumptions.md`.
-/

namespace ERURH
namespace Alpha

/-- Analytic assumptions bundle for Plan B (conditional RH route): this collects
the analytic-side hypotheses: spectral decay (`H_b` packaged in
`SpectralAssumptionsAlpha`), explicit formula for the ERU observable, A1-mode
growth, and A2 low/tail RMS controls, all relative to a chosen RMS context
`ctx`. -/
structure PlanB_AnalyticAssumptions (ctx : RMSLocalContext) : Prop :=
  (spectral           : SpectralAssumptionsAlpha)
  (ls_gamma           : LSGammaAssumptions)
  (classical          : ClassicalZetaAssumptions)
  (explicit_formula_ERU : ExplicitFormulaERU)
  (A1_mode_growth      : A1_mode ctx)
  (A2_low_RMS          : A2Low_RMS ctx)
  (A2_tail_RMS         : A2Tail_RMS ctx)

/-- Extract the `H_b` hypothesis from the spectral assumptions. -/
lemma PlanB_AnalyticAssumptions.coeff_decay_Hb
  {ctx : RMSLocalContext}
  (H : PlanB_AnalyticAssumptions ctx) :
  H_b :=
by
  exact SpectralAssumptionsAlpha.to_H_b H.spectral

/-- Extract the refined LS_γ hypothesis from the analytic bundle. -/
lemma PlanB_AnalyticAssumptions.ls_gamma_fine
  {ctx : RMSLocalContext}
  (H : PlanB_AnalyticAssumptions ctx) :
  H.ls_gamma.LS_gamma_fine :=
by
  exact H.ls_gamma.LS_gamma_fine

/-- Extract the classical explicit-formula/RH assumptions from the bundle. -/
lemma PlanB_AnalyticAssumptions.classical_assumptions
  {ctx : RMSLocalContext}
  (H : PlanB_AnalyticAssumptions ctx) :
  ClassicalZetaAssumptions :=
by
  exact H.classical

/-- Convenience constructor: given spectral assumptions (`H_b`), the explicit
formula, and the low/mode RMS controls, the A2-tail bound follows from the
simple LS_γ route packaged in `A2Tail_RMS_from_Hb_LS_simple`. -/
lemma PlanB_AnalyticAssumptions.of_simple_LS
  (ctx : RMSLocalContext)
  (spec : SpectralAssumptionsAlpha)
  (ls : LSGammaAssumptions)
  (classical : ClassicalZetaAssumptions)
  (hExp : ExplicitFormulaERU)
  (hA1  : A1_mode ctx)
  (hLow : A2Low_RMS ctx) :
  PlanB_AnalyticAssumptions ctx :=
by
  refine
    { spectral := spec
      ls_gamma := ls
      classical := classical
      explicit_formula_ERU := hExp
      A1_mode_growth := hA1
      A2_low_RMS := hLow
      A2_tail_RMS := ?_ }
  exact A2Tail_RMS_from_Hb_LS_simple ctx spec.hb

/-- Convenience constructor from a bare proof of `H_b`. -/
lemma PlanB_AnalyticAssumptions.of_simple_LS_Hb
  (ctx : RMSLocalContext)
  (hExp : ExplicitFormulaERU)
  (hHb  : H_b)
  (hLS  : LSGammaAssumptions)
  (hClassical : ClassicalZetaAssumptions)
  (hA1  : A1_mode ctx)
  (hLow : A2Low_RMS ctx) :
  PlanB_AnalyticAssumptions ctx :=
PlanB_AnalyticAssumptions.of_simple_LS ctx
  (SpectralAssumptionsAlpha.of_Hb hHb)
  hLS
  hClassical
  hExp hA1 hLow

end Alpha
end ERURH
