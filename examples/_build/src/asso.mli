(** Check a formula with Association rule solver
*)

exception Protocol_name_not_set

val set_context : string -> string -> bool

(** Judge if a given formula is satisfiable

    @param quiet true (default) to prevent to print output of smt solver to screen
    @param f the formula to be judged
    @return true if is satisfiable else false
*)
val is_satisfiable : ?quiet:bool -> string -> bool

val chkWithCe : string -> (string , Paramecium.var ) Core_kernel.Core_hashtbl.t -> (bool * (Paramecium.formula list) option)
