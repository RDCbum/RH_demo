/-
  ERURH.Main  Public entry point exposing the end-to-end theorem
  built from the released alpha windows and numerics.
-/
import ERURH
import ERURH.Certificate
import ERURH.CertificateValues
import ERURH.LemmaAContraction
import ERURH.LemmaBEnergy
import ERURH.AlphaInterfaces

namespace ERURH

/-- Instantiation of the algebraic envelope bound using the generated certificate. -/
@[simp] theorem certificate_envelope_final :
    certificateFromBundle.cEnvelope.toRat ≤ certificateFromBundle.cEnvelopeClosed.toRat :=
  certificate_envelope_le_closed _ certificateFromBundle_hypotheses

/-- Summary of the formal ERURH inequalities required by the review gate. -/
theorem erurh_formal_summary :
    And (lGlobalFormalRat ≤ lAClosedRat)
        (And (kappaLowFormalRat ≤ kappaBookClosedRat)
             (certificateFromBundle.cEnvelope.toRat ≤
                certificateFromBundle.cEnvelopeClosed.toRat)) := by
  refine And.intro ?_ ?_
  · exact lemmaA_contraction_bound
  · refine And.intro ?_ ?_
    · exact lemmaB_energy
    · exact certificate_envelope_final

/-- Puente concreto construido a partir de los artefactos publicados. -/
noncomputable def AlphaBridge : ERUBridge := alphaBridge

/-- Certificado global obtenido de los numerics (reexportado para conveniencia). -/
noncomputable def alphaCertificate : FluxCertificate AlphaBridge := by
  simpa [AlphaBridge] using alphaFluxCertificate

/-- Teorema principal público: el puente alfa satisface `InertiaERU`. -/
theorem alpha_inertia : InertiaERU AlphaBridge := by
  simpa [AlphaBridge] using alphaBridge_inertia

/-- Marcapasos para el informe de axiomas; mantiene el módulo accesible. -/
def ERURH_checked : True := True.intro

end ERURH
