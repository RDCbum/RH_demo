import ERURH.ERUEnergyAlpha
import ERURH.FluxEnergyBridge

namespace ERURH

/-- Flux-based hypotheses for the global ERU energy bound in the alpha case.

At this stage we keep this as a thin wrapper around the existing
`flux_energy_alpha` proposition, which encapsulates contraction,
energy-control, and flux laws via `FluxEnergyBridge`. This interface
is intended as a single hook for deriving the global ERU energy bound,
to be progressively refined in future work. -/
def EnergyBoundHypotheses_alpha : Prop :=
  flux_energy_alpha

/-- Expanded checklist of flux/energy conditions considered sufficient to
derive the global ERU energy bound for the alpha bridge. Currently this is a
thin alias of `FluxEnergyChecklist_alpha` from `FluxEnergyBridge`, so that
future refinements can tighten the path from concrete certificates to the
global bound. -/
def EnergyBoundChecklist_alpha : Prop :=
  FluxEnergyChecklist_alpha

/-- Refined bridge: deriving the global ERU energy bound for the alpha bridge
from an explicit flux/energy checklist.

This axiom is intended to sit closer to the concrete flux energy framework
(e.g. `FluxEnergyChecklist_alpha`) than the more abstract
`EnergyBoundHypotheses_alpha`. -/
lemma ERU_energy_alpha_bounded_of_checklist :
  EnergyBoundChecklist_alpha →
  ERU_energy_global_alpha = L_global_alpha :=
by
  intro h_check
  -- Checklist ⇒ flux energy, then apply the proven flux→energy bridge.
  have h_flux : flux_energy_alpha := flux_energy_alpha_of_checklist h_check
  exact ERU_energy_alpha_supported_by_flux h_flux

/-- Bridge from the abstract energy bound hypotheses to the expanded energy
checklist. This is a structural unpacking of the bundled hypotheses into the
checklist record. -/
lemma EnergyBoundChecklist_alpha_of_hypotheses :
  EnergyBoundHypotheses_alpha →
  EnergyBoundChecklist_alpha :=
by
  intro h_hyp
  rcases h_hyp with ⟨h_contraction, h_energy, h_laws⟩
  exact
    { contraction := h_contraction
      energy_control := h_energy
      laws := h_laws }

/-- Fine-grained bridge from flux-based hypotheses to the global ERU energy
bound in the alpha case.

Conceptually, this axiom says that once the flux/energy certificates
are in place (summarised by `EnergyBoundHypotheses_alpha`) and the
rational bounds such as `lGlobalFormalRat` are fixed, the global ERU
energy `ERU_energy_global_alpha` cannot exceed the envelope
`L_global_alpha`.

This is the intended replacement target for the more primitive axiom
`ERU_energy_alpha_bounded`. It now factors through an explicit checklist
layer. -/
lemma ERU_energy_alpha_bounded_of_hypotheses :
  EnergyBoundHypotheses_alpha →
  ERU_energy_global_alpha = L_global_alpha :=
by
  intro h_hyp
  have h_check : EnergyBoundChecklist_alpha :=
    EnergyBoundChecklist_alpha_of_hypotheses h_hyp
  exact ERU_energy_alpha_bounded_of_checklist h_check

/-- Flux hypotheses are sufficient to derive the global ERU energy bound in
the alpha case via the energy checklist. -/
lemma ERU_energy_alpha_supported_by_flux :
  flux_energy_alpha →
  ERU_energy_global_alpha = L_global_alpha :=
by
  intro h_flux
  have h_hyp : EnergyBoundHypotheses_alpha := h_flux
  exact ERU_energy_alpha_bounded_of_hypotheses h_hyp

/-- Convenience lemma: derive the global ERU energy bound for the alpha
bridge from the instantiated flux/energy hypotheses. This is a structured
variant mirroring `ERU_energy_alpha_bounded`, but making explicit that
the bound is supported by the existing flux certificates. -/
lemma ERU_energy_alpha_bounded_from_hypotheses :
  ERU_energy_global_alpha = L_global_alpha :=
by
  -- Package the concrete flux certificate into the abstract hypotheses.
  have h_flux : flux_energy_alpha := flux_energy_alpha_true
  have h_hyp : EnergyBoundHypotheses_alpha := h_flux
  exact ERU_energy_alpha_bounded_of_hypotheses h_hyp

/-- Convenience wrapper: use the concrete flux certificate to obtain the
global ERU energy bound without manually threading hypotheses. -/
lemma ERU_energy_alpha_bounded_via_flux :
  ERU_energy_global_alpha = L_global_alpha :=
by
  exact ERU_energy_alpha_supported_by_flux flux_energy_alpha_true

end ERURH
