# P9 Paper Proof Map

This map aligns remaining Lean hypotheses with paper statements and proof plans.

## AxiomsShimAccepted fields (hAxioms)

| Field | Lean location | Paper lemma/section | Dependencies |
| --- | --- | --- | --- |
| `alphaInterfacesBase` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:24` | Assumption~\ref{assm:explicit} (explicit formula package) | Explicit-formula setup for $\log R$ and $J_{\mathrm{rel}}$ |
| `explicit_alpha_via_stages` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:25` | Assumption~\ref{assm:explicit} (explicit formula package) | Explicit-formula laws (alpha bridge) |
| `xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:26` | Explicit-formula bounds section (Assumption~\ref{assm:explicit}) | Bounds for $\xi_\alpha$ |
| `h_xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:27` | Lean packaging of the above bounds | Depends on `xi_bounds_alpha` proof |
| `xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:28` | Argument bounds section (Assumption~\ref{assm:explicit}) | Argument control for $\xi_\alpha$ |
| `h_xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:29` | Lean packaging of the above argument bounds | Depends on `xi_argument_alpha` proof |
| `xi_bounds_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:30` | Classical/citable implications (Assumptions Ledger) | `xi_bounds_hypotheses_alpha` |
| `xi_argument_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:32` | Classical/citable implications (Assumptions Ledger) | `xi_argument_hypotheses_alpha` |
| `rh_from_E_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:34` | E-to-RH checklist (Assumptions Ledger) | $E$-bound + explicit formula bundle |
| `h_inertia_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:39` | Classical/citable implications (Assumptions Ledger) | ERU inertia to $E$-bound |
| `h_inertia_of_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:41` | Classical/citable implications (Assumptions Ledger) | $E$-bound to ERU inertia |
| `h_RH_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:43` | Classical/citable implications (Assumptions Ledger) | RH implies strong $E$-bound |

## Lemma B.1 (hB1): Pointwise-to-RMS bridge

**Lean statement**
- `ERURH.Alpha.PointwiseToRMSMode ERURH.Alpha.GeneratedRMSContext.ctx_real ERURH.Alpha.ctx_real_window`.

**Mathematical statement (paper)**
- For the fixed context window $w = \texttt{ctx\_real\_window}$, if $\beta > 1/2$ and
  $\texttt{ERU\_mode\_beta}(\beta)$ holds, then there exists a constant
  $K > c_{\mathrm{low}} + c_{\mathrm{tail}} + C_{\mathrm{envelope}}$ such that
  $\mathrm{RMS\_mode}(w) \ge K$.

**Paper placement**
- Section \ref{sec:no-supercritical}, Lemma B.1 (Pointwise-to-RMS bridge).

**Dependencies**
- Definition of `ERU_mode_beta` (pointwise growth for $|\log R_\alpha|$).
- Definition of `RMS_mode` and the window interval associated to `ctx_real_window`.
- Any bridge fact equating the Lean `RMS_mode` to the analytical RMS or a certified lower bound.

## Window-compatibility bridge (SupercriticalModeAppliesOnCtxRealWindow)

**Lean statement**
- `ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow`.

**Mathematical statement (paper)**
- For every $\beta > 1/2$ with `ERU_mode_beta`$(\beta)$, the pointwise lower bound
  $|\log R_\alpha(s)| \ge \exp((\beta-1/2)s)$ holds for all
  $s \in I_{\mathrm{ctx}}$, where $I_{\mathrm{ctx}}$ is the fixed window interval
  used by `ctx_real`.

**Paper placement**
- Section \ref{sec:no-supercritical}, Window-compatibility bridge subsection.

**Dependencies**
- Definition of `ERU_mode_beta`.
- Lower bound domain for the mode (e.g., $s \ge s_0$) and proof that the
  `ctx_real` window interval lies above that threshold.
