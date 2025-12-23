# STEP1 Lean Assumptions Audit

## 1) Encabezado reproducible

```text
=== GIT ===
a4691f3c7ad763309e7ec66b8a7da1da9d7a193e
M eru_upgrade.egg-info/PKG-INFO
 M eru_upgrade.egg-info/SOURCES.txt
 M eru_upgrade.egg-info/top_level.txt
?? docs/core/STEP1_LeanAssumptions_Audit.md
?? docs/core/STEP1_LeanPrint_Output.txt
?? docs/core/STEP1_Print.lean
?? docs/core/STEP1_rg_hits.txt
=== TOOLCHAIN ===
Python 3.11.9
python_exe= C:\Users\duran\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\python.exe
Lake version 5.0.0-src+744f980 (Lean version 4.25.0-rc2)
Lean (version 4.25.0-rc2, x86_64-w64-windows-gnu, commit 744f98064b056ee27fc8c97f524797c8cc96f436, Release)
```

Estado del repo: **no limpio** (ver `git status --porcelain` arriba).

**Gate (opcional) ejecutado:**

- `formal_proofs` symlink: **falló** (`New-Item: Administrator privilege required`).

- `python -m pip install -e .`: **timeout** (exit 124); el log indica instalación completa pero el comando expiró.

- `lake build ERURH`: **falló** con missing file `Mathlib/Data/Complex/Abs.lean` y errores de import en `lean/formal_proofs/ERURH/Numeric/Semantics.lean` (ver salida en consola).

## 2) Localización de artefactos clave

- ERURH_GlobalAssumptions: `lean/formal_proofs/ERURH\ERURH_MasterTheoremSummary.lean:39`

- RH_from_ERURH_conditional: `lean/formal_proofs/ERURH\ERURH_MasterTheoremSummary.lean:89`


**Fragmento literal (ERURH_GlobalAssumptions + contexto)**

```lean
-/

namespace ERURH

/-- Combined external assumptions required for the ERURH → RH chain. -/
structure ERURH_Assumptions where
  classical  : ClassicalZetaAssumptions
  spectral   : SpectralAssumptionsAlpha
  ls_gamma   : LSGammaAssumptions
  beta_inert : BetaInertiaAssumptions

/-- Bundle for the RMS/window scaling side (Plan B A1/A2 controls). -/
structure WindowScalingAssumptions where
  ctx  : RMSLocalContext
  hA1  : A1_mode ctx
  hLow : A2Low_RMS ctx
  hTail : A2Tail_RMS ctx

/-- Global assumptions combining external packages (classical/spectral/LS_γ/beta)
and the RMS/window scaling hypotheses. -/
structure ERURH_GlobalAssumptions where
  eru    : ERURH_Assumptions
  window : WindowScalingAssumptions

/-- Helper: instantiate the analytic Plan B bundle for a given RMS context,
using the external assumption packages and trivial A1/A2 placeholders (these
would be supplied by the analytic pipeline in practice). -/
def makePlanBAnalyticBundle
  (ctx : RMSLocalContext)
  (classical : ClassicalZetaAssumptions)
  (spectral  : SpectralAssumptionsAlpha)
  (ls_gamma  : LSGammaAssumptions)
  (hA1 : A1_mode ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx) :
  PlanB_AnalyticAssumptions ctx :=
by
  -- We package the external assumptions; the constructor expects spectral/ls_gamma/classical.
  refine
    { spectral := spectral
      ls_gamma := ls_gamma
      classical := classical
      explicit_formula_ERU := trivial
      A1_mode_growth := hA1
      A2_low_RMS := hLow
      A2_tail_RMS := hTail }

/-- Global master theorem: from the external ERURH assumption bundles and the
existing certificate/gate infrastructure, we derive RH for `xiAlpha`. This is
conditional on supplying suitable A1/A2/RMS data and the external packages. -/
@[simp] /-- Versión técnica con contexto RMS explícito. -/
theorem RH_from_ERURH_assumptions
  (assm : ERURH_Assumptions)
  (ctx : RMSLocalContext)
  (hA1 : A1_mode ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx)
  (hAxioms : AxiomsShimAccepted := trivial)
  (hCerts : CertificatesCorrectAlpha := { global := globalEnergyCertificate_true_alpha, h_global := globalEnergyCertificate_true_correct_alpha, kernel := kernelBlowupCertificate_true_alpha, h_kernel := kernelBlowupCertificate_true_correct_alpha })
  (hNumeric : NumericCoverageAlpha ctx := by exact fun w => by trivial) :
  RiemannHypothesis xiAlpha :=
by
  -- Build the analytic bundle from external assumptions and A1/A2 controls.
  have hAnalytic : PlanB_AnalyticAssumptions ctx :=
    makePlanBAnalyticBundle ctx assm.classical assm.spectral assm.ls_gamma hA1 hLow hTail
  -- Apply the Plan B master theorem.
  exact RH_from_planB_bundle ctx hAnalytic hAxioms hCerts hNumeric

/-- Condensed master theorem: external packages (classical/spectral/LS_γ/beta)
plus RMS window assumptions imply `RiemannHypothesis xiAlpha`. -/
theorem RH_from_ERURH_conditional
  (G : ERURH_GlobalAssumptions)
  (hAxioms : AxiomsShimAccepted := trivial)
  (hCerts : CertificatesCorrectAlpha := { global := globalEnergyCertificate_true_alpha, h_global := globalEnergyCertificate_true_correct_alpha, kernel := kernelBlowupCertificate_true_alpha, h_kernel := kernelBlowupCertificate_true_correct_alpha })
  (hNumeric : NumericCoverageAlpha G.window.ctx := by exact fun _ => by trivial) :
  RiemannHypothesis xiAlpha :=
by
  rcases G with ⟨eru, window⟩
  rcases window with ⟨ctx, hA1, hLow, hTail⟩
  exact RH_from_ERURH_assumptions eru ctx hA1 hLow hTail hAxioms hCerts hNumeric

end ERURH
```

**Fragmento literal (RH_from_ERURH_conditional + inicio de proof)**

```lean
@[simp] /-- Versión técnica con contexto RMS explícito. -/
theorem RH_from_ERURH_assumptions
  (assm : ERURH_Assumptions)
  (ctx : RMSLocalContext)
  (hA1 : A1_mode ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx)
  (hAxioms : AxiomsShimAccepted := trivial)
  (hCerts : CertificatesCorrectAlpha := { global := globalEnergyCertificate_true_alpha, h_global := globalEnergyCertificate_true_correct_alpha, kernel := kernelBlowupCertificate_true_alpha, h_kernel := kernelBlowupCertificate_true_correct_alpha })
  (hNumeric : NumericCoverageAlpha ctx := by exact fun w => by trivial) :
  RiemannHypothesis xiAlpha :=
by
  -- Build the analytic bundle from external assumptions and A1/A2 controls.
  have hAnalytic : PlanB_AnalyticAssumptions ctx :=
    makePlanBAnalyticBundle ctx assm.classical assm.spectral assm.ls_gamma hA1 hLow hTail
  -- Apply the Plan B master theorem.
  exact RH_from_planB_bundle ctx hAnalytic hAxioms hCerts hNumeric

/-- Condensed master theorem: external packages (classical/spectral/LS_γ/beta)
plus RMS window assumptions imply `RiemannHypothesis xiAlpha`. -/
theorem RH_from_ERURH_conditional
  (G : ERURH_GlobalAssumptions)
  (hAxioms : AxiomsShimAccepted := trivial)
  (hCerts : CertificatesCorrectAlpha := { global := globalEnergyCertificate_true_alpha, h_global := globalEnergyCertificate_true_correct_alpha, kernel := kernelBlowupCertificate_true_alpha, h_kernel := kernelBlowupCertificate_true_correct_alpha })
  (hNumeric : NumericCoverageAlpha G.window.ctx := by exact fun _ => by trivial) :
  RiemannHypothesis xiAlpha :=
by
  rcases G with ⟨eru, window⟩
  rcases window with ⟨ctx, hA1, hLow, hTail⟩
  exact RH_from_ERURH_assumptions eru ctx hA1 hLow hTail hAxioms hCerts hNumeric

end ERURH
```

## 3) Tabla de campos de ERURH_GlobalAssumptions

| Campo | Tipo (literal) | Categoría | Referencias (top 3) |

| --- | --- | --- | --- |

| `eru` | `ERURH_Assumptions` | mixto (clásico + A/B/C + certificados beta) | lean/formal_proofs/ERURH\AlphaAssumptions.lean:17:    - `flux_energy_alpha`: lema A/B + control de energía del flujo ERU.<br>lean/formal_proofs/ERURH\AlphaInterfaces.lean:129:/-- Sistema ERU teórico instanciado con los datos `alpha`. -/<br>lean/formal_proofs/ERURH\AnalyticWitness.lean:6:# Analytic witness for the ERU ↔ ξ bridge |

| `window` | `WindowScalingAssumptions` | ventanas (A1/A2) | lean/formal_proofs/ERURH\ERURH_A2Hypotheses.lean:36:  ∀ w : ctx.Window, ctx.RMS_low w ≤ ctx.c_low<br>lean/formal_proofs/ERURH\ERURH_A2Hypotheses.lean:40:  ∀ w : ctx.Window, ctx.RMS_tail w ≤ ctx.c_tail<br>lean/formal_proofs/ERURH\ERURH_A2Hypotheses.lean:44:  ∃ w : ctx.Window, ∃ K : ℝ, |


## 4) Tabla de axiom/constant/opaque

| Nombre | Kind | Tipo (línea literal) | Archivo:Línea | ¿Afecta al teorema maestro? |

| --- | --- | --- | --- | --- |

| `explicit_alpha` | axiom | `axiom explicit_alpha : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi` | `lean/formal_proofs/ERURH/AlphaAxioms.lean:8` | Yes |

| `rh_from_E_alpha` | axiom | `axiom rh_from_E_alpha : RHfromE xiAlpha AlphaPsi` | `lean/formal_proofs/ERURH/AlphaAxioms.lean:11` | Yes |

| `alphaInterfacesBase` | axiom | `axiom alphaInterfacesBase : AlphaInterfaces` | `lean/formal_proofs/ERURH/AlphaAxioms.lean:14` | Yes |

| `ERU_energy_global_alpha` | constant | `constant ERU_energy_global_alpha : R` | `lean/formal_proofs/ERURH/ERUEnergyAlpha.lean:26` | Yes |

| `ERU_inertia_to_E_bound_alpha` | axiom | `axiom ERU_inertia_to_E_bound_alpha :` | `lean/formal_proofs/ERURH/ERUInertia.lean:46` | No |

| `ERU_inertia_of_E_bound_alpha` | axiom | `axiom ERU_inertia_of_E_bound_alpha :` | `lean/formal_proofs/ERURH/ERUInertia.lean:51` | No |

| `RH_to_E_bound_alpha` | axiom | `axiom RH_to_E_bound_alpha :` | `lean/formal_proofs/ERURH/ERUInertia.lean:73` | No |

| `betaInertiaAssumptions_true` | axiom | `axiom betaInertiaAssumptions_true : BetaInertiaAssumptions` | `lean/formal_proofs/ERURH/ERURH_BetaInertiaAssumptions.lean:31` | Yes |

| `ZeroOfZeta` | constant | `constant ZeroOfZeta : Type` | `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:21` | Yes |

| `beta` | constant | `constant beta : ZeroOfZeta → ℝ` | `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:24` | Yes |

| `gamma` | constant | `constant gamma : ZeroOfZeta → ℝ` | `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:27` | Yes |

| `gamma_prefactor_bound` | axiom | `axiom gamma_prefactor_bound : gamma_prefactor_growth_bound` | `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:49` | Yes |

| `b_rho` | constant | `constant b_rho : ZeroOfZeta → ℂ` | `lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:56` | Yes |

| `EToRH_L1_alpha_of_explicit` | axiom | `axiom EToRH_L1_alpha_of_explicit :` | `lean/formal_proofs/ERURH/EToRHChecklist.lean:47` | No |

| `EToRH_L2_alpha_of_bounds` | axiom | `axiom EToRH_L2_alpha_of_bounds :` | `lean/formal_proofs/ERURH/EToRHChecklist.lean:52` | No |

| `EToRH_L3_alpha_of_argument` | axiom | `axiom EToRH_L3_alpha_of_argument :` | `lean/formal_proofs/ERURH/EToRHChecklist.lean:57` | No |

| `EToRH_no_offline_zeros_alpha_of_stages` | axiom | `axiom EToRH_no_offline_zeros_alpha_of_stages :` | `lean/formal_proofs/ERURH/EToRHChecklist.lean:63` | No |

| `RHfromE_alpha_of_no_offline_zeros` | axiom | `axiom RHfromE_alpha_of_no_offline_zeros :` | `lean/formal_proofs/ERURH/EToRHChecklist.lean:70` | No |

| `rh_from_E_alpha_of_hypotheses` | axiom | `axiom rh_from_E_alpha_of_hypotheses :` | `lean/formal_proofs/ERURH/EToRHChecklist.lean:95` | No |

| `explicit_rect_alpha_true` | axiom | `axiom explicit_rect_alpha_true : explicit_rect_alpha` | `lean/formal_proofs/ERURH/ExplicitCoreBridge.lean:40` | No |

| `explicit_core_alpha` | axiom | `axiom explicit_core_alpha : Prop` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:25` | Yes |

| `xi_bounds_alpha` | axiom | `axiom xi_bounds_alpha : Prop` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:48` | Yes |

| `Explicit_L2_alpha_of_bounds` | axiom | `axiom Explicit_L2_alpha_of_bounds :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:58` | No |

| `xi_argument_alpha` | axiom | `axiom xi_argument_alpha : Prop` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:63` | Yes |

| `Explicit_L3_alpha_of_argument` | axiom | `axiom Explicit_L3_alpha_of_argument :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:73` | No |

| `xi_argument_alpha_of_hypotheses` | axiom | `axiom xi_argument_alpha_of_hypotheses :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:83` | No |

| `flux_to_bridge_bounds_alpha` | axiom | `axiom flux_to_bridge_bounds_alpha : Prop` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:88` | Yes |

| `Explicit_L4_alpha_of_flux` | axiom | `axiom Explicit_L4_alpha_of_flux :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:98` | No |

| `flux_to_bridge_alpha_of_hypotheses` | axiom | `axiom flux_to_bridge_alpha_of_hypotheses :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:109` | No |

| `xi_bounds_alpha_of_hypotheses` | axiom | `axiom xi_bounds_alpha_of_hypotheses :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:140` | No |

| `xi_argument_alpha_of_hypotheses` | axiom | `axiom xi_argument_alpha_of_hypotheses :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:144` | No |

| `Explicit_L1_alpha_of_explicit_core` | axiom | `axiom Explicit_L1_alpha_of_explicit_core :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:154` | No |

| `Explicit_L1_alpha_strong_to_L1` | axiom | `axiom Explicit_L1_alpha_strong_to_L1 :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:161` | No |

| `explicit_alpha_of_stages` | axiom | `axiom explicit_alpha_of_stages :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:190` | No |

| `explicit_alpha_of_pieces` | axiom | `axiom explicit_alpha_of_pieces :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:282` | No |

| `rh_from_E_alpha_of_pieces` | axiom | `axiom rh_from_E_alpha_of_pieces :` | `lean/formal_proofs/ERURH/ExplicitDecomposition.lean:291` | No |


## 5) Artefactos regenerados y su rol

- `lean/formal_proofs/ERURH/RationalBounds.lean`: **True**

- `lean/formal_proofs/ERURH/CertificateValues.lean`: **True**

- Generación (scripts): `tools/make_rational_bounds.py`, `tools/make_certificate_values.py`.


Módulos que importan estos artefactos:

```text
lean/formal_proofs/ERURH\BoundsConfig.lean:3:import ERURH.RationalBounds
lean/formal_proofs/ERURH\ERUEnergyAlpha.lean:3:import ERURH.RationalBounds
lean/formal_proofs/ERURH\Certificate.lean:11:import ERURH.RationalBounds
lean/formal_proofs/ERURH\EnergyCertificatesAlpha.lean:2:import ERURH.RationalBounds
lean/formal_proofs/ERURH\ERURH_GatesAlpha.lean:1:import ERURH.RationalBounds
lean/formal_proofs/ERURH\CertificateValues.lean:7:import ERURH.RationalBounds
lean/formal_proofs/ERURH\ERURH_A2Hypotheses.lean:3:import ERURH.RationalBounds
lean/formal_proofs/ERURH\FluxWindows.lean:4:import ERURH.RationalBounds
lean/formal_proofs/ERURH\Main.lean:7:import ERURH.CertificateValues
lean/formal_proofs/ERURH\WeightedBands.lean:18:import ERURH.RationalBounds
```

## 6) Comparación con documentación (consistencia)

- `README.md`: **True**

- `docs/core/ERURH_Assumptions_Report.md`: **True**

- `docs/core/ERURH_MainTheorem.md`: **True**

- `docs/core/ERURH_Analytic_Theorems_ABC.md`: **True**


Observaciones:

- `docs/core/ERURH_Assumptions_Report.md` describe `ERURH_Assumptions` y `WindowScalingAssumptions`, alineado con los campos `eru` y `window` del record.

- `docs/core/ERURH_MainTheorem.md` describe el paquete clásico + espectral + LSγ y su encapsulación en `ERURH_GlobalAssumptions`; coherente con Lean.

- `docs/core/ERURH_Analytic_Theorems_ABC.md` detalla A/B/C y su rol para `hb_tail` y `ls_gamma_weak`.

- Posible desajuste: en `ERURH_Assumptions_Report.md` se menciona `admissible_range` como campo de `LSGammaAssumptions`, pero en Lean `LSGammaAssumptions` solo tiene `LS_gamma_fine` y `ls_gamma_weak`.

- Posible desajuste menor de nombre: en docs aparece `ERU_energy_kernel_blowup_of_mode_beta_of_certificate`, mientras en Lean el campo es `energy_kernel_blowup_of_mode_beta_of_certificate` en `BetaInertiaAssumptions`.


## 7) Mapa de cierre (lo que queda abierto tras A/B/C)

| Hipótesis / paquete | En Lean está como | Estado actual | Cómo cerrarlo |

| --- | --- | --- | --- |

| ClassicalZetaAssumptions | campo de `ERURH_Assumptions` (`classical`) | abierto (asumido) | (i) resultados clásicos citados |

| Hb (hb_tail) | `SpectralAssumptionsAlpha.hb_tail` | abierto (asumido) | (ii) A/B/C (Teorema A) |

| LSγ (ls_gamma_weak / LS_gamma_fine) | `LSGammaAssumptions` | abierto (asumido) | (ii) A/B/C (Teorema B) |

| A1/A2 ventanas | `WindowScalingAssumptions` (A1/A2) | abierto (asumido) | (iv) derivación analítica RMS + cobertura |

| Certificados alpha | `CertificatesCorrectAlpha` (parámetro del teorema) | cerrado por datos Lean (si los artefactos son correctos) | (iii) pipeline numérico + certificados |

| Cobertura RMS | `NumericCoverageAlpha ctx` | abierto (placeholder `RMS_envelope_closed`) | (iv) malla/intervalos formales o lemas de cobertura |

| BetaInertiaAssumptions | `ERURH_Assumptions.beta_inert` | abierto (axiomático) | (iii) pipeline numérico + certificados beta |
