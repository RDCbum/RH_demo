// Lean compiler output
// Module: ERURH.Numeric.Interval
// Imports: public import Init public import Mathlib public import ERURH.Numeric.Semantics
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
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_uniform__grid(lean_object*, lean_object*, lean_object*);
lean_object* l_List_foldl___at___Array_appendList_spec__0___redArg(lean_object*, lean_object*);
static lean_object* l_ERURH_Numeric_Interval_uniform__grid___closed__0;
LEAN_EXPORT lean_object* l_List_mapTR_loop___at___ERURH_Numeric_Interval_uniform__grid_spec__1(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_List_range(lean_object*);
lean_object* lean_array_to_list(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_GridCover_ctorIdx___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_List_Impl_0__List_flatMapTR_go___at___ERURH_Numeric_Interval_uniform__grid_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___redArg___boxed(lean_object*, lean_object*, lean_object*);
lean_object* l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_1259013419____hygCtx___hyg_2_(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_GridCover_ctorIdx(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___redArg(lean_object*, lean_object*, lean_object*);
lean_object* l_Nat_cast___at___Nat_cast___at___Nat_cast___at___Real_instInhabitedAngle_spec__0_spec__0_spec__0(lean_object*);
lean_object* l_List_reverse___redArg(lean_object*);
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_1745762101____hygCtx___hyg_2_(lean_object*, lean_object*, lean_object*);
extern lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2_;
lean_object* lean_nat_add(lean_object*, lean_object*);
lean_object* l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_2153608522____hygCtx___hyg_2_(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_uniform__grid___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_segmentMax(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_GridCover_ctorIdx(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lean_unsigned_to_nat(0u);
return x_4;
}
}
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_GridCover_ctorIdx___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_ERURH_Numeric_Interval_GridCover_ctorIdx(x_1, x_2, x_3);
lean_dec_ref(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_List_Impl_0__List_flatMapTR_go___at___ERURH_Numeric_Interval_uniform__grid_spec__0(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; 
x_3 = lean_array_to_list(x_2);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_1);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_1, 0);
x_6 = lean_ctor_get(x_1, 1);
x_7 = l_Nat_cast___at___Nat_cast___at___Nat_cast___at___Real_instInhabitedAngle_spec__0_spec__0_spec__0(x_5);
x_8 = lean_box(0);
lean_ctor_set(x_1, 1, x_8);
lean_ctor_set(x_1, 0, x_7);
x_9 = l_List_foldl___at___Array_appendList_spec__0___redArg(x_2, x_1);
x_1 = x_6;
x_2 = x_9;
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_11 = lean_ctor_get(x_1, 0);
x_12 = lean_ctor_get(x_1, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_1);
x_13 = l_Nat_cast___at___Nat_cast___at___Nat_cast___at___Real_instInhabitedAngle_spec__0_spec__0_spec__0(x_11);
x_14 = lean_box(0);
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_13);
lean_ctor_set(x_15, 1, x_14);
x_16 = l_List_foldl___at___Array_appendList_spec__0___redArg(x_2, x_15);
x_1 = x_12;
x_2 = x_16;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* l_List_mapTR_loop___at___ERURH_Numeric_Interval_uniform__grid_spec__1(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_5; 
lean_dec(x_2);
lean_dec(x_1);
x_5 = l_List_reverse___redArg(x_4);
return x_5;
}
else
{
uint8_t x_6; 
x_6 = !lean_is_exclusive(x_3);
if (x_6 == 0)
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_7 = lean_ctor_get(x_3, 0);
x_8 = lean_ctor_get(x_3, 1);
lean_inc(x_1);
x_9 = lean_alloc_closure((void*)(l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_1745762101____hygCtx___hyg_2_), 3, 2);
lean_closure_set(x_9, 0, x_7);
lean_closure_set(x_9, 1, x_1);
lean_inc(x_2);
x_10 = lean_alloc_closure((void*)(l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_2153608522____hygCtx___hyg_2_), 3, 2);
lean_closure_set(x_10, 0, x_2);
lean_closure_set(x_10, 1, x_9);
lean_ctor_set(x_3, 1, x_4);
lean_ctor_set(x_3, 0, x_10);
{
lean_object* _tmp_2 = x_8;
lean_object* _tmp_3 = x_3;
x_3 = _tmp_2;
x_4 = _tmp_3;
}
goto _start;
}
else
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_12 = lean_ctor_get(x_3, 0);
x_13 = lean_ctor_get(x_3, 1);
lean_inc(x_13);
lean_inc(x_12);
lean_dec(x_3);
lean_inc(x_1);
x_14 = lean_alloc_closure((void*)(l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_1745762101____hygCtx___hyg_2_), 3, 2);
lean_closure_set(x_14, 0, x_12);
lean_closure_set(x_14, 1, x_1);
lean_inc(x_2);
x_15 = lean_alloc_closure((void*)(l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_2153608522____hygCtx___hyg_2_), 3, 2);
lean_closure_set(x_15, 0, x_2);
lean_closure_set(x_15, 1, x_14);
x_16 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_16, 0, x_15);
lean_ctor_set(x_16, 1, x_4);
x_3 = x_13;
x_4 = x_16;
goto _start;
}
}
}
}
static lean_object* _init_l_ERURH_Numeric_Interval_uniform__grid___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_uniform__grid(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_4 = lean_unsigned_to_nat(1u);
x_5 = lean_nat_add(x_3, x_4);
x_6 = l_List_range(x_5);
x_7 = l_ERURH_Numeric_Interval_uniform__grid___closed__0;
x_8 = l___private_Init_Data_List_Impl_0__List_flatMapTR_go___at___ERURH_Numeric_Interval_uniform__grid_spec__0(x_6, x_7);
x_9 = lean_box(0);
x_10 = l_List_mapTR_loop___at___ERURH_Numeric_Interval_uniform__grid_spec__1(x_2, x_1, x_8, x_9);
return x_10;
}
}
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_uniform__grid___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_ERURH_Numeric_Interval_uniform__grid(x_1, x_2, x_3);
lean_dec(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_ERURH_Numeric_Interval_segmentMax(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_1);
x_3 = l_Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2_;
return x_3;
}
else
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_4 = lean_ctor_get(x_2, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_2, 1);
lean_inc(x_5);
lean_dec_ref(x_2);
lean_inc(x_1);
x_6 = lean_apply_1(x_1, x_4);
x_7 = l_ERURH_Numeric_Interval_segmentMax(x_1, x_5);
x_8 = lean_alloc_closure((void*)(l_Real_definition___lam__0____x40_Mathlib_Data_Real_Basic_1259013419____hygCtx___hyg_2_), 3, 2);
lean_closure_set(x_8, 0, x_6);
lean_closure_set(x_8, 1, x_7);
return x_8;
}
}
}
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___redArg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_dec(x_3);
lean_inc(x_2);
return x_2;
}
else
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
lean_dec_ref(x_1);
x_6 = lean_apply_2(x_3, x_4, x_5);
return x_6;
}
}
}
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___redArg(x_2, x_3, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___redArg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___redArg(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
LEAN_EXPORT lean_object* l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l___private_ERURH_Numeric_Interval_0__ERURH_Numeric_Interval_segmentMax_match__1_splitter(x_1, x_2, x_3, x_4);
lean_dec(x_3);
return x_5;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Numeric_Semantics(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_Numeric_Interval(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Numeric_Semantics(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH_Numeric_Interval_uniform__grid___closed__0 = _init_l_ERURH_Numeric_Interval_uniform__grid___closed__0();
lean_mark_persistent(l_ERURH_Numeric_Interval_uniform__grid___closed__0);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
