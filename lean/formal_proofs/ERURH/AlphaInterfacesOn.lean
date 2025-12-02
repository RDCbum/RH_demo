import ERURH.XiWitnessOn
import ERURH.ZetaWitnessBuildOn
import ERURH.XiPrefactor
import ERURH_Staging.XiLawsOn
import ERURH.BridgeToXiOn

namespace ERURH

/-- Staged alias for the released window cover. -/
abbrev alphaWindowCover : WindowCoverCertificate alphaBridge :=
  Staging.alphaWindowCover

/-- Staged alias for the lambda witness assembled from the auto-generated bounds. -/
abbrev alphaLambdaWitness :
    LambdaWitness alphaBridge alphaWindowCover :=
  Staging.alphaLambdaWitness

/-- Staged alias for the on-band Xi laws. -/
abbrev alphaLawsOn :
    XiLawsOn alphaWindowCover
      (PrefactorWitnessOn.ofLambda alphaLambdaWitness)
      (alphaZetaWitnessOn alphaBridge) :=
  Staging.alphaLawsOn

/-- Optional façade: instantiates the on-band ξ witness once the bridge laws are provided. -/
noncomputable def alphaXiOn
  (H :
      XiLawsOn alphaWindowCover
        (PrefactorWitnessOn.ofLambda alphaLambdaWitness)
        (alphaZetaWitnessOn alphaBridge)) :
  XiWitnessOn alphaBridge :=
  XiWitnessOn.ofLaws
    alphaWindowCover
    (PrefactorWitnessOn.ofLambda alphaLambdaWitness)
    alphaLambdaWitness
    (alphaZetaWitnessOn alphaBridge)
    H

/-- Concrete on-band witness assembled from the staged Xi laws. -/
noncomputable def alphaXiOn_concrete : XiWitnessOn alphaBridge :=
  alphaXiOn alphaLawsOn

/-- Backwards-compatible alias retained for legacy scripts. -/
@[deprecated alphaXiOn_concrete (since := "2025-11-08")]
noncomputable def alphaXiOn_staging : XiWitnessOn alphaBridge :=
  alphaXiOn_concrete

/-- On-band bridge ready to feed the explicit-layer rectangle contract. -/
noncomputable def alphaBridgeToXiOn :
    BridgeToXiOn alphaBridge :=
  BridgeToXiOn.ofWitness alphaXiOn_concrete

end ERURH
