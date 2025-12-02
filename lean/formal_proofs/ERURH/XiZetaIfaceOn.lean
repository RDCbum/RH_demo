import ERURH.BoundsConfig
import ERURH_Staging.ZetaClose_base

namespace ERURH

/-- On-band witness capturing `log |ζ|` and `|(ζ'/ζ)|` between `s0` and `boundsTcap`. -/
structure ZetaWitnessOn (B : ERUBridge) where
  logBound : ℝ → ℝ
  jBound : ℝ → ℝ
  log_spec_on :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      Staging.zeta_log_fun t ≤ logBound t
  j_spec_on :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      Staging.zeta_j_fun t ≤ jBound t

end ERURH
