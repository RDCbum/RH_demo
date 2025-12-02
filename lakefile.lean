import Lake
open Lake DSL
open System

package eruUpgrade where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "19dd3501fa2c576726e854488a7278bdb2d7ff99"

@[default_target]
lean_lib ERURH where
  srcDir := "lean/formal_proofs"
