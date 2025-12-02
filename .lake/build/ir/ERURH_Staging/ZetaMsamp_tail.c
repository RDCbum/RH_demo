// Lean compiler output
// Module: ERURH_Staging.ZetaMsamp_tail
// Imports: public import Init public import ERURH_Staging.AbsNotation public import ERURH.Numeric.Interval public import ERURH.Numeric.Semantics
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
LEAN_EXPORT lean_object* l_ERURH__Staging_tail__bR;
static lean_object* l_ERURH__Staging_tail__bR___closed__1;
lean_object* l_Nat_cast___at___Float_toRat0_spec__0(lean_object*);
lean_object* l_CauSeq_const___at___CauSeq_Completion_ofRat___at___Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2__spec__0_spec__0___redArg___lam__0___boxed(lean_object*, lean_object*);
static lean_object* l_ERURH__Staging_tail__bR___closed__0;
static lean_object* _init_l_ERURH__Staging_tail__bR___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(300u);
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH__Staging_tail__bR___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH__Staging_tail__bR___closed__0;
x_2 = lean_alloc_closure((void*)(l_CauSeq_const___at___CauSeq_Completion_ofRat___at___Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2__spec__0_spec__0___redArg___lam__0___boxed), 2, 1);
lean_closure_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH__Staging_tail__bR() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH__Staging_tail__bR___closed__1;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH__Staging_AbsNotation(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Numeric_Interval(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Numeric_Semantics(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH__Staging_ZetaMsamp__tail(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH__Staging_AbsNotation(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Numeric_Interval(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Numeric_Semantics(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH__Staging_tail__bR___closed__0 = _init_l_ERURH__Staging_tail__bR___closed__0();
lean_mark_persistent(l_ERURH__Staging_tail__bR___closed__0);
l_ERURH__Staging_tail__bR___closed__1 = _init_l_ERURH__Staging_tail__bR___closed__1();
lean_mark_persistent(l_ERURH__Staging_tail__bR___closed__1);
l_ERURH__Staging_tail__bR = _init_l_ERURH__Staging_tail__bR();
lean_mark_persistent(l_ERURH__Staging_tail__bR);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
