// Lean compiler output
// Module: ERURH.Inertia
// Imports: public import Init public import Mathlib public import ERURH.BridgeCore
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
static lean_object* l_ERURH_instInhabitedERUBridge_default___closed__1;
lean_object* lean_nat_to_int(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_InertiaBounds_ctorIdx(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_instInhabitedERUBridge;
LEAN_EXPORT lean_object* l_ERURH_instInhabitedERUBridge_default___lam__0___boxed(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_instInhabitedERUBridge_default___lam__0(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_ERUBridge_ctorIdx(lean_object*);
static lean_object* l_ERURH_instInhabitedERUBridge_default___closed__0;
LEAN_EXPORT lean_object* l_ERURH_ERUBridge_ctorIdx___boxed(lean_object*);
extern lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2_;
LEAN_EXPORT lean_object* l_ERURH_instInhabitedERUBridge_default;
LEAN_EXPORT lean_object* l_ERURH_InertiaBounds_ctorIdx___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_ERURH_ERUBridge_ctorIdx(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
}
LEAN_EXPORT lean_object* l_ERURH_ERUBridge_ctorIdx___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_ERURH_ERUBridge_ctorIdx(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_ERURH_instInhabitedERUBridge_default___lam__0(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Real_definition____x40_Mathlib_Data_Real_Basic_3335671075____hygCtx___hyg_2_;
return x_2;
}
}
static lean_object* _init_l_ERURH_instInhabitedERUBridge_default___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instInhabitedERUBridge_default___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = l_ERURH_instInhabitedERUBridge_default___closed__0;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_instInhabitedERUBridge_default() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_alloc_closure((void*)(l_ERURH_instInhabitedERUBridge_default___lam__0___boxed), 1, 0);
x_2 = l_ERURH_instInhabitedERUBridge_default___closed__1;
lean_inc_ref(x_1);
x_3 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
lean_ctor_set(x_3, 2, x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_ERURH_instInhabitedERUBridge_default___lam__0___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_ERURH_instInhabitedERUBridge_default___lam__0(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_instInhabitedERUBridge() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_instInhabitedERUBridge_default;
return x_1;
}
}
LEAN_EXPORT lean_object* l_ERURH_InertiaBounds_ctorIdx(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_unsigned_to_nat(0u);
return x_3;
}
}
LEAN_EXPORT lean_object* l_ERURH_InertiaBounds_ctorIdx___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_ERURH_InertiaBounds_ctorIdx(x_1, x_2);
lean_dec_ref(x_2);
lean_dec_ref(x_1);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_BridgeCore(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_Inertia(uint8_t builtin, lean_object* w) {
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
l_ERURH_instInhabitedERUBridge_default___closed__0 = _init_l_ERURH_instInhabitedERUBridge_default___closed__0();
lean_mark_persistent(l_ERURH_instInhabitedERUBridge_default___closed__0);
l_ERURH_instInhabitedERUBridge_default___closed__1 = _init_l_ERURH_instInhabitedERUBridge_default___closed__1();
lean_mark_persistent(l_ERURH_instInhabitedERUBridge_default___closed__1);
l_ERURH_instInhabitedERUBridge_default = _init_l_ERURH_instInhabitedERUBridge_default();
lean_mark_persistent(l_ERURH_instInhabitedERUBridge_default);
l_ERURH_instInhabitedERUBridge = _init_l_ERURH_instInhabitedERUBridge();
lean_mark_persistent(l_ERURH_instInhabitedERUBridge);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
