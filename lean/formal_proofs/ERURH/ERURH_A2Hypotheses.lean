import ERURH.ERURH_ModeGrowthAlpha
import ERURH.ERURH_ExplicitFormulaAlpha
import ERURH.RationalBounds

/-
# A2 hypotheses for RMS-local (Ideas 1 & 2)

We introduce an abstract RMS decomposition context and formalise the bridge
from A1-mode + A2-low + A2-tail to `RMSLocalHypothesis`.
-/

namespace ERURH

/-- Abstract RMS context for Plan B. -/
structure RMSLocalContext where
  Window : Type
  RMS_alpha : Window → ℝ
  RMS_mode  : Window → ℝ
  RMS_low   : Window → ℝ
  RMS_tail  : Window → ℝ
  c_low     : ℝ
  c_tail    : ℝ
  c_low_nonneg : 0 ≤ c_low
  c_tail_nonneg : 0 ≤ c_tail
  RMS_tail_bound_simple :
    ∀ w : Window, RMS_tail w ≤ c_tail
  RMS_decomp :
    ∀ w : Window, RMS_alpha w ≥ RMS_mode w - (RMS_low w + RMS_tail w)

/-- Formal envelope constant promovido a `ℝ` para comparar RMS. -/
noncomputable def C_envelope_formal : ℝ :=
  algebraMap ℚ ℝ cEnvelopeFormalRat

/-- A2-low: cota uniforme para la contribución "low". -/
def A2Low_RMS (ctx : RMSLocalContext) : Prop :=
  ∀ w : ctx.Window, ctx.RMS_low w ≤ ctx.c_low

/-- A2-tail: cota uniforme para la contribución "tail". -/
def A2Tail_RMS (ctx : RMSLocalContext) : Prop :=
  ∀ w : ctx.Window, ctx.RMS_tail w ≤ ctx.c_tail

/-- A1-mode: existe una ventana donde el modo domina por encima del sobre. -/
def A1_mode (ctx : RMSLocalContext) : Prop :=
  ∃ w : ctx.Window, ∃ K : ℝ,
    K > ctx.c_low + ctx.c_tail + C_envelope_formal ∧
    ctx.RMS_mode w ≥ K

/-- Hipótesis RMS-local: existe una ventana con RMS por encima del sobre formal. -/
def RMSLocalHypothesis (ctx : RMSLocalContext) : Prop :=
  ∃ w : ctx.Window, ctx.RMS_alpha w > C_envelope_formal

/-- Puente: A1-mode + A2-low + A2-tail ⇒ RMSLocalHypothesis. -/
lemma RMSLocalHypothesis_of_A2
  (ctx : RMSLocalContext)
  (hMode : A1_mode ctx)
  (hLow  : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx) :
  RMSLocalHypothesis ctx :=
by
  classical
  rcases hMode with ⟨w, K, hKbig, hKw⟩
  have h_low := hLow w
  have h_tail := hTail w
  have h_decomp := ctx.RMS_decomp w
  have h_alpha :
      ctx.RMS_alpha w ≥ K - (ctx.c_low + ctx.c_tail) :=
  by
    have h_mode_sub :
        ctx.RMS_mode w - (ctx.RMS_low w + ctx.RMS_tail w) ≥
          K - (ctx.RMS_low w + ctx.RMS_tail w) := by nlinarith
    have h_low_tail :
        (ctx.RMS_low w + ctx.RMS_tail w) ≤ ctx.c_low + ctx.c_tail := by nlinarith
    -- Triangular: RMS_alpha ≥ RMS_mode − (RMS_low + RMS_tail).
    nlinarith [h_decomp, h_mode_sub, h_low_tail]
  have h_margin : K - (ctx.c_low + ctx.c_tail) > C_envelope_formal := by nlinarith
  have h_step : K - (ctx.c_low + ctx.c_tail) ≤ ctx.RMS_alpha w := by linarith
  refine ⟨w, lt_of_lt_of_le h_margin h_step⟩

/-- A2-tail desde `H_b` usando el bound LS_γ simple ya empaquetado. -/
lemma A2Tail_RMS_from_Hb_LS_simple
  (ctx : RMSLocalContext)
  (_hHb : H_b) :
  A2Tail_RMS ctx :=
by
  intro w
  exact ctx.RMS_tail_bound_simple w

end ERURH

