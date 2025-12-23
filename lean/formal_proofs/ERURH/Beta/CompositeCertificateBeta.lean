import ERURH.Beta.InertiaCertificatesBeta
import ERURH.Beta.GlobalInertiaBeta
import ERURH.Beta.GeneratedGlobalInertiaBeta

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

/-- Numeric composite certificate built from the generated local and global beta artifacts. -/
noncomputable def strongInertiaComposite_beta_numeric : StrongInertiaComposite_beta :=
{
  localCert  := strongInertiaCertificate_beta_numeric,
  globalCert := globalInertiaCertificate_beta_numeric,
  kernelId   := "Gaussian_sigma1.5_radius5"
}

/--
`strongInertiaCompositeCorrect_beta_numeric` is a beta-level assumption:
the composite certificate formed by the numeric local RMS certificate
and the global RMS certificate satisfies the combined correctness predicate.
It lives only in the ERURH-beta layer and is backed by the Python pipeline
for the local part, while the global part is treated phenomenologically.
-/
axiom strongInertiaCompositeCorrect_beta_numeric :
  StrongInertiaCompositeCorrect_beta strongInertiaComposite_beta_numeric

end Beta
end ERURH
