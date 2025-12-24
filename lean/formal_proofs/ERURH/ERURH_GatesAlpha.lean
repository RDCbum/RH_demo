import ERURH.RationalBounds
import ERURH.EnergyCertificatesAlpha
import ERURH.ERUEnergyAlpha
import ERURH.EnergyBoundsAlpha
import ERURH.ERURH_A2Hypotheses

/-
# ERURH gates at the alpha layer

This module introduces abstract propositions for the renormalization and energy
gates in the alpha layer. The goal is to phrase the gate closures directly in
terms of the formal constants and certificate predicates already present in the
alpha stack, without introducing new axioms. The skeleton lemmas show how the
alpha certificates are expected to close the gates, phrased using the existing
formal constants and certificate predicates.
-/

namespace ERURH
namespace Alpha

/-- RMS bound encoded in the gate: all windows respect the envelope. -/
def RMS_envelope_closed (ctx : RMSLocalContext) : Prop :=
  ∀ w : ctx.Window, ctx.RMS_alpha w ≤ C_envelope_formal

/-- Renormalization gate is closed when the RMS envelope and κ-family lie in the target band. -/
def RenormGateClosed (ctx : RMSLocalContext) : Prop :=
  RMS_envelope_closed ctx ∧
  (kappaLowFormalRat ≤ kappaHighFormalRat) ∧
  (kappaLowFormalRat ≤ kappaBookClosedRat) ∧
  (kappaHighFormalRat ≤ kappaBookClosedRat) ∧
  (cEnvelopeFormalRat ≤ cEnvelopeClosedRat) ∧
  (algebraMap ℚ ℝ lGlobalFormalRat = L_global_alpha)

/-- Energy gate is closed when the global ERU energy stays below `L_global`. -/
def EnergyGateClosed : Prop :=
  ERU_energy_global_alpha ≤ L_global_alpha

lemma renorm_gate_closed_of_certificates
  (ctx : RMSLocalContext)
  (hRMS : RMS_envelope_closed ctx)
  {certE : GlobalEnergyCertificate_alpha}
  {certK : KernelBlowupCertificate_alpha}
  (hE : GlobalEnergyCertificateCorrect_alpha certE)
  (hK : KernelBlowupCertificateCorrect_alpha certK)
  : ERURH.Alpha.RenormGateClosed ctx :=
by
  -- Band consistency from generated bounds.
  have h_band : kappaLowFormalRat ≤ kappaHighFormalRat := by
    simpa using lemmaB_band_bounds
  -- Lower-to-book bound comes from the global energy certificate.
  rcases hE with ⟨hκE, hLE, hLow⟩
  have h_kappa_low : kappaLowFormalRat ≤ kappaBookClosedRat := by
    simpa [hκE] using hLow
  -- High-to-book bound comes from the generated inequality.
  have h_kappa_high : kappaHighFormalRat ≤ kappaBookClosedRat := by
    simpa using lemmaB_closed_bound
  -- The envelope constants coincide in the generated bundle.
  have h_envelope : cEnvelopeFormalRat ≤ cEnvelopeClosedRat := by
    native_decide
  -- The global energy envelope is fixed by definition to the formal bound.
  have h_L : algebraMap ℚ ℝ lGlobalFormalRat = L_global_alpha := rfl
  exact ⟨hRMS, h_band, h_kappa_low, h_kappa_high, h_envelope, h_L⟩

lemma energy_gate_closed_of_certificates
  {certE : GlobalEnergyCertificate_alpha}
  (hE : GlobalEnergyCertificateCorrect_alpha certE)
  (h_energy : EnergyBoundHypotheses_alpha)
  : ERURH.Alpha.EnergyGateClosed :=
by
  -- Use the explicit energy-bound hypothesis and rewrite via the certificate.
  rcases hE with ⟨_, hLE, _⟩
  have h_energy_bound : ERU_energy_global_alpha ≤ algebraMap ℚ ℝ certE.L_global := by
    have h := ERU_energy_alpha_bounded_from_hypotheses h_energy
    simpa [L_global_alpha, hLE] using (le_of_eq h)
  -- The gate condition uses `L_global_alpha`, aligned with the certificate via `hLE`.
  simpa [EnergyGateClosed, L_global_alpha, hLE] using h_energy_bound

end Alpha
end ERURH
