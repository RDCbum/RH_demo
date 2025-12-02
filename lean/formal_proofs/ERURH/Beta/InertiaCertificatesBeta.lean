import Mathlib
import ERURH.Inertia
import ERURH.Beta.GeneratedStrongInertiaBeta
import ERURH.ERURH_BetaInertiaAssumptions

/-!
ERURH-beta: tipos fenomenológicos para certificados de inercia suave.
No afecta a la capa alfa ni a certificados formales existentes.
-/

namespace ERURH
namespace Beta

open Real

/-- Registro por ventana para la versión beta (fenomenológica). -/
structure BetaInertiaWindowRecord where
  id        : String
  sLeft     : ℚ
  sRight    : ℚ
  sMid      : ℚ
  rmsBound  : ℚ
  supBound  : ℚ
  deriving Repr

/-- Certificado fuerte de inercia en la capa beta, basado en jRel suavizada. -/
structure StrongInertiaCertificate_beta where
  C_RMS_beta   : ℚ
  S0_beta      : ℚ
  kernelId     : String
  windows      : List BetaInertiaWindowRecord
  tailRMSBound : ℚ
  deriving Repr

/-- Predicado fenomenológico: el certificado beta respeta la cota energética objetivo. -/
def StrongInertiaCertificateCorrect_beta
  (cert : StrongInertiaCertificate_beta) : Prop :=
  cert.C_RMS_beta > 0 ∧ cert.S0_beta > 0 ∧
    (∀ w ∈ cert.windows, w.sLeft ≥ cert.S0_beta) ∧
    (∀ w ∈ cert.windows,
      let sMidR : ℝ := w.sMid
      let boundR : ℝ :=
        (cert.C_RMS_beta : ℝ) * Real.exp (- sMidR / 2) * sMidR ^ 2
      (w.rmsBound : ℝ) ≤ boundR) ∧
    (let s0R : ℝ := cert.S0_beta
     let tailBoundR : ℝ :=
       (cert.C_RMS_beta : ℝ) * Real.exp (- s0R / 2) * s0R ^ 2
     (cert.tailRMSBound : ℝ) ≤ tailBoundR)

/--
`strongInertiaCertificateCorrect_beta_numeric` is an external beta-level
assumption: the numerically generated certificate `strongInertiaCertificate_beta_numeric`
from the ERURH-beta pipeline (explicit bridge + smoothed `jRel_ERU` +
RMS-per-window CSV + certificate builder) satisfies the phenomenological predicate
`StrongInertiaCertificateCorrect_beta`.

It is **not** proved analytically inside Lean and is **not** used by the alpha
theorem or RH equivalence; it lives purely in the ERURH-beta layer as a bridge
between formal types and numeric diagnostics.
-/
def strongInertiaCertificateCorrect_beta_numeric :
  StrongInertiaCertificateCorrect_beta strongInertiaCertificate_beta_numeric :=
by
  exact ERURH.betaInertiaAssumptions_true.strongInertiaCertificateCorrect_beta_numeric

end Beta
end ERURH
