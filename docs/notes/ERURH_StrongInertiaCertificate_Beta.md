ERURH-beta: StrongInertiaCertificate_beta (informal draft)
==========================================================

Context and smoothed signal
---------------------------
- Beta uses the smoothed current \(j_{\mathrm{Rel,ERU}}(s) = (K_{\mathrm{ERU}} * j_{\mathrm{Rel,\alpha}})(s)\) described in `docs/notes/ERURH_jRel_ERU_Design_AlphaToBeta.md`.
- For each alpha window \([a_i, b_i]\) with midpoint \(s_{\mathrm{mid},i} = (a_i + b_i)/2\),
  \[
    E_{\mathrm{RMS}}(a_i,b_i) = \sqrt{\frac{1}{b_i - a_i}\int_{a_i}^{b_i} J_{\mathrm{rel,ERU}}(s)^2\,ds},
  \]
  and the ERU-normalized scale is
  \[
    K_{\mathrm{RMS}}(i) = \frac{e^{s_{\mathrm{mid},i}/2}}{s_{\mathrm{mid},i}^2} E_{\mathrm{RMS}}(a_i,b_i).
  \]

What the beta certificate is
----------------------------
- `StrongInertiaCertificate_beta` posits a global constant \(C_{\mathrm{RMS},\beta}\) such that for all windows in range,
  \[
    E_{\mathrm{RMS}}(a_i,b_i) \le C_{\mathrm{RMS},\beta}\,e^{-s_{\mathrm{mid},i}/2}s_{\mathrm{mid},i}^2.
  \]
- This is a phenomenological ERU object: it captures the observed scale of the smoothed current with kernel \(K_{\mathrm{ERU}}\) (e.g., discrete Gaussian). It does not affect the alpha formal theorem and does not imply RH.
- It bridges numerical artifacts (`tools/eru_jrel_smooth_numeric_alpha.py`, `tools/eru_jrel_energy_windows_beta.py`) to a potential beta energy certificate in Lean.

Initial numeric instantiation (beta)
------------------------------------
- Pipeline (`eru_jrel_energy_windows_beta.py` + `make_strong_inertia_beta_certificate.py`) produced `strongInertiaCertificate_beta_numeric` with \(C_{\mathrm{RMS},\beta} = 0.1\), \(S0_\beta = 14.0\), 6 windows, `tailRMSBound = 0`.
- Purely phenomenological: documents the RMS scale (~0.1) for the smoothed current; no impact on alpha certificates.

Robustness scan (beta layer)
----------------------------
- Parameters: σ ∈ {1.0, 1.5, 2.0}, radius ∈ {3, 5, 7}, \(T\) ∈ {500, 1000}, zeros dataset `zeros_zeta_first500`.
- Across 18/18 combinations, the normalized RMS scale
  \[
    K_{\mathrm{RMS}}^{\max} = \max_{[a,b]} \frac{e^{s_{\mathrm{mid}}/2}}{s_{\mathrm{mid}}^{2}} E_{\mathrm{RMS}}(a,b)
  \]
  lay in \(0.0349 \lesssim K_{\mathrm{RMS}}^{\max} \lesssim 0.0578\).
- Applying factor 2.0 and rounding to one decimal gave a stable pipeline constant \(C_{\mathrm{RMS},\beta} = 0.1\).

Conclusion
----------
The smoothed `jRel_ERU` exhibits a stable energetic scale under smoothing/cutoff variations. The beta layer captures a coherent phenomenological regime, separate from the alpha layer where the sup-norm control is RH-equivalent and hinges on the assumed classical analytic packages in `ERURH_GlobalAssumptions`.
