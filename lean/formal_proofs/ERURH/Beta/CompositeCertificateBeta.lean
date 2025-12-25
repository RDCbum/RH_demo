import ERURH.Beta.InertiaCertificatesBeta
import ERURH.Beta.GlobalInertiaBeta

namespace ERURH
namespace Beta

/-- Composite beta certificate aggregating local (per-window) and global RMS information. -/
structure StrongInertiaComposite_beta where
  localCert  : StrongInertiaCertificate_beta
  globalCert : GlobalInertiaCertificate_beta
  kernelId   : String
  deriving Repr

/-- Phenomenological correctness: both local and global beta certificates are correct. -/
def StrongInertiaCompositeCorrect_beta
  (comp : StrongInertiaComposite_beta) : Prop :=
  StrongInertiaCertificateCorrect_beta comp.localCert ∧
    GlobalInertiaCertificateCorrect_beta comp.globalCert

end Beta
end ERURH
