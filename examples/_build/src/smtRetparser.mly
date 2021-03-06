%token <string> INTEGER
%token <string> ID 
%token  LEFT_MIDBRACE
%token RIGHT_MIDBRACE
%token EQ
%token COMMA
%token SENDTO
%token LEFT_BRACE
%token RIGHT_BRACE
%token ELSE 
%token EOF

%start <(string * string) list> smtModel
%%


(* part 1 
ruleset i:client; j: client do
invariant "coherence"
  i != j -> (n[i] = C -> n[j] != C);
endruleset;
ex1:[s2 = [(1, 2) -> 4, (0, 0) -> 3, else -> 1236],
 s3 = [(1, 2) -> 8859, (0, 0) -> 8, else -> 8955],
 s1 = [(1, 2) -> 8855, (0, 0) -> 5, else -> 7719],
 k!5 = [(1, 2) -> 8859, (0, 0) -> 8, else -> 8955],
 k!3 = [(1, 2) -> 8855, (0, 0) -> 5, else -> 7719],
 k!4 = [(1, 2) -> 4, (0, 0) -> 3, else -> 1236]]

ex2:
[x = False,
 n = [2 -> T, 3 -> T, else -> T],
 k!14 = [2 -> T, 3 -> T, else -> T]]
*)

smtModel: LEFT_MIDBRACE; fls=funList; RIGHT_MIDBRACE;EOF {fls}
	|LEFT_MIDBRACE;  RIGHT_MIDBRACE;EOF  {[]}

funRetEle:
		| varName=ID; EQ; LEFT_MIDBRACE;   vals=retVals; RIGHT_MIDBRACE 
			{let keyFun e=((Core.Std.String.concat ~sep:"" [varName;  fst e]),  snd e) in
			 let keys=Core.Std.List.map ~f:keyFun vals in
						keys}

	  | varName=ID; EQ; oneVal=eleVal {[(varName,oneVal)]}

funList:  
  funLists = separated_list(COMMA, funRetEle)    {let ()=print_endline "fls" in Core.Std.List.concat funLists } ; 

retVals:
	retvals0= separated_list(COMMA, indexEle)    { Core.Std.List.concat retvals0 };

(*funRetEle:
	EFT_MIDBRACE; indexele=indexEle; RIGHT_MIDBRACE {indexele}	*)

indexEle:
	|LEFT_BRACE ; indexes=separated_list(COMMA,index); RIGHT_BRACE; SENDTO; rightVal=eleVal 
	{[(Core.Std.String.concat ~sep:"" (Core.Std.List.map ~f:(fun x->"["^x^"]") indexes), rightVal) ]}

	|indexStr=index; SENDTO; rightVal=eleVal {[("["^indexStr^"]",rightVal)]}

	|ELSE; SENDTO; eleVal {[]}

index:
	|intVal=INTEGER { intVal} 


eleVal:
	|intVal=INTEGER {intVal}
	|enumVal=ID {enumVal}

			
	
