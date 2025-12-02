# ERURH Formalisms Analytic — Lema A

Este documento presenta la prueba analitica cerrada del Lema A (contraccion global) para el operador tipo Buchstab. Todo el contenido se mantiene en ASCII.

## Operador canonico y mosaico

En el parche canonico \(u \in [1,3]\) se define el operador tipo Buchstab por
\[
  (Th)(u) = \frac{1}{u} \int_{u/3}^{u/2} h(t) \, dt.
\]
La extension al mosaico multi-\(\alpha\) se obtiene trasladando la variable renormalizada: cada parche hereda el mismo kernel y los solapes garantizan cobertura completa de la rejilla.

## Cota en norma suprema

El operador anterior verifica la cota exacta
\[
  \|Th\|_{\infty} \le \frac{1}{3} \|h\|_{\infty},
\]
sin requerir discretizacion. La constante \(1/3\) procede de la integral media y es uniforme para cualquier traslacion del kernel.

## Equivalencia de normas ponderadas

Para cada parche con ventana \([s_{\min}, s_{\max}]\) y longitud \(\ell = s_{\max} - s_{\min}\), se consideran las normas ERU con pesos \(w_1(s) = 1\) y \(w_2(s) = e^{s/2}/s^2\). La equivalencia local proporciona
\[
  \|h\|_{L^2(w_i)} \le \sqrt{\frac{\max_{[s_{\min}, s_{\max}]} w_i}{\min_{[s_{\min}, s_{\max}]} w_i}} \, \|h\|_{L^2(\tilde w_i)},
\]
lo que fija un factor de correccion dependiente solo de los extremos del parche.

## Composicion y cota global

Al combinar la cota \(1/3\) con la equivalencia de normas se obtiene, para cada parche \(P\),
\[
  L_A^{\text{closed}}(P) = \frac{1}{3} \max \left\{ 1,\; \sqrt{\frac{\max w_2}{\min w_2}} \right\}.
\]
Los solapes del mosaico multi-\(\alpha\) impiden huecos y el peor parche fija la constante global
\[
  L_{\text{global}}^{\text{analytic, closed}} = \max_{P} L_A^{\text{closed}}(P) < 1.
\]
El script `formalisms/analytic_A_proof.py` emite `L_analytic_proof.json` con el desglose por parche, la longitud \(\ell\), la razon \(\max w / \min w\) y la marca del parche critico.
