# RMS context JSON schema (v1)

Schema version: rms_context_schema_v1

## Top-level fields
- version: string (must equal "rms_context_schema_v1")
- n_windows: integer >= 1
- C_envelope_ctx: rational string
- c_low: rational string
- c_tail: rational string
- windows: array of length n_windows with objects:
  - id: integer in [0, n_windows-1]
  - RMS_mode: rational string
  - RMS_low: rational string
  - RMS_tail: rational string
  - label: optional string
  - s_min: optional rational string
  - s_max: optional rational string

## Parsing rules
- All rationals are exact strings, either "p/q" or a decimal string with finite digits.
- No floats in JSON; the generator parses to exact rational values.

## Lean mapping
- Window := Fin n_windows
- RMS_mode, RMS_low, RMS_tail are table lookups by index.
- RMS_alpha is defined as the constant C_envelope_ctx (no per-window field in v1).
- c_low, c_tail are constants from the JSON.
- RMS_decomp is proved from the constraint:
  RMS_mode[w] <= C_envelope_ctx + RMS_low[w] + RMS_tail[w].

## Non-vacuity constraints
- A1_mode requires a witness window with
  RMS_mode[w] > c_low + c_tail + C_envelope_formal.
- A2 requires RMS_low[w] <= c_low and RMS_tail[w] <= c_tail for all w.
