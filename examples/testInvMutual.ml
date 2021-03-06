
open Core.Std
open Utils
open Paramecium
open Loach
open Formula
open InvFinder
open Cmdline
open CheckInv
 
let _I = strc "I"
let _T = strc "T"
let _C = strc "C"
let _E = strc "E"
let _True = boolc true
let _False = boolc false

let types = [
  enum "state" [_I; _T; _C; _E];
  enum "client" (int_consts [1;2]);
  enum "boolean" [_True; _False];
]


	
let n_test1 =
  let name = "n_test1" in
  let params = [] in
  let formula = (imply (eqn (var (arr [("n_a", [paramfix "i" "client" (Intc 1)])])) (const _C)) 
  (neg (eqn (var (arr [("n_a", [paramfix "j" "client" (Intc 2)])])) (const _C)))) in
  prop name params formula
  
(*let n_test1 =
  let name = "n_test1" in
  let params = [] in
  let formula = (imply (eqn (var (arr [("n", [paramfix "i" "client" (Intc 1)])])) (const _C)) 
  (neg (eqn (var (arr [("n", [paramfix "j" "client" (Intc 2)])])) (const _C)))) in
  prop name params formula  *)

let properties = [  n_test1]
	
	
let prog ()=	
	let localhost="192.168.1.37" in
  let a=CheckInv.startServer ~murphi:(In_channel.read_all "a_mutualEx.m")
    ~smv:(In_channel.read_all "mutualEx.smv") "a_mutualEx"  "mutualEx.smv" 
    localhost localhost in
  let b=CheckInv.checkProps types  properties in
  ()
  
let ()= run_with_cmdline  prog
    
