ERURH Gates (alpha/beta framing)
================================

1. What are ERURH gates?
------------------------
- **Renormalization gate:** tracks whether the ERURH alpha constants remain admissible. Closed when `C_envelope` respects its cap, the κ-band lies within `[kappaLowFormalRat, kappaHighFormalRat]`, and the global energy envelope `L_global` stays at its target value.
- **Energy gate:** monitors the global ERU energy via the GlobalEnergy certificate; closed when the certified global energy stays below the allowed envelope, open if the energy budget is exceeded.

2. Formal alpha-layer view
--------------------------
- “Gate closed” means the formal constants match the released rational bounds: `L_global = lGlobalFormalRat`, κ in `[kappaLowFormalRat, kappaHighFormalRat]`, and `C_envelope = cEnvelopeFormalRat`.
- These come from the certificates and artifacts (`RationalBounds`/`CertificateValues`) and are assumed inside `ERURH_GlobalAssumptions`; gate closure in Lean also assumes the placeholder numeric coverage (`NumericCoverageAlpha`).
- Supporting pieces: LSγ simple bound is implemented (`LS_gamma_simple_pointwise`), and the A1-mode growth is tracked in `ERURH_ModeGrowthAlpha.lean` to explain how β > 1/2 modes would force gate violations.

3. Phenomenological beta-layer view
-----------------------------------
- The beta layer monitors smoothed RMS observables (e.g., `C_RMS,β ~ 0.1`) for diagnostics; alignment with alpha certificates is heuristic and does not enter the formal proof chain.

4. Role in the RH argument
--------------------------
- Closed gates mean the alpha certificates operate inside their intended regime. The RH plan is: alpha certificates + (assumed) coverage ⇒ gates closed; RMS-local/A2 results would show any β > 1/2 mode opens a gate, contradicting closure; hence no such mode, yielding RH via the established ERURH equivalence.
