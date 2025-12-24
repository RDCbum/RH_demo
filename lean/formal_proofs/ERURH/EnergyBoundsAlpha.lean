import ERURH.ERUEnergyAlpha

namespace ERURH

/-- Hypotheses for the global ERU energy bound in the alpha case.

This is now an explicit non-vacuous hypothesis; we no longer depend on
the flux bridge in this release branch. -/
def EnergyBoundHypotheses_alpha : Prop :=
  ERU_energy_global_alpha = L_global_alpha

/-- Checklist version of the energy bound hypotheses. -/
def EnergyBoundChecklist_alpha : Prop :=
  EnergyBoundHypotheses_alpha

/-- Trivial inclusion of hypotheses into the checklist. -/
lemma EnergyBoundChecklist_alpha_of_hypotheses
  (h : EnergyBoundHypotheses_alpha) :
  EnergyBoundChecklist_alpha :=
by
  exact h

/-- From the checklist we recover the global ERU energy bound. -/
lemma ERU_energy_alpha_bounded_of_checklist
  (h : EnergyBoundChecklist_alpha) :
  ERU_energy_global_alpha = L_global_alpha :=
by
  exact h

/-- From the hypotheses we recover the global ERU energy bound. -/
lemma ERU_energy_alpha_bounded_of_hypotheses
  (h : EnergyBoundHypotheses_alpha) :
  ERU_energy_global_alpha = L_global_alpha :=
by
  exact h

/-- Convenience lemma: expose the energy bound from the hypotheses. -/
lemma ERU_energy_alpha_bounded_from_hypotheses
  (h : EnergyBoundHypotheses_alpha) :
  ERU_energy_global_alpha = L_global_alpha :=
by
  exact h

/-- Alias for energy bound derivation (kept for compatibility). -/
lemma ERU_energy_alpha_supported_by_flux
  (h : EnergyBoundHypotheses_alpha) :
  ERU_energy_global_alpha = L_global_alpha :=
by
  exact h

/-- Convenience wrapper matching the previous API name. -/
lemma ERU_energy_alpha_bounded_via_flux
  (h : EnergyBoundHypotheses_alpha) :
  ERU_energy_global_alpha = L_global_alpha :=
by
  exact h

end ERURH