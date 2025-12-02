// Lean compiler output
// Module: ERURH.BridgeCore
// Imports: public import Init public import Mathlib
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
LEAN_EXPORT uint8_t l_ERURH_instDecidableEqWindow(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__9;
LEAN_EXPORT lean_object* l_ERURH_instReprWindow_repr___redArg(lean_object*);
uint8_t l_instDecidableEqRat_decEq(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__6;
LEAN_EXPORT lean_object* l_ERURH_instDecidableEqWindow_decEq___boxed(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__19;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__15;
LEAN_EXPORT lean_object* l_ERURH_Window_ctorIdx___boxed(lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__17;
lean_object* lean_string_length(lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__14;
lean_object* l_Nat_reprFast(lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__12;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__0;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__7;
lean_object* lean_nat_to_int(lean_object*);
static lean_object* l_ERURH_instReprWindow___closed__0;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__20;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__5;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__3;
lean_object* l_Int_repr(lean_object*);
LEAN_EXPORT uint8_t l_ERURH_instDecidableEqWindow_decEq(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__16;
LEAN_EXPORT lean_object* l_ERURH_instReprWindow;
LEAN_EXPORT lean_object* l_ERURH_instReprWindow_repr___boxed(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__8;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__18;
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__11;
lean_object* lean_nat_abs(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__10;
lean_object* l_Repr_addAppParen(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_Window_ctorIdx(lean_object*);
uint8_t lean_int_dec_lt(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* lean_string_append(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_instDecidableEqWindow___boxed(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__2;
LEAN_EXPORT lean_object* l_ERURH_instReprWindow_repr(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__1;
lean_object* lean_string_append(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__13;
lean_object* lean_nat_add(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWindow_repr___redArg___closed__4;
LEAN_EXPORT lean_object* l_ERURH_Window_ctorIdx(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
}
LEAN_EXPORT lean_object* l_ERURH_Window_ctorIdx___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_ERURH_Window_ctorIdx(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
LEAN_EXPORT uint8_t l_ERURH_instDecidableEqWindow_decEq(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; uint8_t x_7; 
x_3 = lean_ctor_get(x_1, 0);
x_4 = lean_ctor_get(x_1, 1);
x_5 = lean_ctor_get(x_2, 0);
x_6 = lean_ctor_get(x_2, 1);
x_7 = l_instDecidableEqRat_decEq(x_3, x_5);
if (x_7 == 0)
{
return x_7;
}
else
{
uint8_t x_8; 
x_8 = l_instDecidableEqRat_decEq(x_4, x_6);
return x_8;
}
}
}
LEAN_EXPORT lean_object* l_ERURH_instDecidableEqWindow_decEq___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_ERURH_instDecidableEqWindow_decEq(x_1, x_2);
lean_dec_ref(x_2);
lean_dec_ref(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_ERURH_instDecidableEqWindow(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = l_ERURH_instDecidableEqWindow_decEq(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_ERURH_instDecidableEqWindow___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_ERURH_instDecidableEqWindow(x_1, x_2);
lean_dec_ref(x_2);
lean_dec_ref(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("{ ", 2, 2);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("s_min", 5, 5);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__2;
x_2 = lean_box(0);
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__4() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(" := ", 4, 4);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__4;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__5;
x_2 = l_ERURH_instReprWindow_repr___redArg___closed__3;
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(9u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__8() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(" }", 2, 2);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__0;
x_2 = lean_string_length(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__9;
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__0;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__8;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(" : Rat)/", 8, 8);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__14() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(",", 1, 1);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__15() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__14;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__16() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("s_max", 5, 5);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWindow_repr___redArg___closed__16;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__18() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("(", 1, 1);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__19() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWindow_repr___redArg___closed__20() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("-", 1, 1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_ERURH_instReprWindow_repr___redArg(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; uint8_t x_11; lean_object* x_12; lean_object* x_13; lean_object* x_25; uint8_t x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_37; lean_object* x_107; uint8_t x_108; 
x_2 = lean_ctor_get(x_1, 0);
lean_inc_ref(x_2);
x_3 = lean_ctor_get(x_1, 1);
lean_inc_ref(x_3);
if (lean_is_exclusive(x_1)) {
 lean_ctor_release(x_1, 0);
 lean_ctor_release(x_1, 1);
 x_4 = x_1;
} else {
 lean_dec_ref(x_1);
 x_4 = lean_box(0);
}
x_5 = lean_ctor_get(x_2, 0);
lean_inc(x_5);
x_6 = lean_ctor_get(x_2, 1);
lean_inc(x_6);
if (lean_is_exclusive(x_2)) {
 lean_ctor_release(x_2, 0);
 lean_ctor_release(x_2, 1);
 x_7 = x_2;
} else {
 lean_dec_ref(x_2);
 x_7 = lean_box(0);
}
x_8 = l_ERURH_instReprWindow_repr___redArg___closed__5;
x_9 = l_ERURH_instReprWindow_repr___redArg___closed__6;
x_10 = l_ERURH_instReprWindow_repr___redArg___closed__7;
x_107 = lean_unsigned_to_nat(1u);
x_108 = lean_nat_dec_eq(x_6, x_107);
if (x_108 == 0)
{
lean_object* x_109; lean_object* x_110; lean_object* x_118; uint8_t x_119; 
x_109 = l_ERURH_instReprWindow_repr___redArg___closed__18;
x_118 = l_ERURH_instReprWindow_repr___redArg___closed__19;
x_119 = lean_int_dec_lt(x_5, x_118);
if (x_119 == 0)
{
lean_object* x_120; lean_object* x_121; 
x_120 = lean_nat_abs(x_5);
lean_dec(x_5);
x_121 = l_Nat_reprFast(x_120);
x_110 = x_121;
goto block_117;
}
else
{
lean_object* x_122; lean_object* x_123; lean_object* x_124; lean_object* x_125; lean_object* x_126; lean_object* x_127; 
x_122 = lean_nat_abs(x_5);
lean_dec(x_5);
x_123 = lean_nat_sub(x_122, x_107);
lean_dec(x_122);
x_124 = l_ERURH_instReprWindow_repr___redArg___closed__20;
x_125 = lean_nat_add(x_123, x_107);
lean_dec(x_123);
x_126 = l_Nat_reprFast(x_125);
x_127 = lean_string_append(x_124, x_126);
lean_dec_ref(x_126);
x_110 = x_127;
goto block_117;
}
block_117:
{
lean_object* x_111; lean_object* x_112; lean_object* x_113; lean_object* x_114; lean_object* x_115; lean_object* x_116; 
x_111 = lean_string_append(x_109, x_110);
lean_dec_ref(x_110);
x_112 = l_ERURH_instReprWindow_repr___redArg___closed__13;
x_113 = lean_string_append(x_111, x_112);
x_114 = l_Nat_reprFast(x_6);
x_115 = lean_string_append(x_113, x_114);
lean_dec_ref(x_114);
x_116 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_116, 0, x_115);
x_37 = x_116;
goto block_106;
}
}
else
{
lean_object* x_128; lean_object* x_129; uint8_t x_130; 
lean_dec(x_6);
x_128 = lean_unsigned_to_nat(0u);
x_129 = l_ERURH_instReprWindow_repr___redArg___closed__19;
x_130 = lean_int_dec_lt(x_5, x_129);
if (x_130 == 0)
{
lean_object* x_131; lean_object* x_132; 
x_131 = l_Int_repr(x_5);
lean_dec(x_5);
x_132 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_132, 0, x_131);
x_37 = x_132;
goto block_106;
}
else
{
lean_object* x_133; lean_object* x_134; lean_object* x_135; 
x_133 = l_Int_repr(x_5);
lean_dec(x_5);
x_134 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_134, 0, x_133);
x_135 = l_Repr_addAppParen(x_134, x_128);
x_37 = x_135;
goto block_106;
}
}
block_24:
{
lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; 
if (lean_is_scalar(x_7)) {
 x_14 = lean_alloc_ctor(4, 2, 0);
} else {
 x_14 = x_7;
 lean_ctor_set_tag(x_14, 4);
}
lean_ctor_set(x_14, 0, x_10);
lean_ctor_set(x_14, 1, x_13);
x_15 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set_uint8(x_15, sizeof(void*)*1, x_11);
if (lean_is_scalar(x_4)) {
 x_16 = lean_alloc_ctor(5, 2, 0);
} else {
 x_16 = x_4;
 lean_ctor_set_tag(x_16, 5);
}
lean_ctor_set(x_16, 0, x_12);
lean_ctor_set(x_16, 1, x_15);
x_17 = l_ERURH_instReprWindow_repr___redArg___closed__10;
x_18 = l_ERURH_instReprWindow_repr___redArg___closed__11;
x_19 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_19, 0, x_18);
lean_ctor_set(x_19, 1, x_16);
x_20 = l_ERURH_instReprWindow_repr___redArg___closed__12;
x_21 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_21, 0, x_19);
lean_ctor_set(x_21, 1, x_20);
x_22 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_22, 0, x_17);
lean_ctor_set(x_22, 1, x_21);
x_23 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_23, 0, x_22);
lean_ctor_set_uint8(x_23, sizeof(void*)*1, x_11);
return x_23;
}
block_36:
{
lean_object* x_30; lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; 
x_30 = lean_string_append(x_27, x_29);
lean_dec_ref(x_29);
x_31 = l_ERURH_instReprWindow_repr___redArg___closed__13;
x_32 = lean_string_append(x_30, x_31);
x_33 = l_Nat_reprFast(x_25);
x_34 = lean_string_append(x_32, x_33);
lean_dec_ref(x_33);
x_35 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_35, 0, x_34);
x_11 = x_26;
x_12 = x_28;
x_13 = x_35;
goto block_24;
}
block_106:
{
uint8_t x_38; 
x_38 = !lean_is_exclusive(x_3);
if (x_38 == 0)
{
lean_object* x_39; lean_object* x_40; uint8_t x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; lean_object* x_49; lean_object* x_50; lean_object* x_51; uint8_t x_52; 
x_39 = lean_ctor_get(x_3, 0);
x_40 = lean_ctor_get(x_3, 1);
lean_ctor_set_tag(x_3, 4);
lean_ctor_set(x_3, 1, x_37);
lean_ctor_set(x_3, 0, x_10);
x_41 = 0;
x_42 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_42, 0, x_3);
lean_ctor_set_uint8(x_42, sizeof(void*)*1, x_41);
x_43 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_43, 0, x_9);
lean_ctor_set(x_43, 1, x_42);
x_44 = l_ERURH_instReprWindow_repr___redArg___closed__15;
x_45 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_45, 0, x_43);
lean_ctor_set(x_45, 1, x_44);
x_46 = lean_box(1);
x_47 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_47, 0, x_45);
lean_ctor_set(x_47, 1, x_46);
x_48 = l_ERURH_instReprWindow_repr___redArg___closed__17;
x_49 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_49, 0, x_47);
lean_ctor_set(x_49, 1, x_48);
x_50 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_50, 0, x_49);
lean_ctor_set(x_50, 1, x_8);
x_51 = lean_unsigned_to_nat(1u);
x_52 = lean_nat_dec_eq(x_40, x_51);
if (x_52 == 0)
{
lean_object* x_53; lean_object* x_54; uint8_t x_55; 
x_53 = l_ERURH_instReprWindow_repr___redArg___closed__18;
x_54 = l_ERURH_instReprWindow_repr___redArg___closed__19;
x_55 = lean_int_dec_lt(x_39, x_54);
if (x_55 == 0)
{
lean_object* x_56; lean_object* x_57; 
x_56 = lean_nat_abs(x_39);
lean_dec(x_39);
x_57 = l_Nat_reprFast(x_56);
x_25 = x_40;
x_26 = x_41;
x_27 = x_53;
x_28 = x_50;
x_29 = x_57;
goto block_36;
}
else
{
lean_object* x_58; lean_object* x_59; lean_object* x_60; lean_object* x_61; lean_object* x_62; lean_object* x_63; 
x_58 = lean_nat_abs(x_39);
lean_dec(x_39);
x_59 = lean_nat_sub(x_58, x_51);
lean_dec(x_58);
x_60 = l_ERURH_instReprWindow_repr___redArg___closed__20;
x_61 = lean_nat_add(x_59, x_51);
lean_dec(x_59);
x_62 = l_Nat_reprFast(x_61);
x_63 = lean_string_append(x_60, x_62);
lean_dec_ref(x_62);
x_25 = x_40;
x_26 = x_41;
x_27 = x_53;
x_28 = x_50;
x_29 = x_63;
goto block_36;
}
}
else
{
lean_object* x_64; lean_object* x_65; uint8_t x_66; 
lean_dec(x_40);
x_64 = lean_unsigned_to_nat(0u);
x_65 = l_ERURH_instReprWindow_repr___redArg___closed__19;
x_66 = lean_int_dec_lt(x_39, x_65);
if (x_66 == 0)
{
lean_object* x_67; lean_object* x_68; 
x_67 = l_Int_repr(x_39);
lean_dec(x_39);
x_68 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_68, 0, x_67);
x_11 = x_41;
x_12 = x_50;
x_13 = x_68;
goto block_24;
}
else
{
lean_object* x_69; lean_object* x_70; lean_object* x_71; 
x_69 = l_Int_repr(x_39);
lean_dec(x_39);
x_70 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_70, 0, x_69);
x_71 = l_Repr_addAppParen(x_70, x_64);
x_11 = x_41;
x_12 = x_50;
x_13 = x_71;
goto block_24;
}
}
}
else
{
lean_object* x_72; lean_object* x_73; lean_object* x_74; uint8_t x_75; lean_object* x_76; lean_object* x_77; lean_object* x_78; lean_object* x_79; lean_object* x_80; lean_object* x_81; lean_object* x_82; lean_object* x_83; lean_object* x_84; lean_object* x_85; uint8_t x_86; 
x_72 = lean_ctor_get(x_3, 0);
x_73 = lean_ctor_get(x_3, 1);
lean_inc(x_73);
lean_inc(x_72);
lean_dec(x_3);
x_74 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_74, 0, x_10);
lean_ctor_set(x_74, 1, x_37);
x_75 = 0;
x_76 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_76, 0, x_74);
lean_ctor_set_uint8(x_76, sizeof(void*)*1, x_75);
x_77 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_77, 0, x_9);
lean_ctor_set(x_77, 1, x_76);
x_78 = l_ERURH_instReprWindow_repr___redArg___closed__15;
x_79 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_79, 0, x_77);
lean_ctor_set(x_79, 1, x_78);
x_80 = lean_box(1);
x_81 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_81, 0, x_79);
lean_ctor_set(x_81, 1, x_80);
x_82 = l_ERURH_instReprWindow_repr___redArg___closed__17;
x_83 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_83, 0, x_81);
lean_ctor_set(x_83, 1, x_82);
x_84 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_84, 0, x_83);
lean_ctor_set(x_84, 1, x_8);
x_85 = lean_unsigned_to_nat(1u);
x_86 = lean_nat_dec_eq(x_73, x_85);
if (x_86 == 0)
{
lean_object* x_87; lean_object* x_88; uint8_t x_89; 
x_87 = l_ERURH_instReprWindow_repr___redArg___closed__18;
x_88 = l_ERURH_instReprWindow_repr___redArg___closed__19;
x_89 = lean_int_dec_lt(x_72, x_88);
if (x_89 == 0)
{
lean_object* x_90; lean_object* x_91; 
x_90 = lean_nat_abs(x_72);
lean_dec(x_72);
x_91 = l_Nat_reprFast(x_90);
x_25 = x_73;
x_26 = x_75;
x_27 = x_87;
x_28 = x_84;
x_29 = x_91;
goto block_36;
}
else
{
lean_object* x_92; lean_object* x_93; lean_object* x_94; lean_object* x_95; lean_object* x_96; lean_object* x_97; 
x_92 = lean_nat_abs(x_72);
lean_dec(x_72);
x_93 = lean_nat_sub(x_92, x_85);
lean_dec(x_92);
x_94 = l_ERURH_instReprWindow_repr___redArg___closed__20;
x_95 = lean_nat_add(x_93, x_85);
lean_dec(x_93);
x_96 = l_Nat_reprFast(x_95);
x_97 = lean_string_append(x_94, x_96);
lean_dec_ref(x_96);
x_25 = x_73;
x_26 = x_75;
x_27 = x_87;
x_28 = x_84;
x_29 = x_97;
goto block_36;
}
}
else
{
lean_object* x_98; lean_object* x_99; uint8_t x_100; 
lean_dec(x_73);
x_98 = lean_unsigned_to_nat(0u);
x_99 = l_ERURH_instReprWindow_repr___redArg___closed__19;
x_100 = lean_int_dec_lt(x_72, x_99);
if (x_100 == 0)
{
lean_object* x_101; lean_object* x_102; 
x_101 = l_Int_repr(x_72);
lean_dec(x_72);
x_102 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_102, 0, x_101);
x_11 = x_75;
x_12 = x_84;
x_13 = x_102;
goto block_24;
}
else
{
lean_object* x_103; lean_object* x_104; lean_object* x_105; 
x_103 = l_Int_repr(x_72);
lean_dec(x_72);
x_104 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_104, 0, x_103);
x_105 = l_Repr_addAppParen(x_104, x_98);
x_11 = x_75;
x_12 = x_84;
x_13 = x_105;
goto block_24;
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_ERURH_instReprWindow_repr(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_ERURH_instReprWindow_repr___redArg(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_ERURH_instReprWindow_repr___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_ERURH_instReprWindow_repr(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
static lean_object* _init_l_ERURH_instReprWindow___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_ERURH_instReprWindow_repr___boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWindow() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_instReprWindow___closed__0;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_BridgeCore(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH_instReprWindow_repr___redArg___closed__0 = _init_l_ERURH_instReprWindow_repr___redArg___closed__0();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__0);
l_ERURH_instReprWindow_repr___redArg___closed__1 = _init_l_ERURH_instReprWindow_repr___redArg___closed__1();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__1);
l_ERURH_instReprWindow_repr___redArg___closed__2 = _init_l_ERURH_instReprWindow_repr___redArg___closed__2();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__2);
l_ERURH_instReprWindow_repr___redArg___closed__3 = _init_l_ERURH_instReprWindow_repr___redArg___closed__3();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__3);
l_ERURH_instReprWindow_repr___redArg___closed__4 = _init_l_ERURH_instReprWindow_repr___redArg___closed__4();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__4);
l_ERURH_instReprWindow_repr___redArg___closed__5 = _init_l_ERURH_instReprWindow_repr___redArg___closed__5();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__5);
l_ERURH_instReprWindow_repr___redArg___closed__6 = _init_l_ERURH_instReprWindow_repr___redArg___closed__6();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__6);
l_ERURH_instReprWindow_repr___redArg___closed__7 = _init_l_ERURH_instReprWindow_repr___redArg___closed__7();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__7);
l_ERURH_instReprWindow_repr___redArg___closed__8 = _init_l_ERURH_instReprWindow_repr___redArg___closed__8();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__8);
l_ERURH_instReprWindow_repr___redArg___closed__9 = _init_l_ERURH_instReprWindow_repr___redArg___closed__9();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__9);
l_ERURH_instReprWindow_repr___redArg___closed__10 = _init_l_ERURH_instReprWindow_repr___redArg___closed__10();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__10);
l_ERURH_instReprWindow_repr___redArg___closed__11 = _init_l_ERURH_instReprWindow_repr___redArg___closed__11();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__11);
l_ERURH_instReprWindow_repr___redArg___closed__12 = _init_l_ERURH_instReprWindow_repr___redArg___closed__12();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__12);
l_ERURH_instReprWindow_repr___redArg___closed__13 = _init_l_ERURH_instReprWindow_repr___redArg___closed__13();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__13);
l_ERURH_instReprWindow_repr___redArg___closed__14 = _init_l_ERURH_instReprWindow_repr___redArg___closed__14();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__14);
l_ERURH_instReprWindow_repr___redArg___closed__15 = _init_l_ERURH_instReprWindow_repr___redArg___closed__15();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__15);
l_ERURH_instReprWindow_repr___redArg___closed__16 = _init_l_ERURH_instReprWindow_repr___redArg___closed__16();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__16);
l_ERURH_instReprWindow_repr___redArg___closed__17 = _init_l_ERURH_instReprWindow_repr___redArg___closed__17();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__17);
l_ERURH_instReprWindow_repr___redArg___closed__18 = _init_l_ERURH_instReprWindow_repr___redArg___closed__18();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__18);
l_ERURH_instReprWindow_repr___redArg___closed__19 = _init_l_ERURH_instReprWindow_repr___redArg___closed__19();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__19);
l_ERURH_instReprWindow_repr___redArg___closed__20 = _init_l_ERURH_instReprWindow_repr___redArg___closed__20();
lean_mark_persistent(l_ERURH_instReprWindow_repr___redArg___closed__20);
l_ERURH_instReprWindow___closed__0 = _init_l_ERURH_instReprWindow___closed__0();
lean_mark_persistent(l_ERURH_instReprWindow___closed__0);
l_ERURH_instReprWindow = _init_l_ERURH_instReprWindow();
lean_mark_persistent(l_ERURH_instReprWindow);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
