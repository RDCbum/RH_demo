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
  `ctx_real_A2Low` and `ctx_real_A2Tail` into a single Lean theorem, fully
  discharged from the generated RMS context.
- **A2 from A/B/C (paper):** Lemma `a2-from-abc` in the paper derives
  `A2Low_RMS` and `A2Tail_RMS` from the classical Theorems A/B/C; this is the
  analytic route used in the legacy window-free proof.
- **Universal A1 core:** Lean proves that
  `exp((β-1/2) * S) / S^2` eventually dominates any fixed envelope
  (file `ERURH_ExpDominatesPolynomial.lean`).
- **A1 reduction:** given a minimal external lower-bound hypothesis
  `ModeRMSLowerBound ctx β`, Lean derives `A1_mode ctx`
  (file `ERURH_A1_FromModeLowerBound.lean`).

## What remains external

- **Primary A1 bridge (legacy window-free):** the paper Lemma
  `a1-from-supercritical` supplies `A1_mode` from a supercritical mode
  hypothesis (`ERU_mode_beta`). This is the main analytic input.
- **Optional Buchstab bridge:** the paper also provides a Buchstab derivation
  of `ModeRMSLowerBound_from_buchstab` and
  `A1_from_supercritical_buchstab`, which can be used as an alternative
  route to `A1_mode`.

## Schematic dependency diagram

```
ERU_mode_beta + A1_from_supercritical  --->  A1_mode          (Paper)
ModeRMSLowerBound + (β > 1/2)          --->  A1_mode          (Lean lemma)
(G + ZB) -> H_b^weak -> A2Tail_RMS     --->  A2Low/A2Tail      (Paper)
ctx_real_A2Low / ctx_real_A2Tail       --->  A2 for ctx_real   (Lean)
A1 + A2 + gates                        --->  RH chain         (Lean)
```
