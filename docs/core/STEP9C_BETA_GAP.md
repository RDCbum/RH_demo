# STEP9C Beta numeric gap

No beta numeric inputs are present under `data/releases/erurh-v2-core/formal/`.
To make beta certificates generatable, the release bundle needs a JSON payload
containing the strong inertia window records (id/sLeft/sRight/sMid/rmsBound/supBound),
plus global RMS parameters (C_Global_beta, S0_global, Smax_global, sRef) and kernel id.

Expected artifacts (suggested names):
- `beta_strong_inertia_certificate.json` (window list + tailRMSBound + kernelId)
- `beta_global_inertia_certificate.json` (global RMS parameters)
- optional composite metadata if needed to lock kernel IDs

Until those inputs are published, the beta certificate remains an explicit assumption
(`BetaInertiaAssumptions.bundle`) rather than a generated Lean definition.
