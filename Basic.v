(*
 Basic.v

 Basic predicate calculus from Ch. 1 of "The Coq Proof Assistant - A Tutorial"
 by Huet et al, available at: https://coq.inria.fr/distrib/current/files/Tutorial.pdf

 Usage:

    Run this file in coqtop using the command:
    $  coqtop -lv Basic.v

    To exit the coqtop session, type "Quit." at the ">" prompt.
*)

(** 1.1.1 Declarations **)

Check 0.
(*
Result:

0
     : nat
*)

Check nat.
(*
Result:

nat
     : Set
*)

Section Declaration.
Variable n : nat.
Hypothesis Pos_n : (gt n 0).

Check gt.
(*
Result:

gt
     : nat -> nat -> Prop
*)


Check (nat -> Prop).
(*
Result:

nat -> Prop
     : Type
*)

Check gt n 0.
(*
Result:

n > 0
     : Prop
*)


(** 1.1.2 Definitions **)

Definition one := (S 0).
(*
Result:

one is defined
*)

(* Optionally indicating the required type, ': nat' *)
Definition two : nat := S one.
(*
Result:

two is defined
*)

(* Defining a function, 'double' *)
Definition double (m:nat) := plus m m.
(*
Result:

double is defined
*)

Definition add_n (m:nat) := plus m n.
(*
Result:

add_n is defined
*)

(* Check quantification. Here we universally quantify a proposition
   m > 0 to get a universal proposition ∀m.m > 0 ...  *)
Check (forall m:nat, gt m 0).
(*
Result:

forall m : nat, m > 0
     : Prop
*)



(* Use the below command in interactive-mode only! *)
(* Reset Declaration. *)
