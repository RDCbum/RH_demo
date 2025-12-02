// Lean compiler output
// Module: ERURH.CertificateValues
// Imports: public import Init public import Mathlib.Tactic.FieldSimp public import Mathlib.Tactic.NormNum public import ERURH.RationalBounds public import ERURH.Certificate public import ERURH.LemmaAContraction public import ERURH.LemmaBEnergy
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
static lean_object* l_ERURH_s0StrictRat___closed__2;
static lean_object* l_ERURH_cEnvelopeBaseRat___closed__2;
LEAN_EXPORT lean_object* l_ERURH_cEnvelopeClosedExact;
extern lean_object* l_ERURH_lAClosed;
LEAN_EXPORT lean_object* l_ERURH_cEnvelopeBaseRat;
static lean_object* l_ERURH_cEnvelopeBaseRat___closed__1;
LEAN_EXPORT lean_object* l_ERURH_epsLBoundRat;
static lean_object* l_ERURH_epsLBoundRat___closed__2;
static lean_object* l_ERURH_epsPhiBound___closed__1;
static lean_object* l_ERURH_cEnvelopeBaseRat___closed__0;
static lean_object* l_ERURH_epsKappaBoundRat___closed__2;
static lean_object* l_ERURH_inflationFactorExact___closed__1;
static lean_object* l_ERURH_epsKappaBound___closed__2;
static lean_object* l_ERURH_certificateFromBundle___closed__0;
static lean_object* l_ERURH_inflationFactorReportedRat___closed__2;
static lean_object* l_ERURH_cEnvelopeClosedExactRat___closed__0;
static lean_object* l_ERURH_epsPhiBoundRat___closed__1;
LEAN_EXPORT lean_object* l_ERURH_certificateFromBundle;
static lean_object* l_ERURH_epsKappaBound___closed__1;
static lean_object* l_ERURH_epsPhiBoundRat___closed__0;
LEAN_EXPORT lean_object* l_ERURH_epsKappaBoundRat;
LEAN_EXPORT lean_object* l_ERURH_cEnvelopeClosedExactRat;
LEAN_EXPORT lean_object* l_ERURH_epsKappaBound;
static lean_object* l_ERURH_cEnvelopeClosedExact___closed__2;
static lean_object* l_ERURH_cEnvelopeBase___closed__2;
static lean_object* l_ERURH_inflationFactorExactRat___closed__0;
lean_object* l_Nat_cast___at___Float_toRat0_spec__0(lean_object*);
static lean_object* l_ERURH_inflationFactorExactRat___closed__1;
LEAN_EXPORT lean_object* l_ERURH_s0Strict;
LEAN_EXPORT lean_object* l_ERURH_inflationFactorReported;
static lean_object* l_ERURH_cEnvelopeBase___closed__1;
LEAN_EXPORT lean_object* l_ERURH_inflationFactorExact;
static lean_object* l_ERURH_cEnvelopeBase___closed__0;
static lean_object* l_ERURH_epsLBoundRat___closed__1;
static lean_object* l_ERURH_s0StrictRat___closed__0;
static lean_object* l_ERURH_inflationFactorReported___closed__0;
static lean_object* l_ERURH_epsLBound___closed__0;
static lean_object* l_ERURH_epsLBound___closed__1;
static lean_object* l_ERURH_inflationFactorExact___closed__0;
LEAN_EXPORT lean_object* l_ERURH_inflationFactorReportedRat;
extern lean_object* l_ERURH_kappaLowFormal;
static lean_object* l_ERURH_epsKappaBoundRat___closed__0;
static lean_object* l_ERURH_cEnvelopeClosedExactRat___closed__1;
LEAN_EXPORT lean_object* l_ERURH_epsPhiBound;
extern lean_object* l_ERURH_kappaBookClosed;
LEAN_EXPORT lean_object* l_ERURH_cEnvelopeBase;
static lean_object* l_ERURH_epsPhiBound___closed__0;
static lean_object* l_ERURH_inflationFactorReportedRat___closed__1;
static lean_object* l_ERURH_s0StrictRat___closed__1;
static lean_object* l_ERURH_inflationFactorReported___closed__1;
static lean_object* l_ERURH_inflationFactorReported___closed__2;
lean_object* l_Rat_div(lean_object*, lean_object*);
static lean_object* l_ERURH_cEnvelopeClosedExact___closed__1;
static lean_object* l_ERURH_cEnvelopeClosedExactRat___closed__2;
LEAN_EXPORT lean_object* l_ERURH_inflationFactorExactRat;
extern lean_object* l_ERURH_lGlobalFormal;
LEAN_EXPORT lean_object* l_ERURH_epsPhiBoundRat;
LEAN_EXPORT lean_object* l_ERURH_s0StrictRat;
static lean_object* l_ERURH_epsKappaBoundRat___closed__1;
static lean_object* l_ERURH_s0Strict___closed__0;
static lean_object* l_ERURH_cEnvelopeClosedExact___closed__0;
LEAN_EXPORT lean_object* l_ERURH_epsLBound;
static lean_object* l_ERURH_epsLBound___closed__2;
extern lean_object* l_ERURH_kappaHighFormal;
static lean_object* l_ERURH_inflationFactorReportedRat___closed__0;
static lean_object* l_ERURH_epsLBoundRat___closed__0;
static lean_object* l_ERURH_epsKappaBound___closed__0;
static lean_object* l_ERURH_epsPhiBoundRat___closed__2;
static lean_object* _init_l_ERURH_s0Strict___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_cstr_to_nat("1000000000000000");
x_2 = lean_cstr_to_nat("14165510876065179");
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_s0Strict() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_s0Strict___closed__0;
return x_1;
}
}
static lean_object* _init_l_ERURH_s0StrictRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("14165510876065179");
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_s0StrictRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("1000000000000000");
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_s0StrictRat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_s0StrictRat___closed__1;
x_2 = l_ERURH_s0StrictRat___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_s0StrictRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_s0StrictRat___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBase___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("953912274983728430839167082038457085646415477851231961429785154422611923885916980000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBase___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("20226271460306719108031147710864580907931013026552735047300375463198569555737927637683771569520214636419811187384625348386663794123212733741237355261052179566548709569270021285472196617");
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBase___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_cEnvelopeBase___closed__1;
x_2 = l_ERURH_cEnvelopeBase___closed__0;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBase() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_cEnvelopeBase___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBaseRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_cEnvelopeBase___closed__0;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBaseRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_cEnvelopeBase___closed__1;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBaseRat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_cEnvelopeBaseRat___closed__1;
x_2 = l_ERURH_cEnvelopeBaseRat___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_cEnvelopeBaseRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_cEnvelopeBaseRat___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExact___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("47695613749186421541958354101922854282320773892561598071489257721130596194295849");
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExact___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("1000000000000000000000000000000000000000000000000000000000000000000000000000000000");
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExact___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_cEnvelopeClosedExact___closed__1;
x_2 = l_ERURH_cEnvelopeClosedExact___closed__0;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExact() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_cEnvelopeClosedExact___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExactRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_cEnvelopeClosedExact___closed__0;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExactRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_cEnvelopeClosedExact___closed__1;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExactRat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_cEnvelopeClosedExactRat___closed__1;
x_2 = l_ERURH_cEnvelopeClosedExactRat___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_cEnvelopeClosedExactRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_cEnvelopeClosedExactRat___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_epsPhiBound___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("20000000000000000000");
return x_1;
}
}
static lean_object* _init_l_ERURH_epsPhiBound___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_epsPhiBound___closed__0;
x_2 = lean_cstr_to_nat("111255980058196443");
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_epsPhiBound() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_epsPhiBound___closed__1;
return x_1;
}
}
static lean_object* _init_l_ERURH_epsPhiBoundRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_cstr_to_nat("111255980058196443");
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_epsPhiBoundRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_epsPhiBound___closed__0;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_epsPhiBoundRat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_epsPhiBoundRat___closed__1;
x_2 = l_ERURH_epsPhiBoundRat___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_epsPhiBoundRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_epsPhiBoundRat___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_epsLBound___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("41654961003773879753741175056097974374524870111097352030060763648105601078312837");
return x_1;
}
}
static lean_object* _init_l_ERURH_epsLBound___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("100000000000000000000000000000000000000000000000000000000000000000000000000000000000");
return x_1;
}
}
static lean_object* _init_l_ERURH_epsLBound___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_epsLBound___closed__1;
x_2 = l_ERURH_epsLBound___closed__0;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_epsLBound() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_epsLBound___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_epsLBoundRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_epsLBound___closed__0;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_epsLBoundRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_epsLBound___closed__1;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_epsLBoundRat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_epsLBoundRat___closed__1;
x_2 = l_ERURH_epsLBoundRat___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_epsLBoundRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_epsLBoundRat___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_epsKappaBound___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("53002031765866498085471694670766648110923926688795026729757526624435371004179887");
return x_1;
}
}
static lean_object* _init_l_ERURH_epsKappaBound___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("10000000000000000000000000000000000000000000000000000000000000000000000000000000000");
return x_1;
}
}
static lean_object* _init_l_ERURH_epsKappaBound___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_epsKappaBound___closed__1;
x_2 = l_ERURH_epsKappaBound___closed__0;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_epsKappaBound() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_epsKappaBound___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_epsKappaBoundRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_epsKappaBound___closed__0;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_epsKappaBoundRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_epsKappaBound___closed__1;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_epsKappaBoundRat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_epsKappaBoundRat___closed__1;
x_2 = l_ERURH_epsKappaBoundRat___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_epsKappaBoundRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_epsKappaBoundRat___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_inflationFactorExact___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
return x_1;
}
}
static lean_object* _init_l_ERURH_inflationFactorExact___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_inflationFactorExact___closed__0;
x_2 = l_ERURH_cEnvelopeBase___closed__1;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_inflationFactorExact() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_inflationFactorExact___closed__1;
return x_1;
}
}
static lean_object* _init_l_ERURH_inflationFactorExactRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_inflationFactorExact___closed__0;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_inflationFactorExactRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_inflationFactorExactRat___closed__0;
x_2 = l_ERURH_cEnvelopeBaseRat___closed__1;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_inflationFactorExactRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_inflationFactorExactRat___closed__1;
return x_1;
}
}
static lean_object* _init_l_ERURH_inflationFactorReported___closed__0() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("5056567865076679777007786927716145226982753256638183761825093865799642388934483");
return x_1;
}
}
static lean_object* _init_l_ERURH_inflationFactorReported___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_cstr_to_nat("5000000000000000000000000000000000000000000000000000000000000000000000000000000");
return x_1;
}
}
static lean_object* _init_l_ERURH_inflationFactorReported___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_inflationFactorReported___closed__1;
x_2 = l_ERURH_inflationFactorReported___closed__0;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_inflationFactorReported() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_inflationFactorReported___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_inflationFactorReportedRat___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_inflationFactorReported___closed__0;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_inflationFactorReportedRat___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_ERURH_inflationFactorReported___closed__1;
x_2 = l_Nat_cast___at___Float_toRat0_spec__0(x_1);
return x_2;
}
}
static lean_object* _init_l_ERURH_inflationFactorReportedRat___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_ERURH_inflationFactorReportedRat___closed__1;
x_2 = l_ERURH_inflationFactorReportedRat___closed__0;
x_3 = l_Rat_div(x_2, x_1);
return x_3;
}
}
static lean_object* _init_l_ERURH_inflationFactorReportedRat() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_inflationFactorReportedRat___closed__2;
return x_1;
}
}
static lean_object* _init_l_ERURH_certificateFromBundle___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_1 = l_ERURH_epsKappaBound;
x_2 = l_ERURH_epsLBound;
x_3 = l_ERURH_epsPhiBound;
x_4 = l_ERURH_cEnvelopeClosedExact;
x_5 = l_ERURH_cEnvelopeBase;
x_6 = l_ERURH_kappaBookClosed;
x_7 = l_ERURH_kappaHighFormal;
x_8 = l_ERURH_kappaLowFormal;
x_9 = l_ERURH_lAClosed;
x_10 = l_ERURH_lGlobalFormal;
x_11 = l_ERURH_s0Strict;
x_12 = lean_alloc_ctor(0, 11, 0);
lean_ctor_set(x_12, 0, x_11);
lean_ctor_set(x_12, 1, x_10);
lean_ctor_set(x_12, 2, x_9);
lean_ctor_set(x_12, 3, x_8);
lean_ctor_set(x_12, 4, x_7);
lean_ctor_set(x_12, 5, x_6);
lean_ctor_set(x_12, 6, x_5);
lean_ctor_set(x_12, 7, x_4);
lean_ctor_set(x_12, 8, x_3);
lean_ctor_set(x_12, 9, x_2);
lean_ctor_set(x_12, 10, x_1);
return x_12;
}
}
static lean_object* _init_l_ERURH_certificateFromBundle() {
_start:
{
lean_object* x_1; 
x_1 = l_ERURH_certificateFromBundle___closed__0;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Tactic_FieldSimp(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Tactic_NormNum(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_RationalBounds(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_Certificate(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_LemmaAContraction(uint8_t builtin, lean_object*);
lean_object* initialize_ERURH_LemmaBEnergy(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ERURH_CertificateValues(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Tactic_FieldSimp(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Tactic_NormNum(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_RationalBounds(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_Certificate(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_LemmaAContraction(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ERURH_LemmaBEnergy(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_ERURH_s0Strict___closed__0 = _init_l_ERURH_s0Strict___closed__0();
lean_mark_persistent(l_ERURH_s0Strict___closed__0);
l_ERURH_s0Strict = _init_l_ERURH_s0Strict();
lean_mark_persistent(l_ERURH_s0Strict);
l_ERURH_s0StrictRat___closed__0 = _init_l_ERURH_s0StrictRat___closed__0();
lean_mark_persistent(l_ERURH_s0StrictRat___closed__0);
l_ERURH_s0StrictRat___closed__1 = _init_l_ERURH_s0StrictRat___closed__1();
lean_mark_persistent(l_ERURH_s0StrictRat___closed__1);
l_ERURH_s0StrictRat___closed__2 = _init_l_ERURH_s0StrictRat___closed__2();
lean_mark_persistent(l_ERURH_s0StrictRat___closed__2);
l_ERURH_s0StrictRat = _init_l_ERURH_s0StrictRat();
lean_mark_persistent(l_ERURH_s0StrictRat);
l_ERURH_cEnvelopeBase___closed__0 = _init_l_ERURH_cEnvelopeBase___closed__0();
lean_mark_persistent(l_ERURH_cEnvelopeBase___closed__0);
l_ERURH_cEnvelopeBase___closed__1 = _init_l_ERURH_cEnvelopeBase___closed__1();
lean_mark_persistent(l_ERURH_cEnvelopeBase___closed__1);
l_ERURH_cEnvelopeBase___closed__2 = _init_l_ERURH_cEnvelopeBase___closed__2();
lean_mark_persistent(l_ERURH_cEnvelopeBase___closed__2);
l_ERURH_cEnvelopeBase = _init_l_ERURH_cEnvelopeBase();
lean_mark_persistent(l_ERURH_cEnvelopeBase);
l_ERURH_cEnvelopeBaseRat___closed__0 = _init_l_ERURH_cEnvelopeBaseRat___closed__0();
lean_mark_persistent(l_ERURH_cEnvelopeBaseRat___closed__0);
l_ERURH_cEnvelopeBaseRat___closed__1 = _init_l_ERURH_cEnvelopeBaseRat___closed__1();
lean_mark_persistent(l_ERURH_cEnvelopeBaseRat___closed__1);
l_ERURH_cEnvelopeBaseRat___closed__2 = _init_l_ERURH_cEnvelopeBaseRat___closed__2();
lean_mark_persistent(l_ERURH_cEnvelopeBaseRat___closed__2);
l_ERURH_cEnvelopeBaseRat = _init_l_ERURH_cEnvelopeBaseRat();
lean_mark_persistent(l_ERURH_cEnvelopeBaseRat);
l_ERURH_cEnvelopeClosedExact___closed__0 = _init_l_ERURH_cEnvelopeClosedExact___closed__0();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExact___closed__0);
l_ERURH_cEnvelopeClosedExact___closed__1 = _init_l_ERURH_cEnvelopeClosedExact___closed__1();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExact___closed__1);
l_ERURH_cEnvelopeClosedExact___closed__2 = _init_l_ERURH_cEnvelopeClosedExact___closed__2();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExact___closed__2);
l_ERURH_cEnvelopeClosedExact = _init_l_ERURH_cEnvelopeClosedExact();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExact);
l_ERURH_cEnvelopeClosedExactRat___closed__0 = _init_l_ERURH_cEnvelopeClosedExactRat___closed__0();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExactRat___closed__0);
l_ERURH_cEnvelopeClosedExactRat___closed__1 = _init_l_ERURH_cEnvelopeClosedExactRat___closed__1();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExactRat___closed__1);
l_ERURH_cEnvelopeClosedExactRat___closed__2 = _init_l_ERURH_cEnvelopeClosedExactRat___closed__2();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExactRat___closed__2);
l_ERURH_cEnvelopeClosedExactRat = _init_l_ERURH_cEnvelopeClosedExactRat();
lean_mark_persistent(l_ERURH_cEnvelopeClosedExactRat);
l_ERURH_epsPhiBound___closed__0 = _init_l_ERURH_epsPhiBound___closed__0();
lean_mark_persistent(l_ERURH_epsPhiBound___closed__0);
l_ERURH_epsPhiBound___closed__1 = _init_l_ERURH_epsPhiBound___closed__1();
lean_mark_persistent(l_ERURH_epsPhiBound___closed__1);
l_ERURH_epsPhiBound = _init_l_ERURH_epsPhiBound();
lean_mark_persistent(l_ERURH_epsPhiBound);
l_ERURH_epsPhiBoundRat___closed__0 = _init_l_ERURH_epsPhiBoundRat___closed__0();
lean_mark_persistent(l_ERURH_epsPhiBoundRat___closed__0);
l_ERURH_epsPhiBoundRat___closed__1 = _init_l_ERURH_epsPhiBoundRat___closed__1();
lean_mark_persistent(l_ERURH_epsPhiBoundRat___closed__1);
l_ERURH_epsPhiBoundRat___closed__2 = _init_l_ERURH_epsPhiBoundRat___closed__2();
lean_mark_persistent(l_ERURH_epsPhiBoundRat___closed__2);
l_ERURH_epsPhiBoundRat = _init_l_ERURH_epsPhiBoundRat();
lean_mark_persistent(l_ERURH_epsPhiBoundRat);
l_ERURH_epsLBound___closed__0 = _init_l_ERURH_epsLBound___closed__0();
lean_mark_persistent(l_ERURH_epsLBound___closed__0);
l_ERURH_epsLBound___closed__1 = _init_l_ERURH_epsLBound___closed__1();
lean_mark_persistent(l_ERURH_epsLBound___closed__1);
l_ERURH_epsLBound___closed__2 = _init_l_ERURH_epsLBound___closed__2();
lean_mark_persistent(l_ERURH_epsLBound___closed__2);
l_ERURH_epsLBound = _init_l_ERURH_epsLBound();
lean_mark_persistent(l_ERURH_epsLBound);
l_ERURH_epsLBoundRat___closed__0 = _init_l_ERURH_epsLBoundRat___closed__0();
lean_mark_persistent(l_ERURH_epsLBoundRat___closed__0);
l_ERURH_epsLBoundRat___closed__1 = _init_l_ERURH_epsLBoundRat___closed__1();
lean_mark_persistent(l_ERURH_epsLBoundRat___closed__1);
l_ERURH_epsLBoundRat___closed__2 = _init_l_ERURH_epsLBoundRat___closed__2();
lean_mark_persistent(l_ERURH_epsLBoundRat___closed__2);
l_ERURH_epsLBoundRat = _init_l_ERURH_epsLBoundRat();
lean_mark_persistent(l_ERURH_epsLBoundRat);
l_ERURH_epsKappaBound___closed__0 = _init_l_ERURH_epsKappaBound___closed__0();
lean_mark_persistent(l_ERURH_epsKappaBound___closed__0);
l_ERURH_epsKappaBound___closed__1 = _init_l_ERURH_epsKappaBound___closed__1();
lean_mark_persistent(l_ERURH_epsKappaBound___closed__1);
l_ERURH_epsKappaBound___closed__2 = _init_l_ERURH_epsKappaBound___closed__2();
lean_mark_persistent(l_ERURH_epsKappaBound___closed__2);
l_ERURH_epsKappaBound = _init_l_ERURH_epsKappaBound();
lean_mark_persistent(l_ERURH_epsKappaBound);
l_ERURH_epsKappaBoundRat___closed__0 = _init_l_ERURH_epsKappaBoundRat___closed__0();
lean_mark_persistent(l_ERURH_epsKappaBoundRat___closed__0);
l_ERURH_epsKappaBoundRat___closed__1 = _init_l_ERURH_epsKappaBoundRat___closed__1();
lean_mark_persistent(l_ERURH_epsKappaBoundRat___closed__1);
l_ERURH_epsKappaBoundRat___closed__2 = _init_l_ERURH_epsKappaBoundRat___closed__2();
lean_mark_persistent(l_ERURH_epsKappaBoundRat___closed__2);
l_ERURH_epsKappaBoundRat = _init_l_ERURH_epsKappaBoundRat();
lean_mark_persistent(l_ERURH_epsKappaBoundRat);
l_ERURH_inflationFactorExact___closed__0 = _init_l_ERURH_inflationFactorExact___closed__0();
lean_mark_persistent(l_ERURH_inflationFactorExact___closed__0);
l_ERURH_inflationFactorExact___closed__1 = _init_l_ERURH_inflationFactorExact___closed__1();
lean_mark_persistent(l_ERURH_inflationFactorExact___closed__1);
l_ERURH_inflationFactorExact = _init_l_ERURH_inflationFactorExact();
lean_mark_persistent(l_ERURH_inflationFactorExact);
l_ERURH_inflationFactorExactRat___closed__0 = _init_l_ERURH_inflationFactorExactRat___closed__0();
lean_mark_persistent(l_ERURH_inflationFactorExactRat___closed__0);
l_ERURH_inflationFactorExactRat___closed__1 = _init_l_ERURH_inflationFactorExactRat___closed__1();
lean_mark_persistent(l_ERURH_inflationFactorExactRat___closed__1);
l_ERURH_inflationFactorExactRat = _init_l_ERURH_inflationFactorExactRat();
lean_mark_persistent(l_ERURH_inflationFactorExactRat);
l_ERURH_inflationFactorReported___closed__0 = _init_l_ERURH_inflationFactorReported___closed__0();
lean_mark_persistent(l_ERURH_inflationFactorReported___closed__0);
l_ERURH_inflationFactorReported___closed__1 = _init_l_ERURH_inflationFactorReported___closed__1();
lean_mark_persistent(l_ERURH_inflationFactorReported___closed__1);
l_ERURH_inflationFactorReported___closed__2 = _init_l_ERURH_inflationFactorReported___closed__2();
lean_mark_persistent(l_ERURH_inflationFactorReported___closed__2);
l_ERURH_inflationFactorReported = _init_l_ERURH_inflationFactorReported();
lean_mark_persistent(l_ERURH_inflationFactorReported);
l_ERURH_inflationFactorReportedRat___closed__0 = _init_l_ERURH_inflationFactorReportedRat___closed__0();
lean_mark_persistent(l_ERURH_inflationFactorReportedRat___closed__0);
l_ERURH_inflationFactorReportedRat___closed__1 = _init_l_ERURH_inflationFactorReportedRat___closed__1();
lean_mark_persistent(l_ERURH_inflationFactorReportedRat___closed__1);
l_ERURH_inflationFactorReportedRat___closed__2 = _init_l_ERURH_inflationFactorReportedRat___closed__2();
lean_mark_persistent(l_ERURH_inflationFactorReportedRat___closed__2);
l_ERURH_inflationFactorReportedRat = _init_l_ERURH_inflationFactorReportedRat();
lean_mark_persistent(l_ERURH_inflationFactorReportedRat);
l_ERURH_certificateFromBundle___closed__0 = _init_l_ERURH_certificateFromBundle___closed__0();
lean_mark_persistent(l_ERURH_certificateFromBundle___closed__0);
l_ERURH_certificateFromBundle = _init_l_ERURH_certificateFromBundle();
lean_mark_persistent(l_ERURH_certificateFromBundle);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
