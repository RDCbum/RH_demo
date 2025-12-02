// Lean compiler output
// Module: ERURH.BoundsConfig
// Imports: public import Init public import Mathlib public import ERURH.FluxWindows public import ERURH.RationalBounds
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
LEAN_EXPORT lean_object* l_ERURH_BoundsConfig_boundsTcapQ;
static lean_object* l_ERURH_BoundsConfig_boundsTcapQ___closed__0;
LEAN_EXPORT lean_object* l_ERURH_BoundsConfig_boundsTcap;
LEAN_EXPORT lean_object* l_ERURH_boundsTcap;
LEAN_EXPORT lean_object* l_ERURH_BoundsConfig_boundsTcapR;
static lean_object* l_ERURH_BoundsConfig_boundsTcapR___closed__0;
lean_object* l_CauSeq_const___at___CauSeq_Completion_ofRat___at___Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2__spec__0_spec__0___redArg___lam__0___boxed(lean_object*, lean_object*);
lean_object* l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(lean_object*);
static lean_object* _init_l_ERURH_BoundsConfig_boundsTcapQ___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(300u);
x_2 = l_Nat_cast___at_____private_Lean_Meta_Tactic_Grind_Arith_Linear_MBTC_0__Lean_Meta_Grind_Arith_Linear_toRatValue_x3f_spec__1(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_BoundsConfig_boundsTcapQ() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_BoundsConfig_boundsTcapQ___closed__0;
return x_1;
}
}
static lean_object* _init_l_ERURH_BoundsConfig_boundsTcapR___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_BoundsConfig_boundsTcapQ;
x_2 = lean_alloc_closure((void*)(l_CauSeq_const___at___CauSeq_Completion_ofRat___at___Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2__spec__0_spec__0___redArg___lam__0___boxed), 2, 1);
lean_closure_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_BoundsConfig_boundsTcapR() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_BoundsConfig_boundsTcapR___closed__0;
return x_1;
}
}
static lean_object* _init_l_ERURH_boundsTcap() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_BoundsConfig_boundsTcapQ;
return x_1;
}
}
static lean_object* _init_l_ERURH_BoundsConfig_boundsTcap() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_BoundsConfig_boundsTcapQ;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_FluxWindows(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_RationalBounds(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_BoundsConfig(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_FluxWindows(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_RationalBounds(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH_BoundsConfig_boundsTcapQ___closed__0 = _init_l_ERURH_BoundsConfig_boundsTcapQ___closed__0();
lean_mark_persistent(l_ERURH_BoundsConfig_boundsTcapQ___closed__0);
l_ERURH_BoundsConfig_boundsTcapQ = _init_l_ERURH_BoundsConfig_boundsTcapQ();
lean_mark_persistent(l_ERURH_BoundsConfig_boundsTcapQ);
l_ERURH_BoundsConfig_boundsTcapR___closed__0 = _init_l_ERURH_BoundsConfig_boundsTcapR___closed__0();
lean_mark_persistent(l_ERURH_BoundsConfig_boundsTcapR___closed__0);
l_ERURH_BoundsConfig_boundsTcapR = _init_l_ERURH_BoundsConfig_boundsTcapR();
lean_mark_persistent(l_ERURH_BoundsConfig_boundsTcapR);
l_ERURH_boundsTcap = _init_l_ERURH_boundsTcap();
lean_mark_persistent(l_ERURH_boundsTcap);
l_ERURH_BoundsConfig_boundsTcap = _init_l_ERURH_BoundsConfig_boundsTcap();
lean_mark_persistent(l_ERURH_BoundsConfig_boundsTcap);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
