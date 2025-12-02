import Mathlib
import ERURH.BoundsConfig
import ERURH.FluxWindows
import ERURH.ZetaBounds
import ERURH.XiZetaIfaceOn
import ERURH.AlphaWindowCover
import ERURH_Staging.ZetaClose_base
import ERURH_Staging.ZetaClose_tail
import ERURH_Staging.ZetaClose_wAlpha49_shift0_all
import ERURH_Staging.ZetaClose_wAlpha49_shift1_all

namespace ERURH

open FluxWindows AlphaWindowCover
open scoped Real

noncomputable def zeta_log_env_on (t : ℝ) : ℝ :=
  if h0 : t ∈ wAlpha49_shift0.IccR then
    ((zeta_log_q wAlpha49_shift0 : ℚ) : ℝ)
  else if h1 : t ∈ wAlpha49_shift1.IccR then
    ((zeta_log_q wAlpha49_shift1 : ℚ) : ℝ)
  else
    ((zeta_log_tail : ℚ) : ℝ)

noncomputable def zeta_j_env_on (t : ℝ) : ℝ :=
  if h0 : t ∈ wAlpha49_shift0.IccR then
    ((zeta_j_q wAlpha49_shift0 : ℚ) : ℝ)
  else if h1 : t ∈ wAlpha49_shift1.IccR then
    ((zeta_j_q wAlpha49_shift1 : ℚ) : ℝ)
  else
    ((zeta_j_tail : ℚ) : ℝ)

lemma zeta_log_spec_on
    {t : ℝ} (hs0 : alphaBridge.s0R ≤ t)
    (hcap : t ≤ BoundsConfig.boundsTcapR) :
    Staging.zeta_log_fun t ≤ zeta_log_env_on t := by
  classical
  have hs0_cast :
      s0BridgeR ≤ t := by
    simpa [ERUBridge.s0R, alphaBridge_s0, s0BridgeR] using hs0
  by_cases h0 : t ∈ wAlpha49_shift0.IccR
  · have h :=
      Staging.zeta_log_le_window_wAlpha49_shift0 (t := t) h0
    simpa [zeta_log_env_on, h0] using h
  · by_cases h1 : t ∈ wAlpha49_shift1.IccR
    · have h :=
        Staging.zeta_log_le_window_wAlpha49_shift1 (t := t) h1
      simpa [zeta_log_env_on, h0, h1] using h
    · have htail :
        tailStartR ≤ t :=
      tailStart_le_of_not_windows hs0_cast h0 h1
      have ht_lo :
          ((tailStart : ℚ) : ℝ) ≤ t := by
        simpa [tailStartR] using htail
      have ht_hi :
          t ≤ ((BoundsConfig.boundsTcapQ : ℚ) : ℝ) := by
        simpa [BoundsConfig.boundsTcapR] using hcap
      have h_tail :=
        Staging.tail_log_le_cap (t := t) ht_lo ht_hi
      have h_cast :
          Staging.ZetaClose_wAlpha49_shift0_all.tail_cap_logR =
            ((zeta_log_tail : ℚ) : ℝ) := rfl
      have h_val :
          Staging.tail_zeta_log_fun t ≤ ((zeta_log_tail : ℚ) : ℝ) := by
        simpa [h_cast] using h_tail
      simpa [zeta_log_env_on, h0, h1, Staging.tail_zeta_log_fun] using h_val

lemma zeta_j_spec_on
    {t : ℝ} (hs0 : alphaBridge.s0R ≤ t)
    (hcap : t ≤ BoundsConfig.boundsTcapR) :
    Staging.zeta_j_fun t ≤ zeta_j_env_on t := by
  classical
  have hs0_cast :
      s0BridgeR ≤ t := by
    simpa [ERUBridge.s0R, alphaBridge_s0, s0BridgeR] using hs0
  by_cases h0 : t ∈ wAlpha49_shift0.IccR
  · have h :=
      Staging.zeta_j_le_window_wAlpha49_shift0 (t := t) h0
    simpa [zeta_j_env_on, h0] using h
  · by_cases h1 : t ∈ wAlpha49_shift1.IccR
    · have h :=
        Staging.zeta_j_le_window_wAlpha49_shift1 (t := t) h1
      simpa [zeta_j_env_on, h0, h1] using h
    · have htail :
        tailStartR ≤ t :=
      tailStart_le_of_not_windows hs0_cast h0 h1
      have ht_lo :
          ((tailStart : ℚ) : ℝ) ≤ t := by
        simpa [tailStartR] using htail
      have ht_hi :
          t ≤ ((BoundsConfig.boundsTcapQ : ℚ) : ℝ) := by
        simpa [BoundsConfig.boundsTcapR] using hcap
      have h_tail :=
        Staging.tail_j_le_cap (t := t) ht_lo ht_hi
      have h_cast :
          Staging.ZetaClose_wAlpha49_shift0_all.tail_cap_jR =
            ((zeta_j_tail : ℚ) : ℝ) := rfl
      have h_val :
          Staging.tail_zeta_j_fun t ≤ ((zeta_j_tail : ℚ) : ℝ) := by
        simpa [h_cast] using h_tail
      simpa [zeta_j_env_on, h0, h1, Staging.tail_zeta_j_fun] using h_val

noncomputable def alphaZetaWitnessOn : ZetaWitnessOn alphaBridge :=
{ logBound := zeta_log_env_on
  , jBound := zeta_j_env_on
  , log_spec_on := by
      intro t hs0 hcap
      exact zeta_log_spec_on hs0 hcap
  , j_spec_on := by
      intro t hs0 hcap
      exact zeta_j_spec_on hs0 hcap }

end ERURH
