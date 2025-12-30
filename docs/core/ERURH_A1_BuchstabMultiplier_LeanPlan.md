# Lean Plan: Buchstab Multiplier Bridge for A1

Goal: formalize the nonvanishing of the Buchstab multiplier

  m(rho) = (2^(-rho) - 3^(-rho)) / rho

for rho = beta + i*gamma with beta > 0, and use it to show the mode coefficient
is nonzero once it is known to be proportional to m(rho) times a structural
nonzero factor.

## Step 1: Define 2^(-rho) and 3^(-rho) in Lean
- Use rho : Complex and define
    a_pow_neg_rho (a : Real) (rho : Complex) := Complex.exp (-rho * Complex.log a).
- Restrict to a = 2 and a = 3 (positive reals), so Complex.log is well-defined.
- Define m(rho) := (a_pow_neg_rho 2 rho - a_pow_neg_rho 3 rho) / rho.

## Step 2: Prove nonvanishing for beta > 0
- Show |a_pow_neg_rho a rho| = a^(-beta) for a > 0, rho = beta + i*gamma.
- Use the reverse triangle inequality:
    |x - y| >= ||x| - |y||
  to derive |2^(-rho) - 3^(-rho)| >= |2^(-beta) - 3^(-beta)| > 0.
- Conclude the numerator is nonzero.
- If beta > 0 then rho != 0, so m(rho) != 0.

## Step 3: Bridge to A1
- Add a minimal external hypothesis:
    SupercriticalModeCoefficient beta gamma :=
      exists c_struct : Complex, c_struct != 0 and
      (mode_coeff = c_struct * m(beta + i*gamma)).
- Prove that the mode coefficient is nonzero.
- Combine with the existing exp-dominates-polynomial lemma and the A1_mode
  definition to obtain A1_mode (Lean).

## Status
Lean now includes a concrete bridge layer:
`ModeRMSLowerBound_from_buchstab` and `A1_from_supercritical_buchstab` are
defined in `ERURH_A1_BuchstabBridge.lean` as explicit hypotheses that package
the coefficient and RMS lower bound. This keeps the main chain unchanged and
avoids new axioms.
