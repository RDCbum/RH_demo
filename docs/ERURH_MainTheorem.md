Main Theorem (informal)
=======================

Status: high-level summary. For the authoritative assumption and gap mapping,
see `docs/core/ASSUMPTIONS_LEDGER.md` and `docs/core/RH_CLOSURE_CHECKLIST.md`.

Assuming classical results on the Riemann zeta function (explicit formula, growth
of Γ and ζ'/ζ, dyadic zero counts), the ERURH shim bundle, and a finite set of
ERURH numeric certificates (alpha and beta), the ERURH system shows there are no
zeros of ζ with real part greater than 1/2. Thus, it yields a conditional proof
of the Riemann Hypothesis.

What is assumed?
----------------
- Classical analytic number theory inputs: explicit formula, growth of Γ(ρ/2) and ζ'/ζ, zero counts in dyadic bands (Riemann–von Mangoldt).
- The ERURH shim bundle (`AxiomsShimAccepted`), which packages the explicit-formula
  infrastructure and the RH-from-E bridges used in the final step.
- ERURH numeric certificates for the alpha and beta layers (energy, inertia, gates),
  plus explicit numeric coverage over the required window family.

What is proved in Lean?
-----------------------
- The full ERURH/Plan B/gates/RMS machinery is formalized in Lean.
- The core Plan B chain, RMS/gates logic, and master theorem
  `RH_from_ERURH_conditional` are formalized in Lean.
- The analytic inputs A1 and A2 are supplied by paper lemmas
  (`a1-from-supercritical`, `a2-from-abc`) and Theorems A/B/C in the companion
  preprint. The fixed-window bridge is documented as an alternative route, but
  the primary route is the legacy window-free A1 lemma.
