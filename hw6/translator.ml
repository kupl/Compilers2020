open Batteries

let translate : S.program -> T.program
=fun s -> [T.dummy_label, T.HALT] (* XXX *)
