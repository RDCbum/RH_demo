# RB38 ModeToRMSMode definitions dossier (summary)

Key shapes (from `docs/core/RB38_MODE_TO_RMS_MODE_DEFS.txt`):
- `ERURH.ERU_mode_beta` is a pointwise lower bound on `|logR_alpha s|` for all `s ≥ s0`.
- `ERURH.RMSLocalContext` is an abstract record with fields `RMS_alpha`, `RMS_mode`, `RMS_low`, `RMS_tail`, constants `c_low/c_tail`, and a single inequality field `RMS_decomp` relating them.
- `ERURH.A1_mode` is an existential statement about a window `w` and a threshold `K` with `RMS_mode w ≥ K` and `K` above `c_low + c_tail + C_envelope_formal`.
- `Alpha.GeneratedRMSContext.ctx_real.Window` is `Fin n_windows` (here `n_windows = 1`).
- `ctx_real.RMS_mode` is the generated function `rmsMode` backed by the fixed list `rmsModeList`; `ctx_real.RMS_alpha` is the constant function `cEnvelopeCtx`.
- `RMS_decomp` in the context is just the inequality field `RMS_alpha w ≥ RMS_mode w - (RMS_low w + RMS_tail w)`.

Interpretation
- In the current generated context, `RMS_mode` is a table of rational constants (data/gate), not an integral or L2 norm of `logR_alpha`.
- There is no definitional bridge from `logR_alpha` to `RMS_mode`; the only structural link available in `RMSLocalContext` is `RMS_decomp`.

What is missing for B.1
- A new analytic bridge lemma is needed to relate the pointwise lower bound in `ERU_mode_beta` to the `RMS_mode` table for `ctx_real`.
- Concretely, the proof needs a statement of the form:
  “pointwise growth of `|logR_alpha|` on a window implies a lower bound on `ctx_real.RMS_mode w`.”
  Without this, the existential `∃ w K, ctx_real.RMS_mode w ≥ K` cannot be derived from `ERU_mode_beta`.
