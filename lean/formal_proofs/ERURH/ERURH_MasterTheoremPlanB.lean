import ERURH.ERURH_AxiomsShim
import ERURH.ERURH_GatesAlpha
import ERURH.ERURH_GatesFromRMS
import ERURH.ERUModesAlpha
import ERURH.ERURH_A2Hypotheses
import ERURH.ERURH_PlanB_Assumptions
import ERURH.ERURH_RMSLocalLemma

/-
# Master theorem (Plan B, RMS-local route)

This module states a conditional master theorem for Plan B (Ideas 1 & 2):
assuming the ERURH alpha axioms, correct alpha certificates, numeric coverage,
and the RMS-local analytic hypothesis, there can be no mode with β > 1/2; the
existing ERURH equivalence then yields `RiemannHypothesis xiAlpha`.

No new axioms are introduced here; any pending analytic content lives in
`RMSLocalHypothesis` (anticipated consequence of `RMS_local_lemma`) and in the
gap inside `gate_opens_from_RMS_alpha` imported from `ERURH_GatesFromRMS`.
-/

namespace ERURH

/-- Acceptance of the centralized alpha axioms, bundled as explicit data. -/
structure AxiomsShimAccepted where
  explicit_alpha : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi
  rh_from_E_alpha : RHfromE xiAlpha AlphaPsi
  alphaInterfacesBase : AlphaInterfaces

noncomputable def axiomsShimAccepted_true : AxiomsShimAccepted := by
  exact ⟨explicit_alpha, rh_from_E_alpha, alphaInterfacesBase⟩

/-- Bundle of alpha certificates assumed correct for Plan B. This includes the
global energy and kernel blow-up certificates used to close the gates. -/
structure CertificatesCorrectAlpha : Prop where
  h_global : GlobalEnergyCertificateCorrect_alpha globalEnergyCertificate_true_alpha
  h_kernel : KernelBlowupCertificateCorrect_alpha kernelBlowupCertificate_true_alpha

theorem certificatesCorrectAlpha_true : CertificatesCorrectAlpha := by
  exact ⟨globalEnergyCertificate_true_correct_alpha, kernelBlowupCertificate_true_correct_alpha⟩

/-- Placeholder for any additional numeric coverage assumptions (windows, tails,
RMS normalization) needed to instantiate the RMS-local and gate arguments. Here
we assume the RMS envelope bound globally. -/
def NumericCoverageAlpha (ctx : RMSLocalContext) : Prop :=
  Alpha.RMS_envelope_closed ctx

/-- Plan B master theorem (conditional, RMS-local route). Under the centralized
axioms, correct certificates, numeric coverage, and the RMS-local hypothesis,
there is no mode with β > 1/2, hence (by the ERURH equivalence) RH holds for
`xiAlpha`. -/
theorem RH_from_planB_RMS
  (ctx : RMSLocalContext)
  (hAxioms : AxiomsShimAccepted)
  (hCerts : CertificatesCorrectAlpha)
  (hNumeric : NumericCoverageAlpha ctx)
  (hRMS : RMSLocalHypothesis ctx) :
  RiemannHypothesis xiAlpha :=
by
  -- Gates are closed using the certificate bundle.
  have h_renorm : Alpha.RenormGateClosed ctx :=
    Alpha.renorm_gate_closed_of_certificates ctx hNumeric hCerts.h_global hCerts.h_kernel
  -- Absence of ERU modes with β > 1/2 follows by contradiction using RMS-local
  -- and gate opening.
  have h_no_modes : ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
    intro β hβ hmode
    -- RMS-local hypothesis gives a window breaking the envelope.
    obtain ⟨w, h_rms⟩ := hRMS
    have h_gate : ¬ Alpha.RenormGateClosed ctx :=
      gate_opens_from_RMS_alpha ctx ⟨w, h_rms⟩
    exact h_gate h_renorm
  -- Translate absence of modes into strong inertia, then RH.
  have h_inertia : InertiaERU_alpha_strong :=
    InertiaERU_alpha_strong_of_no_modes_via_certificates (by
      intro β hβ; exact h_no_modes β hβ)
  exact (ERU_RH_equiv_alpha).1 h_inertia

/-- A2-based wrapper: replace the RMS-local hypothesis with the abstract A2-low
and A2-tail controls. -/
theorem RH_from_planB_A2
  (ctx : RMSLocalContext)
  (hAxioms : AxiomsShimAccepted)
  (hCerts : CertificatesCorrectAlpha)
  (hNumeric : NumericCoverageAlpha ctx)
  (hMode : A1_mode ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx) :
  RiemannHypothesis xiAlpha :=
by
  have hRMS : RMSLocalHypothesis ctx := RMSLocalHypothesis_of_A2 ctx hMode hLow hTail
  exact RH_from_planB_RMS ctx hAxioms hCerts hNumeric hRMS

/-- Conditional master theorem (Plan B) bundled: under the analytic Plan B
assumptions (`PlanB_AnalyticAssumptions`) plus the formal/certified pieces
(`AxiomsShimAccepted`, `CertificatesCorrectAlpha`, `NumericCoverageAlpha`), we
obtain RH for `xiAlpha`. This is conditional on the external ζ-theory
hypotheses listed in `docs/ERURH_PlanB_Assumptions.md`; the analytic gap is the
same as in `RMSLocalHypothesis_of_A2`. -/
theorem RH_from_planB_bundle
  (ctx : RMSLocalContext)
  (hAnalytic : ERURH.Alpha.PlanB_AnalyticAssumptions ctx)
  (hAxioms   : AxiomsShimAccepted)
  (hCerts    : CertificatesCorrectAlpha)
  (hNumeric  : NumericCoverageAlpha ctx) :
  RiemannHypothesis xiAlpha :=
by
  -- Extract A2 pieces from the bundle.
  have hLow : A2Low_RMS ctx := hAnalytic.A2_low_RMS
  have hTail : A2Tail_RMS ctx := hAnalytic.A2_tail_RMS
  -- Derive RMS-local hypothesis via the A2 bridge (analytic gap already tracked).
  have hRMS : RMSLocalHypothesis ctx := RMS_local_lemma ctx hAnalytic
  -- Apply the existing Plan B master theorem.
  exact RH_from_planB_RMS ctx hAxioms hCerts hNumeric hRMS

end ERURH
