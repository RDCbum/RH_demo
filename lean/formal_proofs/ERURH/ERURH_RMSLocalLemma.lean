import ERURH.ERURH_A2Hypotheses
import ERURH.ERURH_PlanB_Assumptions

/-
# RMS-local lemma (Plan B)

Refactored to use the abstract `RMSLocalContext` from `ERURH_A2Hypotheses`.
Given the analytic bundle `PlanB_AnalyticAssumptions ctx`, we obtain
`RMSLocalHypothesis ctx` by delegating to the proven bridge
`RMSLocalHypothesis_of_A2`.
-/

namespace ERURH

open Alpha

lemma RMS_local_lemma
  (ctx : RMSLocalContext)
  (H : PlanB_AnalyticAssumptions ctx) :
  RMSLocalHypothesis ctx :=
by
  have h_mode : A1_mode ctx    := H.A1_mode_growth
  have h_low  : A2Low_RMS ctx  := H.A2_low_RMS
  have h_tail : A2Tail_RMS ctx := H.A2_tail_RMS
  exact RMSLocalHypothesis_of_A2 ctx h_mode h_low h_tail

/-- Beta/smoothed variant: same abstract context and bundle. -/
lemma RMS_local_lemma_beta
  (ctx : RMSLocalContext)
  (H : PlanB_AnalyticAssumptions ctx) :
  RMSLocalHypothesis ctx :=
RMS_local_lemma ctx H

end ERURH
