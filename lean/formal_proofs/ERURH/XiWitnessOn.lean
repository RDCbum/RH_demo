import Mathlib
import ERURH.XiCore
import ERURH.BoundsConfig
import ERURH.XiPrefactor
import ERURH.XiZetaIfaceOn
import ERURH_Staging.LambdaClose_base
import ERURH_Staging.ZetaClose_base

namespace ERURH

open scoped Real
open Complex

/-- Helper log-profile for `xi` defined as prefactor + zeta pads. -/
noncomputable def xi_log_fun (t : Real) : Real :=
  Staging.prefactor_log_fun t + Staging.zeta_log_fun t

/-- Helper derivative profile for `xi` defined as prefactor + zeta pads. -/
noncomputable def xi_j_fun (t : Real) : Real :=
  Staging.prefactor_j_fun t + Staging.zeta_j_fun t

/-- On-band witness for `xiClassic` on `[B.s0R, boundsTcapR]`. -/
structure XiWitnessOn (B : ERUBridge) where
  logBound : Real → Real
  argBound : Real → Real
  xi_log_spec_on :
    ∀ {t : Real}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_log_fun t ≤ logBound t
  xi_arg_spec_on :
    ∀ {t : Real}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_j_fun t ≤ argBound t

/-- Laws describing how prefactor and zeta bounds combine on the target band. -/
structure XiLawsOn
    {B : ERUBridge} (W : WindowCoverCertificate B)
    (P : PrefactorWitnessOn B W) (Z : ZetaWitnessOn B) : Prop where
  log_total_on :
    ∀ {t : Real}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_log_fun t ≤ P.logBound t + Z.logBound t
  arg_total_on :
    ∀ {t : Real}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_j_fun t ≤ P.argBound t + Z.jBound t

/-- Assemble an on-band witness for `xiClassic` from prefactor + zeta laws. -/
noncomputable def XiWitnessOn.ofLaws
    {B : ERUBridge} (W : WindowCoverCertificate B)
    (P : PrefactorWitnessOn B W)
    (L : LambdaWitness B W)
    (Z : ZetaWitnessOn B)
    (H : XiLawsOn W P Z) :
    XiWitnessOn B :=
{ logBound := fun t => P.logBound t + Z.logBound t
  argBound := fun t => P.argBound t + Z.jBound t
  xi_log_spec_on := by
    intro t hs0 hcap
    exact H.log_total_on hs0 hcap
  xi_arg_spec_on := by
    intro t hs0 hcap
    exact H.arg_total_on hs0 hcap }

end ERURH
