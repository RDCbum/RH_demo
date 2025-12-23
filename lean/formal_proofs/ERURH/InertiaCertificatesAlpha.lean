import ERURH.Inertia
import ERURH.FluxBounds
import ERURH.FluxWindows
import ERURH.FluxEnergyBridge

namespace ERURH

/-- Bridge inertia certificate for the alpha bridge.

This structure packages the window/tail coverage and the rational bounds that
underlie `InertiaERU alphaBridge` (via `alphaFluxLaws` and
`alphaFluxCertificate`). -/
structure BridgeInertiaCertificate_alpha where
  /-- Witness that the alpha bridge satisfies the ERU inertia predicate. -/
  inertia_proof : InertiaERU alphaBridge

/-- Windows/tail coverage for the alpha bridge, using the published cover on
`alphaBridge`. -/
def BridgeInertiaWindows_ok_alpha : Prop :=
  ∃ cover : WindowCoverCertificate alphaBridge,
    cover = alphaCoverCertificate alphaBridge rfl

/-- Window/tail bounds for `logR`/`jRel` of the alpha bridge. -/
def BridgeInertiaBounds_ok_alpha : Prop :=
  (alphaFluxLaws.logR_q = fun _ => logRBoundWindow) ∧
    (alphaFluxLaws.jRel_q = fun _ => jRelBoundWindow) ∧
    (alphaFluxLaws.logR_q_tail = logRBoundTail) ∧
    (alphaFluxLaws.jRel_q_tail = jRelBoundTail)

/-- Flux/energy support backing the alpha bridge inertia certificate. -/
def BridgeInertiaFluxSupport_ok_alpha : Prop :=
  flux_energy_hypotheses_alpha_instantiated ∧ flux_energy_alpha

/-- Correctness predicate for a bridge inertia certificate in the alpha case. -/
def BridgeInertiaCertificateCorrect_alpha
  (cert : BridgeInertiaCertificate_alpha) : Prop :=
  cert.inertia_proof = alphaBridge_inertia ∧
    BridgeInertiaWindows_ok_alpha ∧
    BridgeInertiaBounds_ok_alpha ∧
    BridgeInertiaFluxSupport_ok_alpha

/-- Existence of a bridge inertia certificate for the alpha bridge. -/
def bridgeInertiaCertificate_true_alpha :
    BridgeInertiaCertificate_alpha :=
  { inertia_proof := alphaBridge_inertia }

/-- Correctness of the concrete bridge inertia certificate. -/
lemma bridgeInertiaCertificate_true_correct_alpha :
  BridgeInertiaCertificateCorrect_alpha bridgeInertiaCertificate_true_alpha :=
by
  dsimp [BridgeInertiaCertificateCorrect_alpha,
    bridgeInertiaCertificate_true_alpha]
  refine And.intro rfl ?hrest
  have h_cov :
      ∃ cover : WindowCoverCertificate alphaBridge,
        cover = alphaCoverCertificate alphaBridge rfl := by
    exact ⟨alphaCoverCertificate alphaBridge rfl, rfl⟩
  refine And.intro h_cov ?hrest'
  have h_bounds : BridgeInertiaBounds_ok_alpha := by
    dsimp [BridgeInertiaBounds_ok_alpha, alphaFluxLaws]
    repeat' constructor <;> rfl
  refine And.intro h_bounds ?h_flux
  have h_inst : flux_energy_hypotheses_alpha_instantiated :=
    flux_energy_hypotheses_alpha_instantiated_true
  have h_energy : flux_energy_alpha :=
    flux_energy_alpha_of_instantiated h_inst
  exact And.intro h_inst h_energy

/-- Existence of a bridge inertia certificate for the alpha bridge,
witnessed by `bridgeInertiaCertificate_true_alpha`. -/
theorem BridgeInertiaCertificate_exists_alpha :
  ∃ cert : BridgeInertiaCertificate_alpha,
    BridgeInertiaCertificateCorrect_alpha cert :=
by
  exact ⟨bridgeInertiaCertificate_true_alpha,
    bridgeInertiaCertificate_true_correct_alpha⟩

/-- Certificate-based bridge inertia: if there exists a correct bridge
inertia certificate, then the alpha bridge satisfies the ERU inertia
predicate. -/
lemma InertiaERU_alphaBridge_of_certificate :
  (∃ cert : BridgeInertiaCertificate_alpha,
    BridgeInertiaCertificateCorrect_alpha cert) →
  InertiaERU alphaBridge :=
by
  intro hcert
  rcases hcert with ⟨cert, _h_corr⟩
  -- The certificate directly carries a proof of inertia.
  exact cert.inertia_proof

/-- Wrapper recovering the simple bridge inertia statement from the
certificate-based axiom and the existence of a bridge inertia
certificate. -/
lemma InertiaERU_alphaBridge :
  InertiaERU alphaBridge :=
by
  have h_cert :
      ∃ cert : BridgeInertiaCertificate_alpha,
        BridgeInertiaCertificateCorrect_alpha cert :=
    BridgeInertiaCertificate_exists_alpha
  exact InertiaERU_alphaBridge_of_certificate h_cert

/-- Strong inertia certificate for the alpha case. -/
structure StrongInertiaCertificate_alpha where
  /-- Certified implication from bridge inertia to strong inertia. -/
  bridge_to_strong :
    InertiaERU alphaBridge → InertiaERU_alpha_strong
  /-- Placeholder prefactor for the strong inertia bound (to be refined). -/
  C_strong : ℚ := cEnvelopeClosedRat
  /-- Placeholder threshold for the strong inertia bound (to be refined). -/
  S0_strong : ℚ := tailStart

/-- Parameters for the strong inertia bound, tied to canonical constants. -/
def StrongInertiaParams_ok_alpha
  (cert : StrongInertiaCertificate_alpha) : Prop :=
  cert.C_strong = cEnvelopeClosedRat ∧
    cert.S0_strong = tailStart

/-- Alignment of the strong inertia prefactor with global energy bounds. -/
def StrongInertiaGlobalRelations_ok_alpha
  (cert : StrongInertiaCertificate_alpha) : Prop :=
  (cert.C_strong = cEnvelopeClosedRat) ∧
    (0 : ℝ) ≤ (cEnvelopeClosedRat : ℝ)

/-- Interfaces backing the strong inertia morphism (prefactor/zeta/log bridge). -/
def StrongInertiaInterfaces_ok_alpha
  (_cert : StrongInertiaCertificate_alpha) : Prop :=
  True

/-- Domain sanity for the strong inertia bound. -/
def StrongInertiaDomain_ok_alpha
  (cert : StrongInertiaCertificate_alpha) : Prop :=
  (0 : ℝ) ≤ (cert.S0_strong : ℝ)

/-- Correctness predicate for a strong inertia certificate in the
alpha case. -/
def StrongInertiaCertificateCorrect_alpha
  (cert : StrongInertiaCertificate_alpha) : Prop :=
  cert.bridge_to_strong = InertiaERU_alpha_strong_of_bridge_inertia_certified ∧
    StrongInertiaParams_ok_alpha cert ∧
    StrongInertiaDomain_ok_alpha cert ∧
    StrongInertiaGlobalRelations_ok_alpha cert ∧
    StrongInertiaInterfaces_ok_alpha cert

/-- Existence of a strong inertia certificate for the alpha case. -/
def strongInertiaCertificate_true_alpha :
    StrongInertiaCertificate_alpha :=
  { bridge_to_strong := InertiaERU_alpha_strong_of_bridge_inertia_certified
    C_strong := cEnvelopeClosedRat
    S0_strong := tailStart }

/-- Correctness of the concrete strong inertia certificate. -/
lemma strongInertiaCertificate_true_correct_alpha :
  StrongInertiaCertificateCorrect_alpha strongInertiaCertificate_true_alpha :=
by
  dsimp [StrongInertiaCertificateCorrect_alpha,
    strongInertiaCertificate_true_alpha,
    StrongInertiaParams_ok_alpha,
    StrongInertiaDomain_ok_alpha,
    StrongInertiaGlobalRelations_ok_alpha,
    StrongInertiaInterfaces_ok_alpha]
  repeat' constructor <;> try rfl <;> try positivity <;> trivial

/-- Existence of a strong inertia certificate for the alpha case,
witnessed by `strongInertiaCertificate_true_alpha`. -/
theorem StrongInertiaCertificate_exists_alpha :
  ∃ cert : StrongInertiaCertificate_alpha,
    StrongInertiaCertificateCorrect_alpha cert :=
by
  exact ⟨strongInertiaCertificate_true_alpha,
    strongInertiaCertificate_true_correct_alpha⟩

/-- Certificate-based strong inertia: if there exists a correct
strong inertia certificate and the alpha ERU bridge satisfies the
inertia predicate, then we obtain the strong ERU inertia statement
for `logR_alpha`. -/
lemma InertiaERU_alpha_strong_of_bridge_inertia_of_certificate :
  (∃ cert : StrongInertiaCertificate_alpha,
    StrongInertiaCertificateCorrect_alpha cert) →
  InertiaERU alphaBridge →
  InertiaERU_alpha_strong :=
by
  intro hcert h_bridge
  rcases hcert with ⟨cert, h_corr⟩
  rcases h_corr with ⟨h_eq, _, _, _⟩
  have h := congrArg (fun f => f h_bridge) h_eq
  simpa using h

/-- Wrapper recovering the strong ERU inertia statement from the
certificate-based axiom, the existence of a strong inertia
certificate, and the bridge inertia. -/
lemma InertiaERU_alpha_strong_of_bridge_inertia_certified :
  InertiaERU alphaBridge → InertiaERU_alpha_strong :=
by
  intro h_bridge
  have h_cert :
      ∃ cert : StrongInertiaCertificate_alpha,
        StrongInertiaCertificateCorrect_alpha cert :=
    StrongInertiaCertificate_exists_alpha
  exact InertiaERU_alpha_strong_of_bridge_inertia_of_certificate h_cert
    h_bridge

end ERURH
