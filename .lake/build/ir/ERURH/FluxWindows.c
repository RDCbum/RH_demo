// Lean compiler output
// Module: ERURH.FluxWindows
// Imports: public import Init public import Mathlib public import ERURH.BridgeCore public import ERURH.BridgeScaffold public import ERURH.RationalBounds
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* l_ERURH_jRelBoundTail;
LEAN_EXPORT lean_object* l_ERURH_windowOfOffsets(lean_object*, lean_object*);
static lean_object* l_ERURH_wAlpha49__shift0___closed__0;
static lean_object* l_ERURH_wAlpha49__shift1___closed__2;
static lean_object* l_ERURH_logRBoundWindow___closed__0;
static lean_object* l_ERURH_wAlpha49__shift1___closed__0;
LEAN_EXPORT lean_object* l_ERURH_jRelBoundWindow;
static lean_object* l_ERURH_logRBoundTail___closed__0;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_s0Bridge;
LEAN_EXPORT lean_object* l_ERURH_wAlpha50__shift0;
static lean_object* l_ERURH_alphaWindows___closed__5;
static lean_object* l_ERURH_wAlpha50__shift1___closed__1;
static lean_object* l_ERURH_wAlpha49__shift0___closed__2;
LEAN_EXPORT lean_object* l_ERURH_tailStart;
static lean_object* l_ERURH_wAlpha49__shift1___closed__1;
static lean_object* l_ERURH_logRBoundTail___closed__1;
static lean_object* l_ERURH_jRelBoundTail___closed__0;
LEAN_EXPORT lean_object* l_ERURH_wAlpha49__shift0;
static lean_object* l_ERURH_wAlpha50__shift0___closed__2;
LEAN_EXPORT lean_object* l_ERURH_alphaWindows;
LEAN_EXPORT lean_object* l_ERURH_wAlpha51__shift0;
static lean_object* l_ERURH_jRelBoundTail___closed__1;
static lean_object* l_ERURH_wAlpha50__shift0___closed__3;
static lean_object* l_ERURH_alphaWindows___closed__3;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_wAlpha49__shift0;
LEAN_EXPORT lean_object* l_ERURH_logRBoundWindow;
static lean_object* l_ERURH_wAlpha49__shift0___closed__4;
static lean_object* l_ERURH_logRBoundWindow___closed__1;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_wAlpha50__shift1;
static lean_object* l_ERURH_alphaWindows___closed__0;
LEAN_EXPORT lean_object* l_ERURH_wAlpha50__shift1;
static lean_object* l_ERURH_logRBoundTail___closed__2;
static lean_object* l_ERURH_tailStart___closed__0;
extern lean_object* l_ERURH_s0ClosedRat;
static lean_object* l_ERURH_wAlpha50__shift0___closed__1;
static lean_object* l_ERURH_wAlpha51__shift0___closed__2;
static lean_object* l_ERURH_wAlpha51__shift0___closed__0;
static lean_object* l_ERURH_wAlpha49__shift0___closed__1;
static lean_object* l_ERURH_alphaWindows___closed__4;
static lean_object* l_ERURH_alphaWindows___closed__1;
LEAN_EXPORT lean_object* l_ERURH_wAlpha51__shift1;
LEAN_EXPORT lean_object* l_ERURH_logRBoundTail;
lean_object* l_Rat_add(lean_object*, lean_object*);
static lean_object* l_ERURH_wAlpha51__shift0___closed__1;
LEAN_EXPORT lean_object* l_ERURH_wAlpha49__shift1;
static lean_object* l_ERURH_logRBoundWindow___closed__2;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_windowOfOffsets(lean_object*, lean_object*);
static lean_object* l_ERURH_wAlpha51__shift1___closed__1;
static lean_object* l_ERURH_wAlpha51__shift1___closed__0;
static lean_object* l_ERURH_wAlpha49__shift0___closed__3;
static lean_object* l_ERURH_wAlpha50__shift1___closed__0;
LEAN_EXPORT lean_object* l_ERURH_s0Bridge;
static lean_object* l_ERURH_jRelBoundWindow___closed__2;
lean_object* l_Rat_div(lean_object*, lean_object*);
lean_object* l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(lean_object*);
static lean_object* l_ERURH_alphaWindows___closed__2;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_wAlpha51__shift0;
static lean_object* l_ERURH_jRelBoundWindow___closed__0;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_wAlpha51__shift1;
static lean_object* l_ERURH_jRelBoundWindow___closed__1;
static lean_object* l_ERURH_wAlpha50__shift1___closed__2;
static lean_object* l_ERURH_wAlpha51__shift1___closed__2;
static lean_object* l_ERURH_wAlpha50__shift0___closed__0;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_tailStart;
static lean_object* l_ERURH_tailStart___closed__1;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_wAlpha50__shift0;
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_wAlpha49__shift1;
static lean_object* _init_l_ERURH_s0Bridge() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_s0ClosedRat;
return x_1;
}
}
static lean_object* _init_l_ERURH_tailStart___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(2u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_tailStart___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_tailStart___closed__0;
x_2 = l_ERURH_s0ClosedRat;
x_3 = l_Rat_add(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_tailStart() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_tailStart___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_ERURH_windowOfOffsets(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_3 = l_ERURH_s0ClosedRat;
x_4 = l_Rat_add(x_3, x_1);
x_5 = l_Rat_add(x_3, x_2);
x_6 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_6, 0, x_4);
lean_ctor_set(x_6, 1, x_5);
return x_6;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift0___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift0___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(109u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift0___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(100u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift0___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha49__shift0___closed__2;
x_2 = l_ERURH_wAlpha49__shift0___closed__1;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift0___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha49__shift0___closed__3;
x_2 = l_ERURH_wAlpha49__shift0___closed__0;
x_3 = l_ERURH_windowOfOffsets(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift0() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha49__shift0___closed__4;
return x_1;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift0___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(11u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift0___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(10u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift0___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha50__shift0___closed__1;
x_2 = l_ERURH_wAlpha50__shift0___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift0___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha50__shift0___closed__2;
x_2 = l_ERURH_wAlpha49__shift0___closed__0;
x_3 = l_ERURH_windowOfOffsets(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift0() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha50__shift0___closed__3;
return x_1;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift0___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(111u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift0___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha49__shift0___closed__2;
x_2 = l_ERURH_wAlpha51__shift0___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift0___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha51__shift0___closed__1;
x_2 = l_ERURH_wAlpha49__shift0___closed__0;
x_3 = l_ERURH_windowOfOffsets(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift0() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha51__shift0___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift1___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(89u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift1___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha49__shift0___closed__2;
x_2 = l_ERURH_wAlpha49__shift1___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift1___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_tailStart___closed__0;
x_2 = l_ERURH_wAlpha49__shift1___closed__1;
x_3 = l_ERURH_windowOfOffsets(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha49__shift1() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha49__shift1___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift1___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(9u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift1___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha50__shift0___closed__1;
x_2 = l_ERURH_wAlpha50__shift1___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift1___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_tailStart___closed__0;
x_2 = l_ERURH_wAlpha50__shift1___closed__1;
x_3 = l_ERURH_windowOfOffsets(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha50__shift1() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha50__shift1___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift1___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(91u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift1___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_wAlpha49__shift0___closed__2;
x_2 = l_ERURH_wAlpha51__shift1___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift1___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_tailStart___closed__0;
x_2 = l_ERURH_wAlpha51__shift1___closed__1;
x_3 = l_ERURH_windowOfOffsets(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_wAlpha51__shift1() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha51__shift1___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_alphaWindows___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_ERURH_wAlpha51__shift1;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_alphaWindows___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_alphaWindows___closed__0;
x_2 = l_ERURH_wAlpha50__shift1;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_alphaWindows___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_alphaWindows___closed__1;
x_2 = l_ERURH_wAlpha49__shift1;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_alphaWindows___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_alphaWindows___closed__2;
x_2 = l_ERURH_wAlpha51__shift0;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_alphaWindows___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_alphaWindows___closed__3;
x_2 = l_ERURH_wAlpha50__shift0;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_alphaWindows___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_alphaWindows___closed__4;
x_2 = l_ERURH_wAlpha49__shift0;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_alphaWindows() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_alphaWindows___closed__5;
return x_1;
}
}
static lean_object* _init_l_ERURH_logRBoundWindow___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("35010938607");
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_logRBoundWindow___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("200000000000");
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_logRBoundWindow___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_logRBoundWindow___closed__1;
x_2 = l_ERURH_logRBoundWindow___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_logRBoundWindow() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_logRBoundWindow___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_jRelBoundWindow___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(49287667u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_jRelBoundWindow___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("62500000000");
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_jRelBoundWindow___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_jRelBoundWindow___closed__1;
x_2 = l_ERURH_jRelBoundWindow___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_jRelBoundWindow() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_jRelBoundWindow___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_logRBoundTail___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("17505486809");
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_logRBoundTail___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("100000000000");
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_logRBoundTail___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_logRBoundTail___closed__1;
x_2 = l_ERURH_logRBoundTail___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_logRBoundTail() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_logRBoundTail___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_jRelBoundTail___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(1363890281u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_jRelBoundTail___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_logRBoundWindow___closed__1;
x_2 = l_ERURH_jRelBoundTail___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_jRelBoundTail() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_jRelBoundTail___closed__1;
return x_1;
}
}
static lean_object* _init_l_ERURH_FluxWindows_s0Bridge() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_s0ClosedRat;
return x_1;
}
}
static lean_object* _init_l_ERURH_FluxWindows_tailStart() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_tailStart;
return x_1;
}
}
LEAN_EXPORT lean_object* l_ERURH_FluxWindows_windowOfOffsets(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_ERURH_windowOfOffsets(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_ERURH_FluxWindows_wAlpha49__shift0() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha49__shift0;
return x_1;
}
}
static lean_object* _init_l_ERURH_FluxWindows_wAlpha49__shift1() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha49__shift1;
return x_1;
}
}
static lean_object* _init_l_ERURH_FluxWindows_wAlpha50__shift0() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha50__shift0;
return x_1;
}
}
static lean_object* _init_l_ERURH_FluxWindows_wAlpha50__shift1() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha50__shift1;
return x_1;
}
}
static lean_object* _init_l_ERURH_FluxWindows_wAlpha51__shift0() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha51__shift0;
return x_1;
}
}
static lean_object* _init_l_ERURH_FluxWindows_wAlpha51__shift1() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_wAlpha51__shift1;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_BridgeCore(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_BridgeScaffold(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_RationalBounds(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_FluxWindows(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_BridgeCore(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_BridgeScaffold(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_RationalBounds(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH_s0Bridge = _init_l_ERURH_s0Bridge();
lean_mark_persistent(l_ERURH_s0Bridge);
l_ERURH_tailStart___closed__0 = _init_l_ERURH_tailStart___closed__0();
lean_mark_persistent(l_ERURH_tailStart___closed__0);
l_ERURH_tailStart___closed__1 = _init_l_ERURH_tailStart___closed__1();
lean_mark_persistent(l_ERURH_tailStart___closed__1);
l_ERURH_tailStart = _init_l_ERURH_tailStart();
lean_mark_persistent(l_ERURH_tailStart);
l_ERURH_wAlpha49__shift0___closed__0 = _init_l_ERURH_wAlpha49__shift0___closed__0();
lean_mark_persistent(l_ERURH_wAlpha49__shift0___closed__0);
l_ERURH_wAlpha49__shift0___closed__1 = _init_l_ERURH_wAlpha49__shift0___closed__1();
lean_mark_persistent(l_ERURH_wAlpha49__shift0___closed__1);
l_ERURH_wAlpha49__shift0___closed__2 = _init_l_ERURH_wAlpha49__shift0___closed__2();
lean_mark_persistent(l_ERURH_wAlpha49__shift0___closed__2);
l_ERURH_wAlpha49__shift0___closed__3 = _init_l_ERURH_wAlpha49__shift0___closed__3();
lean_mark_persistent(l_ERURH_wAlpha49__shift0___closed__3);
l_ERURH_wAlpha49__shift0___closed__4 = _init_l_ERURH_wAlpha49__shift0___closed__4();
lean_mark_persistent(l_ERURH_wAlpha49__shift0___closed__4);
l_ERURH_wAlpha49__shift0 = _init_l_ERURH_wAlpha49__shift0();
lean_mark_persistent(l_ERURH_wAlpha49__shift0);
l_ERURH_wAlpha50__shift0___closed__0 = _init_l_ERURH_wAlpha50__shift0___closed__0();
lean_mark_persistent(l_ERURH_wAlpha50__shift0___closed__0);
l_ERURH_wAlpha50__shift0___closed__1 = _init_l_ERURH_wAlpha50__shift0___closed__1();
lean_mark_persistent(l_ERURH_wAlpha50__shift0___closed__1);
l_ERURH_wAlpha50__shift0___closed__2 = _init_l_ERURH_wAlpha50__shift0___closed__2();
lean_mark_persistent(l_ERURH_wAlpha50__shift0___closed__2);
l_ERURH_wAlpha50__shift0___closed__3 = _init_l_ERURH_wAlpha50__shift0___closed__3();
lean_mark_persistent(l_ERURH_wAlpha50__shift0___closed__3);
l_ERURH_wAlpha50__shift0 = _init_l_ERURH_wAlpha50__shift0();
lean_mark_persistent(l_ERURH_wAlpha50__shift0);
l_ERURH_wAlpha51__shift0___closed__0 = _init_l_ERURH_wAlpha51__shift0___closed__0();
lean_mark_persistent(l_ERURH_wAlpha51__shift0___closed__0);
l_ERURH_wAlpha51__shift0___closed__1 = _init_l_ERURH_wAlpha51__shift0___closed__1();
lean_mark_persistent(l_ERURH_wAlpha51__shift0___closed__1);
l_ERURH_wAlpha51__shift0___closed__2 = _init_l_ERURH_wAlpha51__shift0___closed__2();
lean_mark_persistent(l_ERURH_wAlpha51__shift0___closed__2);
l_ERURH_wAlpha51__shift0 = _init_l_ERURH_wAlpha51__shift0();
lean_mark_persistent(l_ERURH_wAlpha51__shift0);
l_ERURH_wAlpha49__shift1___closed__0 = _init_l_ERURH_wAlpha49__shift1___closed__0();
lean_mark_persistent(l_ERURH_wAlpha49__shift1___closed__0);
l_ERURH_wAlpha49__shift1___closed__1 = _init_l_ERURH_wAlpha49__shift1___closed__1();
lean_mark_persistent(l_ERURH_wAlpha49__shift1___closed__1);
l_ERURH_wAlpha49__shift1___closed__2 = _init_l_ERURH_wAlpha49__shift1___closed__2();
lean_mark_persistent(l_ERURH_wAlpha49__shift1___closed__2);
l_ERURH_wAlpha49__shift1 = _init_l_ERURH_wAlpha49__shift1();
lean_mark_persistent(l_ERURH_wAlpha49__shift1);
l_ERURH_wAlpha50__shift1___closed__0 = _init_l_ERURH_wAlpha50__shift1___closed__0();
lean_mark_persistent(l_ERURH_wAlpha50__shift1___closed__0);
l_ERURH_wAlpha50__shift1___closed__1 = _init_l_ERURH_wAlpha50__shift1___closed__1();
lean_mark_persistent(l_ERURH_wAlpha50__shift1___closed__1);
l_ERURH_wAlpha50__shift1___closed__2 = _init_l_ERURH_wAlpha50__shift1___closed__2();
lean_mark_persistent(l_ERURH_wAlpha50__shift1___closed__2);
l_ERURH_wAlpha50__shift1 = _init_l_ERURH_wAlpha50__shift1();
lean_mark_persistent(l_ERURH_wAlpha50__shift1);
l_ERURH_wAlpha51__shift1___closed__0 = _init_l_ERURH_wAlpha51__shift1___closed__0();
lean_mark_persistent(l_ERURH_wAlpha51__shift1___closed__0);
l_ERURH_wAlpha51__shift1___closed__1 = _init_l_ERURH_wAlpha51__shift1___closed__1();
lean_mark_persistent(l_ERURH_wAlpha51__shift1___closed__1);
l_ERURH_wAlpha51__shift1___closed__2 = _init_l_ERURH_wAlpha51__shift1___closed__2();
lean_mark_persistent(l_ERURH_wAlpha51__shift1___closed__2);
l_ERURH_wAlpha51__shift1 = _init_l_ERURH_wAlpha51__shift1();
lean_mark_persistent(l_ERURH_wAlpha51__shift1);
l_ERURH_alphaWindows___closed__0 = _init_l_ERURH_alphaWindows___closed__0();
lean_mark_persistent(l_ERURH_alphaWindows___closed__0);
l_ERURH_alphaWindows___closed__1 = _init_l_ERURH_alphaWindows___closed__1();
lean_mark_persistent(l_ERURH_alphaWindows___closed__1);
l_ERURH_alphaWindows___closed__2 = _init_l_ERURH_alphaWindows___closed__2();
lean_mark_persistent(l_ERURH_alphaWindows___closed__2);
l_ERURH_alphaWindows___closed__3 = _init_l_ERURH_alphaWindows___closed__3();
lean_mark_persistent(l_ERURH_alphaWindows___closed__3);
l_ERURH_alphaWindows___closed__4 = _init_l_ERURH_alphaWindows___closed__4();
lean_mark_persistent(l_ERURH_alphaWindows___closed__4);
l_ERURH_alphaWindows___closed__5 = _init_l_ERURH_alphaWindows___closed__5();
lean_mark_persistent(l_ERURH_alphaWindows___closed__5);
l_ERURH_alphaWindows = _init_l_ERURH_alphaWindows();
lean_mark_persistent(l_ERURH_alphaWindows);
l_ERURH_logRBoundWindow___closed__0 = _init_l_ERURH_logRBoundWindow___closed__0();
lean_mark_persistent(l_ERURH_logRBoundWindow___closed__0);
l_ERURH_logRBoundWindow___closed__1 = _init_l_ERURH_logRBoundWindow___closed__1();
lean_mark_persistent(l_ERURH_logRBoundWindow___closed__1);
l_ERURH_logRBoundWindow___closed__2 = _init_l_ERURH_logRBoundWindow___closed__2();
lean_mark_persistent(l_ERURH_logRBoundWindow___closed__2);
l_ERURH_logRBoundWindow = _init_l_ERURH_logRBoundWindow();
lean_mark_persistent(l_ERURH_logRBoundWindow);
l_ERURH_jRelBoundWindow___closed__0 = _init_l_ERURH_jRelBoundWindow___closed__0();
lean_mark_persistent(l_ERURH_jRelBoundWindow___closed__0);
l_ERURH_jRelBoundWindow___closed__1 = _init_l_ERURH_jRelBoundWindow___closed__1();
lean_mark_persistent(l_ERURH_jRelBoundWindow___closed__1);
l_ERURH_jRelBoundWindow___closed__2 = _init_l_ERURH_jRelBoundWindow___closed__2();
lean_mark_persistent(l_ERURH_jRelBoundWindow___closed__2);
l_ERURH_jRelBoundWindow = _init_l_ERURH_jRelBoundWindow();
lean_mark_persistent(l_ERURH_jRelBoundWindow);
l_ERURH_logRBoundTail___closed__0 = _init_l_ERURH_logRBoundTail___closed__0();
lean_mark_persistent(l_ERURH_logRBoundTail___closed__0);
l_ERURH_logRBoundTail___closed__1 = _init_l_ERURH_logRBoundTail___closed__1();
lean_mark_persistent(l_ERURH_logRBoundTail___closed__1);
l_ERURH_logRBoundTail___closed__2 = _init_l_ERURH_logRBoundTail___closed__2();
lean_mark_persistent(l_ERURH_logRBoundTail___closed__2);
l_ERURH_logRBoundTail = _init_l_ERURH_logRBoundTail();
lean_mark_persistent(l_ERURH_logRBoundTail);
l_ERURH_jRelBoundTail___closed__0 = _init_l_ERURH_jRelBoundTail___closed__0();
lean_mark_persistent(l_ERURH_jRelBoundTail___closed__0);
l_ERURH_jRelBoundTail___closed__1 = _init_l_ERURH_jRelBoundTail___closed__1();
lean_mark_persistent(l_ERURH_jRelBoundTail___closed__1);
l_ERURH_jRelBoundTail = _init_l_ERURH_jRelBoundTail();
lean_mark_persistent(l_ERURH_jRelBoundTail);
l_ERURH_FluxWindows_s0Bridge = _init_l_ERURH_FluxWindows_s0Bridge();
lean_mark_persistent(l_ERURH_FluxWindows_s0Bridge);
l_ERURH_FluxWindows_tailStart = _init_l_ERURH_FluxWindows_tailStart();
lean_mark_persistent(l_ERURH_FluxWindows_tailStart);
l_ERURH_FluxWindows_wAlpha49__shift0 = _init_l_ERURH_FluxWindows_wAlpha49__shift0();
lean_mark_persistent(l_ERURH_FluxWindows_wAlpha49__shift0);
l_ERURH_FluxWindows_wAlpha49__shift1 = _init_l_ERURH_FluxWindows_wAlpha49__shift1();
lean_mark_persistent(l_ERURH_FluxWindows_wAlpha49__shift1);
l_ERURH_FluxWindows_wAlpha50__shift0 = _init_l_ERURH_FluxWindows_wAlpha50__shift0();
lean_mark_persistent(l_ERURH_FluxWindows_wAlpha50__shift0);
l_ERURH_FluxWindows_wAlpha50__shift1 = _init_l_ERURH_FluxWindows_wAlpha50__shift1();
lean_mark_persistent(l_ERURH_FluxWindows_wAlpha50__shift1);
l_ERURH_FluxWindows_wAlpha51__shift0 = _init_l_ERURH_FluxWindows_wAlpha51__shift0();
lean_mark_persistent(l_ERURH_FluxWindows_wAlpha51__shift0);
l_ERURH_FluxWindows_wAlpha51__shift1 = _init_l_ERURH_FluxWindows_wAlpha51__shift1();
lean_mark_persistent(l_ERURH_FluxWindows_wAlpha51__shift1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
