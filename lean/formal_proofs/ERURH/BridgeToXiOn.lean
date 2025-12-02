import ERURH.XiWitnessOn
import ERURH.ExpRect
import ERURH.BoundsConfig

namespace ERURH

/-- On-band bridge packaging a `XiWitnessOn` together with the explicit rectangle
    required by the ERU explicit-formula layer. -/
structure BridgeToXiOn (B : ERUBridge) where
  witness : XiWitnessOn B
  rect : ExpRect xiClassic
  log_spec :
    ∀ {t : Real}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_log_fun t ≤ rect.log_bound t
  arg_spec :
    ∀ {t : Real}, B.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_j_fun t ≤ rect.arg_bound t
  Tcap_eq : rect.Tcap = BoundsConfig.boundsTcapR

namespace BridgeToXiOn

/-- Build the on-band bridge directly from a `XiWitnessOn`. -/
noncomputable def ofWitness {B : ERUBridge}
    (W : XiWitnessOn B) : BridgeToXiOn B :=
{ witness := W
  , rect :=
      { log_bound := W.logBound
        , arg_bound := W.argBound
        , Tcap := BoundsConfig.boundsTcapR }
  , log_spec := by
      intro t hs0 hcap
      simpa using W.xi_log_spec_on hs0 hcap
  , arg_spec := by
      intro t hs0 hcap
      simpa using W.xi_arg_spec_on hs0 hcap
  , Tcap_eq := rfl }

end BridgeToXiOn

end ERURH
