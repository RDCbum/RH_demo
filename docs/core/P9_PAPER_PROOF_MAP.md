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
- Definition of `ERU_mode_beta` (pointwise growth for the supercritical mode
  component in the paper interpretation).
- Definition of `RMS_mode` and the window interval associated to `ctx_real_window`.
- Any bridge fact equating the Lean `RMS_mode` to the analytical RMS or a certified lower bound.

## Mode-threshold control (ModeThresholdControlOnCtxRealWindowFamily)

**Lean statement**
- `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`.

**Mathematical statement (paper)**
- For every $\beta > 1/2$ with `ERU_mode_beta`$(\beta)$, there exists
  $s_0 \le \mathrm{windowMinMax}$ such that
  $|\log R_\alpha^{\mathrm{mode}}(s)| \ge \exp((\beta-1/2)s)$ for all $s \ge s_0$.

**Paper placement**
- Section \ref{sec:no-supercritical}, Assumption `assm:threshold-control`.

**Dependencies**
- Definition of `ERU_mode_beta`.
- Analytic control of the threshold (external input; analytic gap discussion in paper)
  plus the gate-verified numeric inequality $\mathrm{windowMinMax} \ge S_0$
  from the analytic report.

## A1 from supercritical mode (legacy window-free)

**Lean statement**
- `ERURH.A1_from_supercritical ctx`.

**Mathematical statement (paper)**
- Lemma `a1-from-supercritical`: if `ERU_mode_beta(β)` holds for some
  $\beta>1/2$, then `A1_mode` holds for the chosen RMS context (existential window).

**Paper placement**
- Section \ref{sec:no-supercritical}, Lemma `a1-from-supercritical`.

**Dependencies**
- Definition of `ERU_mode_beta`.
- Mode-to-RMS lower bound for the supercritical contribution (proved in the
  paper using admissibility of the window family and Lemma
  \ref{lem:pointwise-to-rms}). One concrete derivation uses the Buchstab bridge.

## A2 from classical inputs (legacy window-free)

**Lean statements**
- `ERURH.A2Low_RMS ctx` and `ERURH.A2Tail_RMS ctx`.

**Mathematical statement (paper)**
- Lemma `a2-from-abc`: under the explicit-formula package and Theorems A/B/C,
  there exist constants `c_low`, `c_tail` such that
  `RMS_low(w) ≤ c_low` and `RMS_tail(w) ≤ c_tail` on admissible windows.

**Paper placement**
- Section \ref{sec:no-supercritical}, Lemma `a2-from-abc`.

**Dependencies**
- Theorems A/B/C in `arxiv_submission/Theorem_ABC_preprint.tex`
  (labels `thm:A`, `thm:B`, `thm:C`).
- Assumption `assm:explicit` (explicit-formula package).

## Buchstab bridge (optional derivation of A1)

**Lean statements**
- `ERURH.A1_from_supercritical_buchstab ctx`.
- `ERURH.ExplicitBRhoExpression`.

**Mathematical statement (paper)**
- Lemma `a1-from-supercritical-buchstab`: supercritical mode implies
  `ModeRMSLowerBound_from_buchstab` (and hence A1).
- Lemma `buchstab-coefficient`: explicit-formula identification
  $b_\rho=\pi^{-\rho/2}\Gamma(\rho/2)$ and factorization with $m(\rho)$.

**Paper placement**
- Section \ref{sec:no-supercritical}, Lemmas `a1-from-supercritical-buchstab`,
  `buchstab-coefficient`.

**Dependencies**
- Explicit formula package (Assumption~\ref{assm:explicit}).
- Non-vanishing of $\Gamma$ and $\pi^{-\rho/2}$ for $\Re(\rho)>0$.
