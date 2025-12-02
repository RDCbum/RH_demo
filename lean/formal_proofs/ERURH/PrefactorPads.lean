import Mathlib
import ERURH.FluxWindows

namespace ERURH

open scoped Real

noncomputable section

noncomputable def pf_log_q_wAlpha49_shift0 : ℚ :=
  ((974413429088416707 : ℚ) / (204800000000000000 : ℚ))

noncomputable def pf_log_q_wAlpha49_shift1 : ℚ :=
  ((998120722102293697 : ℚ) / (204800000000000000 : ℚ))

noncomputable def pf_log_tail_q : ℚ :=
  ((63852554371729108003367 : ℚ) / (5884235424000000000000 : ℚ))

noncomputable def pf_j_q_zero : ℚ := 0

noncomputable def pf_tail_arg_q : ℚ := 0

lemma pf_log_q_wAlpha49_shift0_nonneg : 0 ≤ pf_log_q_wAlpha49_shift0 := by
  have : (0 : ℚ) ≤ ((974413429088416707 : ℚ) / (204800000000000000 : ℚ)) := by
    norm_num
  simpa using this

lemma pf_log_q_wAlpha49_shift1_nonneg : 0 ≤ pf_log_q_wAlpha49_shift1 := by
  have : (0 : ℚ) ≤ ((998120722102293697 : ℚ) / (204800000000000000 : ℚ)) := by
    norm_num
  simpa using this

lemma pf_log_tail_q_nonneg : 0 ≤ pf_log_tail_q := by
  have :
      (0 : ℚ) ≤ ((63852554371729108003367 : ℚ) / (5884235424000000000000 : ℚ)) := by
    norm_num
  simpa using this

lemma pf_j_q_zero_nonneg : 0 ≤ pf_j_q_zero := by simpa

lemma pf_tail_arg_q_nonneg : 0 ≤ ((pf_tail_arg_q : ℚ) : ℝ) := by simpa

noncomputable def pf_log_q (w : Window) : ℚ :=
  if h0 : w = wAlpha49_shift0 then pf_log_q_wAlpha49_shift0
  else if h1 : w = wAlpha49_shift1 then pf_log_q_wAlpha49_shift1
  else pf_log_q_wAlpha49_shift1

noncomputable def pf_j_q (_w : Window) : ℚ := 0

noncomputable def pf_tail_log (_t : ℝ) : ℝ :=
  ((pf_log_tail_q : ℚ) : ℝ)

noncomputable def pf_tail_arg (_t : ℝ) : ℝ := 0

lemma pf_log_q_nonneg : ∀ w, 0 ≤ pf_log_q w := by
  intro w
  by_cases h0 : w = wAlpha49_shift0
  · simpa [pf_log_q, h0] using pf_log_q_wAlpha49_shift0_nonneg
  · by_cases h1 : w = wAlpha49_shift1
    · simpa [pf_log_q, h0, h1] using pf_log_q_wAlpha49_shift1_nonneg
    · simpa [pf_log_q, h0, h1] using pf_log_q_wAlpha49_shift1_nonneg

lemma pf_j_q_nonneg : ∀ w, 0 ≤ pf_j_q w := by simpa [pf_j_q]

lemma pf_tail_log_nonneg : ∀ t, 0 ≤ pf_tail_log t := by
  intro t
  have := pf_log_tail_q_nonneg
  exact_mod_cast this

lemma pf_tail_arg_nonneg : ∀ t, 0 ≤ pf_tail_arg t := by
  intro t
  simpa [pf_tail_arg] using (show (0 : ℝ) ≤ 0 from le_rfl)

end

end ERURH
