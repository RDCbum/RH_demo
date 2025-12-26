# RB1 spec summary: RMSLocalContext / A1 / A2

## A1_mode shape
A1_mode ctx is:
- exists (w : ctx.Window) and (K : ?) such that
  - K > ctx.c_low + ctx.c_tail + C_envelope_formal, and
  - ctx.RMS_mode w >= K.

Minimal satisfiable condition (informal):
- there exists w with ctx.RMS_mode w > ctx.c_low + ctx.c_tail + C_envelope_formal.

## A2Low_RMS shape
A2Low_RMS ctx is:
- for all w : ctx.Window, ctx.RMS_low w <= ctx.c_low.

## A2Tail_RMS shape
A2Tail_RMS ctx is:
- for all w : ctx.Window, ctx.RMS_tail w <= ctx.c_tail.

## RMS_envelope_closed shape
Alpha.RMS_envelope_closed ctx is:
- for all w : ctx.Window, ctx.RMS_alpha w <= C_envelope_formal.

## Relevant fields and constants
- A1 depends on ctx.Window, ctx.RMS_mode, ctx.c_low, ctx.c_tail, and C_envelope_formal.
- A2Low depends on ctx.RMS_low and ctx.c_low.
- A2Tail depends on ctx.RMS_tail and ctx.c_tail.
- RMS_envelope_closed depends on ctx.RMS_alpha and C_envelope_formal.
