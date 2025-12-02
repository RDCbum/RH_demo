import ERURH.Equivalence
import ERURH.AlphaInterfacesOn

namespace ERURH

/-- Staged conditional: once the staged analytic data is assembled on the
released bridge, every explicit rectangle in range is on-band. -/
theorem alpha_rh_conditional_on
  (R : ExplicitRect)
  (W : XiWitnessOn alphaBridge := alphaXiOn_concrete)
  (B : BridgeToXiOn alphaBridge := bridgeFromWitness W R)
  (Hlaws : XiLawsOn alphaWindowCover
      (PrefactorWitnessOn.ofLambda alphaLambdaWitness)
      (alphaZetaWitnessOn alphaBridge) := alphaLawsOn)
  (Hexp  : ExplicitOn R) :
  ConditionalOnBand R := by
  simpa [ConditionalOnBand] using Hexp

end ERURH
