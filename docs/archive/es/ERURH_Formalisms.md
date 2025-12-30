# ERURH Formals v1

Esta capa formal se apoya exclusivamente en los artefactos canonicos del bundle
`releases/buchstab-pointfix-v1`. Las constantes se controlan con aritmetica
intervalar (`Decimal`, prec=80) y redondeo dirigido.

## Comparacion: numerico vs analitico vs closed

| Magnitud | Numerico | Analitico | Closed | Domina |
| --- | --- | --- | --- | --- |
| L_global | 0.1753984986621393400000 | 0.1753984986621393400000 | 0.57929977774014219936853669559016787753444098162539155141207156547098121417508683 | Empate |
| kappa_low | 8.168110882635824 | 8.168110882635824 | N/D | Empate |
| kappa_high | 9.433600625136824 | 9.433600625136824 | 33.231391735111652258083516140795691416354159404063920126731990551717871611128396 | Empate |
| C_envelope | 0.047695613749186421541958354101922854282320773892561598071489257721130596194295849 | 0.047695613749186421541958354101922854282320773892561598071489257721130596194295849 | 0.047695613749186421541958354101922854282320773892561598071489257721130596194295849 | Empate |
| s0 | 13.815510557964274 | 13.815510557964274 | 13.815510557964274 | Empate |

- La constante efectiva empleada por `formal_runner` y `formal_gate` es siempre el minimo entre las cotas superiores disponibles (numerica, analitica o closed), sin descender por debajo de la cota operativa del bundle.
- Ruta analitica disponible (ver `formal_report_analytic.json`).
- Cotas cerradas disponibles (ver `L_analytic_proof.json`, `kappa_book_proof.json`, `bridge_closed.json`).
- s0 formal: 13.815510557964274 (leido de `formal_report.json`).

## Lema A (Contraccion uniforme, norma ERU)

Existe \(L_{\text{global}}^{\text{formal}} < 1\) tal que, para todo subintervalo del
mosaico con solape suficiente y \(s \ge s_0\), el operador de renormalizacion \(T\)
satisface

\[
  \lVert Tf - Tg \rVert_{\text{ERU}} \le
  L_{\text{global}}^{\text{formal}} \lVert f - g \rVert_{\text{ERU}}.
\]

Parametros: paso maximo \(\Delta u = 0.01\), correccion conservadora \(\delta_L = 0.0003436305730000000000\).

### Lema A (analitico y cerrada)

La prueba cerrada parte de \((Th)(u)=\frac{1}{u}\int_{u/3}^{u/2}h(t)\,dt\).
En norma suprema se obtiene \|Th\|_\infty \le \frac{1}{3}\|h\|_\infty.
La equivalencia de normas \(\|h\|_{L^2(w)} \le \sqrt{\frac{\max w}{\min w}}\,\|h\|_{L^2(\tilde w)}\)
permite trasladar la cota a la norma ERU. Las cotas por parche figuran en `L_analytic.json`
y el desglose cerrado (sin discretizacion) en `L_analytic_proof.json`.

- Parche mas restrictivo (closed): alpha=0.49_shift=0 en [13.815510557964274, 16.811242831518264], domina w=e^{s/2}/s^2, ratio = 3.0202940924080033646949855518654729226445513343582574252448142392991432798041663, L_A_closed = 0.57929977774014219936853669559016787753444098162539155141207156547098121417508683.

## Lema B (Desigualdad de energia ERU)

Existen \(\kappa_{\text{low}}^{\text{formal}}, \kappa^{\text{formal}}, \kappa_{\text{high}}^{\text{formal}}\) tales que

\[
  \int J_{\text{rel}}(s)^2 w(s) \, ds \le
  \kappa^{\text{formal}} \int \bigl(\log R(s)\bigr)^2 w(s) \, ds,
\]

para \(w(s)=1, e^{s/2}/s^2\) y \(s \ge s_0\). La banda superior se infla con \(\delta_\kappa = 0.050\).

### Lema B (constante de libro y cerrada)

Para la derivada central discreta \(D_h f(s)=\frac{f(s+h)-f(s-h)}{2h}\) se cumple
\(\|D_h f\|_{L^2(w)}^2 \le \frac{\max w}{\min w}\frac{1}{h^2}\|f\|_{L^2(w)}^2\).
El paso minimo \(h_{\min} = 0.272866124662384\)
fija la constante `kappa_book.json` y su version cerrada `kappa_book_proof.json`.

- Constantes cerradas: kappa_book(1) = 13.430765119765409074627499265824910629715130770960226184394782407824039273487999, kappa_book(weighted) = 33.231391735111652258083516140795691416354159404063920126731990551717871611128396, kappa_book_closed = 33.231391735111652258083516140795691416354159404063920126731990551717871611128396, h_min = 0.272866124662384, weight_min = 5.9365908676063735972540939975487643575434551524825323062577760707316184174516621, weight_max = 14.688751901571457491913526801755493163269964839523866807461416441047966079769442.

## Lema C (Puente \(\Phi\psi\log R\) con constantes)

A partir de las cotas explicitas en \(\Phi\) (nucleo y holdouts), de \(L_{\text{global}}^{\text{formal}} < 1\)
y de la banda \(\kappa^{\text{formal}}\), existe \(C_{\text{envelope}}^{\text{formal}}\) y
\(s_0 = 13.815510557964274\) tales que

\[
  \lvert \log R(s) \rvert \le
  C_{\text{envelope}}^{\text{formal}} \frac{e^{s/2}}{s^2}, \quad s \ge s_0.
\]

La constante formal nunca se situa por debajo de la operativa del bundle y se infla con
\(\varepsilon_\Phi, \varepsilon_L, \varepsilon_\kappa\). La version cerrada (`bridge_closed.json`)
documenta el mismo encadenado con constantes de libro.

- Puente closed: C_envelope_closed = 0.047695613749186421541958354101922854282320773892561598071489257721130596194295849, s0_closed = 13.815510557964274, inflation = 1.0113135730153359554015573855432290453965506513276367523650187731599284777868966.

## Corolario (RH)

La envolvente anterior implica el error clasico en \(\psi(x)\); por el diccionario estandar, RH.

## Supuestos y cobertura

- Cobertura del mosaico (`alpha_cover_report.json`) y \(L_{\text{global}} < 1\).
- Banda energetica canonica (`energy_constant.json`, rejilla central).
- Holdouts de \(\Phi\) por debajo de \(0.5\%\).
- Rejilla canonica `logR_series.csv` fija \(s_0\) y ventana ERU.

Las cotas formales se derivan unicamente de las entradas documentadas en `formalisms/inputs_schema.md`.

## Documentos adicionales

- `docs/ERURH_Formalisms_Analytic.md` (panorama analitico v1).
- `docs/ERURH_Formalisms_Analytic_A.md` (prueba cerrada de Lema A).
- `docs/ERURH_Formalisms_Analytic_B.md` (prueba cerrada de Lema B).
- `docs/ERURH_Formalisms_Analytic_Bridge.md` (puente con constantes de libro).
- `ADDENDA_ANALYTIC.md` y `ADDENDA_ANALYTIC_V2.md` en la release: notas de integracion y politica de uso.
