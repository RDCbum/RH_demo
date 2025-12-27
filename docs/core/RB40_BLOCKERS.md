# RB40 blockers (Lemma B.2 closed)

With `Alpha.ctx_real_window` the window choice is fixed. Current goal from
`docs/core/RB40_ModeToRMSMode_Try.log`:

```lean
⊢ ∃ K > Alpha.GeneratedRMSContext.ctx_real.c_low +
        Alpha.GeneratedRMSContext.ctx_real.c_tail + C_envelope_formal,
      Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window ≥ K
```

This isolates Lemma B.1: derive a lower bound on `RMS_mode` for the fixed window
from the pointwise growth bound in `ERU_mode_beta`.
