(* The Star Seller exercise in algorithmics,
   written in OCaML.                        [14 lines of code]
 *)

(* OCaML is a functional programming language, sure, but it's not pure.
   Coming from Haskell, type safety is cumbersome (you need to tie it into your
   function definition, instead of its own line) and what type there is is
   awkward (No type classes or traits means a different operator for ints and
   floats).

   I'm sure it has its advantages -- I mean, there's a reason why it is the
   preferred language for Mirage OS -- but it just leaves a bitter aftertaste
   as a Haskeller...
*)

let putStars n = Array.fold_left (^) "" (Array.make n "*") ;;

(* Infix operators are defined the same as in Haskell *)
let (<=>) x (a,b) = x >= a && x <= b;;

(* In order to be applicative (lazy), a definition needs at least one argument.
   Functions that do not take arguments in OCaML usually take a 'unit', or null
   typed value. *)
let rec askStars () =   (* OCaML functions aren't recursive by default *)
                let _ = Printf.printf "%s" "How many stars do you want? " in
                let result = int_of_string (read_line ()) in
                match result with
                | x when x <=> (0,200) -> x
                | _ -> askStars ();;


(* OCaML is imperative, meaning evaluation and execution follow the same flow,
   discarding the need for a 'main' function, which Haskell requires. *)

Printf.printf "%s" "What is your name? ";;
let name = read_line ();;

Printf.printf "Hello, %s!\n" name;;
let stars = askStars ();;

Printf.printf "%s\n" (putStars stars);;
Printf.printf "Goodbye, %s\n" name;;

(* This language is case-sensitive. *)
