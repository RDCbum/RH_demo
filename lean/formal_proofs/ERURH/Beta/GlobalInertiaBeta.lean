import Mathlib
import ERURH.Beta.InertiaCertificatesBeta

namespace ERURH
namespace Beta

open Real

/-- Global beta-level certificate aggregating ERU-normalised energy. -/
structure GlobalInertiaCertificate_beta where
  C_Global_beta : ℚ
  S0_global     : ℚ
  Smax_global   : ℚ
  sRef          : ℚ
  deriving Repr

/-- Phenomenological correctness predicate for the global beta certificate. -/
def GlobalInertiaCertificateCorrect_beta
  (cert : GlobalInertiaCertificate_beta) : Prop :=
  cert.C_Global_beta > 0 ∧ cert.S0_global > 0 ∧ cert.Smax_global ≥ cert.S0_global
  -- Future versions could relate this to a global RMS estimate for jRel_ERU.

end Beta
end ERURH
