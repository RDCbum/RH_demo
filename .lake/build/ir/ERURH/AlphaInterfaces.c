// Lean compiler output
// Module: ERURH.AlphaInterfaces
// Imports: public import Init public import Mathlib public import ERURH.Inertia public import ERURH.RH public import ERURH.ZetaLink public import ERURH.PsiLayer public import ERURH.PsiLayerClassical public import ERURH.ExplicitBridge public import ERURH.BoundsConfig public import ERURH.FluxWindows public import ERURH.NumberTheory.Chebyshev public import ERURH.AnalyticWitness public import ERURH.XiCore public import ERURH.XiPrefactor public import ERURH.XiZetaIface public import ERURH.XiWitnessAssembly public import ERURH.BridgeToRH public import ERURH.ERUTheory public import ERURH.ComplexAbsCompat
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
LEAN_EXPORT lean_object* l_ERURH_AlphaInterfaces_ctorIdx(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_AlphaInterfaces_ctorIdx___boxed(lean_object*);
LEAN_EXPORT lean_object* l_ERURH_AlphaInterfaces_ctorIdx(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_unsigned_to_nat(0u);
return x_2;
}
}
LEAN_EXPORT lean_object* l_ERURH_AlphaInterfaces_ctorIdx___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_ERURH_AlphaInterfaces_ctorIdx(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Inertia(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_RH(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_ZetaLink(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_PsiLayer(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_PsiLayerClassical(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_ExplicitBridge(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_BoundsConfig(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_FluxWindows(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_NumberTheory_Chebyshev(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_AnalyticWitness(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiCore(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiPrefactor(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiZetaIface(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiWitnessAssembly(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_BridgeToRH(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_ERUTheory(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_ComplexAbsCompat(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_AlphaInterfaces(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Inertia(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_RH(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_ZetaLink(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_PsiLayer(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_PsiLayerClassical(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_ExplicitBridge(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_BoundsConfig(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_FluxWindows(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_NumberTheory_Chebyshev(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_AnalyticWitness(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_XiCore(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_XiPrefactor(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_XiZetaIface(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_XiWitnessAssembly(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_BridgeToRH(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_ERUTheory(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_ComplexAbsCompat(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
