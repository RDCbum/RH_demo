// Lean compiler output
// Module: ERURH
// Imports: public import Init public import ERURH.BridgeCore public import ERURH.Inertia public import ERURH.BridgeScaffold public import ERURH.Flux public import ERURH.FluxWindows public import ERURH.FluxBounds public import ERURH.RH public import ERURH.ZetaLink public import ERURH.PsiLayer public import ERURH.ExplicitBridge public import ERURH.ExpRect public import ERURH.AnalyticWitness public import ERURH.XiPrefactor public import ERURH.XiZetaIface public import ERURH.XiWitnessAssembly public import ERURH.NumberTheory.VonMangoldt public import ERURH.NumberTheory.Chebyshev public import ERURH.XiCore public import ERURH.AlphaInterfaces public import ERURH.Equivalence
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
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_BridgeCore(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Inertia(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_BridgeScaffold(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Flux(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_FluxWindows(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_FluxBounds(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_RH(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_ZetaLink(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_PsiLayer(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_ExplicitBridge(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_ExpRect(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_AnalyticWitness(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiPrefactor(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiZetaIface(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiWitnessAssembly(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_NumberTheory_VonMangoldt(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_NumberTheory_Chebyshev(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_XiCore(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_AlphaInterfaces(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Equivalence(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_BridgeCore(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Inertia(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_BridgeScaffold(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Flux(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_FluxWindows(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_FluxBounds(builtin, lean_io_mk_world());
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
res = initialize_ERURH_ExplicitBridge(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_ExpRect(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_AnalyticWitness(builtin, lean_io_mk_world());
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
res = initialize_ERURH_NumberTheory_VonMangoldt(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_NumberTheory_Chebyshev(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_XiCore(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_AlphaInterfaces(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Equivalence(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
