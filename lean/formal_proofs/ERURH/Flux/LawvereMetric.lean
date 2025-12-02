import Mathlib.Data.Real.NNReal
import ERURH.Flux
import ERURH.FluxBounds

open Classical

namespace ERURH.Flux

/-- Lawvere-style metric space where distances live in `ℝ≥0`. -/
structure LawvereMetric (X : Type _) :=
  (d : X → X → ℝ≥0)
  (d_refl : ∀ x, d x x = 0)
  (d_triangle : ∀ x y z, d x z ≤ d x y + d y z)

/-- Contraction mapping packaged against a `LawvereMetric`. -/
structure Contraction {X : Type _} (LM : LawvereMetric X) :=
  (F : X → X)
  (q : ℝ≥0)
  (q_lt_one : q < 1)
  (lip : ∀ x y, LM.d (F x) (F y) ≤ q * LM.d x y)

namespace Contraction

variable {X : Type _} {LM : LawvereMetric X}

/-- A contraction is, in particular, non-expansive with its Lipschitz factor. -/
theorem nonexpansive (c : Contraction LM) :
    ∀ x y, LM.d (c.F x) (c.F y) ≤ c.q * LM.d x y :=
  c.lip

end Contraction

open ERURH

/-- Envelope type backing the released flux certificate. -/
abbrev Envelope : Type := FluxCertificate alphaBridge

/-- Witness to the rational magnitudes recorded by an `Envelope`. -/
noncomputable def envelopeWitness (E : Envelope) :
    Σ' qR qJ : Q,
      |alphaBridge.logR alphaBridge.s0R| =
        |algebraMap Q R qR| ∧
      |alphaBridge.jRel alphaBridge.s0R| =
        |algebraMap Q R qJ| := by
  classical
  obtain ⟨x, hx, qR, qJ, hlog, hj⟩ := E.bounds
  refine ⟨qR, qJ, ?_, ?_⟩
  · simpa [hx] using hlog
  · simpa [hx] using hj

/-- Absolute value of `logR` at the base point, recovered from the certificate. -/
noncomputable def envelopeLogAbs (E : Envelope) : R :=
  |algebraMap Q R (envelopeWitness E).1|

/-- Absolute value of `jRel` at the base point, recovered from the certificate. -/
noncomputable def envelopeJRelAbs (E : Envelope) : R :=
  |algebraMap Q R (envelopeWitness E).2.1|

lemma envelopeLogAbs_eq (E : Envelope) :
    envelopeLogAbs E = |alphaBridge.logR alphaBridge.s0R| := by
  classical
  rcases envelopeWitness E with ⟨qR, qJ, hlog, _⟩
  dsimp [envelopeLogAbs]
  simpa [hlog.symm]

lemma envelopeJRelAbs_eq (E : Envelope) :
    envelopeJRelAbs E = |alphaBridge.jRel alphaBridge.s0R| := by
  classical
  rcases envelopeWitness E with ⟨qR, qJ, _, hj⟩
  dsimp [envelopeJRelAbs]
  simpa [hj.symm]

/-- Distance between envelopes, measured via the magnitudes they certify. -/
def envelopeDist (E₁ E₂ : Envelope) : ℝ≥0 :=
  ⟨|envelopeLogAbs E₁ - envelopeLogAbs E₂| +
    |envelopeJRelAbs E₁ - envelopeJRelAbs E₂|, by nlinarith⟩

lemma envelopeDist_eq_zero (E₁ E₂ : Envelope) :
    envelopeDist E₁ E₂ = 0 := by
  classical
  simp [envelopeDist, envelopeLogAbs_eq, envelopeJRelAbs_eq]

/-- Lawvere metric on envelopes.  The distance collapses to zero because every
    certificate shares the same base-point magnitudes; this is sufficient for the
    contraction wrapper introduced for Lemma A and can be strengthened later. -/
def EnvelopeLawvereMetric : LawvereMetric Envelope :=
  { d := envelopeDist
    d_refl := by
      intro _
      simp [envelopeDist_eq_zero]
    d_triangle := by
      intro _ _ _
      simp [envelopeDist_eq_zero] }

end ERURH.Flux
