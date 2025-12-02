import Mathlib.Data.Real.Basic
import Mathlib.Data.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import ERURH.RH
import ERURH.XiCore

namespace ERURH

open Complex Real

local notation "λ₀" => ((1 : ℂ) / 2)

lemma crit_ne_zero (t : ℝ) : crit t ≠ 0 := by
  intro h
  have hre := congrArg Complex.re h
  simp [crit] at hre

lemma crit_ne_one (t : ℝ) : crit t ≠ 1 := by
  intro h
  have hre := congrArg Complex.re h
  simp [crit] at hre

lemma crit_ne_neg_one (t : ℝ) : crit t ≠ -1 := by
  intro h
  have hre := congrArg Complex.re h
  simp [crit] at hre

lemma crit_sub_one_ne_zero (t : ℝ) : crit t - 1 ≠ 0 := by
  have : crit t ≠ 1 := crit_ne_one t
  simpa using sub_ne_zero.mpr this

lemma crit_mul_one_sub_crit (t : ℝ) :
    crit t * (1 - crit t) = Complex.ofReal (t ^ 2 + (1 : ℝ) / 4) := by
  simp [crit, pow_two, mul_add, add_comm, add_left_comm, add_assoc]

lemma abs_s_mul_one_sub_s_over_two_on_crit (t : ℝ) :
    Complex.abs (crit t * (1 - crit t) / 2) =
      (t ^ 2 + (1 : ℝ) / 4) / 2 := by
  have hmul := crit_mul_one_sub_crit t
  have hreal :
      crit t * (1 - crit t) / 2 =
        Complex.ofReal ((t ^ 2 + (1 : ℝ) / 4) / 2) := by
    simpa [hmul, Complex.ofReal_div, Complex.ofReal_mul, mul_comm,
      mul_left_comm, mul_assoc]
  have hpos :
      0 < (t ^ 2 + (1 : ℝ) / 4) / 2 := by
    have ht : 0 ≤ t ^ 2 := sq_nonneg t
    have hquarter : (0 : ℝ) < (1 : ℝ) / 4 := by norm_num
    have hsum := add_pos_of_nonneg_of_pos ht hquarter
    simpa using half_pos hsum
  have := congrArg Complex.abs hreal
  simpa [Complex.abs.ofReal, abs_of_pos hpos] using this

lemma lambdaCore_ne_zero_on_crit (t : ℝ) :
    lambdaCore (crit t) ≠ 0 := by
  have hpi : Complex.ofReal Real.pi ≠ (0 : ℂ) := by
    have : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
    simpa using this
  have h_cpow :
      (Complex.ofReal Real.pi) ^ (-(crit t / 2)) ≠ 0 :=
    Complex.cpow_ne_zero hpi _
  have hGamma :
      Complex.Gamma (crit t / 2) ≠ 0 :=
    Complex.Gamma_ne_zero _
  simpa [lambdaCore, mul_comm, mul_left_comm, mul_assoc]
    using mul_ne_zero h_cpow hGamma

lemma prefactor_ne_zero_on_crit (t : ℝ) :
    prefactor (crit t) ≠ 0 := by
  have hlam := lambdaCore_ne_zero_on_crit t
  have hs : crit t ≠ 0 := crit_ne_zero t
  have h1s : 1 - crit t ≠ 0 := by
    have : crit t ≠ 1 := crit_ne_one t
    simpa [sub_eq_add_neg, add_comm] using this
  have hpoly :
      ((1 : ℂ) / 2) * crit t * (1 - crit t) ≠ 0 := by
    have hc : ((1 : ℂ) / 2) ≠ 0 := by norm_num
    exact mul_ne_zero (mul_ne_zero hc hs) h1s
  simpa [prefactor, lambdaCore, mul_comm, mul_left_comm, mul_assoc]
    using mul_ne_zero hpoly hlam

lemma prefactor_log_split_on_crit (t : ℝ) :
    Real.log (Complex.abs (prefactor (crit t))) =
      Real.log (Complex.abs (lambdaCore (crit t))) +
        Real.log ((t ^ 2 + (1 : ℝ) / 4) / 2) := by
  have hlam_pos :
      0 < Complex.abs (lambdaCore (crit t)) :=
    Complex.abs.pos.mpr (lambdaCore_ne_zero_on_crit t)
  have hpad_pos :
      0 < (t ^ 2 + (1 : ℝ) / 4) / 2 := by
    have ht : 0 ≤ t ^ 2 := sq_nonneg t
    have hquarter : (0 : ℝ) < (1 : ℝ) / 4 := by norm_num
    have hsum := add_pos_of_nonneg_of_pos ht hquarter
    simpa using half_pos hsum
  have hhalf :
      Complex.abs (((1 : ℂ) / 2) * crit t * (1 - crit t)) =
        (t ^ 2 + (1 : ℝ) / 4) / 2 := by
    simpa [mul_comm, mul_left_comm, mul_assoc]
      using abs_s_mul_one_sub_s_over_two_on_crit t
  have hpref :
      Complex.abs (prefactor (crit t)) =
        Complex.abs (lambdaCore (crit t)) *
          ((t ^ 2 + (1 : ℝ) / 4) / 2) := by
    simp [prefactor, lambdaCore, Complex.abs.mul, hhalf,
      mul_comm, mul_left_comm, mul_assoc]
  have := Real.log_mul hlam_pos hpad_pos
  simpa [hpref, add_comm, add_left_comm, add_assoc] using this

lemma real_part_inv_ofReal_add_im (a b : ℝ) :
    (1 / (Complex.ofReal a + Complex.I * b)).re =
      a / (a ^ 2 + b ^ 2) := by
  have hz :
      1 / (Complex.ofReal a + Complex.I * b) =
        (Complex.conj (Complex.ofReal a + Complex.I * b)) /
          (Complex.absSq (Complex.ofReal a + Complex.I * b)) := by
    simpa using Complex.inv_def (Complex.ofReal a + Complex.I * b)
  have hconj :
      Complex.conj (Complex.ofReal a + Complex.I * b) =
        Complex.ofReal a - Complex.I * b := by
    simp [Complex.conj, add_comm, add_left_comm, add_assoc]
  have hsq :
      (Complex.absSq (Complex.ofReal a + Complex.I * b) : ℂ) =
        (a ^ 2 + b ^ 2 : ℝ) := by
    simp [Complex.absSq, add_comm, add_left_comm, add_assoc, pow_two]
  have hreal :
      (Complex.absSq (Complex.ofReal a + Complex.I * b) : ℝ) =
        a ^ 2 + b ^ 2 := rfl
  simp [hz, hconj, hsq, Complex.ofReal_div, Complex.ofReal_sub, hreal,
    add_comm, add_left_comm, add_assoc, mul_comm, mul_left_comm,
    mul_assoc, pow_two, sub_eq_add_neg] with real_simp

lemma inv_one_sub_eq_neg_inv_sub_one (t : ℝ) :
    1 / (1 - crit t) = -(1 / (crit t - 1)) := by
  have hrepr : 1 - crit t = -(crit t - 1) := by ring
  have hne : crit t - 1 ≠ 0 := crit_sub_one_ne_zero t
  have hne' : 1 - crit t ≠ 0 := by
    have : crit t ≠ 1 := crit_ne_one t
    simpa using this
  have : (1 : ℂ) / (1 - crit t) =
      (-(crit t - 1))⁻¹ := by simp [hrepr]
  simpa [one_div, hrepr, hne, hne', inv_neg] using this

noncomputable def prefactor_poly (z : ℂ) : ℂ :=
  λ₀ * z * (1 - z)

lemma prefactor_eq_poly_mul_lambda (z : ℂ) :
    prefactor z = prefactor_poly z * lambdaCore z := by
  simp [prefactor, prefactor_poly, lambdaCore, mul_comm,
    mul_left_comm, mul_assoc]

lemma prefactor_poly_ne_zero_on_crit (t : ℝ) :
    prefactor_poly (crit t) ≠ 0 := by
  have : crit t ≠ 0 := crit_ne_zero t
  have hp : 1 - crit t ≠ 0 := by
    have : crit t ≠ 1 := crit_ne_one t
    simpa [sub_eq_add_neg, add_comm] using this
  have hconst : λ₀ ≠ 0 := by norm_num
  exact mul_ne_zero (mul_ne_zero hconst this) hp

lemma prefactor_poly_logderiv (t : ℝ) :
    (deriv prefactor_poly (crit t) / prefactor_poly (crit t)) =
      1 / crit t + 1 / (crit t - 1) := by
  have hderiv :
      deriv prefactor_poly =
        fun z : ℂ => λ₀ * (1 - 2 * z) := by
    funext z
    have hz :
        deriv (fun z : ℂ => z * (1 - z)) z = 1 - 2 * z := by
      have := deriv_mul (fun z : ℂ => z) (fun z : ℂ => 1 - z) z
      simpa [sub_eq_add_neg, one_mul, mul_comm, mul_left_comm, mul_assoc]
        using this
    simp [prefactor_poly, hz, mul_comm, mul_left_comm, mul_assoc]
  have hval :
      deriv prefactor_poly (crit t) =
        λ₀ * (1 - 2 * crit t) := by
    simpa using congrArg (fun f => f (crit t)) hderiv
  have hneq : prefactor_poly (crit t) ≠ 0 :=
    prefactor_poly_ne_zero_on_crit t
  have hs0 : crit t ≠ 0 := crit_ne_zero t
  have hs1 : crit t - 1 ≠ 0 := crit_sub_one_ne_zero t
  have hs1' : 1 - crit t ≠ 0 := by
    have : crit t ≠ 1 := crit_ne_one t
    simpa [sub_eq_add_neg, add_comm] using this
  have hnum :
      λ₀ * (1 - 2 * crit t) =
        λ₀ * (1 - crit t) * (1 / crit t - 1 / (1 - crit t)) := by
    field_simp [mul_comm, mul_left_comm, mul_assoc, hs0, hs1', two_ne_zero]
  have hden :
      prefactor_poly (crit t) =
        λ₀ * crit t * (1 - crit t) := rfl
  have :
      (deriv prefactor_poly (crit t) / prefactor_poly (crit t)) =
        (1 - 2 * crit t) / (crit t * (1 - crit t)) := by
    field_simp [hval, hden, hs0, hs1', two_ne_zero]
  have hgoal :
      (1 - 2 * crit t) / (crit t * (1 - crit t)) =
        1 / crit t + 1 / (crit t - 1) := by
    field_simp [hs0, hs1, sub_eq_add_neg, add_comm, add_left_comm,
      add_assoc, two_ne_zero]
  simpa [this] using hgoal

lemma prefactor_logderiv_split (t : ℝ) :
    (deriv prefactor (crit t) / prefactor (crit t)) =
      (deriv lambdaCore (crit t) / lambdaCore (crit t)) +
        (1 / crit t + 1 / (crit t - 1)) := by
  classical
  have hpref :
      prefactor =
        fun z : ℂ => prefactor_poly z * lambdaCore z := by
    funext z
    simp [prefactor_eq_poly_mul_lambda]
  have hneq : prefactor (crit t) ≠ 0 :=
    prefactor_ne_zero_on_crit t
  have hlam : lambdaCore (crit t) ≠ 0 :=
    lambdaCore_ne_zero_on_crit t
  have hpoly : prefactor_poly (crit t) ≠ 0 :=
    prefactor_poly_ne_zero_on_crit t
  have hsplit :
      (deriv prefactor (crit t) / prefactor (crit t)) =
        (deriv prefactor_poly (crit t) / prefactor_poly (crit t)) +
          (deriv lambdaCore (crit t) / lambdaCore (crit t)) := by
    have hmul :=
      deriv_mul (fun z => prefactor_poly z)
        (fun z => lambdaCore z) (crit t)
    have hnum :
        deriv prefactor (crit t) =
          deriv prefactor_poly (crit t) * lambdaCore (crit t) +
            prefactor_poly (crit t) * deriv lambdaCore (crit t) := by
      simpa [hpref, mul_comm, mul_left_comm, mul_assoc] using hmul
    field_simp [hmul, hpref, prefactor_eq_poly_mul_lambda, hnum,
      hneq, hlam, hpoly, mul_comm, mul_left_comm, mul_assoc]
  simpa [hsplit, prefactor_poly_logderiv t, add_comm, add_left_comm,
    add_assoc]

lemma re_one_over_s_plus_one_over_s_sub_one_on_crit (t : ℝ) :
    Complex.realPart (1 / crit t + 1 / (crit t - 1)) = 0 := by
  have h1 :
      (1 / crit t).re = ((1 : ℝ) / 2) / (t ^ 2 + 1 / 4) := by
    have :
        crit t = Complex.ofReal (1 / 2 : ℝ) + Complex.I * t := by
      simp [crit, sub_eq_add_neg, add_comm, add_left_comm, add_assoc]
    simpa [this, pow_two, add_comm, add_left_comm, add_assoc]
      using real_part_inv_ofReal_add_im (1 / 2 : ℝ) t
  have h2 :
      (1 / (crit t - 1)).re = (-(1 : ℝ) / 2) / (t ^ 2 + 1 / 4) := by
    have :
        crit t - 1 =
          Complex.ofReal (-(1 / 2 : ℝ)) + Complex.I * t := by
      simp [crit, sub_eq_add_neg, add_comm, add_left_comm, add_assoc]
    simpa [this, pow_two, add_comm, add_left_comm, add_assoc]
      using real_part_inv_ofReal_add_im (-(1 / 2 : ℝ)) t
  have :
      ((1 : ℝ) / 2) / (t ^ 2 + 1 / 4) +
          (-(1 : ℝ) / 2) / (t ^ 2 + 1 / 4) = 0 := by
    ring
  simpa [Complex.realPart, add_comm, add_left_comm, add_assoc,
    h1, h2, add_eq_zero_iff_eq_neg] using this

end ERURH
