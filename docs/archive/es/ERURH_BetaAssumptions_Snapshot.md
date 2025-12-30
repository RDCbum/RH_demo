ERURH BetaAssumptions Snapshot
==============================

Introducción
------------
`BetaInertiaAssumptions` es el paquete externo que agrupa los insumos beta de la
cadena ERURH → RH. Recoge hipótesis numéricas/fenomenológicas sobre certificados
beta y una implicación de blow-up energético para modos con β > 1/2. No aporta
información analítica nueva sobre ζ; sirve para cerrar la vía certificada de
energía/inercia en la capa alpha cuando se delega en artefactos beta.

Campos de BetaInertiaAssumptions (Lean)
---------------------------------------
- `strongInertiaCertificateCorrect_beta_numeric` (numeric): el certificado local
  fuerte beta generado por la pipeline (RMS por ventana, kernel suavizado) satisface
  `StrongInertiaCertificateCorrect_beta`.
- `strongInertiaCompositeCorrect_beta_numeric` (numeric): el certificado compuesto
  beta (local + global) satisface `StrongInertiaCompositeCorrect_beta`.
- `energy_kernel_blowup_of_mode_beta_of_certificate` (analítico/certificado):
  si β > 1/2, existe un certificado de blow-up de kernel alpha correcto y
  `ERU_mode_beta β`, entonces `ERU_energy_kernel_alpha ≥ kernel_threshold_alpha`.

Rol en la cadena hacia RH
-------------------------
- Se usa en `EnergyCertificatesAlpha.lean` para obtener
  `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` mediante el campo
  `energy_kernel_blowup_of_mode_beta_of_certificate`.
- `BetaInertiaAssumptions` es un campo de `ERURH_Assumptions` dentro de
  `ERURH_GlobalAssumptions`, que alimenta `RH_from_ERURH_conditional`.
- Los certificados beta numéricos no aparecen en la parte RMS/Plan B; su papel
  es respaldar la ruta de blow-up energético que descarta modos β > 1/2 en la
  capa alpha.

Dependencias y usos principales
-------------------------------
- Consumido en `formal_proofs/ERURH/EnergyCertificatesAlpha.lean` para encadenar
  modo β > 1/2 ⇒ blow-up de kernel.
- Re-exportado indirectamente al formar `ERURH_Assumptions` en
  `ERURH_MasterTheoremSummary.lean`; no se re-exporta en `ERURH_AxiomsShim`.
- Usado vía `betaInertiaAssumptions_true` (axioma) en los módulos beta
  fenomenológicos: `Beta/InertiaCertificatesBeta.lean`,
  `Beta/CompositeCertificateBeta.lean`.

Perspectiva futura
------------------
- Potencialmente formalizable: la implicación
  `energy_kernel_blowup_of_mode_beta_of_certificate` podría demostrarse en Lean
  si se dispone de certificados alpha concretos y una prueba formal del blow-up
  analítico; hoy se asume externamente.
- Probablemente externa a medio plazo: la corrección numérica de los certificados
  beta (`strongInertia*Correct_beta_numeric`) seguirá tratada como input
  fenomenológico, aunque se podrían añadir tests/verificaciones parciales en Lean
  sobre datos discretizados.
