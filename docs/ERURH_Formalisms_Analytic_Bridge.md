# ERURH Formalisms Analytic — Puente \(\Phi\psi\log R\)

Este documento resume el encadenado analitico que liga las cotas de \(\Phi\) y \(\psi\) con la envolvente de \(\log R\), fijando constantes de libro y cuantificadores globales.

## Constantes de entrada

Partimos de `constants_global.json`, que proporciona \(\Phi_{\text{core}}\), \(\Phi_{\text{holdouts}}\), la constante operativa \(C_{\text{envelope}}\) y el umbral \(s_0\). Las cotas cerradas de Lemas A y B se leen desde `L_analytic_proof.json` y `kappa_book_proof.json`.

El tope \(T_{\text{cap}}\) se fija en `tools/bounds_config.json` bajo la clave `boundsTcap`. Este valor es la fuente de verdad tanto para los generadores (`make_lambda_bounds.py`, `make_zeta_bounds.py`) como para `formal_proofs/ERURH/BoundsConfig.lean`, que contiene un guardia de compilación: si el archivo JSON y el valor Lean divergen, `lake build ERURH` aborta antes de propagar pruebas incoherentes.

## Inflacion controlada

El puente formal agrupa tres margenes:
\[
  \varepsilon_{\Phi}, \qquad
  \varepsilon_L = \frac{\delta_L}{1 - L_{\text{upper}}}, \qquad
  \varepsilon_{\kappa} = \frac{\delta_{\kappa}}{\kappa_{\text{high}}}.
\]
Cada uno proviene de artefactos canónicos (kernel, renorm, energía) y se mantiene al aplicar las cotas cerradas.

## Constante de libro

La envolvente cerrada queda fijada por
\[
  C_{\text{envelope}}^{\text{closed}} =
  C_{\text{operativo}} \cdot (1 + \varepsilon_{\Phi}) (1 + \varepsilon_L) (1 + \varepsilon_{\kappa}),
\]
asegurando que nunca se desciende por debajo del baseline operativo. El valor de \(s_0\) se preserva igual al de la rejilla canonica.

## Artefacto

`formalisms/analytic_bridge_proof.py` emite `bridge_closed.json` con \(C_{\text{envelope}}^{\text{closed}}\), \(s_0\), los margenes \(\varepsilon\) y las referencias a los lemas cerrados. Este artefacto alimenta el runner formal en modo estricto y valida el nuevo gate con `--strict`.

## Cadena prefactor → RH

```
prefactor witness ─┐
                   │  pads pf_log_q, pf_j_q, pf_tail_*  (≈ 0 por diseño)
LambdaWitness ─────┴─► PrefactorWitnessOn.ofLambda
ZetaWitness ─────────► XiWitness.ofPrefactorZeta
XiWitness ───────────► BridgeToXi.ofWitness
BridgeToXi + ExplicitFormulaLaws ─► RHfromE
RHfromE + InertiaERU ─────────────► RiemannHypothesis
```

Los pads racionales permanecen nulos en la release actual; se incluyen solo para absorber posibles ajustes numéricos sin debilitar las cotas. Sobre la recta crítica la parte racional verifica \(\Re(1/s + 1/(1 - s)) = 0\), de modo que no aporta a `jRel` y puede mantenerse con pad cero. Esta estructura se refleja en `XiWitness.ofPrefactorZeta`, que suma los pads de `Λ` y `ζ` ventana por ventana antes de conectarlos con el puente.

### Perfiles numéricos y caché

- Los generadores `make_lambda_bounds.py` y `make_zeta_bounds.py` soportan perfiles `ci-fast`, `dev` y `release-strict` que fijan \(T_{\mathrm{cap}}\), precisión de mpmath, tolerancia de refinamiento y límites de subdivisión. CI emplea `ci-fast` (\(T_{\mathrm{cap}} = 300\)) para obtener bounds conservadores en segundos; los perfiles `dev` y `release-strict` permiten reconstruir los certificados con más precisión sin tocar el código Lean.
- Cada subintervalo se redondea por exceso a múltiplos de \(10^{-12}\) tras aplicar un pequeño margen multiplicativo/aditivo. El resultado se guarda en `tools/cache/{lambda,zeta}/<fingerprint>/window.json`, por lo que el workflow puede recalcular únicamente los shards afectados.
- Los flags `--resume` y `--merge` permiten reutilizar los pads cacheados y recompilar `LambdaBounds.lean`/`ZetaBounds.lean` a partir de los JSON generados (la matriz de CI se apoya en ellos).

### Pipeline automatizado

`Invoke-ERURH-Pipeline.ps1` encapsula el flujo completo desde PowerShell: detecta `boundsTcap`, lista ventanas (`--list-windows` en los generadores), recalcula cada shard con `--resume` y `--tail-only`, reintenta en perfil `dev` si hay fallos puntuales y ejecuta `--merge`. Si `--merge` detecta `missing cache entry`, la función vuelve a lanzar el shard correspondiente y repite el merge una sola vez. Finalmente ejecuta `lake build ERURH` y `python -m tools.axioms_report`, mostrando el resumen de axiomas.

Checklist rápido (prefactor on-band):

1. `python -m tools.make_prefactor_bounds --profile ci-fast --resume --windows wAlpha49_shift{0,1} --emit-msamp-helpers --segments wAlpha49_shift{0,1}`
2. `python -m tools.make_prefactor_bounds --profile ci-fast --resume --windows wAlpha49_shift{0,1} --emit-lip-helpers --segments wAlpha49_shift{0,1}`
3. `python -m tools.make_prefactor_bounds --profile ci-fast --resume --tail-only --emit-{msamp,lip}-helpers --segments tail`
4. `python -m tools.make_prefactor_bounds --profile ci-fast --resume --merge --merge-windows wAlpha49_shift{0,1},tail`
5. `lake build ERURH`
6. `python -m tools.axioms_report` (resultado: `[propext, Classical.choice, Quot.sound]`).


### Certificados segmentados para Λ

- Cada shard de `make_lambda_bounds.py` emite ahora un certificado de segmentos enriquecido con la malla efectiva `h`, un mayorante puntual `M_log`/`M_j` y los coeficientes Lipschitz `L_log`/`L_j` redondeados por exceso. El JSON conserva además el estado (`ok`/`fallback`), el perfil, la precisión y el `tcap`; así, el `--merge` dispone de toda la metainformación para reconstruir las pruebas en Lean.
- Durante `--merge`, además de regenerar `LambdaBounds.lean`, se escribe `staging/ERURH/LambdaIntervals_skeleton.lean` con lemas esqueleto `lam_log_le_seg_*`/`lam_j_le_seg_*` por segmento y los lemas de ventana/cola correspondientes. Este módulo sigue sin importarse desde `ERURH.lean`; sirve como staging para el siguiente ciclo en el que reemplazaremos los `admit` por derivaciones reales.
- El andamiaje en Lean se apoya en `formal_proofs/ERURH/Numeric/Interval.lean`, que declara `GridCover`, junto con los enunciados placeholder `sup_le_from_grid_Lip` y `sup_le_union`. En el próximo ciclo dotaremos a estos teoremas de pruebas reales (sin axiomas) que consuman los certificados segmentados.

El objetivo del siguiente hito es sustituir las constantes globales por certificados de subintervalos demostrados en Lean, manteniendo limpio el `axioms_report`.

### Naturaleza del smoke test actual

- `SmokePads.lean`/`SmokeTests.lean` únicamente verifican el cosido algebraico de los pads racionales (ventanas + cola) y permanecen fuera de `ERURH.lean`. Todavía no descargan las desigualdades analíticas de `λ` o `ζ`; ese trabajo se abordará en el siguiente hito.

### Notas de generación y cola acotada

- Tanto `tools.make_lambda_bounds.py` como `tools.make_zeta_bounds.py` evalúan los supremos sobre cada ventana y sobre el intervalo de cola \([W.\mathrm{hi}, T_{\mathrm{cap}}]\), donde \(T_{\mathrm{cap}}\) proviene de los artefactos `explicit_mode_report.json` y queda registrado en `ExpRect.Tcap`.
- Los valores se redondean por exceso a racionales con denominador \(10^{12}\); se añade una tolerancia fija antes de redondear para proteger contra errores numéricos.
- En los rangos actuales no aparecen ceros de \(ζ(1/2 + it)\). Si en el futuro se cubre un intervalo que toque un cero, habrá que excluir un vecindario explícito o introducir una cota certificada para \((ζ'/ζ)(1/2 + it)\) cerca del polo correspondiente.
En la capa on-band no utilizamos identidades de producto para \(\xi\). Los perfiles auxiliares `xi_log_fun` y `xi_j_fun` se definen literalmente como la suma de las envolventes del prefactor y de ζ: `prefactor_*_fun + zeta_*_fun`. El pegamento analítico se reduce entonces a aplicar `add_le_add` sobre los testigos `PrefactorWitnessOn` y `ZetaWitnessOn`, sin exigir hipótesis sobre la no anulación de ζ en banda.

Tanto los generadores como `BridgeToXiOn` comparten un único tope \(T_{\mathrm{cap}} = \)`BoundsConfig.boundsTcapR`. El campo `ExpRect.Tcap` del adaptador on-band se fija en el mismo valor, de manera que el contrato explícito trabaja exactamente sobre el rectángulo certificado por los artefactos numéricos.

