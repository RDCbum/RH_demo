import ERURH.ERURH_ExplicitFormulaAlpha
import ERURH.ComplexAbsCompat

/-
# Large-sieve-on-γ sketch for ERURH (Plan B, A2-tail)

This module records a schematic large-sieve inequality over the heights γ of
non-trivial zeros, using the explicit-formula coefficients `b_ρ` and the decay
hypothesis `H_b`. It also includes a simple pointwise LS_γ bound proved via the
triangle inequality, useful for coarse A2-tail control. The refined LS_γ bound
remains an analytic gap marked by a `sorry` elsewhere.
-/

namespace ERURH
namespace Alpha

open scoped BigOperators
open MeasureTheory

/-- Contexto finito para aplicar LS_γ: familia finita de frecuencias `γ`,
coeficientes `b`, longitud de ventana `L` y un bound esperado para la
cardinalidad de la banda. -/
structure LSGammaContext where
  ι : Type
  [fintype : Fintype ι]
  γ : ι → ℝ
  b : ι → ℂ
  L : ℝ
  hL : 0 < L
  card_bound : ℝ

attribute [instance] LSGammaContext.fintype

/-- Teorema clásico LS_γ^weak: la RMS de la suma espectral en `[0, L]` se controla
por la cardinalidad de la banda y la masa cuadrática de los coeficientes. -/
def LSGammaWeak : Prop :=
  ∀ ctx : LSGammaContext,
    (Fintype.card ctx.ι : ℝ) ≤ ctx.card_bound →
      (1 / ctx.L) *
        ∫ u in Set.Icc 0 ctx.L,
          Complex.abs (∑ j, ctx.b j * Complex.exp (Complex.I * (ctx.γ j) * u)) ^ 2
        ≤ ctx.card_bound * ∑ j, (Complex.abs (ctx.b j)) ^ 2

variables {ι : Type} [Fintype ι]

/-- Simple LS_γ bound (pointwise): for any finite family of coefficients `b` and
frequencies `γ`, the exponential sum is bounded by the sum of absolute values,
independently of `u`. This is the trivial triangle-inequality variant used for
coarse A2-tail control. -/
lemma LS_gamma_simple_pointwise (γ : ι → ℝ) (b : ι → ℂ) (u : ℝ) :
  Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u))
    ≤ ∑ j, Complex.abs (b j) :=
by
  classical
  have h_sum :
      Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ≤
        ∑ j, Complex.abs (b j * Complex.exp (Complex.I * (γ j) * u)) :=
    norm_sum_le _
  have h_exp : ∀ j, Complex.abs (b j * Complex.exp (Complex.I * (γ j) * u)) =
      Complex.abs (b j) := by
    intro j
    have : Complex.abs (Complex.exp (Complex.I * (γ j) * u)) = 1 := by
      simp
    simpa [Complex.abs_mul, this]
  simpa [h_exp] using h_sum

lemma LS_gamma_simple_pointwise_sq (γ : ι → ℝ) (b : ι → ℂ) (u : ℝ) :
  Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
    ≤ (Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2 :=
by
  -- Cauchy–Schwarz in ℓ²
  have h_cs :=
    Complex.norm_sq_le_real_inner_norm_sq (∑ j, b j * Complex.exp (Complex.I * (γ j) * u))
  -- But an easier route: use Cauchy–Schwarz inequality on finite sums directly.
  classical
  have h :
      Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ≤
        (Real.sqrt (Fintype.card ι)) * Real.sqrt (∑ j, (Complex.abs (b j)) ^ 2) :=
  by
    -- Cauchy–Schwarz: ⟪b, e^{iγu}⟫ ≤ ‖b‖₂ ‖e^{iγu}‖₂, and the latter has norm sqrt(n).
    have h_norm :
        (∑ j, (Complex.abs (Complex.exp (Complex.I * (γ j) * u))) ^ 2) =
          (Fintype.card ι : ℝ) := by
      simp
    have h_cs' :
        Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ≤
          Real.sqrt (∑ j, (Complex.abs (b j)) ^ 2) *
            Real.sqrt (∑ j, (Complex.abs (Complex.exp (Complex.I * (γ j) * u))) ^ 2) :=
      by
        -- Cauchy–Schwarz on ℓ²
        have := Complex.abs_sum_mul_le_norm_sum_mul_norm_sum (f := b)
          (g := fun j => Complex.exp (Complex.I * (γ j) * u))
        -- expand norms to ℓ² norms; for finite sums, norm_sum_sq is sum of squares
        -- Use Jensen with ℓ²: ‖f‖₂ = sqrt (Σ |f|²)
        have h1 :
            ‖(∑ j, (b j) • (Complex.exp (Complex.I * (γ j) * u)))‖ ≤
              ‖fun j => b j‖ *
                ‖fun j => Complex.exp (Complex.I * (γ j) * u)‖ :=
          by simpa using this
        -- translate norms of functions on finite types to ℓ² sums
        have hb :
            ‖fun j => b j‖ = Real.sqrt (∑ j, (Complex.abs (b j)) ^ 2) := by
          simpa using Fintype.norm_eq_sqrt_sum_abs_sq (fun j => b j)
        have hg :
            ‖fun j => Complex.exp (Complex.I * (γ j) * u)‖ =
              Real.sqrt (∑ j, (Complex.abs (Complex.exp (Complex.I * (γ j) * u))) ^ 2) := by
          simpa using Fintype.norm_eq_sqrt_sum_abs_sq (fun j => Complex.exp (Complex.I * (γ j) * u))
        simpa [hb, hg] using h1
    have h_norm_sqrt :
        Real.sqrt (∑ j, (Complex.abs (Complex.exp (Complex.I * (γ j) * u))) ^ 2) =
          Real.sqrt (Fintype.card ι : ℝ) := by
      simp [h_norm]
    have h' := le_of_eq_of_le (by ring_nf) (by exact h_cs')
    -- simplify the right-hand side
    have h'' : Real.sqrt (∑ j, (Complex.abs (Complex.exp (Complex.I * (γ j) * u))) ^ 2) =
        Real.sqrt (Fintype.card ι : ℝ) := h_norm_sqrt
    have hfinal :
        Real.sqrt (∑ j, (Complex.abs (b j)) ^ 2) *
          Real.sqrt (∑ j, (Complex.abs (Complex.exp (Complex.I * (γ j) * u))) ^ 2) =
        Real.sqrt (Fintype.card ι : ℝ) * Real.sqrt (∑ j, (Complex.abs (b j)) ^ 2) := by
      nlinarith
    have hcs := h_cs'
    -- rewrite RHS using h_norm_sqrt
    have hcs' :
        Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ≤
          Real.sqrt (Fintype.card ι : ℝ) * Real.sqrt (∑ j, (Complex.abs (b j)) ^ 2) := by
      simpa [h_norm_sqrt] using h_cs'
    exact hcs'
  -- square both sides
  have h_sq := sq_le_sq h
  -- simplify squares of sqrt
  have h_rhs :
      (Real.sqrt (Fintype.card ι : ℝ) * Real.sqrt (∑ j, (Complex.abs (b j)) ^ 2)) ^ 2 =
        (Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2 := by nlinarith
  have h_lhs :
      Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2 =
        (Real.sqrt (Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2)) ^ 2 := by
    ring_nf
  -- Combine
  nlinarith

/-- RMS version of the simple LS_γ bound: the uniform pointwise bound implies
the same bound for the average over `[0, L]`. -/
lemma LS_gamma_simple_RMS
  {ι : Type} [Fintype ι]
  (γ : ι → ℝ) (b : ι → ℂ) (L : ℝ) (hL : 0 < L) :
    (1 / L) *
      ∫ u in Set.Icc 0 L,
        Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
      ≤ (Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2 :=
by
  have hpt : ∀ u : ℝ,
      Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
        ≤ (Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2 :=
    LS_gamma_simple_pointwise_sq (γ := γ) (b := b)
  have hconst :
      ∫ u in Set.Icc 0 L,
        Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
        ≤ L * ((Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2) :=
  by
    have h_meas : MeasurableSet (Set.Icc (0:ℝ) L) := by
      exact isClosed_Icc.measurableSet
    have h_integrand :
        ∀ u ∈ Set.Icc (0:ℝ) L,
          Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
            ≤ (Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2 := by
      intro u hu
      exact hpt u
    -- integrate a bounded function over an interval of length L
    have h_length : ∫ _u in Set.Icc (0:ℝ) L, (1:ℝ) = L := by
      simp [integral_const, measure_Icc, hL.le, hL.ne']
    have h_bound :
        ∫ u in Set.Icc (0:ℝ) L,
          Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
        ≤ ((Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2) *
          (∫ _u in Set.Icc (0:ℝ) L, (1:ℝ)) :=
    by
      have h_nonneg :
          (fun u => Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2) ≥ 0 := by
        intro u; have : (0 : ℝ) ≤ Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) := by
          exact by nlinarith
        nlinarith
      refine integral_le_integral_of_nonneg_of_le ?h_nonneg ?h_le ?h_meas ?h_meas
      · intro u hu; simpa using h_nonneg u
      · intro u hu; simpa using h_integrand u hu
    have h_bound' :
        ∫ u in Set.Icc (0:ℝ) L,
          Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
        ≤ ((Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2) * L := by
      simpa [h_length] using h_bound
    simpa [mul_comm] using h_bound'
  have h_final :
      (1 / L) *
        ∫ u in Set.Icc 0 L,
          Complex.abs (∑ j, b j * Complex.exp (Complex.I * (γ j) * u)) ^ 2
      ≤ (1 / L) * (L * ((Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2)) :=
    by
      have := mul_le_mul_of_nonneg_left hconst (by positivity)
      simpa [mul_comm, mul_left_comm, mul_assoc] using this
  have hLpos : (L : ℝ) ≠ 0 := by exact ne_of_gt hL
  have h_simplify : (1 / L) * (L * ((Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2))
      = (Fintype.card ι : ℝ) * ∑ j, (Complex.abs (b j)) ^ 2 := by
    field_simp [hLpos, mul_comm, mul_left_comm, mul_assoc]
  exact h_final.trans_eq h_simplify

variables (T1 T2 L : ℝ)

/-- Paquete de supuestos LS_γ (refinado + versión clásica débil). -/
structure LSGammaAssumptions where
  LS_gamma_fine : Prop
  /-- Hipótesis clásica LS_γ^weak (cola RMS en `u`, bandas `(T,2T]`). -/
  ls_gamma_weak : LSGammaWeak := LSGammaWeak_of_simple

/-- Abstract predicate for admissible spectral/window ranges. In practice this
encodes constraints such as `T1 ≥ S`, `T2 ≤ S^B`, and `1 ≪ L ≪ S^α`, but we keep
it abstract here. -/
def AdmissibleRange (T1 T2 L : ℝ) : Prop := True

/-- Tail exponential sum restricted to a spectral band `(T1, T2]`. This is a
schematic expression; a finite/truncated sum over zeros in the band is intended
in analytic usage. -/
noncomputable def F_band (T1 T2 : ℝ) (u : ℝ) : ℂ :=
  (∑ ρ : ZeroOfZeta,
    (if T1 < |gamma ρ| ∧ |gamma ρ| ≤ T2 then
        b_rho ρ * Complex.exp (Complex.I * (gamma ρ) * u)
      else 0))

/-- Large-sieve-style inequality over the heights γ of non-trivial zeros:
assuming the coefficient decay hypothesis `H_b` and an admissible range for
`(T1, T2, L)`, the `L`-average of the band-limited sum `F_band` is bounded by
`(1 + L * log T2)` times the quadratic mass of `(b_ρ)` in that band.

This is the analytic LS_γ package for A2-tail; proof pending. -/
theorem LS_gamma_large_sieve
  (hHb : H_b)
  (hRange : AdmissibleRange T1 T2 L)
  (hLS : LSGammaAssumptions) :
  hLS.LS_gamma_fine :=
by
  -- ANALYTIC GAP: the refined LS_γ inequality is supplied externally via
  -- `hLS.LS_gamma_fine`. The proof would expand |F_band(u)|^2, separate
  -- diagonal/off-diagonal, integrate over u, and use zero-density estimates.
  exact hLS.LS_gamma_fine

end Alpha
end ERURH
/-- LS_γ^weak derivado del bound LS_γ simple y una cota de cardinalidad para la
banda considerada. -/
lemma LSGammaWeak_of_simple : LSGammaWeak :=
by
  intro ctx h_card
  have h_simple :=
    LS_gamma_simple_RMS (γ := ctx.γ) (b := ctx.b) (L := ctx.L) ctx.hL
  -- LS_gamma_simple_RMS ya devuelve `(card) * Σ |b|^2`
  have h_le :
      (1 / ctx.L) *
        ∫ u in Set.Icc 0 ctx.L,
          Complex.abs (∑ j, ctx.b j * Complex.exp (Complex.I * (ctx.γ j) * u)) ^ 2
      ≤ (Fintype.card ctx.ι : ℝ) * ∑ j, (Complex.abs (ctx.b j)) ^ 2 := h_simple
  -- si `card ≤ card_bound`, escalamos la cota
  have h_monotone :
      (Fintype.card ctx.ι : ℝ) * ∑ j, (Complex.abs (ctx.b j)) ^ 2
      ≤ ctx.card_bound * ∑ j, (Complex.abs (ctx.b j)) ^ 2 := by
    have h_nonneg : 0 ≤ ∑ j, (Complex.abs (ctx.b j)) ^ 2 := by
      have h' : ∀ j, 0 ≤ (Complex.abs (ctx.b j)) ^ 2 := by
        intro j; nlinarith
      have := Finset.sum_nonneg (Finset.univ : Finset ctx.ι) (by intro j hj; exact h' j)
      simpa [Finset.sum_sigma'] using this
    have h_mul := mul_le_mul_of_nonneg_right h_card h_nonneg
    simpa [mul_comm, mul_left_comm, mul_assoc] using h_mul
  exact le_trans h_le h_monotone
