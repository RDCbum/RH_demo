# ERURH-alpha · Capa industrial

## Visión y flujo (texto)
- Datos publicados (`releases/erurh-v2-core/{formal,constants_global}.json` y estudios `studies/buchstab_pointfix/out/*`)
  → `tools/make_rational_bounds.py`
  → `docs/paper/rational_bounds.json` + `formal_proofs/ERURH/RationalBounds.lean`
  → `tools/make_certificate_values.py`
  → `docs/paper/certificate_values.json` + `formal_proofs/ERURH/CertificateValues.lean`
  → `tools/make_flux_bounds.py`
  → `formal_proofs/ERURH/FluxBounds.lean` → `alphaBridge_inertia` (puente hacia `BridgeInertiaCertificate_true_alpha`).
- Bounds analíticos de ventanas/tail (`tools/bounds_config.json`):
  → `tools/make_lambda_bounds.py` + `tools/gen_walpha_close.py`
  → `staging/ERURH/LambdaBounds.lean` + `staging/ERURH/Staging/LambdaClose_*`
  → `LambdaWitnessBuildOn` / `XiWitnessAssembly`.
- Prefactor numérico:
  → `tools/make_prefactor_bounds.py` + `tools/gen_wprefactor_close.py`
  → `staging/ERURH/PrefactorBounds.lean` + `staging/ERURH/Staging/PrefactorClose_*`
  → `XiPrefactor`.
- Zeta:
  → `tools/make_zeta_bounds.py` + `tools/gen_wzeta_close.py`
  → `staging/ERURH/ZetaBounds.lean` + `staging/ERURH/Staging/ZetaClose_*`
  → `XiZetaIface` / `XiWitnessAssembly`.
- Ensamblado Lean (`lake build ERURH`) → certificados `_true_alpha` → teorema ERURH-alpha.

## Inventario de scripts y artefactos

| Script | Inputs clave | Outputs | Certificado/Lean que toca |
| --- | --- | --- | --- |
| `tools/make_rational_bounds.py` | `releases/erurh-v2-core/formal/{L_analytic_proof,kappa_book_proof,bridge_closed,s0_unified,formal_report_strict}.json` | `docs/paper/rational_bounds.json`, `formal_proofs/ERURH/RationalBounds.lean` | Provee `lGlobalFormalRat`, `kappaBookClosedRat`, etc. usados en `globalEnergyCertificate_true_alpha`, `kernelBlowupCertificate_true_alpha`, `CertificateValues`. |
| `tools/make_certificate_values.py` | `releases/erurh-v2-core/formal/bridge_closed.json`, `formal_report_strict.json`, `releases/erurh-v2-core/constants_global.json`, `docs/paper/rational_bounds.json` | `docs/paper/certificate_values.json`, `formal_proofs/ERURH/CertificateValues.lean` | Construye `certificateFromBundle`, verifica inflación y `s0`; alimenta `CertificateHypotheses` y energía alpha. |
| `tools/make_flux_bounds.py` | `releases/erurh-v2-core/alpha_cover_report.json`, `studies/buchstab_pointfix/out/logR_series.csv`, `studies/buchstab_pointfix/out/equivalence_report_check.json`, `releases/erurh-v2-core/constants_global.json` | `formal_proofs/ERURH/FluxBounds.lean` | Instancia `alphaFluxLaws` y `alphaBridge_inertia` → `BridgeInertiaCertificate_true_alpha`. |
| `tools/make_lambda_bounds.py` | `tools/bounds_config.json`, perfil (`--profile`), caché `tools/cache/lambda/<fingerprint>/` | `staging/ERURH/LambdaBounds.lean`, `staging/ERURH/LambdaIntervals_skeleton.lean`, `staging/ERURH/LambdaSamples_skeleton.lean`, cachés JSON por ventana/tail | Testigos de `lambdaCore` en ventanas/tail; usados por `LambdaWitnessBuildOn` → puente hacia `XiWitnessAssembly` y `StrongInertiaCertificate_alpha`. |
| `tools/gen_walpha_close.py` | Cachés de `make_lambda_bounds` (`tools/cache/lambda/**/{window}.json` + `tail.json` o `--cert` JSON) | `staging/ERURH/Staging/LambdaClose_<window>_all.lean` | Ensambla lemas por ventana (cap suprema) para `LambdaBounds` y `FluxWindows`. |
| `tools/make_prefactor_bounds.py` | `tools/bounds_config.json`, perfil (`--profile`), caché `tools/cache/prefactor/<fingerprint>/` | `staging/ERURH/PrefactorBounds.lean`, lemas helper `staging/ERURH/Staging/Prefactor*`, `prefactor_segments_*_tail.json` | Bounds de `prefactor_pad_fun`; consumidos por `XiPrefactor` y puente a `StrongInertiaCertificate_alpha`. |
| `tools/gen_wprefactor_close.py` | `prefactor_segments_*_tail.json` + cachés por ventana/tail | `staging/ERURH/Staging/PrefactorClose_<window>_all.lean` | Cierra ventanas/tail de prefactor frente a `pf_log_q`/tail; conecta con `FluxWindows`. |
| `tools/make_zeta_bounds.py` | `tools/bounds_config.json`, perfil (`--profile`), caché `tools/cache/zeta/<fingerprint>/` | `staging/ERURH/ZetaBounds.lean`, payloads de segmentos (`zeta_segments_*.json`), helpers opcionales | Bounds de `riemannZeta`/deriv en ventanas/tail; usados por `XiZetaIface` y `XiWitnessAssembly`. |
| `tools/gen_wzeta_close.py` | Segmentos de `make_zeta_bounds` (cache o bundle) | `staging/ERURH/Staging/ZetaClose_<window>_all.lean` | Cierra ventanas/tail de zeta frente a `zeta_log_q`/`zeta_j_q`. |
| `scripts/verify_gate.py` | Repo limpio, scripts anteriores disponibles | Ejecuta `make_rational_bounds`, `make_certificate_values`, `tools/render_paper.py`, `lake build`, `pytest tests`; falla si hay diffs nuevos | Gate reproducible de constantes/certificados y compilación Lean. |
| `tools/formal_gate.py` | `releases/erurh-v2-core` bundle + `formal_report_strict.json` (opcional) | `buchstab_pointfix/out/formal_gate_report.json` | Comprueba coherencia formal (`L_global`, `kappa_*`, `s0`) vs reportes analíticos. |
| Tests | `pytest tests` (core), `pytest tests tests_fin` (cuando se toca finanzas/entropía/utilidades), `python -m tools.e2e_cli_tests` | Reportes pytest / CLI e2e | Revisión auxiliar; no generan artefactos Lean pero gatean regresiones. |

## Pipeline reproducible (alpha)
1. **Entorno** (aux): `.\.venv\Scripts\activate` y `pip install -e .`.
2. **Bounds racionales** (crítico): `python tools/make_rational_bounds.py --release-dir releases/erurh-v2-core/formal --out docs/paper/rational_bounds.json --lean-out formal_proofs/ERURH/RationalBounds.lean`.
3. **Valores del certificado** (crítico): `python tools/make_certificate_values.py --release-dir releases/erurh-v2-core/formal --constants-path releases/erurh-v2-core/constants_global.json --bounds-path docs/paper/rational_bounds.json --out-json docs/paper/certificate_values.json --lean-out formal_proofs/ERURH/CertificateValues.lean`.
4. **Flux windows/tail** (crítico para `BridgeInertiaCertificate_true_alpha`): `python tools/make_flux_bounds.py` (lee `studies/buchstab_pointfix/out/logR_series.csv`, `equivalence_report_check.json`, `alpha_cover_report.json`).
5. **Lambda witness** (crítico para rama analítica/Strong): `python tools/make_lambda_bounds.py --profile release-strict --merge --windows 0,1,2,3,4,5,tail` (usa y rellena `tools/cache/lambda/<fingerprint>/`; genera `staging/ERURH/LambdaBounds.lean`).
6. **Prefactor pad** (crítico para rama prefactor): `python tools/make_prefactor_bounds.py --profile release --windows wAlpha49_shift0,wAlpha49_shift1,wAlpha50_shift0,wAlpha50_shift1,wAlpha51_shift0,wAlpha51_shift1 --merge --merge-windows wAlpha49_shift0,wAlpha49_shift1,wAlpha50_shift0,wAlpha50_shift1,wAlpha51_shift0,wAlpha51_shift1,tail` (genera `staging/ERURH/PrefactorBounds.lean` y bundle de segmentos).
7. **Zeta witness** (crítico para rama zeta): `python tools/make_zeta_bounds.py --profile release-strict --merge --windows wAlpha49_shift0,wAlpha49_shift1,wAlpha50_shift0,wAlpha50_shift1,wAlpha51_shift0,wAlpha51_shift1,tail` (genera `staging/ERURH/ZetaBounds.lean` + bundles).
8. **Cierres por ventana** (crítico para conectar bounds→`FluxWindows`):  
   - Lambda: `python tools/gen_walpha_close.py --window wAlpha49_shift0 --emit-window-close` (repetir por ventana).  
   - Prefactor: `python tools/gen_wprefactor_close.py --window wAlpha49_shift0 --emit-window-close` (repetir por ventana).  
   - Zeta: `python tools/gen_wzeta_close.py --window wAlpha49_shift0 --emit-window-close` (repetir por ventana).
9. **Cache opcional**: `lake exe cache get` (descarga deps Lean cuando aplica).
10. **Build Lean** (crítico): `lake build ERURH`.
11. **Gate reproducible** (crítico, automatiza 2–3–10–tests): `python scripts/verify_gate.py` (añadir `--skip-pytests` si ya se corrió pytest).
12. **Tests Python** (auxiliar pero recomendados): `pytest tests` o `pytest tests tests_fin`; para cola CLI `python -m tools.e2e_cli_tests`.

Pasos críticos para los certificados Lean: 2–4–7–8–10–11 (5–6 también si se actualizan ramas Strong/prefactor/zeta). Pasos auxiliares: 1, 9, 12 y renderizado de paper.

## Mapa scripts → certificados `_true_alpha` y campos `Correct`
- `make_rational_bounds.py` → `RationalBounds.lean` alimenta `kappaBookClosedRat`, `lGlobalFormalRat`, `s0ClosedRat`, etc. usados por `globalEnergyCertificate_true_alpha` y `kernelBlowupCertificate_true_alpha` en `GlobalEnergyCertificateCorrect_alpha` / `KernelBlowupCertificateCorrect_alpha`.
- `make_certificate_values.py` → `CertificateValues.lean` define `certificateFromBundle`, garantiza hipótesis (`lAClosedRat < 1`, no-negatividad de eps) para `CertificateHypotheses` y energía alpha.
- `make_flux_bounds.py` → `FluxBounds.lean` instancia `alphaFluxLaws`/`alphaFluxCertificate`; `alphaBridge_inertia` se inserta en `bridgeInertiaCertificate_true_alpha` y `BridgeInertiaCertificateCorrect_alpha`.
- `make_lambda_bounds.py` + `gen_walpha_close.py` → `LambdaBounds.lean` + cierres por ventana; base para `LambdaWitnessBuildOn` y la rama hacia `InertiaERU_alpha_strong` (objetivo de `StrongInertiaCertificate_true_alpha`).
- `make_prefactor_bounds.py` + `gen_wprefactor_close.py` → `PrefactorBounds.lean` + cierres; consumidos por `XiPrefactor` (prefactor fuerte) que se referenciará desde `StrongInertiaCertificate_alpha`.
- `make_zeta_bounds.py` + `gen_wzeta_close.py` → `ZetaBounds.lean` + cierres; usados por `XiZetaIface`/`XiWitnessAssembly` para completar la rama zeta del certificado fuerte.
- `scripts/verify_gate.py` → no define certificado, pero comprueba que `RationalBounds.lean` y `CertificateValues.lean` se regeneran sin diffs y que `lake build` pasa (garantiza que `_true_alpha` siguen compilandose).

## Propuestas de mejora / refactor
- **Orquestador único**: añadir `python tools/eru_pipeline.py --profile alpha` que encadene 2–11, con flags `--no-strong` (saltarse lambda/prefactor/zeta) y `--ci-fast` (perfiles `ci-fast` y `--skip-pytests`).
- **Perfiles declarativos**: centralizar perfiles `release-strict/dev/ci-fast` en un único `configs/pipeline_profiles.yml` consumido por `make_lambda_bounds`, `make_zeta_bounds`, `make_prefactor_bounds` y por el orquestador.
- **Checksums y locking**: después de generar caches `tools/cache/{lambda,prefactor,zeta}/<fingerprint>`, emitir un `fingerprint.txt` con `bounds_config` y hash del script para detectar ejecuciones obsoletas.
- **Quickstart revisor**: mover la lista de comandos críticos (2–4–10–11) a `RUNBOOK.md` y enlazar desde `README.md`/`docs/ERURH_IndustrialPipeline_Alpha.md`; incluir tiempos estimados y requisitos (Python 3.11, Lean toolchain de `lean-toolchain`).
- **Bundles auditables**: publicar en `releases/` los bundles de segmentos (`prefactor_segments_*`, `zeta_segments_*`) y `certificate_values.json` usados en revisiones para que los cierres `gen_w*_close.py` puedan validar checksums antes de escribir Lean.

## Notas para revisores
- Para verificar la demostración completa tras tocar constantes o ventanas: ejecutar pasos 2–4–7–8–10–11 (añadir 5–6 si cambia `bounds_config.json` o scripts de lambda/prefactor).
- El gate `scripts/verify_gate.py` falla si `docs/paper/certificate_values.json` o `formal_proofs/ERURH/CertificateValues.lean` difieren tras regenerar; úselo antes de abrir PR.
