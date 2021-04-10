
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | SENDTO
    | RIGHT_MIDBRACE
    | RIGHT_BRACE
    | LEFT_MIDBRACE
    | LEFT_BRACE
    | INTEGER of (
# 1 "src/smtRetparser.mly"
       (string)
# 16 "src/smtRetparser.ml"
  )
    | ID of (
# 2 "src/smtRetparser.mly"
       (string)
# 21 "src/smtRetparser.ml"
  )
    | EQ
    | EOF
    | ELSE
    | COMMA
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState36
  | MenhirState30
  | MenhirState27
  | MenhirState20
  | MenhirState17
  | MenhirState12
  | MenhirState7
  | MenhirState6
  | MenhirState5
  | MenhirState1

let rec _menhir_goto_separated_nonempty_list_COMMA_indexEle_ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((bytes * bytes) list list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : ((bytes * bytes) list list)) = _v in
        let _v : ((bytes * bytes) list list) = 
# 144 "<standard.mly>"
    ( x )
# 64 "src/smtRetparser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_indexEle__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : ((bytes * bytes) list list)) = _v in
        let (_menhir_stack, _menhir_s, (x : ((bytes * bytes) list))) = _menhir_stack in
        let _2 = () in
        let _v : ((bytes * bytes) list list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 76 "src/smtRetparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_indexEle_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_funRetEle_ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((bytes * bytes) list list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : ((bytes * bytes) list list)) = _v in
        let _v : ((bytes * bytes) list list) = 
# 144 "<standard.mly>"
    ( x )
# 92 "src/smtRetparser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : ((bytes * bytes) list list)) = _v in
        let _v : ((bytes * bytes) list) = let funLists = 
# 232 "<standard.mly>"
    ( xs )
# 100 "src/smtRetparser.ml"
         in
        
# 47 "src/smtRetparser.mly"
                                                 (let ()=print_endline "fls" in Core.Std.List.concat funLists )
# 105 "src/smtRetparser.ml"
         in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RIGHT_MIDBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EOF ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _, (fls : ((bytes * bytes) list))) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : (
# 13 "src/smtRetparser.mly"
       ((string * string) list)
# 127 "src/smtRetparser.ml"
                ) = 
# 35 "src/smtRetparser.mly"
                                                         (fls)
# 131 "src/smtRetparser.ml"
                 in
                _menhir_goto_smtModel _menhir_env _menhir_stack _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : ((bytes * bytes) list list)) = _v in
        let (_menhir_stack, _menhir_s, (x : ((bytes * bytes) list))) = _menhir_stack in
        let _2 = () in
        let _v : ((bytes * bytes) list list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 155 "src/smtRetparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_funRetEle_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_indexEle : _menhir_env -> 'ttv_tail -> _menhir_state -> ((bytes * bytes) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | INTEGER _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | LEFT_BRACE ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27)
    | RIGHT_MIDBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : ((bytes * bytes) list))) = _menhir_stack in
        let _v : ((bytes * bytes) list list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 189 "src/smtRetparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_indexEle_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_funRetEle : _menhir_env -> 'ttv_tail -> _menhir_state -> ((bytes * bytes) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
    | RIGHT_MIDBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : ((bytes * bytes) list))) = _menhir_stack in
        let _v : ((bytes * bytes) list list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 223 "src/smtRetparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_funRetEle_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_loption_separated_nonempty_list_COMMA_index__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (bytes list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RIGHT_BRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SENDTO ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
            | INTEGER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_COMMA_index_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (bytes list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (bytes list)) = _v in
        let _v : (bytes list) = 
# 144 "<standard.mly>"
    ( x )
# 286 "src/smtRetparser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_index__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (bytes list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (bytes))) = _menhir_stack in
        let _2 = () in
        let _v : (bytes list) = 
# 243 "<standard.mly>"
    ( x :: xs )
# 298 "src/smtRetparser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_index_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_eleVal : _menhir_env -> 'ttv_tail -> _menhir_state -> (bytes) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (rightVal : (bytes)) = _v in
        let ((_menhir_stack, _menhir_s), _, (xs : (bytes list))) = _menhir_stack in
        let _4 = () in
        let _3 = () in
        let _1 = () in
        let _v : ((bytes * bytes) list) = let indexes = 
# 232 "<standard.mly>"
    ( xs )
# 318 "src/smtRetparser.ml"
         in
        
# 57 "src/smtRetparser.mly"
 ([(Core.Std.String.concat ~sep:"" (Core.Std.List.map ~f:(fun x->"["^x^"]") indexes), rightVal) ])
# 323 "src/smtRetparser.ml"
         in
        _menhir_goto_indexEle _menhir_env _menhir_stack _menhir_s _v
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (bytes)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : ((bytes * bytes) list) = 
# 61 "src/smtRetparser.mly"
                       ([])
# 336 "src/smtRetparser.ml"
         in
        _menhir_goto_indexEle _menhir_env _menhir_stack _menhir_s _v
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (rightVal : (bytes)) = _v in
        let (_menhir_stack, _menhir_s, (indexStr : (bytes))) = _menhir_stack in
        let _2 = () in
        let _v : ((bytes * bytes) list) = 
# 59 "src/smtRetparser.mly"
                                          ([("["^indexStr^"]",rightVal)])
# 348 "src/smtRetparser.ml"
         in
        _menhir_goto_indexEle _menhir_env _menhir_stack _menhir_s _v
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (oneVal : (bytes)) = _v in
        let (_menhir_stack, _menhir_s, (varName : (
# 2 "src/smtRetparser.mly"
       (string)
# 358 "src/smtRetparser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : ((bytes * bytes) list) = 
# 44 "src/smtRetparser.mly"
                                   ([(varName,oneVal)])
# 364 "src/smtRetparser.ml"
         in
        _menhir_goto_funRetEle _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_COMMA_indexEle__ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((bytes * bytes) list list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (xs : ((bytes * bytes) list list)) = _v in
    let _v : ((bytes * bytes) list) = let retvals0 = 
# 232 "<standard.mly>"
    ( xs )
# 378 "src/smtRetparser.ml"
     in
    
# 50 "src/smtRetparser.mly"
                                              ( Core.Std.List.concat retvals0 )
# 383 "src/smtRetparser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RIGHT_MIDBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (varName : (
# 2 "src/smtRetparser.mly"
       (string)
# 397 "src/smtRetparser.ml"
        ))), _), _, (vals : ((bytes * bytes) list))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _2 = () in
        let _v : ((bytes * bytes) list) = 
# 40 "src/smtRetparser.mly"
   (let keyFun e=((Core.Std.String.concat ~sep:"" [varName;  fst e]),  snd e) in
			 let keys=Core.Std.List.map ~f:keyFun vals in
						keys)
# 407 "src/smtRetparser.ml"
         in
        _menhir_goto_funRetEle _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INTEGER _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | RIGHT_BRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState7 in
        let _v : (bytes list) = 
# 142 "<standard.mly>"
    ( [] )
# 431 "src/smtRetparser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_index__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 1 "src/smtRetparser.mly"
       (string)
# 442 "src/smtRetparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (intVal : (
# 1 "src/smtRetparser.mly"
       (string)
# 450 "src/smtRetparser.ml"
    )) = _v in
    let _v : (bytes) = 
# 64 "src/smtRetparser.mly"
                 ( intVal)
# 455 "src/smtRetparser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INTEGER _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
        | RIGHT_BRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (bytes))) = _menhir_stack in
            let _v : (bytes list) = 
# 241 "<standard.mly>"
    ( [ x ] )
# 481 "src/smtRetparser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_index_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState6 | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SENDTO ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | INTEGER _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SENDTO ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | INTEGER _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 1 "src/smtRetparser.mly"
       (string)
# 546 "src/smtRetparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (intVal : (
# 1 "src/smtRetparser.mly"
       (string)
# 554 "src/smtRetparser.ml"
    )) = _v in
    let _v : (bytes) = 
# 68 "src/smtRetparser.mly"
                 (intVal)
# 559 "src/smtRetparser.ml"
     in
    _menhir_goto_eleVal _menhir_env _menhir_stack _menhir_s _v

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 2 "src/smtRetparser.mly"
       (string)
# 566 "src/smtRetparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (enumVal : (
# 2 "src/smtRetparser.mly"
       (string)
# 574 "src/smtRetparser.ml"
    )) = _v in
    let _v : (bytes) = 
# 69 "src/smtRetparser.mly"
             (enumVal)
# 579 "src/smtRetparser.ml"
     in
    _menhir_goto_eleVal _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_goto_smtModel : _menhir_env -> 'ttv_tail -> (
# 13 "src/smtRetparser.mly"
       ((string * string) list)
# 629 "src/smtRetparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 13 "src/smtRetparser.mly"
       ((string * string) list)
# 637 "src/smtRetparser.ml"
    )) = _v in
    Obj.magic _1

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 2 "src/smtRetparser.mly"
       (string)
# 644 "src/smtRetparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | INTEGER _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | LEFT_MIDBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState5 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ELSE ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | INTEGER _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | LEFT_BRACE ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | RIGHT_MIDBRACE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState6 in
                let _v : ((bytes * bytes) list list) = 
# 142 "<standard.mly>"
    ( [] )
# 679 "src/smtRetparser.ml"
                 in
                _menhir_goto_loption_separated_nonempty_list_COMMA_indexEle__ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and smtModel : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 13 "src/smtRetparser.mly"
       ((string * string) list)
# 712 "src/smtRetparser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LEFT_MIDBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | RIGHT_MIDBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState1 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EOF ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _) = _menhir_stack in
                let _3 = () in
                let _2 = () in
                let _1 = () in
                let _v : (
# 13 "src/smtRetparser.mly"
       ((string * string) list)
# 750 "src/smtRetparser.ml"
                ) = 
# 36 "src/smtRetparser.mly"
                                      ([])
# 754 "src/smtRetparser.ml"
                 in
                _menhir_goto_smtModel _menhir_env _menhir_stack _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)

# 269 "<standard.mly>"
  

# 776 "src/smtRetparser.ml"
