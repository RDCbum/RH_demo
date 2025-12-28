# P32 Window-threshold target (minimal gap)

## (i) Current gap statement (Lean)

Source: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean:15-18`

```lean
def SupercriticalModeAppliesOnCtxRealWindow : Prop :=
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
    ∀ s ∈ GeneratedRMSContext.ctx_real_window_interval ctx_real_window,
      |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)
```

## (ii) Equivalent minimal step (windowMin ≥ s0)

From `ERU_mode_beta` (`lean/formal_proofs/ERURH/ERUModesCore.lean:11-13`):

```lean
def ERU_mode_beta (β : ℝ) : Prop :=
  ∃ s0 : ℝ, ∀ {s : ℝ}, s ≥ s0 →
    |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)
```

To use this on the fixed window interval, it is enough to show:

`windowMin ctx_real_window ≥ s0`,
because then every `s` in `ctx_real_window_interval` satisfies `s ≥ s0`.

This is the only missing logical step (see `docs/core/P28_WINDOW_BRIDGE_PROOF_DRAFT.md:13-27`).

## (iii) Sufficient additional information

Any one of the following would close the gap:

- **Explicit threshold control (per β):**
  `∃ s0 ≤ windowMin ctx_real_window, ∀ s ≥ s0, ...`
  (see `docs/core/P30_ModeThresholdControl.lean:10-14`).
- **Uniform bound:** a fixed `S` such that every witness `s0` can be chosen
  with `s0 ≤ S ≤ windowMin ctx_real_window`.
- **Alternative analytic lemma:** a proof that the ERU mode bound holds on
  all `s ∈ I_ctx` directly, bypassing the existential threshold.

## Table: possible sources of a bound

| Possible source | Status | Reference |
| --- | --- | --- |
| Explicit lemma in the paper (Mode threshold control) | OPEN | `docs/core/P30_MODE_THRESHOLD_CONTROL.md` |
| Existing Lean lemma bounding `s0` | NOT FOUND | `docs/core/P31_THRESHOLD_SEARCH.md` |
| Gate-certified numeric threshold | NOT APPLICABLE (s0 existential) | `docs/core/P26_WINDOWMIN_THRESHOLD_CERT.md` |
