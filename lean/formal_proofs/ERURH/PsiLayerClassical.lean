import ERURH.NumberTheory.Chebyshev

namespace ERURH

/-- Interface alias for the classical Chebyshev `ψ` function. -/
noncomputable def chebyshevPsi (x : ℝ) : ℝ :=
  ERURH.NT.psi x

/-- Interface alias for the classical Chebyshev error term `ψ(x) - x`. -/
noncomputable def chebyshevE (x : ℝ) : ℝ :=
  ERURH.NT.E x

end ERURH
