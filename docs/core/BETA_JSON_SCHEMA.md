# Beta inertia JSON schema

This document defines the frozen beta inertia certificate input used by
`tools/make_beta_certificate.py` and verified by `scripts/verify_gate.py`.

## File

`data/releases/erurh-v2-core/formal/beta_inertia_certificate.json`

## Schema (current)

```
{
  "strong_inertia": {
    "C_RMS_beta": {"numerator": int, "denominator": int},
    "S0_beta": {"numerator": int, "denominator": int},
    "kernel_id": "string",
    "tail_rms_bound": {"numerator": int, "denominator": int},
    "windows": [
      {
        "id": "string",
        "s_left": {"numerator": int, "denominator": int},
        "s_right": {"numerator": int, "denominator": int},
        "s_mid": {"numerator": int, "denominator": int},
        "rms_bound": {"numerator": int, "denominator": int},
        "sup_bound": {"numerator": int, "denominator": int}
      }
    ]
  },
  "global_inertia": {
    "C_Global_beta": {"numerator": int, "denominator": int},
    "S0_global": {"numerator": int, "denominator": int},
    "Smax_global": {"numerator": int, "denominator": int},
    "sRef": {"numerator": int, "denominator": int}
  }
}
```

## Current limitations

The current Lean correctness proof is generated only for:
- an empty `windows` list, and
- `tail_rms_bound = 0`.

This keeps the Lean proof non-vacuous while the full beta numeric
proof pipeline is integrated. The schema can be extended once the
beta RMS window checks are formalized.
