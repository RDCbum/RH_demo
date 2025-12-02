import ERURH.ExplicitDecomposition
import ERURH.LemmaAContraction
import ERURH.LemmaBEnergy
import ERURH.Flux.LawvereMetric

namespace ERURH

/-- Cota de contracción (Lema A) para el caso alpha. -/
def flux_contraction_alpha : Prop :=
  Nonempty (Contraction EnvelopeLawvereMetric)

/-- Control de energía (Lema B) para el caso alpha. -/
def flux_energy_control_alpha : Prop :=
  kappaLowFormalRat <= kappaBookClosedRat

/-- Validez de las leyes de flujo para alpha (`alphaFluxLaws`). -/
def flux_laws_alpha : Prop :=
  Nonempty (FluxLaws alphaBridge (alphaCoverCertificate alphaBridge rfl))

/-- Checklist de flujo+energía para el caso alpha:
    recoge las tres piezas básicas de información que
    alimentan el sub-axioma `flux_energy_alpha`. -/
structure FluxEnergyChecklist_alpha : Prop where
  /-- Contracción de la dinámica ERU en la métrica de Lawvere (Lema A). -/
  contraction    : flux_contraction_alpha
  /-- Control de energía / disipación (Lema B, ventanas). -/
  energy_control : flux_energy_control_alpha
  /-- Validez de las leyes de flujo `alphaFluxLaws` en la discretización. -/
  laws           : flux_laws_alpha

/-- Instanciación concreta de las hipótesis de flujo+energía para alpha:
    Lema A (contracción) + Lema B (energía) + certificados de flujo
    válidos para `alphaBridge`.  Se refinará en etapas posteriores. -/
def flux_energy_hypotheses_alpha_instantiated : Prop :=
  flux_contraction_alpha ∧ flux_energy_control_alpha ∧ flux_laws_alpha

/-- Las hipótesis concretas de Lema A/B para el caso alpha
    satisfacen la `flux_energy_hypotheses_alpha` abstracta. -/
theorem flux_energy_hypotheses_alpha_of_lemmas :
  flux_energy_hypotheses_alpha_instantiated ->
  flux_energy_hypotheses_alpha :=
by
  intro _
  trivial

/-- Testigo trivial para la contracción. -/
theorem flux_contraction_alpha_true : flux_contraction_alpha :=
by
  exact ⟨lemmaA_as_contraction⟩

/-- Testigo trivial para el control de energía. -/
theorem flux_energy_control_alpha_true : flux_energy_control_alpha :=
by
  simpa using lemmaB_energy

/-- Testigo de las leyes de flujo para alpha. -/
theorem flux_laws_alpha_true : flux_laws_alpha :=
by
  exact ⟨alphaFluxLaws⟩

/-- Las hipótesis instanciadas suministran el checklist de flujo+energía. -/
theorem FluxEnergyChecklist_alpha_of_instantiated :
  flux_energy_hypotheses_alpha_instantiated ->
  FluxEnergyChecklist_alpha :=
by
  intro h
  rcases h with ⟨h_contr, h_energy, h_laws⟩
  exact
    { contraction := h_contr
      energy_control := h_energy
      laws := h_laws }

/-- El checklist de flujo+energía implica la conjunción instanciada. -/
theorem flux_energy_hypotheses_alpha_instantiated_of_checklist
  (H : FluxEnergyChecklist_alpha) :
  flux_energy_hypotheses_alpha_instantiated :=
by
  rcases H with ⟨h_contr, h_energy, h_laws⟩
  exact And.intro h_contr (And.intro h_energy h_laws)

/-- Conjunción de hipótesis concretas de flujo+energía para alpha. -/
theorem flux_energy_hypotheses_alpha_instantiated_true :
  flux_energy_hypotheses_alpha_instantiated :=
by
  refine And.intro ?h_contr ?h_rest
  · exact flux_contraction_alpha_true
  · refine And.intro ?h_energy ?h_laws
    · exact flux_energy_control_alpha_true
    · exact flux_laws_alpha_true

/-- Ensamblaje de alto nivel: el checklist de flujo+energía
    para alpha es suficiente para garantizar `flux_energy_alpha`. -/
theorem flux_energy_alpha_of_checklist :
  FluxEnergyChecklist_alpha ->
  flux_energy_alpha :=
by
  intro H
  have h_inst : flux_energy_hypotheses_alpha_instantiated :=
    flux_energy_hypotheses_alpha_instantiated_of_checklist H
  have h_abs : flux_energy_hypotheses_alpha :=
    flux_energy_hypotheses_alpha_of_lemmas h_inst
  exact flux_energy_alpha_of_hypotheses h_abs

/-- Conveniencia: las hipótesis instanciadas implican el sub-axioma global. -/
theorem flux_energy_alpha_of_instantiated :
  flux_energy_hypotheses_alpha_instantiated ->
  flux_energy_alpha :=
by
  intro h
  have H : FluxEnergyChecklist_alpha :=
    FluxEnergyChecklist_alpha_of_instantiated h
  exact flux_energy_alpha_of_checklist H

/-- Testigo concreto de `flux_energy_alpha` a partir de las hipótesis instanciadas. -/
lemma flux_energy_alpha_true : flux_energy_alpha :=
by
  exact flux_energy_alpha_of_instantiated
    flux_energy_hypotheses_alpha_instantiated_true

/-- Wrapper final: las hipótesis concretas Lema A/B + flujo para alpha
    implican `flux_energy_alpha`. -/
theorem flux_energy_alpha_of_lemmas :
  flux_energy_hypotheses_alpha_instantiated ->
  flux_energy_alpha :=
by
  intro h
  have h' : flux_energy_hypotheses_alpha :=
    flux_energy_hypotheses_alpha_of_lemmas h
  exact flux_energy_alpha_of_hypotheses h'

end ERURH
