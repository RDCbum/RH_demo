// Lean compiler output
// Module: ERURH.WeightedBands
// Imports: public import Init public import Mathlib.Data.Rat.Init public import ERURH.RationalBounds
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
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__3;
LEAN_EXPORT lean_object* l_ERURH_energyBand;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__14;
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_ctorIdx___boxed(lean_object*);
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__1;
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_ctorIdx(lean_object*);
static lean_object* l_ERURH_instReprWeightedBand___closed__0;
LEAN_EXPORT lean_object* l_ERURH_instReprWeightedBand_repr___redArg(lean_object*);
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__12;
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_thresholdRat(lean_object*);
lean_object* lean_string_length(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_instReprWeightedBand_repr___boxed(lean_object*, lean_object*);
static lean_object* l_ERURH_analyticBand___closed__0;
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_contraction(lean_object*);
static lean_object* l_ERURH_energyBand___closed__0;
lean_object* lean_nat_to_int(lean_object*);
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__13;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__6;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__5;
LEAN_EXPORT lean_object* l_ERURH_instReprWeightedBand;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__0;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__9;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__16;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__2;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__11;
LEAN_EXPORT lean_object* l_ERURH_analyticBand;
LEAN_EXPORT lean_object* l_ERURH_instReprWeightedBand_repr(lean_object*, lean_object*);
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__8;
lean_object* l_ERURH_QBound_toRat(lean_object*);
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__17;
extern lean_object* l_ERURH_s0Closed;
extern lean_object* l_ERURH_maxWOverMinW;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__10;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__4;
lean_object* l_ERURH_instReprQBound_repr___redArg(lean_object*);
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__7;
static lean_object* l_ERURH_instReprWeightedBand_repr___redArg___closed__15;
extern lean_object* l_ERURH_weightMax;
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_ctorIdx(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
}
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_ctorIdx___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_ERURH_WeightedBand_ctorIdx(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("{ ", 2, 2);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("threshold", 9, 9);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__2;
x_2 = lean_box(0);
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__4() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(" := ", 4, 4);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__4;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__5;
x_2 = l_ERURH_instReprWeightedBand_repr___redArg___closed__3;
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(13u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__8() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(",", 1, 1);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__9() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__8;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__10() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("weight_ratio", 12, 12);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__10;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(16u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(" }", 2, 2);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__14() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__0;
x_2 = lean_string_length(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__15() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__14;
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__0;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__17() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_instReprWeightedBand_repr___redArg___closed__13;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_ERURH_instReprWeightedBand_repr___redArg(lean_object* x_1) {
_start:
{
uint8_t x_2; 
x_2 = !lean_is_exclusive(x_1);
if (x_2 == 0)
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; uint8_t x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; 
x_3 = lean_ctor_get(x_1, 0);
x_4 = lean_ctor_get(x_1, 1);
x_5 = l_ERURH_instReprWeightedBand_repr___redArg___closed__5;
x_6 = l_ERURH_instReprWeightedBand_repr___redArg___closed__6;
x_7 = l_ERURH_instReprWeightedBand_repr___redArg___closed__7;
x_8 = l_ERURH_instReprQBound_repr___redArg(x_3);
lean_ctor_set_tag(x_1, 4);
lean_ctor_set(x_1, 1, x_8);
lean_ctor_set(x_1, 0, x_7);
x_9 = 0;
x_10 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_10, 0, x_1);
lean_ctor_set_uint8(x_10, sizeof(void*)*1, x_9);
x_11 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_11, 0, x_6);
lean_ctor_set(x_11, 1, x_10);
x_12 = l_ERURH_instReprWeightedBand_repr___redArg___closed__9;
x_13 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_13, 0, x_11);
lean_ctor_set(x_13, 1, x_12);
x_14 = lean_box(1);
x_15 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_15, 0, x_13);
lean_ctor_set(x_15, 1, x_14);
x_16 = l_ERURH_instReprWeightedBand_repr___redArg___closed__11;
x_17 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_17, 0, x_15);
lean_ctor_set(x_17, 1, x_16);
x_18 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_18, 0, x_17);
lean_ctor_set(x_18, 1, x_5);
x_19 = l_ERURH_instReprWeightedBand_repr___redArg___closed__12;
x_20 = l_ERURH_instReprQBound_repr___redArg(x_4);
x_21 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_21, 0, x_19);
lean_ctor_set(x_21, 1, x_20);
x_22 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_22, 0, x_21);
lean_ctor_set_uint8(x_22, sizeof(void*)*1, x_9);
x_23 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_23, 0, x_18);
lean_ctor_set(x_23, 1, x_22);
x_24 = l_ERURH_instReprWeightedBand_repr___redArg___closed__15;
x_25 = l_ERURH_instReprWeightedBand_repr___redArg___closed__16;
x_26 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_26, 0, x_25);
lean_ctor_set(x_26, 1, x_23);
x_27 = l_ERURH_instReprWeightedBand_repr___redArg___closed__17;
x_28 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_28, 0, x_26);
lean_ctor_set(x_28, 1, x_27);
x_29 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_29, 0, x_24);
lean_ctor_set(x_29, 1, x_28);
x_30 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_30, 0, x_29);
lean_ctor_set_uint8(x_30, sizeof(void*)*1, x_9);
return x_30;
}
else
{
lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; uint8_t x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; lean_object* x_49; lean_object* x_50; lean_object* x_51; lean_object* x_52; lean_object* x_53; lean_object* x_54; lean_object* x_55; lean_object* x_56; lean_object* x_57; lean_object* x_58; lean_object* x_59; 
x_31 = lean_ctor_get(x_1, 0);
x_32 = lean_ctor_get(x_1, 1);
lean_inc(x_32);
lean_inc(x_31);
lean_dec(x_1);
x_33 = l_ERURH_instReprWeightedBand_repr___redArg___closed__5;
x_34 = l_ERURH_instReprWeightedBand_repr___redArg___closed__6;
x_35 = l_ERURH_instReprWeightedBand_repr___redArg___closed__7;
x_36 = l_ERURH_instReprQBound_repr___redArg(x_31);
x_37 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_37, 0, x_35);
lean_ctor_set(x_37, 1, x_36);
x_38 = 0;
x_39 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_39, 0, x_37);
lean_ctor_set_uint8(x_39, sizeof(void*)*1, x_38);
x_40 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_40, 0, x_34);
lean_ctor_set(x_40, 1, x_39);
x_41 = l_ERURH_instReprWeightedBand_repr___redArg___closed__9;
x_42 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_42, 0, x_40);
lean_ctor_set(x_42, 1, x_41);
x_43 = lean_box(1);
x_44 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_44, 0, x_42);
lean_ctor_set(x_44, 1, x_43);
x_45 = l_ERURH_instReprWeightedBand_repr___redArg___closed__11;
x_46 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_46, 0, x_44);
lean_ctor_set(x_46, 1, x_45);
x_47 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_47, 0, x_46);
lean_ctor_set(x_47, 1, x_33);
x_48 = l_ERURH_instReprWeightedBand_repr___redArg___closed__12;
x_49 = l_ERURH_instReprQBound_repr___redArg(x_32);
x_50 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_50, 0, x_48);
lean_ctor_set(x_50, 1, x_49);
x_51 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_51, 0, x_50);
lean_ctor_set_uint8(x_51, sizeof(void*)*1, x_38);
x_52 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_52, 0, x_47);
lean_ctor_set(x_52, 1, x_51);
x_53 = l_ERURH_instReprWeightedBand_repr___redArg___closed__15;
x_54 = l_ERURH_instReprWeightedBand_repr___redArg___closed__16;
x_55 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_55, 0, x_54);
lean_ctor_set(x_55, 1, x_52);
x_56 = l_ERURH_instReprWeightedBand_repr___redArg___closed__17;
x_57 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_57, 0, x_55);
lean_ctor_set(x_57, 1, x_56);
x_58 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_58, 0, x_53);
lean_ctor_set(x_58, 1, x_57);
x_59 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_59, 0, x_58);
lean_ctor_set_uint8(x_59, sizeof(void*)*1, x_38);
return x_59;
}
}
}
LEAN_EXPORT lean_object* l_ERURH_instReprWeightedBand_repr(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_ERURH_instReprWeightedBand_repr___redArg(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_ERURH_instReprWeightedBand_repr___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_ERURH_instReprWeightedBand_repr(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_ERURH_instReprWeightedBand_repr___boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_ERURH_instReprWeightedBand() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_instReprWeightedBand___closed__0;
return x_1;
}
}
static lean_object* _init_l_ERURH_analyticBand___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_maxWOverMinW;
x_2 = l_ERURH_s0Closed;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_analyticBand() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_analyticBand___closed__0;
return x_1;
}
}
static lean_object* _init_l_ERURH_energyBand___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_weightMax;
x_2 = l_ERURH_s0Closed;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_energyBand() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_energyBand___closed__0;
return x_1;
}
}
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_contraction(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_ctor_get(x_1, 1);
lean_inc_ref(x_2);
lean_dec_ref(x_1);
x_3 = l_ERURH_QBound_toRat(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_ERURH_WeightedBand_thresholdRat(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_ctor_get(x_1, 0);
lean_inc_ref(x_2);
lean_dec_ref(x_1);
x_3 = l_ERURH_QBound_toRat(x_2);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Data_Rat_Init(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_RationalBounds(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_WeightedBands(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Data_Rat_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_RationalBounds(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH_instReprWeightedBand_repr___redArg___closed__0 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__0();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__0);
l_ERURH_instReprWeightedBand_repr___redArg___closed__1 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__1();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__1);
l_ERURH_instReprWeightedBand_repr___redArg___closed__2 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__2();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__2);
l_ERURH_instReprWeightedBand_repr___redArg___closed__3 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__3();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__3);
l_ERURH_instReprWeightedBand_repr___redArg___closed__4 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__4();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__4);
l_ERURH_instReprWeightedBand_repr___redArg___closed__5 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__5();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__5);
l_ERURH_instReprWeightedBand_repr___redArg___closed__6 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__6();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__6);
l_ERURH_instReprWeightedBand_repr___redArg___closed__7 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__7();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__7);
l_ERURH_instReprWeightedBand_repr___redArg___closed__8 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__8();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__8);
l_ERURH_instReprWeightedBand_repr___redArg___closed__9 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__9();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__9);
l_ERURH_instReprWeightedBand_repr___redArg___closed__10 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__10();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__10);
l_ERURH_instReprWeightedBand_repr___redArg___closed__11 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__11();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__11);
l_ERURH_instReprWeightedBand_repr___redArg___closed__12 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__12();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__12);
l_ERURH_instReprWeightedBand_repr___redArg___closed__13 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__13();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__13);
l_ERURH_instReprWeightedBand_repr___redArg___closed__14 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__14();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__14);
l_ERURH_instReprWeightedBand_repr___redArg___closed__15 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__15();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__15);
l_ERURH_instReprWeightedBand_repr___redArg___closed__16 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__16();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__16);
l_ERURH_instReprWeightedBand_repr___redArg___closed__17 = _init_l_ERURH_instReprWeightedBand_repr___redArg___closed__17();
lean_mark_persistent(l_ERURH_instReprWeightedBand_repr___redArg___closed__17);
l_ERURH_instReprWeightedBand___closed__0 = _init_l_ERURH_instReprWeightedBand___closed__0();
lean_mark_persistent(l_ERURH_instReprWeightedBand___closed__0);
l_ERURH_instReprWeightedBand = _init_l_ERURH_instReprWeightedBand();
lean_mark_persistent(l_ERURH_instReprWeightedBand);
l_ERURH_analyticBand___closed__0 = _init_l_ERURH_analyticBand___closed__0();
lean_mark_persistent(l_ERURH_analyticBand___closed__0);
l_ERURH_analyticBand = _init_l_ERURH_analyticBand();
lean_mark_persistent(l_ERURH_analyticBand);
l_ERURH_energyBand___closed__0 = _init_l_ERURH_energyBand___closed__0();
lean_mark_persistent(l_ERURH_energyBand___closed__0);
l_ERURH_energyBand = _init_l_ERURH_energyBand();
lean_mark_persistent(l_ERURH_energyBand);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
