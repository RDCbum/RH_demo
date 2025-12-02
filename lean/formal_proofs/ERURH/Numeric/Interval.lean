import Mathlib
import ERURH.Numeric.Semantics

namespace ERURH
namespace Numeric.Interval

open scoped Real
open scoped BigOperators

private lemma one_add_sub_half (x : ℝ) : 1 + (x - (1 / 2)) = x + (1 / 2) := by
  ring

@[simp]
private lemma add_half_sub_half (x : ℝ) : x + (1 / 2) - (1 / 2) = x := by
  ring

private lemma floor_le_real (x : ℝ) (hx : 0 ≤ x) : (Nat.floor x : ℝ) ≤ x := by
  simpa using (Nat.floor_le hx : (⌊x⌋₊ : ℝ) ≤ x)

private lemma lt_floor_add_one_real (x : ℝ) : x < (Nat.floor x : ℝ) + 1 := by
  simpa using (Nat.lt_floor_add_one x : x < (⌊x⌋₊ : ℝ) + 1)

/-- Uniform grid covering a closed interval. -/
structure GridCover (a b : ℝ) :=
  (h : ℝ)
  (h_pos : 0 < h)
  (pts : List ℝ)
  (cover :
    ∀ {t : ℝ}, a ≤ t → t ≤ b →
      ∃ u ∈ pts, a ≤ u ∧ u ≤ b ∧ |t - u| ≤ h / 2)

/-- Uniform grid with mesh `h` and `n` steps starting at `a`. -/
def uniform_grid (a h : ℝ) (n : ℕ) : List ℝ :=
  (List.range (n + 1)).map (fun k => a + (k : ℝ) * h)

lemma uniform_grid_mem {a h : ℝ} {n k : ℕ} (hk : k ≤ n) :
    a + (k : ℝ) * h ∈ uniform_grid a h n := by
  classical
  unfold uniform_grid
  refine List.mem_map.mpr ?_
  refine ⟨k, ?_, ?_⟩
  ·
    have hk' : k < n + 1 := Nat.lt_succ_of_le hk
    simpa using List.mem_range.mpr hk'
  · simp

lemma uniform_grid_cover
    (a b h : ℝ) (n : ℕ)
    (h_pos : 0 < h)
    (length_eq : b = a + (n : ℝ) * h)
    {t : ℝ} (hta : a ≤ t) (htb : t ≤ b) :
    ∃ u ∈ uniform_grid a h n,
      a ≤ u ∧ u ≤ b ∧ |t - u| ≤ h / 2 := by
  classical
  by_cases hdeg : a = b
  ·
    cases hdeg
    have ht_eq : t = a := le_antisymm htb hta
    cases ht_eq
    refine ⟨a, ?_, le_rfl, le_rfl, ?_⟩
    ·
      have hk0 : (0 : ℕ) ≤ n := Nat.zero_le _
      simpa using uniform_grid_mem (a := a) (h := h) (n := n) (k := 0) hk0
    ·
      have hhalf_nonneg : 0 ≤ h / 2 := div_nonneg h_pos.le (by norm_num)
      simpa [abs_zero] using hhalf_nonneg
  ·
    set y : ℝ := (t - a) / h
    have hy_nonneg : 0 ≤ y := by
      have hta' : 0 ≤ t - a := sub_nonneg.mpr hta
      have hpos_le : 0 ≤ h := h_pos.le
      simpa [y] using div_nonneg hta' hpos_le
    have htb' : t ≤ a + (n : ℝ) * h := by simpa [length_eq] using htb
    have hy_le : y ≤ (n : ℝ) := by
      have : t - a ≤ (n : ℝ) * h := by
        have := sub_le_sub_right htb' a
        simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using this
      have := (div_le_iff₀ h_pos).mpr this
      simpa [y] using this
    have hy_half_nonneg : 0 ≤ y + 1 / 2 :=
      add_nonneg hy_nonneg (by norm_num)
    set k0 : ℕ := Nat.floor (y + 1 / 2)
    set k : ℕ := Nat.min k0 n
    set u : ℝ := a + (k : ℝ) * h
    have hk_le_n : k ≤ n := by
      simpa [k] using Nat.min_le_right k0 n
    have hk_le_k0 : k ≤ k0 := by
      simpa [k] using Nat.min_le_left k0 n
    have hu_mem : u ∈ uniform_grid a h n := by
      simpa [u] using uniform_grid_mem (a := a) (h := h) (n := n) (k := k) hk_le_n
    have hk_nonneg : 0 ≤ (k : ℝ) := by exact_mod_cast (Nat.zero_le k)
    have hu_lower : a ≤ u := by
      have : 0 ≤ (k : ℝ) * h := mul_nonneg hk_nonneg h_pos.le
      simpa [u] using add_le_add_left this a
    have hk_cast_le : (k : ℝ) ≤ (n : ℝ) := by exact_mod_cast hk_le_n
    have hu_upper : u ≤ b := by
      have : (k : ℝ) * h ≤ (n : ℝ) * h :=
        mul_le_mul_of_nonneg_right hk_cast_le h_pos.le
      have : a + (k : ℝ) * h ≤ a + (n : ℝ) * h := by
        simpa [add_comm, add_left_comm, add_assoc] using add_le_add_left this a
      simpa [u, length_eq] using this
    have hk0_le' : (k0 : ℝ) ≤ y + 1 / 2 := by
      simpa [k0] using floor_le_real (y + 1 / 2) hy_half_nonneg
    have hy_lt_succ : y + 1 / 2 < (k0 : ℝ) + 1 := by
      simpa [k0] using lt_floor_add_one_real (y + 1 / 2)
    have hy_lt : y < (k0 : ℝ) + 1 / 2 := by
      have hy_lt_succ' := hy_lt_succ
      linarith [hy_lt_succ']
    have hy_upper_k0 : y - (k0 : ℝ) ≤ 1 / 2 := by
      have := sub_lt_sub_right hy_lt (k0 : ℝ)
      have hy' : y - (k0 : ℝ) < 1 / 2 := by
        simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using this
      exact hy'.le
    have hy_lower_k0 : -(1 / 2) ≤ y - (k0 : ℝ) := by
      have : (k0 : ℝ) - 1 / 2 ≤ y :=
        (sub_le_iff_le_add).mpr (by simpa [add_comm, add_left_comm, add_assoc] using hk0_le')
      have := sub_le_sub_right this (k0 : ℝ)
      simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using this
    have hy_k0 :
        |y - (k0 : ℝ)| ≤ 1 / 2 := abs_le.mpr ⟨hy_lower_k0, hy_upper_k0⟩
    have hy_bounds :
        |y - (k : ℝ)| ≤ 1 / 2 := by
      classical
      by_cases hk0_le : k0 ≤ n
      ·
        have hk_eq : k = k0 := by
          simpa [k, hk0_le] using Nat.min_eq_left hk0_le
        simpa [hk_eq] using hy_k0
      ·
        have hn_lt : n < k0 := Nat.lt_of_not_ge hk0_le
        have hn_le : n ≤ k0 := hn_lt.le
        have hk_eq : k = n := by
          simpa [k, hn_le] using Nat.min_eq_right hn_le
        have hn_cast : (n : ℝ) ≤ (k0 : ℝ) := by exact_mod_cast hn_le
        have hy_ge_aux : (n : ℝ) ≤ y + 1 / 2 := hn_cast.trans hk0_le'
        have hy_lower_n : (n : ℝ) - 1 / 2 ≤ y :=
          (sub_le_iff_le_add).mpr
            (by simpa [add_comm, add_left_comm, add_assoc] using hy_ge_aux)
        have hy_lower_n' : -(1 / 2) ≤ y - (n : ℝ) := by
          have := sub_le_sub_right hy_lower_n (n : ℝ)
          simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using this
        have hy_upper_n : y - (n : ℝ) ≤ 1 / 2 := by
          have : y - (n : ℝ) ≤ 0 := sub_nonpos.mpr hy_le
          have hhalf_nonneg : (0 : ℝ) ≤ 1 / 2 := by norm_num
          exact this.trans hhalf_nonneg
        have hy_abs_n :
            |y - (n : ℝ)| ≤ 1 / 2 := abs_le.mpr ⟨hy_lower_n', hy_upper_n⟩
        simpa [hk_eq] using hy_abs_n
    have h_ne : h ≠ 0 := ne_of_gt h_pos
    have hy_mul : y * h = t - a := by
      have : ((t - a) / h) * h = t - a := div_mul_cancel₀ _ h_ne
      simpa [y] using this
    have hy_eq : t = a + y * h := by
      calc
        t = a + (t - a) := by
          simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc]
        _ = a + y * h := by simpa [hy_mul, add_comm, add_left_comm, add_assoc]
    have hdiff :
        t - u = (y - (k : ℝ)) * h := by
      calc
        t - u = (t - a) - (k : ℝ) * h := by
          simp [u, sub_eq_add_neg, add_comm, add_left_comm, add_assoc]
        _ = y * h - (k : ℝ) * h := by simpa [hy_mul]
        _ = (y - (k : ℝ)) * h := by ring
    have h_abs :
        |t - u| = |y - (k : ℝ)| * h := by
      have : |t - u| = |(y - (k : ℝ)) * h| := by simpa [hdiff]
      simpa [abs_mul, abs_of_pos h_pos, mul_comm] using this
    have hdist : |t - u| ≤ h / 2 := by
      have : |y - (k : ℝ)| * h ≤ (1 / 2) * h :=
        mul_le_mul_of_nonneg_right hy_bounds h_pos.le
      simpa [h_abs, one_div, mul_comm, mul_left_comm, mul_assoc] using this
    exact ⟨u, hu_mem, hu_lower, hu_upper, hdist⟩

/-- Maximum bound across a list of segments. -/
def segmentMax (bound : (ℝ × ℝ) → ℝ) : List (ℝ × ℝ) → ℝ
  | [] => 0
  | s :: segs => max (bound s) (segmentMax bound segs)

lemma segmentMax_const
    {bound : (ℝ × ℝ) → ℝ} {segs : List (ℝ × ℝ)} {c : ℝ}
    (hconst : ∀ s ∈ segs, bound s = c) (hc0 : 0 ≤ c) :
    segmentMax bound segs ≤ c := by
  classical
  induction segs with
  | nil =>
      simpa [segmentMax] using hc0
  | cons s segs ih =>
      have hhead : bound s = c := hconst s (by simp)
      have htail : ∀ t ∈ segs, bound t = c := by
        intro t ht
        exact hconst t (by simp [ht])
      have ih' := ih htail
      have hb_le : bound s ≤ c := by simpa [hhead]
      have hmax : max (bound s) (segmentMax bound segs) ≤ c :=
        max_le_iff.mpr ⟨hb_le, ih'⟩
      simpa [segmentMax] using hmax

lemma le_segmentMax_of_mem {bound : (ℝ × ℝ) → ℝ}
    {segs : List (ℝ × ℝ)} {s : ℝ × ℝ} (hs : s ∈ segs) :
    bound s ≤ segmentMax bound segs := by
  induction segs with
  | nil =>
      cases hs
  | cons s' segs ih =>
      simp [List.mem_cons] at hs
      rcases hs with hs | hs
      · cases hs
        simpa [segmentMax] using (le_max_left (bound s') (segmentMax bound segs))
      ·
        have htail : bound s ≤ segmentMax bound segs := ih hs
        have : bound s ≤ max (bound s') (segmentMax bound segs) :=
          htail.trans (le_max_right _ _)
        simpa [segmentMax] using this

/--
If a function is Lipschitz with constant `L` on `[a, b]` and every grid point is bounded by `M`,
then every point of the interval is bounded by `M + L * h / 2`, where `h` is the mesh size.
-/
theorem sup_le_from_grid_Lip
    (f : ℝ → ℝ) (a b L M : ℝ) (gc : GridCover a b)
    (hL : 0 ≤ L)
    (lip : ∀ {x y : ℝ}, a ≤ x → x ≤ b → a ≤ y → y ≤ b → |f x - f y| ≤ L * |x - y|)
    (hSamples : ∀ {u : ℝ}, u ∈ gc.pts → f u ≤ M) :
    ∀ {t : ℝ}, a ≤ t → t ≤ b → f t ≤ M + L * (gc.h / 2) := by
  intro t hta htb
  obtain ⟨u, hu_pts, hau, hub, hdist⟩ := gc.cover hta htb
  have hdiff_le : f t - f u ≤ L * |t - u| := (abs_le.mp (lip hta htb hau hub)).2
  have hft_le : f t ≤ f u + L * |t - u| := by
    have := add_le_add_right hdiff_le (f u)
    simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using this
  have hLipBound : L * |t - u| ≤ L * (gc.h / 2) :=
    mul_le_mul_of_nonneg_left hdist hL
  have hfu_le : f u ≤ M := hSamples hu_pts
  have := add_le_add hfu_le hLipBound
  have := le_trans hft_le this
  simpa [mul_comm, mul_left_comm, mul_assoc, one_div] using this

/--
If every subsegment carries its own bound `bound s`, then the entire interval is controlled by the
maximum of those bounds.
-/
theorem sup_le_union
    (f : ℝ → ℝ) (a b : ℝ)
    (segs : List (ℝ × ℝ)) (bound : (ℝ × ℝ) → ℝ)
    (hcover :
      ∀ {t : ℝ}, a ≤ t → t ≤ b →
        ∃ s ∈ segs, s.1 ≤ t ∧ t ≤ s.2)
    (hle :
      ∀ {s : ℝ × ℝ}, s ∈ segs →
        ∀ {t : ℝ}, s.1 ≤ t → t ≤ s.2 → f t ≤ bound s) :
    ∀ {t : ℝ}, a ≤ t → t ≤ b → f t ≤ segmentMax bound segs := by
  intro t hta htb
  obtain ⟨s, hs, hs_lo, hs_hi⟩ := hcover hta htb
  calc
    f t ≤ bound s := hle hs hs_lo hs_hi
    _ ≤ segmentMax bound segs := le_segmentMax_of_mem hs

theorem lip_of_deriv_bdd_on
    (f : ℝ → ℝ) (a b L : ℝ)
    (hab : a ≤ b) (hL : 0 ≤ L)
    (hf : DifferentiableOn ℝ f (Set.Icc a b))
    (hDer : ∀ x ∈ Set.Icc a b, |deriv f x| ≤ L) :
    ∀ {x y : ℝ}, x ∈ Set.Icc a b → y ∈ Set.Icc a b → |f x - f y| ≤ L * |x - y| := by
  classical
  have aux :
      ∀ {u v : ℝ}, u ∈ Set.Icc a b → v ∈ Set.Icc a b → u ≤ v →
        |f v - f u| ≤ L * (v - u) := by
    intro u v hu hv huv
    by_cases h_eq : u = v
    · subst h_eq
      simp [abs_zero, sub_self]
    have huv_lt : u < v := lt_of_le_of_ne huv h_eq
    have hu_bounds := Set.mem_Icc.mp hu
    have hv_bounds := Set.mem_Icc.mp hv
    have subset_Icc : Set.Icc u v ⊆ Set.Icc a b := by
      intro z hz
      have hz_bounds := Set.mem_Icc.mp hz
      exact ⟨hu_bounds.1.trans hz_bounds.1, hz_bounds.2.trans hv_bounds.2⟩
    have subset_Ioo : Set.Ioo u v ⊆ Set.Icc a b := by
      intro z hz
      exact subset_Icc ⟨hz.1.le, hz.2.le⟩
    have hf_uv : DifferentiableOn ℝ f (Set.Icc u v) := hf.mono subset_Icc
    have hcont : ContinuousOn f (Set.Icc u v) := hf_uv.continuousOn
    have hdiff :
        DifferentiableOn ℝ f (Set.Ioo u v) :=
      hf_uv.mono Set.Ioo_subset_Icc_self
    obtain ⟨c, hc_mem, hc_slope⟩ :=
      exists_deriv_eq_slope (f := f) (a := u) (b := v) huv_lt hcont hdiff
    have hc_bounds : c ∈ Set.Icc a b := subset_Ioo hc_mem
    have h_deriv_bound : |deriv f c| ≤ L := hDer c hc_bounds
    have h_ne : v - u ≠ 0 := sub_ne_zero.mpr (ne_of_gt huv_lt)
    have h_eq :
        deriv f c * (v - u) = f v - f u := (eq_div_iff_mul_eq h_ne).1 hc_slope
    have h_nonneg : 0 ≤ v - u := sub_nonneg.mpr huv
    have h_abs :
        |f v - f u| = |deriv f c| * (v - u) := by
      have h_eq' : f v - f u = deriv f c * (v - u) := by
        simpa using h_eq.symm
      calc
        |f v - f u| = |deriv f c * (v - u)| := by simpa [h_eq']
        _ = |deriv f c| * |v - u| := abs_mul _ _
        _ = |deriv f c| * (v - u) := by simpa [abs_of_nonneg h_nonneg]
    have : |f v - f u| ≤ L * (v - u) := by
      have := mul_le_mul_of_nonneg_right h_deriv_bound h_nonneg
      simpa [h_abs] using this
    simpa using this
  intro x y hx hy
  have hx_bounds := Set.mem_Icc.mp hx
  have hy_bounds := Set.mem_Icc.mp hy
  cases le_total x y with
  | inl hxy =>
      have h := aux hx hy hxy
      have hx_abs : y - x = |x - y| := by
        have hx_nonpos : x - y ≤ 0 := sub_nonpos.mpr hxy
        simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using
          (abs_of_nonpos hx_nonpos).symm
      have h' : |f x - f y| ≤ L * (y - x) := by
        simpa [abs_sub_comm] using h
      have hx_abs' : |x - y| = y - x := hx_abs.symm
      have : |f x - f y| ≤ L * |x - y| := by
        simpa [hx_abs'] using h'
      exact this
  | inr hyx =>
      have h := aux hy hx hyx
      have hy_abs : x - y = |x - y| := by
        have hy_nonneg : 0 ≤ x - y := sub_nonneg.mpr hyx
        simpa using (abs_of_nonneg hy_nonneg).symm
      have h' : |f x - f y| ≤ L * (x - y) := by
        simpa using h
      have hy_abs' : |x - y| = x - y := hy_abs.symm
      have : |f x - f y| ≤ L * |x - y| := by
        simpa [hy_abs'] using h'
      exact this


lemma lipschitz_const_mul
    {f : ℝ → ℝ} {a b L c : ℝ} (hc : 0 ≤ c)
    (lip :
      ∀ {x y : ℝ},
        x ∈ Set.Icc a b → y ∈ Set.Icc a b →
          |f x - f y| ≤ L * |x - y|) :
    ∀ {x y : ℝ},
      x ∈ Set.Icc a b → y ∈ Set.Icc a b →
        |(c * f x) - (c * f y)| ≤ (c * L) * |x - y| := by
  intro x y hx hy
  have h := mul_le_mul_of_nonneg_left (lip hx hy) hc
  have h_left :
      c * |f x - f y| = |(c * f x) - (c * f y)| := by
    have hc_abs : |c| = c := abs_of_nonneg hc
    calc
      c * |f x - f y|
          = |c| * |f x - f y| := by simpa [hc_abs]
      _ = |c * (f x - f y)| := by simp [abs_mul]
      _ = |(c * f x) - (c * f y)| := by
        simp [mul_sub]
  have h_right :
      c * (L * |x - y|) = (c * L) * |x - y| := by
    simp [mul_comm, mul_left_comm, mul_assoc]
  simpa [h_left, h_right] using h

lemma lipschitz_abs_of
    {f : ℝ → ℝ} {a b L : ℝ}
    (lip :
      ∀ {x y : ℝ},
        x ∈ Set.Icc a b → y ∈ Set.Icc a b →
          |f x - f y| ≤ L * |x - y|) :
    ∀ {x y : ℝ},
      x ∈ Set.Icc a b → y ∈ Set.Icc a b →
        abs (|f x| - |f y|) ≤ L * |x - y| := by
  intro x y hx hy
  have h := lip hx hy
  exact (abs_abs_sub_abs_le_abs_sub _ _).trans h

end Numeric.Interval
end ERURH
