# ERURH A1/A2 status (Lean vs paper)

Status: background note. For the current authoritative gap list, see
`docs/core/ASSUMPTIONS_LEDGER.md` and `docs/core/RH_CLOSURE_CHECKLIST.md`.

This note summarizes what is now discharged in Lean for the current demo and
what remains external.

## What A1/A2 mean

- `A1_mode ctx`: there exists a window `w` and `K` such that
  `K > ctx.c_low + ctx.c_tail + C_envelope_formal` and `ctx.RMS_mode w ≥ K`.
- `A2Low_RMS ctx`: uniform low-part bound `ctx.RMS_low w ≤ ctx.c_low`.
- `A2Tail_RMS ctx`: uniform tail-part bound `ctx.RMS_tail w ≤ ctx.c_tail`.

These are defined in `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`.

## What is proved in Lean now

- **A2 for `ctx_real`:** `ERURH.ctx_real_A2` packages
  `ctx_real_A2Low` and `ctx_real_A2Tail` into a single Lean theorem.
  This is fully discharged from the generated RMS context.
- **Universal A1 core:** we prove in Lean that
  `exp((β-1/2) * S) / S^2` eventually dominates any fixed envelope
  (file `ERURH_ExpDominatesPolynomial.lean`).
- **A1 reduction:** given a minimal external lower-bound hypothesis
  `ModeRMSLowerBound ctx β`, Lean derives `A1_mode ctx`
  (file `ERURH_A1_FromModeLowerBound.lean`).

## What remains external

- The only zeta-dependent input for A1 is the lower-bound hypothesis
  `ModeRMSLowerBound ctx β`, which captures the contribution of a
  supercritical mode to `RMS_mode`. This is the analytic core left for the
  paper (or future formalization).

## Schematic dependency diagram

```
ModeRMSLowerBound + (β > 1/2)  --->  A1_mode                 (Lean)
(G + ZB) -> H_b^weak -> A2Tail_RMS  --->  A2Low/A2Tail        (Lean/paper)
ctx_real_A2Low / ctx_real_A2Tail    --->  A2 for ctx_real     (Lean)
A1 + A2 + gates                      --->  RH chain          (Lean)
```
