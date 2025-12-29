# ERURH - Conditional RH Proof (Lean/Python)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.18010407.svg)](https://doi.org/10.5281/zenodo.18010407)

This repository is a minimal, self-contained project. It provides the Lean proof modules and the Python tooling needed to regenerate the rational certificates used in the conditional proof of the Riemann Hypothesis (RH).
It also presents three analytic theorems (A, B, C) that underpin the Lean result and should be independently reviewed and verified.
This repository includes no staging or experimental files; only the validated and review-ready components of the ERURH RH demo are included.

## Overview
- Lean formalization: encodes the ERURH framework and the conditional implication `ERURH_GlobalAssumptions -> RiemannHypothesis`.
- Python tooling: regenerates rational bounds and certificate values from the published numeric artefacts.
- Documentation: explains the analytic assumptions, the certificate pipeline, and how to reproduce the build.
- Step-by-step proof walkthrough (legacy window-free route): `docs/core/LEGACY_WINDOW_FREE_PROOF_WALKTHROUGH.md`.

## Repository Structure
- `lean/formal_proofs/ERURH/` — main Lean sources (Alpha/Beta certificates, gates, master theorem).
- `lean/formal_proofs/ERURH/Beta/` — Beta-specific certificate modules.
- `tools/` — generators (`make_rational_bounds.py`, `make_certificate_values.py`).
- `scripts/verify_gate.py` — end-to-end regeneration + build (optional tests).
- `data/releases/erurh-v2-core/formal/` — published JSON inputs.
- `data/docs/paper/` — regenerated JSON outputs.
- `docs/` — ERURH notes, assumptions, and reproduction guide.
- `lakefile.lean`, `lean-toolchain`, `lake-manifest.json` — Lean 4.25.0-rc2 + mathlib pin.

## Installation

### Requirements
- Python 3.10+ (recommended)
- Lean toolchain as pinned by `lean-toolchain`
- Git

### Windows (PowerShell)

```powershell
# 1) Python venv
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -U pip

# 2) Install the Python package (editable)
python -m pip install -e .

# 3) Fetch Lean dependencies / cache (optional but recommended)
lake update
lake exe cache get
```
### Linux/macOS
```
# 1) Python venv
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -U pip

# 2) Install the Python package (editable)
python -m pip install -e .

# 3) Fetch Lean dependencies / cache (optional but recommended)
lake update
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
The Lean theorem formalizes a conditional implication of the form:

**ERURH_GlobalAssumptions -> RiemannHypothesis**

`ERURH_GlobalAssumptions` bundles:
- Classical zeta-function input (explicit formula, growth and zero-counting bounds).
- Spectral / large-sieve–style controls for explicit-formula coefficients.
- Window and certificate hypotheses (A1/A2 conditions, alpha/beta coverage).

In addition, this repository includes a **proposed analytic proof** of three key assumptions (Theorems **A, B, C**) which, if externally verified, would discharge the remaining analytic gaps used by the conditional statement. These analytic components are provided for independent review:

- Theorems A, B, C (analytic write-up): `docs/core/ERURH_Analytic_Theorems_ABC.md`
- Assumptions table and dependency map: `docs/core/ERURH_Assumptions_Report.md`
- Main theorem overview and assumption references: `docs/core/ERURH_MainTheorem.md`

## How to cite

This repository is archived and citable via Zenodo.

- **Concept DOI (recommended for general citation, always resolves to the latest version):**  
  https://doi.org/10.5281/zenodo.18010407

- **Version DOI (this specific release `v1.0-preprint`):**  
  https://doi.org/10.5281/zenodo.18010408

### BibTeX

```bibtex
@software{duran_erurh_2025,
  author       = {Duran, Robert},
  title        = {ERURH: Conditional RH demo (Lean) with analytic assumptions A, B, C},
  year         = {2025},
  version      = {v1.0-preprint},
  url          = {https://github.com/RDCbum/RH_demo},
  doi          = {10.5281/zenodo.18010407}
}
```
Note. The Lean formalization proves a conditional implication
ERURH_GlobalAssumptions -> RiemannHypothesis.
The analytic theorems A, B, C are provided as proposed proofs requiring independent external verification.

## License

### Code
All source code in this repository (Lean, Python, scripts, build files, and related tooling) is licensed under the **Apache License, Version 2.0**.

See: `LICENSE` (Apache-2.0).  
Unless required by applicable law or agreed to in writing, software distributed under the License is provided on an **“AS IS” BASIS**, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND.  
See <http://www.apache.org/licenses/LICENSE-2.0>.

### Paper / preprint materials
The manuscript sources and rendered documents (including `.tex`, `.bib`, and `.pdf` files under `docs/preprints/` and `arxiv_submission/`, and any other files explicitly identified as manuscript material) are licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

See: `LICENSE-PAPER` (CC BY 4.0).

**IP note.** A national filing establishing priority date **2025-12-21** exists for the general ERU analysis method.

## Copyright
Copyright (c) 2025 Robert Duran (e-mail: duran.robert301@gmail.com)


