import ERURH.BoundsConfig
import ERURH.BridgeToXiOn
import ERURH.XiWitnessOn

namespace ERURH

/-- Explicit rectangle decorated with the unified `Tcap`. -/
structure ExplicitRect where
  expRect : ExpRect xiClassic
  tcap_eq : expRect.Tcap = BoundsConfig.boundsTcapR

/-- Explicit on-band hypotheses (place-holder for the analytic inequalities
    obtained from the explicit formula).  The statements are phrased on the same
    strip `[alphaBridge.s0R, boundsTcapR]`. -/
structure ExplicitOn (R : ExplicitRect) : Prop :=
  (log_bound :
    ∀ {t : ℝ}, alphaBridge.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_log_fun t ≤ R.expRect.log_bound t)
  (arg_bound :
    ∀ {t : ℝ}, alphaBridge.s0R ≤ t → t ≤ BoundsConfig.boundsTcapR →
      xi_j_fun t ≤ R.expRect.arg_bound t)

/-- Conditional conclusion on the band; currently identical to the explicit
    hypotheses, but kept abstract so the downstream paper can specialise it. -/
def ConditionalOnBand (R : ExplicitRect) : Prop :=
  ExplicitOn R

/-- Helper: any explicit rectangle inherits the unified `Tcap`. -/
lemma expRect_tcap_unifies (R : ExplicitRect) :
    R.expRect.Tcap = BoundsConfig.boundsTcapR :=
  R.tcap_eq

/-- Connect a `XiWitnessOn` with the bridge adaptor; the explicit rectangle is
    threaded so further refinements can reuse the same `Tcap`. -/
def bridgeFromWitness
    (W : XiWitnessOn alphaBridge) (R : ExplicitRect) :
    BridgeToXiOn alphaBridge :=
  by
    -- `R` is threaded only to emphasise the shared `Tcap`.
    simpa using BridgeToXiOn.ofWitness W

end ERURH
