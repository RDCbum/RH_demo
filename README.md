# ERURH – Conditional RH Proof (Lean/Python)

This repository is a minimal, self-contained extraction of the ERURH project (from `eru-upgrade`). It preserves the Lean proof modules and the Python tooling needed to regenerate the rational certificates used in the conditional proof of the Riemann Hypothesis (RH).

## Overview
- Lean formalization: encodes the ERURH framework and the conditional implication `ERURH_GlobalAssumptions → RiemannHypothesis`.
- Python tooling: regenerates rational bounds and certificate values from the published numeric artefacts.
- Documentation: explains the analytic assumptions, the certificate pipeline, and how to reproduce the build.

## Repository Structure
- `lean/formal_proofs/ERURH/` — main Lean sources (Alpha/Beta certificates, gates, master theorem).
- `lean/formal_proofs/ERURH/Beta/` — Beta-specific certificate modules.
- `tools/` — generators (`make_rational_bounds.py`, `make_certificate_values.py`).
- `scripts/verify_gate.py` — end-to-end regeneration + build (optional tests).
- `data/releases/erurh-v2-core/formal/` — published JSON inputs.
- `data/docs/paper/` — regenerated JSON outputs.
- `docs/` — ERURH notes, assumptions, and reproduction guide.
- `lakefile.lean`, `lean-toolchain`, `lake-manifest.json` — Lean 4.25.0-rc2 + mathlib pin.

## Installation (Windows PowerShell; adapt paths as needed)
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -U pip
python -m pip install -e .

lake exe cache get
```

## Verification Pipeline
From the repo root (venv active):
```powershell
# 1) Regenerate rational bounds and Lean mirror
python tools/make_rational_bounds.py
# 2) Regenerate certificate values and Lean mirror
python tools/make_certificate_values.py
# 3) Build Lean target
lake build ERURH
# 4) Full gate (regeneration + Lean build, optional pytest)
python scripts/verify_gate.py --skip-pytests
```
If tests are added later, omit `--skip-pytests` to run them.

## External Assumptions (high level)
The Lean theorem is conditional on `ERURH_GlobalAssumptions`, which bundle:
- Classical zeta-function input (explicit formula, growth and zero-counting bounds).
- Large-sieve–style spectral controls for the explicit-formula coefficients.
- Window and certificate hypotheses (A1/A2 conditions, alpha/beta coverage).
See `docs/ERURH_MainTheorem.md` and related files for details.

## License
Licensed under the Apache License, Version 2.0. Unless required by applicable law or agreed to in writing, software distributed under the License is provided on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND. See the `LICENSE` section below or visit <http://www.apache.org/licenses/LICENSE-2.0>.

Copyright (c) 2025 Robert Duran (duran.robert301@gmail.com).
