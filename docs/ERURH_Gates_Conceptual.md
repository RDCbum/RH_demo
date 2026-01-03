ERURH Gates (alpha/beta framing)
================================

Status: background note. For the formal gate definitions and current route
framing, see `arxiv_submission/ERURH_Conditional_Proof.tex` and
`docs/core/ASSUMPTIONS_LEDGER.md`.

1. What are ERURH gates?
------------------------
- **Renormalization gate**: tracks the regime where the ERURH alpha constants remain admissible. It is closed when the envelope constant `C_envelope` respects its cap, the κ-family stays inside the admissible band `[κ_min, κ_max]`, and the global energy envelope `L_global` remains at the target level. If any of these constraints break, the flow must renormalize or switch regime.
- **Energy gate**: watches the global ERU energy via the GlobalEnergy certificate. It is closed when the certified global energy stays below the allowed envelope; opening the gate signals that the energy budget has been exceeded.

2. Formal alpha-layer view
--------------------------
- In the alpha layer, “gate closed” means the formal constants are within their adopted bounds:
  - `L_global` is fixed to the formal envelope (`≈ 0.175`).
  - `κ` sits in the specified band `[κ_min, κ_max]` (target `≈ [8.168, 9.384]`).
  - `C_envelope` is below its limit (`≈ 0.048`).
- These numbers are not floating placeholders: they originate from the formal bounds (`lGlobalFormalRat`, `kappaLowFormalRat`, `kappaHighFormalRat`, `cEnvelopeFormalRat`) and from the alpha certificates that identify the actual constants with the released values.
- Supporting demos: a simple LS_γ bound is implemented in Lean (`LS_gamma_simple_pointwise`), and the mode-growth estimates in `formal_proofs/ERURH/ERURH_ModeGrowthAlpha.lean` support the conditional A1 bridge used in the paper to derive an RMS violation from a supercritical mode.

3. Phenomenological beta-layer view
-----------------------------------
- The beta layer monitors RMS-style observables, with constants such as `C_RMS,β ≈ 0.1`.
- A closed beta gate means the smoothed observable stays within the band compatible with the alpha certificates; this alignment is for diagnostics and heuristics, not for the formal logical chain.

4. Role in the RH argument
--------------------------
- When the gates are closed, no renormalization or extra energy is needed; the alpha certificates operate inside their intended regime.
- The RH plan is to derive closed gates from the alpha certificates and, in future work, to show that any zero with `β > 1/2` would force at least one gate to open, contradicting the certified regime.
