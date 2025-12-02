ERURH Formalisms Analytic — Bridge (Φ, ψ, logR)
===============================================

Overview
--------
This note summarizes the analytic chain linking bounds for \(\Phi\) and \(\psi\) to the envelope for \(\log R\), fixing book constants and global quantifiers. These inputs are treated as classical analytic data (assumed via `ClassicalZetaAssumptions`/`ERURH_GlobalAssumptions`), not proved in Lean.

Input constants
---------------
- `constants_global.json` supplies \(\Phi_{\text{core}}\), \(\Phi_{\text{holdouts}}\), the operational envelope \(C_{\text{operativo}}\), and the threshold \(s_0\).
- Closed constants for Lemmas A and B come from `L_analytic_proof.json` and `kappa_book_proof.json`.
- The cap \(T_{\text{cap}}\) is set in `tools/bounds_config.json` (`boundsTcap`) and mirrored in `formal_proofs/ERURH/BoundsConfig.lean`; a build guard aborts `lake build ERURH` if they diverge.

Controlled inflation
--------------------
Margins are grouped as
\[
  \varepsilon_{\Phi}, \qquad
  \varepsilon_L = \frac{\delta_L}{1 - L_{\text{upper}}}, \qquad
  \varepsilon_{\kappa} = \frac{\delta_{\kappa}}{\kappa_{\text{high}}},
\]
each coming from canonical artifacts (kernel, renorm, energy).

Closed envelope
---------------
\[
  C_{\text{envelope}}^{\text{closed}} =
  C_{\text{operativo}} \cdot (1 + \varepsilon_{\Phi}) (1 + \varepsilon_L) (1 + \varepsilon_{\kappa}),
\]
preserving \(s_0\) from the canonical grid and ensuring the envelope never dips below the operational baseline.

Artifact
--------
`formalisms/analytic_bridge_proof.py` emits `bridge_closed.json` with \(C_{\text{envelope}}^{\text{closed}}\), \(s_0\), the \(\varepsilon\) margins, and references to the closed lemmas. This feeds the strict gate in the formal runner.

Prefactor → RH chain
--------------------
```
prefactor witness ─┐
                   │ pads pf_log_q, pf_j_q, pf_tail_* (≈ 0 by design)
LambdaWitness ─────┴─► PrefactorWitnessOn.ofLambda
ZetaWitness ─────────► XiWitness.ofPrefactorZeta
XiWitness ───────────► BridgeToXi.ofWitness
BridgeToXi + ExplicitFormulaLaws ─► RHfromE
RHfromE + InertiaERU ─────────────► RiemannHypothesis
```
Rational pads are zero in the current release; they exist to absorb future numerical adjustments without weakening bounds. On the critical line \(\Re(1/s + 1/(1-s)) = 0\), so pads do not affect \(jRel\).

Numerical profiles and cache
----------------------------
- Generators `make_lambda_bounds.py` and `make_zeta_bounds.py` support profiles `ci-fast`, `dev`, `release-strict` fixing \(T_{\mathrm{cap}}\), precision, refinement tolerance, and subdivision limits. CI uses `ci-fast` (\(T_{\mathrm{cap}}=300\)) for fast conservative bounds; `dev`/`release-strict` allow tighter reconstruction.
- Each subinterval is rounded upward to multiples of \(10^{-12}\) after a small additive/multiplicative margin. Results are cached under `tools/cache/{lambda,zeta}/<fingerprint>/window.json`; shards can be recomputed incrementally.
- Flags `--resume`/`--merge` reuse cached pads and rebuild `LambdaBounds.lean`/`ZetaBounds.lean` from JSON (CI relies on this).

Automated pipeline
------------------
`Invoke-ERURH-Pipeline.ps1` drives the end-to-end flow: detects `boundsTcap`, lists windows, recomputes shards with `--resume`/`--tail-only`, retries with `dev` on failures, merges once, then runs `lake build ERURH` and `python -m tools.axioms_report`. If a merge reports “missing cache entry,” the shard is rerun and merged once more.

Segmented certificates for Λ
----------------------------
- Each shard of `make_lambda_bounds.py` emits segment certificates with effective mesh `h`, pointwise upper bounds `M_log`/`M_j`, Lipschitz coefficients `L_log`/`L_j` (rounded upward), status/profile/precision/tcap metadata.
- `--merge` regenerates `LambdaBounds.lean` and writes `staging/ERURH/LambdaIntervals_skeleton.lean` with skeleton lemmas `lam_log_le_seg_*`/`lam_j_le_seg_*` per segment and the corresponding window/tail lemmas. This staging module is not imported by `ERURH.lean`; it is a placeholder until proofs replace the admits.
- Lean scaffolding uses `formal_proofs/ERURH/Numeric/Interval.lean` (`GridCover`, placeholder lemmas `sup_le_from_grid_Lip`, `sup_le_union`) to consume these certificates in a future cycle without new axioms.

Smoke tests
-----------
`SmokePads.lean`/`SmokeTests.lean` only verify algebraic stitching of rational pads (windows + tail) and remain outside `ERURH.lean`; they do not yet discharge analytic inequalities for \(\lambda\) or \(\zeta\).

Generation and tail coverage
----------------------------
- `make_lambda_bounds.py` and `make_zeta_bounds.py` take suprema over each window and over the tail \([W.\mathrm{hi}, T_{\mathrm{cap}}]\); \(T_{\mathrm{cap}}\) is shared with `BridgeToXiOn` and recorded in `ExpRect.Tcap`.
- Values are rounded upward to rationals with denominator \(10^{12}\), with fixed tolerances to protect against floating error.
- Current ranges contain no zeros of \(ζ(1/2 + it)\); if a future interval touches a zero, one must exclude a neighborhood or bound \((ζ'/ζ)(1/2 + it)\) near the pole.
- On-band we do not use product identities for \(\xi\); `xi_log_fun` and `xi_j_fun` are defined as `prefactor_*_fun + zeta_*_fun`, so `BridgeToXi` applies `add_le_add` to the witnesses without extra non-vanishing assumptions.
