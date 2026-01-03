ERURH Large-Sieve-on-γ Plan
===========================

Status: background note. For the authoritative assumptions and gap mapping, see
`docs/core/ASSUMPTIONS_LEDGER.md` and `docs/core/RH_CLOSURE_CHECKLIST.md`.

1. Setup for the γ-large-sieve lemma
------------------------------------
- Zeros `ρ_j = β_j + iγ_j` with `β_j > 1/2` in the tail regime.
- Coefficients `b_j = b_ρj` satisfy the decay hypothesis `H_b`.
- Work on window variables `u ∈ [0, L]` and consider band-limited sums
  `F_{(T, T]}(u) = Σ_{T<|γ_j|≤T'} b_j e^{i γ_j u}` over a spectral band.

2. Target inequality (LS_γ)
---------------------------
- Desired bound (schematic):
  \[
  \frac{1}{L} \int_0^L \left|F_{(T_1, T_2]}(u)\right|^2 \, du
  \le C \bigl(1 + L \log T_2\bigr)
      \sum_{T_1<|\gamma_j|\le T_2} |b_j|^2,
  \]
  for `T` in the admissible range (e.g. `T ≥ S`, `T ≤ S^B`, `L` in a window range).

3. Sketch of the analytic argument
----------------------------------
- Expand the square and integrate termwise over `u ∈ [0, L]`.
- Separate diagonal and off-diagonal contributions; evaluate
  \(\int_0^L e^{i(\gamma_j - \gamma_k)u} du\).
- Use zero-density estimates to control pairs with `|γ_j - γ_k|` small.
- Combine these bounds to obtain an inequality of the form
  `(1/L)∫ |F|^2 ≤ (1 + L log T) Σ |b_j|^2`.

4. Role in A2-tail and Plan B
-----------------------------
- LS_γ, together with `H_b` and zero-density, yields control of the RMS integral
  in `u` for the tail, leading to A2-tail.
- Thus, the γ-large-sieve lemma is a key analytic package feeding `A2Tail_RMS`
  and, via Plan B, the exclusion of modes with `β > 1/2`.
