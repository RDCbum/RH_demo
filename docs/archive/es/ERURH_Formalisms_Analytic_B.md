# ERURH Formalisms Analytic — Lema B

Este documento detalla la prueba analitica cerrada del Lema B (desigualdad de energia ERU) incorporando terminos de frontera y pesos canonicos.

## Derivada central y formula base

Se considera la derivada central discreta
\[
  D_h f(s) = \frac{f(s+h) - f(s-h)}{2h},
\]
definida en el mallado canonico de paso \(h_{\min}\). Por Cauchy-Schwarz se obtiene
\[
  \|D_h f\|_{L^2(w)}^2 \le \frac{\max w}{\min w} \frac{1}{h_{\min}^2} \|f\|_{L^2(w)}^2,
\]
validando la generacion de constantes de libro para cada peso.

## Pesos y control de bordes

Se emplean dos pesos: \(w_1(s) = 1\) y \(w_2(s) = e^{s/2}/s^2\). Los terminos de frontera generados por integracion por partes discreta se evaluan en los mismos extremos \([s_{\min}, s_{\max}]\) del grid canonico y se absorben en la constante global siempre que \(s \ge s_0\).

## Constantes cerradas

La cota cerrada para cada peso queda fijada por
\[
  \kappa_{\text{book}}(1) = \frac{1}{h_{\min}^2}, \qquad
  \kappa_{\text{book}}(w_2) = \frac{1}{h_{\min}^2} \frac{\max w_2}{\min w_2}.
\]
La constante final toma el maximo:
\[
  \kappa_{\text{book}}^{\text{closed}} = \max \left\{ \kappa_{\text{book}}(1),\; \kappa_{\text{book}}(w_2) \right\}.
\]

## Artefacto de verificacion

El script `formalisms/analytic_B_proof.py` produce `kappa_book_proof.json` con los valores de \(h_{\min}\), los extremos de \(s\), las razones de peso y los terminos de borde documentados. Este artefacto se utiliza para fijar la cota superior estricta en el runner formal y en el gate estricto.
