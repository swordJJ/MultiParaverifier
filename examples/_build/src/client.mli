(** Client for connect to smv/smt2 server
*)

exception Server_exception
val symmetry_method_switch:bool ref
val type_defs: Paramecium.typedef list ref

val initVardefTbl:Paramecium.vardef list -> unit
module Smv : sig
  exception Cannot_check
  val host : UnixLabels.inet_addr ref
  val port : int ref
  val compute_reachable : ?smv_ord:string -> string -> string -> bool
  val query_reachable : string -> int
  val check_inv : string -> string -> bool
  val quit : string -> bool
end

module SmvBMC : sig
  exception Cannot_check
  val host : UnixLabels.inet_addr ref
  val port : int ref
  val go_bmc : string -> string -> bool
  val check_inv : string -> string -> bool
  val quit : string -> bool
end

module Murphi : sig
  val host : UnixLabels.inet_addr ref
  val port : int ref
  val set_context : string -> string -> bool
  val check_inv : string -> string -> bool
end

(* module Smt2 : sig
  val host : UnixLabels.inet_addr ref
  val port : int ref
  val set_context : string -> string -> bool
  val check : string -> string -> bool
  val check_stand : string -> string -> bool
end *)

module Asso : sig
  val host : UnixLabels.inet_addr ref
  val port : int ref
  val set_context : string -> string -> bool
end

module Decision : sig
  val host : UnixLabels.inet_addr ref
  val port : int ref
  val set_context : string -> string -> bool
  val check_inv : string -> string -> bool
end


module Smt2 : sig
  val host : UnixLabels.inet_addr ref
  val port : int ref
  val set_context : string -> string -> bool
  val check : string -> string -> bool
  val check_stand : string -> string -> bool
	val check_allce :string -> string -> ((string , Paramecium.var ) Core_kernel.Core_hashtbl.t)  -> (bool*Paramecium.formula list option) (* name f varName2Vars*)
end


