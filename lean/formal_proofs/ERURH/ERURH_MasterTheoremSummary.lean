import ERURH.ERURH_ClassicalZetaAssumptions
import ERURH.ERURH_ExplicitFormulaAlpha
import ERURH.ERURH_LargeSieveGammaSketch
import ERURH.ERURH_BetaInertiaAssumptions
import ERURH.ERURH_PlanB_Assumptions
import ERURH.ERURH_A2Hypotheses
import ERURH.ERURH_MasterTheoremPlanB

/-
# Master theorem summary: external packages → RH for `xiAlpha`

This file packages the external assumption bundles (classical ζ, spectral
decay, LS_γ, beta numeric certificates) together with the existing ERURH
certificates/gates to derive `RiemannHypothesis xiAlpha` via the Plan B master
theorem.
-/

namespace ERURH

/-- Combined external assumptions required for the ERURH → RH chain. -/
structure ERURH_Assumptions where
  classical  : ClassicalZetaAssumptions
  spectral   : Alpha.SpectralAssumptionsAlpha
  ls_gamma   : Alpha.LSGammaAssumptions
  explicit_formula_ERU : Alpha.ExplicitFormulaERU
  beta_inert : BetaInertiaAssumptions

/-- Bundle for the RMS/window scaling side (Plan B A1/A2 controls). -/
structure WindowScalingAssumptions where
  ctx  : RMSLocalContext
  hA1  : A1_mode ctx
  hLow : A2Low_RMS ctx
  hTail : A2Tail_RMS ctx

/-- Global assumptions combining external packages (classical/spectral/LS_γ/beta)
and the RMS/window scaling hypotheses. -/
structure ERURH_GlobalAssumptions where
  eru    : ERURH_Assumptions
  window : WindowScalingAssumptions

/-- Helper: instantiate the analytic Plan B bundle for a given RMS context,
using the external assumption packages and trivial A1/A2 placeholders (these
would be supplied by the analytic pipeline in practice). -/
def makePlanBAnalyticBundle
  (ctx : RMSLocalContext)
  (classical : ClassicalZetaAssumptions)
  (spectral  : Alpha.SpectralAssumptionsAlpha)
  (ls_gamma  : Alpha.LSGammaAssumptions)
  (explicit_formula_ERU : Alpha.ExplicitFormulaERU)
  (hA1 : A1_mode ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx) :
  Alpha.PlanB_AnalyticAssumptions ctx :=
by
  -- We package the external assumptions; the constructor expects spectral/ls_gamma/classical.
  refine
    { spectral := spectral
      ls_gamma := ls_gamma
      classical := classical
      explicit_formula_ERU := explicit_formula_ERU
      A1_mode_growth := hA1
      A2_low_RMS := hLow
      A2_tail_RMS := hTail }

/-- Global master theorem: from the external ERURH assumption bundles and the
existing certificate/gate infrastructure, we derive RH for `xiAlpha`. This is
conditional on supplying suitable A1/A2/RMS data and the external packages. -/
@[simp]
theorem RH_from_ERURH_assumptions
  (assm : ERURH_Assumptions)
  (ctx : RMSLocalContext)
  (hA1 : A1_mode ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx)
  (hAxioms : AxiomsShimAccepted)
  (hCerts : CertificatesCorrectAlpha)
  (hNumeric : NumericCoverageAlpha ctx) :
  RiemannHypothesis xiAlpha :=
by
  -- Build the analytic bundle from external assumptions and A1/A2 controls.
  have hAnalytic : Alpha.PlanB_AnalyticAssumptions ctx :=
    makePlanBAnalyticBundle ctx assm.classical assm.spectral assm.ls_gamma assm.explicit_formula_ERU hA1 hLow hTail
  -- Apply the Plan B master theorem.
  exact RH_from_planB_bundle ctx hAnalytic hAxioms hCerts hNumeric

/-- Condensed master theorem: external packages (classical/spectral/LS_γ/beta)
plus RMS window assumptions imply `RiemannHypothesis xiAlpha`. -/
theorem RH_from_ERURH_conditional
  (G : ERURH_GlobalAssumptions)
  (hAxioms : AxiomsShimAccepted)
  (hCerts : CertificatesCorrectAlpha)
  (hNumeric : NumericCoverageAlpha G.window.ctx) :
  RiemannHypothesis xiAlpha :=
by
  rcases G with ⟨eru, window⟩
  rcases window with ⟨ctx, hA1, hLow, hTail⟩
  exact RH_from_ERURH_assumptions eru ctx hA1 hLow hTail hAxioms hCerts hNumeric

end ERURH
