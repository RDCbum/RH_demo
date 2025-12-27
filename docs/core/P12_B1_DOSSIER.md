# P12 B.1 dossier (PointwiseToRMSMode)

## Goal (from P12_B1_TRY.log)
```lean
⊢ ∃ K > Alpha.GeneratedRMSContext.ctx_real.c_low + Alpha.GeneratedRMSContext.ctx_real.c_tail + C_envelope_formal,
    Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window ≥ K
```

## Why it does not close today
- `ERU_mode_beta` only provides pointwise lower bounds on `|logR_alpha|`.
- `ctx_real.RMS_mode` is a numeric table from gate/data, with no semantic definition tied to `logR_alpha`.
- There is no `window_interval` definition for `ctx_real_window` in the formal context.
- The only structural link in `RMSLocalContext` is `RMS_decomp`, which does not connect to pointwise bounds.
- A bridge lemma is missing that turns pointwise bounds on `|logR_alpha|` over a window into a lower bound on `RMS_mode`.

## Missing definitions/bridge
- A precise `window_interval` for `ctx_real_window` (endpoints in data + Lean).
- A semantic RMS functional (or certified lower bound) tied to `logR_alpha` over that interval.
- A lemma stating: pointwise lower bound on `|logR_alpha|` over the interval implies a lower bound on the semantic RMS.
- A certificate/bridge that the table `ctx_real.RMS_mode` bounds (or equals) that semantic RMS.
