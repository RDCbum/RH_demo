import Mathlib
import ERURH.BoundsConfig
import ERURH.LambdaBounds
import ERURH.AlphaWindowCover
import ERURH_Staging.LambdaClose_base
import ERURH_Staging.LambdaClose_tail
import ERURH_Staging.LambdaClose_wAlpha49_shift0_all
import ERURH_Staging.LambdaClose_wAlpha49_shift1_all

namespace ERURH

open AlphaWindowCover
open scoped Real

noncomputable def lam_log_env_on (t : ℝ) : ℝ :=
  if h0 : t ∈ wAlpha49_shift0.IccR then
    ((lam_log_q wAlpha49_shift0 : ℚ) : ℝ)
  else if h1 : t ∈ wAlpha49_shift1.IccR then
    ((lam_log_q wAlpha49_shift1 : ℚ) : ℝ)
  else
    ((lam_log_tail : ℚ) : ℝ)

noncomputable def lam_j_env_on (t : ℝ) : ℝ :=
  if h0 : t ∈ wAlpha49_shift0.IccR then
    ((lam_j_q wAlpha49_shift0 : ℚ) : ℝ)
  else if h1 : t ∈ wAlpha49_shift1.IccR then
    ((lam_j_q wAlpha49_shift1 : ℚ) : ℝ)
  else
    ((lam_j_tail : ℚ) : ℝ)

lemma lam_log_spec_on
    {t : ℝ} (hs0 : alphaBridge.s0R ≤ t)
    (hcap : t ≤ BoundsConfig.boundsTcapR) :
    Staging.lam_log_fun t ≤ lam_log_env_on t := by
  classical
  have hs0_cast :
      s0BridgeR ≤ t := by
    simpa [ERUBridge.s0R, alphaBridge_s0, s0BridgeR] using hs0
  by_cases h0 : t ∈ wAlpha49_shift0.IccR
  · have h :=
      Staging.lam_log_le_window_wAlpha49_shift0 (t := t) h0
    simpa [lam_log_env_on, h0] using h
  · by_cases h1 : t ∈ wAlpha49_shift1.IccR
    · have h :=
        Staging.lam_log_le_window_wAlpha49_shift1 (t := t) h1
      simpa [lam_log_env_on, h0, h1]
        using h
    · have htail :
        tailStartR ≤ t :=
      tailStart_le_of_not_windows hs0_cast h0 h1
      have ht_lo :
          ((tailStart : ℚ) : ℝ) ≤ t := by
        simpa [tailStartR] using htail
      have ht_hi :
          t ≤ ((BoundsConfig.boundsTcap : ℚ) : ℝ) := by
        simpa [BoundsConfig.boundsTcapR] using hcap
      have h_tail :=
        Staging.tail_log_le_cap (t := t) ht_lo ht_hi
      have h_simp :
          Staging.LambdaClose_wAlpha49_shift0_all.tail_cap_logR
            = ((lam_log_tail : ℚ) : ℝ) := rfl
      have h_cast :
          ((lam_log_tail : ℚ) : ℝ)
              = Staging.LambdaClose_wAlpha49_shift0_all.tail_cap_logR :=
        h_simp.symm
      have h_val :
          Staging.tail_f_l t ≤ ((lam_log_tail : ℚ) : ℝ) := by
        simpa [h_cast]
          using h_tail
      simpa [lam_log_env_on, h0, h1, Staging.tail_f_l,
        Staging.lam_log_fun]
        using h_val

lemma lam_j_spec_on
    {t : ℝ} (hs0 : alphaBridge.s0R ≤ t)
    (hcap : t ≤ BoundsConfig.boundsTcapR) :
    Staging.lam_j_fun t ≤ lam_j_env_on t := by
  classical
  have hs0_cast :
      s0BridgeR ≤ t := by
    simpa [ERUBridge.s0R, alphaBridge_s0, s0BridgeR] using hs0
  by_cases h0 : t ∈ wAlpha49_shift0.IccR
  · have h :=
      Staging.lam_j_le_window_wAlpha49_shift0 (t := t) h0
    simpa [lam_j_env_on, h0, Staging.lam_j_fun, Staging.wAlpha49_shift0_f_d]
      using h
  · by_cases h1 : t ∈ wAlpha49_shift1.IccR
    · have h :=
        Staging.lam_j_le_window_wAlpha49_shift1 (t := t) h1
      simpa [lam_j_env_on, h0, h1, Staging.lam_j_fun,
        Staging.wAlpha49_shift1_f_d]
        using h
    · have htail :
        tailStartR ≤ t :=
      tailStart_le_of_not_windows hs0_cast h0 h1
      have ht_lo :
          ((tailStart : ℚ) : ℝ) ≤ t := by
        simpa [tailStartR] using htail
      have ht_hi :
          t ≤ ((BoundsConfig.boundsTcap : ℚ) : ℝ) := by
        simpa [BoundsConfig.boundsTcapR] using hcap
      have h_tail :=
        Staging.tail_j_le_cap (t := t) ht_lo ht_hi
      have h_cast :
          ((lam_j_tail : ℚ) : ℝ)
              = Staging.LambdaClose_wAlpha49_shift0_all.tail_cap_jR := rfl
      have h_val :
          Staging.tail_f_d t ≤ ((lam_j_tail : ℚ) : ℝ) := by
        simpa [h_cast]
          using h_tail
      simpa [lam_j_env_on, h0, h1, Staging.tail_f_d,
        Staging.lam_j_fun]
        using h_val

/-- On-band Lambda witness specialised to a bridge. -/
structure LambdaWitnessOn (B : ERUBridge) where
  logBound : ℝ → ℝ
  jBound : ℝ → ℝ
  log_spec_on :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      Staging.lam_log_fun t ≤ logBound t
  j_spec_on :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      Staging.lam_j_fun t ≤ jBound t

noncomputable def alphaLambdaWitnessOn : LambdaWitnessOn alphaBridge :=
{ logBound := lam_log_env_on
  , jBound := lam_j_env_on
  , log_spec_on := by
      intro t hs0 hcap
      exact lam_log_spec_on hs0 hcap
  , j_spec_on := by
      intro t hs0 hcap
      exact lam_j_spec_on hs0 hcap }

end ERURH
