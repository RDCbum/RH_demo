import Mathlib
import ERURH.ERUModesCore
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.GeneratedRMSModeBridge
import ERURH.Alpha.RMSModeSemantic
import ERURH.Alpha.ModeToRMSMode_PointwiseToRMS
import ERURH.Alpha.ModeToRMSMode_Window
import ERURH.ERURH_A2Hypotheses

namespace ERURH
namespace Alpha

/-- Explicit bridge: a supercritical mode gives pointwise growth on the fixed
ctx_real window interval. -/
def SupercriticalModeAppliesOnCtxRealWindow : Prop :=
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
    ∀ s ∈ GeneratedRMSContext.ctx_real_window_interval ctx_real_window,
      |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)

private lemma ctx_real_window_min_pos : 0 < _root_.windowMin ctx_real_window := by
  -- numeric window start is positive by construction
  simp [ctx_real_window, _root_.windowMin, _root_.windowMinRat, _root_.windowMinList, n_windows]

private lemma ctx_real_threshold_lt_one :
    GeneratedRMSContext.ctx_real.c_low +
      GeneratedRMSContext.ctx_real.c_tail +
      C_envelope_formal < 1 := by
  -- all constants are small rationals in the gate data
  norm_num [GeneratedRMSContext.ctx_real, ctx_real,
    cLow, cLowRat, cTail, cTailRat,
    C_envelope_formal, cEnvelopeFormalRat, cEnvelopeFormal, ERURH.QBound.toRat]

/-- Bridge: combine the window-compatibility hypothesis with the RMS semantic
lower bound and the gate-certified table bound to produce B.1. -/
theorem pointwise_to_RMS_mode_of_ctx_real_logR_alpha_upper_and_window_bridge
  (h_upper : _root_.ctx_real_logR_alpha_upper ctx_real_window)
  (h_bridge : SupercriticalModeAppliesOnCtxRealWindow) :
  PointwiseToRMSMode GeneratedRMSContext.ctx_real ctx_real_window := by
  intro β hβ hmode
  let K : ℝ := Real.exp ((β - (1/2 : ℝ)) * _root_.windowMin ctx_real_window)
  have hpoint :
      ∀ s ∈ GeneratedRMSContext.ctx_real_window_interval ctx_real_window,
        |logR_alpha s| ≥ K := by
    intro s hs
    have h_bridge_point : |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s) :=
      h_bridge β hβ hmode s hs
    have hcoef : 0 ≤ (β - (1/2 : ℝ)) := by linarith [hβ]
    have hs_min : _root_.windowMin ctx_real_window ≤ s := hs.1
    have h_mul :
        (β - (1/2 : ℝ)) * _root_.windowMin ctx_real_window ≤
          (β - (1/2 : ℝ)) * s :=
      mul_le_mul_of_nonneg_left hs_min hcoef
    have h_exp :
        Real.exp ((β - (1/2 : ℝ)) * _root_.windowMin ctx_real_window) ≤
          Real.exp ((β - (1/2 : ℝ)) * s) :=
      Real.exp_le_exp.mpr h_mul
    have h_bridge_point' :
        Real.exp ((β - (1/2 : ℝ)) * s) ≤ |logR_alpha s| :=
      h_bridge_point
    exact le_trans h_exp h_bridge_point'
  have h_semantic : rms_semantic ctx_real_window ≥ K :=
    pointwise_to_rms_semantic ctx_real_window K hpoint
  have h_semantic' : K ≤ rms_semantic ctx_real_window := by
    simpa using h_semantic
  have h_rms_mode :
      rms_semantic ctx_real_window ≤
        GeneratedRMSContext.ctx_real.RMS_mode ctx_real_window := by
    have h := _root_.ctx_real_rms_mode_ge_semantic ctx_real_window h_upper
    simpa using h
  have h_rms_mode_K :
      GeneratedRMSContext.ctx_real.RMS_mode ctx_real_window ≥ K :=
    le_trans h_semantic' h_rms_mode
  have h_exp_gt_one :
      1 < Real.exp ((β - (1/2 : ℝ)) * _root_.windowMin ctx_real_window) := by
    have hcoef : 0 < (β - (1/2 : ℝ)) := by linarith [hβ]
    have hpos :
        0 < (β - (1/2 : ℝ)) * _root_.windowMin ctx_real_window :=
      mul_pos hcoef ctx_real_window_min_pos
    exact (Real.one_lt_exp_iff).2 hpos
  have hKbig :
      K >
        GeneratedRMSContext.ctx_real.c_low +
          GeneratedRMSContext.ctx_real.c_tail +
          C_envelope_formal := by
    have h_threshold_lt_one := ctx_real_threshold_lt_one
    linarith [h_exp_gt_one, h_threshold_lt_one]
  exact ⟨K, hKbig, h_rms_mode_K⟩

end Alpha
end ERURH
