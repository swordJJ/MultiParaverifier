(** Check a formula with SMT solver
*)

open Utils

open Core.Std

(** Raises when there is an error in the formula to be judged *)
exception Protocol_name_not_set

let protocol_name = ref ""

let table = Hashtbl.create ~hashable:String.hashable ()

let set_context name context =
  protocol_name := name;
  Client.Smt2.set_context name context

(** Judge if a given formula is satisfiable

    @param quiet true (default) to prevent to print output of smt solver to screen
    @param f the formula to be judged
    @return true if is satisfiable else false
*)
let is_satisfiable ?(quiet=true) f =
  match Hashtbl.find table f with
  | Some(r) ->   fst r
  | None -> 
    if (!protocol_name) = "" then raise Protocol_name_not_set
    else begin
    	(*let ()=print_endline ("enter smt satisfiable"^f) in *)
      let r = Client.Smt2.check (!protocol_name) f in
     (* Hashtbl.replace table ~key:f ~data:(r,None);*) (  r)
    end

let chkWithCe f vn2Vstr =
	match Hashtbl.find table f with
  | Some(r) -> let ()=print_endline "find some" in r
  | None -> 
    if (!protocol_name) = "" then let ()=print_endline "protocol_name_not_set" in raise Protocol_name_not_set
    else begin
    	let ()=print_endline ("set"^f) in 
      let r = Client.Smt2.check_allce (!protocol_name) f vn2Vstr  in
			let ()=print_endline "Client.Smt2 finished" in
      (*Hashtbl.replace table ~key:f ~data:r; r*)
			 
			Hashtbl.replace table ~key:f ~data:r; r
		end

