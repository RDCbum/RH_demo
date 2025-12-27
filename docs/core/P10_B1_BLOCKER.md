# P10 B.1 blocker (PointwiseToRMSMode)

Attempt file: `docs/core/P10_PointwiseToRMSMode_Try.lean`
Log: `docs/core/P10_PointwiseToRMSMode_Try.log`

## First blocking goal
```lean
⊢ ∃ K > Alpha.GeneratedRMSContext.ctx_real.c_low + Alpha.GeneratedRMSContext.ctx_real.c_tail + C_envelope_formal,
    Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window ≥ K
```

## Why this blocks
- `ERU_mode_beta` gives pointwise lower bounds on `|logR_alpha|`.
- `ctx_real.RMS_mode` is a numeric table from gate/data, with no definitional link to `logR_alpha`.
- The missing bridge is exactly the lemma noted in `docs/core/RB41_MISSING_BRIDGE_FACT.md`:
  a pointwise bound on `|logR_alpha|` over the window interval should imply a lower bound on
  `RMS_mode` for that window.

## Proposed Lean-first strategy (minimal)
1) Define an explicit `window_interval` for `ctx_real_window` (from the gate data window endpoints).
2) Define a semantic RMS functional (integral/L2 or certified lower bound) for `logR_alpha` on that window.
3) Prove a generic lemma: pointwise lower bound on `|logR_alpha|` over the window interval implies
   a lower bound on that RMS functional.
4) Add a bridge lemma equating (or lower-bounding) `ctx_real.RMS_mode` by the semantic RMS for the
   same window.

Once (3) and (4) exist, the goal above closes and Lemma B.1 becomes a theorem without new axioms.
