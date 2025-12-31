ERURH Plan B Conditional Theorem (Mini-Paper)
=============================================

Status: historical mini-paper. For the current status and gaps, see
`docs/core/ASSUMPTIONS_LEDGER.md` and `docs/core/RH_CLOSURE_CHECKLIST.md`.

1. Introduction and context
---------------------------
- Plan B gives an RMS/gates route to RH in the ERURH-alpha layer: combine growth of modes with β > 1/2, A2 low/tail bounds, and closed gates to exclude supercritical modes.
- See `docs/core/ERURH_Proof_Status.md` for the overall picture and the alpha route.

2. ERU setup and ERURH↔RH equivalence
-------------------------------------
- \( \log R(s) = E(e^s)/e^s \), \( j_{\mathrm{rel}}(s) = \frac{d}{ds} \log R(s) \); ERU normalisation of the observables.
- Formal equivalence: four alpha certificates ⇒ ERU inertia ⇒ `RiemannHypothesis xiAlpha` (see the master statement; proofs not repeated here).

3. Gates and certificates
-------------------------
- `RenormGateClosed` and `EnergyGateClosed` capture the regime where envelope/κ/global energy meet their caps (see `docs/notes/ERURH_Gates_Conceptual.md`).
- Correct alpha certificates + numeric coverage (`NumericCoverageAlpha`, discharged by gate data for `ctx_real`) ⇒ gates closed (formalised in `ERURH_GatesAlpha.lean`).

4. Plan B analytic package
--------------------------
- Explicit formula and coefficients \(b_\rho\) (see `docs/notes/ERURH_ExplicitFormula_Plan.md`).
- A2-low and A2-tail (see `docs/notes/ERURH_A2_AnalyticPlan.md`).
- LS\_γ simple RMS (see `docs/notes/ERURH_LSgamma_and_Mode_Demos.md` and `docs/core/ERURH_LSgamma_AnalyticTheorem.md`).
- A1-mode growth (see `docs/notes/ERURH_LSgamma_and_Mode_Demos.md`).
- RMSLocalHypothesis lemma (see `docs/notes/ERURH_RMSLocal_Proof.md`).

5. Plan B conditional theorem
-----------------------------
- Statement (conditional Plan B): assuming the classical hypotheses \(H_ζ,\mathrm{standard}\) on ζ, the ERU-explicit hypotheses \(H_{\mathrm{ERU},\mathrm{explicit}}\), the A2 low/tail bounds and A1-mode growth, together with correct alpha certificates and assumed numeric coverage, we obtain `RiemannHypothesis xiAlpha`.
- Logical chain: \(H_ζ,\mathrm{standard}\) + \(H_{\mathrm{ERU},\mathrm{explicit}}\) + \(H_{\mathrm{LS}}/H_{\mathrm{A2}}\) + \(H_{\mathrm{certs+num}}\) ⇒ PlanB analytic assumptions + closed gates ⇒ `RMSLocalHypothesis` + closed gates ⇒ no modes with β > 1/2 ⇒ RH.
