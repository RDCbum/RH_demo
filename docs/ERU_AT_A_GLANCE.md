# ERU at a glance

## What ERU is

- ERU (EnergeticRelational Universe) is a deterministic structural certification framework for sequential data and the models that interpret them.
- ERU evaluates model coherence, stability, and viability rather than optimizing predictions or outputs.
- ERU reduces global claims about a system to:
  - explicit analytic or structural obligations,
  - finite, auditable certificates,
  - and formally verified implication chains.
- ERU treats models themselves as first-class objects of analysis (including stop engines and decision criteria).
- ERU is reproducible by design: deterministic pipelines, explicit artifacts, and audit-friendly outputs.
- ERU separates logic, analysis, and computation instead of entangling them in a single argument.

## What ERU is not

- ERU is not a forecasting system.
- ERU is not a trading or optimization strategy.
- ERU is not a control or actuation engine.
- ERU is not a truth oracle.
- ERU does not produce actions or decisions.

## How ERURH fits into ERU

ERURH is a high-difficulty mathematical instantiation of the ERU framework.

- The Riemann Hypothesis is used here as a canonical stress-test rather than as an isolated target.
- ERURH demonstrates that ERU can:
  - isolate classical analytic assumptions explicitly,
  - formalize the logical core of a deep conjecture in a proof assistant (Lean),
  - and close the remaining gap using finite, reproducible certificates.
- The result is a formally verified reduction: if the stated external analytic obligations are validated, the Lean-verified implication yields RH for the chosen completed function ξα.

## Routes within ERURH

Two complementary routes are presented.

**Primary route (legacy, window-free).**
- This is the main route.
- It operates in an abstract RMS context and does not rely on any fixed window family or computational threshold control.
- It carries the conceptual and logical core of the conditional result.

**Secondary route (fixed-window, computational).**
- This is an applied and experimental instantiation.
- It anchors the abstract theory to a concrete, gate-certified numerical context.
- It introduces additional hypotheses and normalization bridges that are not required for the primary route.

The primary route carries the conceptual core; the secondary route illustrates a fully reproducible computational instantiation.

## Other ERU instantiations

ERURH is not the only instantiation of ERU.

- Narrative Atlas applies the same ERU architecture to semantic time series and narrative stability analysis.
- Additional ERU instantiations will be released independently as separate case studies.

## How to read this repository

- If you are interested in formal logic and proof structure: start with the Lean master statement and the conditional theorem.
- If you are interested in analytic number theory: focus on the A/B/C analytic preprints and the assumptions ledger.
- If you are interested in reproducibility and systems design: inspect the verification pipeline, manifests, and certificate regeneration scripts.
