// Lean compiler output
// Module: ERURH.LemmaAContraction
// Imports: public import Init public import Mathlib.Data.Rat.Init public import Mathlib.Tactic public import ERURH.WeightedBands
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
uint8_t l_Rat_instDecidableLe(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_ERURH_lemmaA__threshold___nativeDecide__1__1;
LEAN_EXPORT uint8_t l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1;
extern lean_object* l_ERURH_s0ClosedRat;
static uint8_t l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1___closed__0;
extern lean_object* l_ERURH_lGlobalFormalRat;
extern lean_object* l_ERURH_analyticBand;
extern lean_object* l_ERURH_lAClosedRat;
lean_object* l_ERURH_QBound_toRat(lean_object*);
static uint8_t _init_l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; uint8_t x_3; 
x_1 = l_ERURH_lAClosedRat;
x_2 = l_ERURH_lGlobalFormalRat;
x_3 = l_Rat_instDecidableLe(x_2, x_1);
return x_3;
}
}
static uint8_t _init_l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1() {
_start:
{
uint8_t x_1; 
x_1 = l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1___closed__0;
return x_1;
}
}
static uint8_t _init_l_ERURH_lemmaA__threshold___nativeDecide__1__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_1 = l_ERURH_analyticBand;
x_2 = lean_ctor_get(x_1, 0);
lean_inc_ref(x_2);
x_3 = l_ERURH_QBound_toRat(x_2);
x_4 = l_ERURH_s0ClosedRat;
x_5 = l_Rat_instDecidableLe(x_3, x_4);
return x_5;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Data_Rat_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Tactic(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_WeightedBands(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_LemmaAContraction(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Data_Rat_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Tactic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_WeightedBands(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1___closed__0 = _init_l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1___closed__0();
l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1 = _init_l_ERURH_lemmaA__contraction__bound___nativeDecide__1__1();
l_ERURH_lemmaA__threshold___nativeDecide__1__1 = _init_l_ERURH_lemmaA__threshold___nativeDecide__1__1();
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
