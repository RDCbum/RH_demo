import ERURH.Beta.InertiaSmooth
import ERURH.Beta.InertiaCertificatesBeta

namespace ERURH
namespace Beta

noncomputable def strongInertiaCertificate_beta_numeric : StrongInertiaCertificate_beta :=
{
  C_RMS_beta   := ((1 : ℚ) / (10 : ℚ)),
  S0_beta      := (14 : ℚ),
  kernelId     := "Gaussian_sigma1.5_radius5_T1500",
  windows      := [
    { id := "wAlpha49_shift0", sLeft := ((567867 : ℚ) / (40088 : ℚ)), sRight := ((14974184 : ℚ) / (981559 : ℚ)), sMid := ((12737037 : ℚ) / (865846 : ℚ)), rmsBound := ((4651 : ℚ) / (806133 : ℚ)), supBound := ((23365 : ℚ) / (943923 : ℚ)) },
    { id := "wAlpha49_shift1", sLeft := ((7151187 : ℚ) / (474988 : ℚ)), sRight := ((648043 : ℚ) / (40088 : ℚ)), sMid := ((14016506 : ℚ) / (897889 : ℚ)), rmsBound := ((251 : ℚ) / (55047 : ℚ)), supBound := ((22687 : ℚ) / (876423 : ℚ)) },
    { id := "wAlpha50_shift0", sLeft := ((567867 : ℚ) / (40088 : ℚ)), sRight := ((9369650 : ℚ) / (613779 : ℚ)), sMid := ((8589635 : ℚ) / (583713 : ℚ)), rmsBound := ((5653 : ℚ) / (989567 : ℚ)), supBound := ((11213 : ℚ) / (450452 : ℚ)) },
    { id := "wAlpha50_shift1", sLeft := ((11662679 : ℚ) / (774131 : ℚ)), sRight := ((648043 : ℚ) / (40088 : ℚ)), sMid := ((9427974 : ℚ) / (603757 : ℚ)), rmsBound := ((3890 : ℚ) / (969831 : ℚ)), supBound := ((14969 : ℚ) / (690091 : ℚ)) },
    { id := "wAlpha51_shift0", sLeft := ((567867 : ℚ) / (40088 : ℚ)), sRight := ((11365973 : ℚ) / (744065 : ℚ)), sMid := ((14131661 : ℚ) / (959998 : ℚ)), rmsBound := ((839 : ℚ) / (147470 : ℚ)), supBound := ((17731 : ℚ) / (708175 : ℚ)) },
    { id := "wAlpha51_shift1", sLeft := ((2243432 : ℚ) / (148813 : ℚ)), sRight := ((648043 : ℚ) / (40088 : ℚ)), sMid := ((9846061 : ℚ) / (630329 : ℚ)), rmsBound := ((2117 : ℚ) / (580248 : ℚ)), supBound := ((664 : ℚ) / (41745 : ℚ)) }
  ],
  tailRMSBound := (0 : ℚ)
}

end Beta
end ERURH
