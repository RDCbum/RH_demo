# RB4 note: A1/A2 vs envelope

- A1_mode asserts a witness window with RMS_mode above the envelope by more than
  c_low + c_tail.
- A2Low_RMS and A2Tail_RMS bound RMS_low and RMS_tail by c_low and c_tail.
- The RMS_decomp field then forces RMS_alpha at that witness window to exceed
  C_envelope_formal.
- Alpha.RMS_envelope_closed requires RMS_alpha to stay at or below
  C_envelope_formal for every window.
- Hence A1 + A2 + RMS_decomp + RMS_envelope_closed is inconsistent.

Interpretation:
- This is expected: A1 represents the consequence of a supercritical mode,
  while RMS_envelope_closed encodes the closed-gate world.
- The contradiction is the mechanism used to rule out supercritical modes,
  not a bug in the setup.
- It prevents vacuity: A1 is not an assumption about the real world, only a
  conditional implication from a hypothetical mode.
