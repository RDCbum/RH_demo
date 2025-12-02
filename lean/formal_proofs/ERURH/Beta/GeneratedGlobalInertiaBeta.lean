import ERURH.Beta.GlobalInertiaBeta

namespace ERURH
namespace Beta

noncomputable def globalInertiaCertificate_beta_numeric : GlobalInertiaCertificate_beta :=
{
  C_Global_beta := ((1 : ℚ) / (10 : ℚ)),
  S0_global     := ((567867 : ℚ) / (40088 : ℚ)),
  Smax_global   := ((648043 : ℚ) / (40088 : ℚ)),
  sRef          := ((567867 : ℚ) / (40088 : ℚ))
}

end Beta
end ERURH
