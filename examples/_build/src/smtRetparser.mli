
(* The type of tokens. *)

type token = 
  | SENDTO
  | RIGHT_MIDBRACE
  | RIGHT_BRACE
  | LEFT_MIDBRACE
  | LEFT_BRACE
  | INTEGER of (string)
  | ID of (string)
  | EQ
  | EOF
  | ELSE
  | COMMA

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val smtModel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((string * string) list)
