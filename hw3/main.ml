open Parse2

let cfg1 = (
  [N "E"; N "T"; N "F"],
  [T "+"; T "*"; T "("; T ")"; T "id"],
  N "E",
  [
    (N "E", [N "E"; T "+"; N "T"]);
    (N "E", [N "T"]);
    (N "T", [N "T"; T "*"; N "F"]);
    (N "T", [N "F"]);
    (N "F", [T "("; N "E"; T ")"]);
    (N "F", [T "id"])
  ])

let cfg2 = (
  [N "S"; N "L"; N "R"],
  [T "="; T ";"; T "id"; T "*"],
  N "S",
  [
    (N "S", [N "L"; T "="; N "R"; T ";"]);
    (N "S", [N "R"; T ";"]);
    (N "L", [T "id"]);
    (N "L", [T "*"; N "R"]);
    (N "R", [N "L"])
  ]
)

let cfg3 = (
  [N "S"; N "E"],
  [T "a"; T "b"; T "e"; T "i"; T "t"],
  N "S",
  [
   (N "S", [T "i"; N "E"; T "t"; N "S"; T "e"; N "S"]);
   (N "S", [T "i"; N "E"; T "t"; N "S"]);
   (N "S", [T "a"]);
   (N "E", [T "b"])
  ] 
)

let cfg4 = (
  [N "S"; N "E"],
  [T "a"; T "b"; T "e"; T "i"; T "t"; T "{"; T "}"],
  N "S",
  [
   (N "S", [T "i"; N "E"; T "t"; T "{"; N "S"; T "}"; T "e"; T "{"; N "S"; T "}"]);
   (N "S", [T "i"; N "E"; T "t"; T "{"; N "S"; T "}"]);
   (N "S", [T "a"]);
   (N "E", [T "b"])
  ] 
)

let s1 = [T "i"; T "b"; T "t"; T "a"; T "e"; T "{"; T "i"; T "b"; T "t"; T "a"; T "e"; T "a"; T "}"; End]
let s2 = [T "i"; T "b"; T "t"; T "{"; T "a"; T "}"; T "e"; T "{"; T "i"; T "b"; T "t"; T "{"; T "a"; T "}"; T "e"; T "{"; T "a"; T "}"; T "}"; End]

let cfgs = [cfg1; cfg2; cfg3; cfg4] (* true false false true *)
let main () =
  List.iter (fun cfg ->
    print_endline (string_of_bool (check_SLR cfg))
  ) cfgs;
  print_endline "";
  print_endline (string_of_bool (parse cfg4 s1)); (* false *)
  print_endline (string_of_bool (parse cfg4 s2)) (* true *)

let _ = main ()
