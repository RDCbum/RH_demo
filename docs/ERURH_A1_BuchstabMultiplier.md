# A1 Bridge via Buchstab Multiplier (Paper-First)

Status: optional analytic bridge note. For the primary route and gap list, see
`docs/core/RH_CLOSURE_CHECKLIST.md` and `arxiv_submission/ERURH_Conditional_Proof.tex`.

This note records a paper-level bridge that reduces the A1 analytic burden to a
single structural nonvanishing statement, without changing the kernel or any
numerical certificates.

## Operator and multiplier
We use the multiplicative averaging operator

  (T h)(u) = (1/u) * \int_{u/3}^{u/2} h(t) dt.

For a monomial h(t) = t^(rho-1) with rho = beta + i*gamma,

  (T h)(u) = u^(rho-1) * m(rho),

where

  m(rho) = (2^(-rho) - 3^(-rho)) / rho,
  2^(-rho) := exp(-rho * log 2).

Normalization note: in the Lean formalization the explicit-formula
identification uses `explicit_b_rho_expression = pi^{-rho/2} * Gamma(rho/2)`
(gamma prefactor). Any auxiliary holomorphic factors (e.g. `H(rho)` or
`(rho-1)/rho`) are absorbed into the abstract coefficient `b_rho` in the
preprint. In the current release data the kernel is the Buchstab operator above,
so the kernel contribution to the analytic factor `H` is exactly the multiplier
`m(rho)`, which is nonzero for Re(rho) > 0; the remaining nonvanishing
requirement concerns only auxiliary holomorphic weights.

## Nonvanishing
If beta > 0, then m(rho) != 0. The key estimate is

  |2^(-rho) - 3^(-rho)| >= ||2^(-rho)| - |3^(-rho)||
                         = |2^(-beta) - 3^(-beta)| > 0.

The denominator rho is nonzero because Re(rho) = beta > 0.

## How this reduces A1
If the mode coefficient is proportional to m(rho) times a structural constant
c_struct != 0 (from the explicit formula package), then the mode coefficient is
nonzero. Combined with the exp-dominates-polynomial lemma already in Lean,
this yields A1_mode for the chosen RMS context.

## What remains external
The remaining external input is the explicit formula identification of the
mode coefficient, captured as the Prop `ExplicitBRhoExpression`. In Lean we
prove the multiplier nonvanishing for beta > 0, so under this identification
the Buchstab coefficient is nonzero. The separate bridge that turns this
coefficient into a concrete RMS_mode lower bound remains the explicit
hypothesis `ModeRMSLowerBound_from_buchstab`, wrapped by
`A1_from_supercritical_buchstab`.
