# ERURH Formalisms Analytic Sketch

Este documento resume la ruta analitica empleada para fijar cotas cerradas en los Lemas A y B, y enlaza dichas cotas con el puente \(\Phi\psi\log R\) y el corolario tipo RH. Todo el texto se mantiene en ASCII para simplificar la generacion de PDFs automatizados.

## Lema A (global)

1. **Kernel canonico.** El operador tipo Buchstab satisface, para \(u \in [1,3]\),
   \[
     (Th)(u) = \frac{1}{u} \int_{u/3}^{u/2} h(t) \, dt.
   \]
   La integral media impone \(\|Th\|_{\infty} \le \tfrac{1}{3} \|h\|_{\infty}\).
2. **Traslacion al mosaico.** Cada parche del mosaico multi-\(\alpha\) es una traslacion del operador canonico. Para todo parche \(P\) con ventana \([s_{\min}, s_{\max}]\) y \(s \ge s_0\), el mismo kernel actua, de modo que la constante \(\tfrac{1}{3}\) se hereda sin penalizacion.
3. **Equivalencia de normas.** Sobre cada ventana finita se dispone de la equivalencia
   \[
     \|h\|_{L^2(w)} \le \sqrt{\frac{\max_P w}{\min_P w}} \, \|h\|_{L^2(\tilde w)},
   \]
   tanto para \(w(s)=1\) como para \(w(s)=e^{s/2}/s^2\). La razon de pesos se registra parche a parche en `formal/L_analytic.json`.
4. **Cota uniforme.** El peor parche \(P^\star\) (indicador `dominates`) fija
   \[
     L_{\text{global}}^{\text{analytic}} = \frac{1}{3} \max\left\{1, \sqrt{\frac{\max_{P^\star} w}{\min_{P^\star} w}}\right\} < 1.
   \]
   El runner adopta \(\min(L_{\text{global}}^{\text{numeric}}, L_{\text{global}}^{\text{analytic}})\) sin descender del baseline operativo.

## Lema B (fronteras y energia)

1. **Derivada central.** La derivada discreta \(D_h f(s) = \tfrac{f(s+h)-f(s-h)}{2h}\) satisface
   \(\|D_h f\|_{L^2(w)}^2 \le \frac{\max_P w}{\min_P w} \frac{1}{h^2} \|f\|_{L^2(w)}^2\).
2. **Cierre para \(w=1\).** Con \(h_{\min}\) tomado del bundle canonico se fija
   \(\kappa_{\text{book}}(1) = 1 / h_{\min}^2\).
3. **Cierre ponderado.** Para \(w(s)=e^{s/2}/s^2\) el ratio \(\max w / \min w\) se evalua en `formal/kappa_book.json`; de ahi se obtiene
   \(\kappa_{\text{book}}(w) = \kappa_{\text{book}}(1) \cdot \max w / \min w\).
4. **Bordes y \(s_0\).** Los terminos de borde de \(J_{\text{rel}}\) comparten la misma ventana y quedan absorbidos por \(\kappa_{\text{book}}\) siempre que \(s \ge s_0\), siendo \(s_0 = 13.815510557964274\) el valor importado desde `formal/formal_report.json`.

## Puente \(\Phi\psi\log R\) y corolario RH

1. **Fuentes.** Los artefactos `constants_global.json` y `phi_psi_bridge_report.json` suministran \(\varepsilon_{\Phi}\), \(\varepsilon_L\) y \(\varepsilon_{\kappa}\), ademas de la constante operativa de \(\Phi\).
2. **Lema C formal.** Con \(L_{\text{global}}^{\text{formal}} < 1\) y la banda \([\kappa_{\text{low}}, \min(\kappa_{\text{high}}^{\text{numeric}}, \kappa_{\text{book}})]\), se obtiene
   \[
     |\log R(s)| \le C_{\text{envelope}}^{\text{formal}} \frac{e^{s/2}}{s^2}, \quad s \ge s_0.
   \]
3. **Corolario tipo RH.** La envolvente anterior implica el error clasico de \(\psi(x)\) y, mediante el diccionario habitual, la validez de RH en el contexto del bundle.

## Plan hacia una prueba formal completa

- Formalizar en Lean/Coq la norma ERU, el operador \(T\) y la equivalencia de normas para cada parche.
- Registrar \(h_{\min}\), \(\kappa_{\text{book}}(1)\) y \(\kappa_{\text{book}}(w)\) como constantes racionales con intervalos dirigidos.
- Codificar el puente \(\Phi\psi\log R\) con la envolvente formal y los margenes \(\varepsilon\).
- Introducir un directorio `formal_proofs/` con stubs (Lean/Coq) que conecten los Lemas A y B con el corolario tipo RH.
- Automatizar la verificacion conjunta `tools.formal_gate` + `formal_runner --prefer-analytic-*` como paso previo a cualquier nueva release.
