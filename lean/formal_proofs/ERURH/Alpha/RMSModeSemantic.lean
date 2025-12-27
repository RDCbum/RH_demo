import Mathlib
import ERURH.ERUModesCore
import ERURH.Alpha.GeneratedRMSContext

namespace ERURH
namespace Alpha

/-- Values of `|logR_alpha|` over the RMS window interval (semantic carrier). -/
def rms_semantic_values (w : GeneratedRMSContext.ctx_real.Window) : Set ℝ :=
  {x | ∃ s ∈ GeneratedRMSContext.ctx_real_window_interval w, x = |logR_alpha s|}

/-- Semantic RMS-style lower bound, defined as the infimum of window values. -/
noncomputable def rms_semantic (w : GeneratedRMSContext.ctx_real.Window) : ℝ :=
  sInf (rms_semantic_values w)

/-- Pointwise lower bounds imply a lower bound on the semantic RMS value. -/
theorem pointwise_to_rms_semantic
    (w : GeneratedRMSContext.ctx_real.Window)
    (K : ℝ)
    (hpoint : ∀ s ∈ GeneratedRMSContext.ctx_real_window_interval w, |logR_alpha s| ≥ K) :
    rms_semantic w ≥ K := by
  classical
  have h_nonempty : (rms_semantic_values w).Nonempty := by
    rcases GeneratedRMSContext.ctx_real_window_interval_nonempty w with ⟨s, hs⟩
    exact ⟨|logR_alpha s|, s, hs, rfl⟩
  have h_lower : ∀ x ∈ rms_semantic_values w, K ≤ x := by
    intro x hx
    rcases hx with ⟨s, hs, rfl⟩
    exact hpoint s hs
  exact le_csInf h_nonempty h_lower

end Alpha
end ERURH
