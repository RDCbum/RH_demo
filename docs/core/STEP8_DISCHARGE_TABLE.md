| Name | Kind | File:line | Category (logical / classical / A-B-C / gate+certs / BLOCKER / refactor) | Notes |
| --- | --- | --- | --- | --- |
| propext | axiom | Lean core | logical | Propositional extensionality (standard). |
| Classical.choice | axiom | Lean core | logical | Classical choice (standard). |
| Quot.sound | axiom | Lean core | logical | Quotient soundness (standard). |
| Lean.ofReduceBool | axiom | Lean core | logical | Compiler/VM reduction axiom. |
| Lean.trustCompiler | axiom | Lean core | logical | Compiler trust axiom. |
| ERURH.Alpha.ZeroOfZeta | axiom | lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:23 | classical/citable | Nontrivial zeta zeros; also re-axiomatized in `lean/formal_proofs/ERURH/AlphaZeros.lean`. |
| ERURH.Alpha.beta | axiom | lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:26 | classical/citable | Real part of zero; duplicated in `lean/formal_proofs/ERURH/AlphaZeros.lean`. |
| ERURH.Alpha.gamma | axiom | lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:29 | classical/citable | Imag part of zero; duplicated in `lean/formal_proofs/ERURH/AlphaZeros.lean`. |
| ERURH.Alpha.b_rho | axiom | lean/formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean:58 | classical/citable | Explicit-formula coefficient for zeros. |
| ERURH.ERU_inertia_to_E_bound_alpha | axiom | lean/formal_proofs/ERURH/ERUInertia.lean:26 | classical/citable | ERU inertia -> E-bound equivalence (analytic). |
| ERURH.ERU_inertia_of_E_bound_alpha | axiom | lean/formal_proofs/ERURH/ERUInertia.lean:31 | classical/citable | E-bound -> ERU inertia equivalence (analytic). |
| ERURH.RH_to_E_bound_alpha | axiom | lean/formal_proofs/ERURH/ERUInertia.lean:53 | classical/citable | RH -> E-bound (classical). |
| ERURH.alphaInterfacesBase | axiom | lean/formal_proofs/ERURH/AlphaAxioms.lean:14 | refactor | Global axiom bundling analytic interfaces; should be a field in a hypothesis bundle. |
| ERURH.explicit_alpha_via_stages_true | axiom | lean/formal_proofs/ERURH/ExplicitDecomposition.lean:220 | refactor | Explicit-formula laws should be bundled as assumptions, not global axioms. |
| ERURH.rh_from_E_alpha_of_hypotheses | axiom | lean/formal_proofs/ERURH/EToRHChecklist.lean:95 | refactor | E->RH checklist should be a hypothesis field; not a global axiom. |
| ERURH.xi_bounds_alpha | axiom | lean/formal_proofs/ERURH/ExplicitDecomposition.lean:47 | refactor | Xi bound assumption should live in the explicit formula bundle. |
| ERURH.xi_argument_alpha | axiom | lean/formal_proofs/ERURH/ExplicitDecomposition.lean:62 | refactor | Xi argument assumption should live in the explicit formula bundle. |
| ERURH.xi_bounds_alpha_of_hypotheses | axiom | lean/formal_proofs/ERURH/ExplicitDecomposition.lean:126 | refactor | Hypotheses -> xi bounds should be proven or bundled. |
| ERURH.xi_argument_alpha_of_hypotheses | axiom | lean/formal_proofs/ERURH/ExplicitDecomposition.lean:130 | refactor | Hypotheses -> xi argument should be proven or bundled. |
| ERURH.Beta.strongInertiaCertificate_beta_numeric | axiom | lean/formal_proofs/ERURH/Beta/InertiaCertificatesBeta.lean:49 | refactor/assumption | Resolved by STEP9-C: beta certificate is now an explicit bundle assumption (see STEP9C_BETA_GAP.md). |
