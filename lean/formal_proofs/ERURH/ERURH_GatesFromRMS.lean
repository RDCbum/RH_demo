import ERURH.ERURH_RMSLocalLemma
import ERURH.ERURH_GatesAlpha

/-
# Gates from RMS (Plan B, Ideas 1 & 2)

This module connects the RMS-local information to the alpha gates. It assumes
the RMS-local lemma (currently stated with a `sorry` in
`ERURH_RMSLocalLemma.lean`) and records the structural consequence: if a
β > 1/2 mode forces some window RMS above the formal envelope, then a gate
must open. No new axioms are introduced here; any pending analytic content
remains in the RMS-local lemma.

Narrative (Plan B):
* DominantMode with β > 1/2 ⇒ (by Ideas 1 & 2) some window has RMS above the
  envelope (RMS-local lemma).
* A window with RMS above the envelope contradicts closed renormalization
  gates.
* Therefore, under closed gates, such a dominant mode cannot exist.
-/

namespace ERURH

/-- If some window has alpha-layer RMS above the formal envelope, a gate must
open. The missing piece is the analytic inequality relating RMS to the envelope
used in `RenormGateClosed`. -/
lemma gate_opens_from_RMS_alpha
  (ctx : RMSLocalContext)
  (hRMS : ∃ w : ctx.Window, ctx.RMS_alpha w > C_envelope_formal) :
  ¬ ERURH.Alpha.RenormGateClosed ctx :=
by
  intro hClosed
  rcases hRMS with ⟨w, hgt⟩
  have h_bound : ctx.RMS_alpha w ≤ C_envelope_formal := hClosed.1 w
  exact not_lt_of_ge h_bound hgt

/-- Beta/smoothed version: RMS above the envelope forces a gate to open. -/
lemma gate_opens_from_RMS_beta
  (ctx : RMSLocalContext)
  (hRMS : ∃ w : ctx.Window, ctx.RMS_alpha w > C_envelope_formal) :
  ¬ ERURH.Alpha.RenormGateClosed ctx :=
by
  exact gate_opens_from_RMS_alpha ctx hRMS

/-- DominantMode + RMS-local witness + closed gates gives a contradiction.

Future plan:
1. Use `RMS_local_lemma` to obtain `HRMS` from `(DominantMode m)` and
   `ModeDominatesRMS m`.
2. Apply this theorem to rule out dominant modes when the renormalization gate
   is closed.
3. Combine with the standard chain “no modes with β > 1/2 ⇒ RH” to complete the
   Plan B route.
-/
theorem no_dominant_mode_if_gates_closed_and_RMS_local
  (ctx : RMSLocalContext)
  (HRMS : ∃ w : ctx.Window, ctx.RMS_alpha w > C_envelope_formal)
  (hRen : ERURH.Alpha.RenormGateClosed ctx) :
  False :=
by
  have hgate : ¬ ERURH.Alpha.RenormGateClosed ctx :=
    gate_opens_from_RMS_alpha ctx HRMS
  exact hgate hRen

end ERURH
