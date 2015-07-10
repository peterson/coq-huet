(*
 Minimal.v

 Minimal logic from Ch. 1 of "The Coq Proof Assistant - A Tutorial"
 by Huet et al, available at: https://coq.inria.fr/distrib/current/files/Tutorial.pdf

 Usage:

    Run this file in coqtop using the command:
    $  coqtop -lv Basic.v

    To exit the coqtop session, type "Quit." at the ">" prompt.
*)

(** 1.2 Minimal Logic **)

Section Minimal_Logic.

Variables A B C : Prop.
(*
Result:
A is assumed
B is assumed
C is assumed
*)

Check (A->B).
(*
Result:
A -> B
     : Prop
*)

(* A simple proof ... *)
Goal (A -> B -> C) -> (A -> B) -> A -> C.
(*
Result:
1 subgoal

  n : nat
  Pos_n : n > 0
  A : Prop
  B : Prop
  C : Prop
  ============================
   (A -> B -> C) -> (A -> B) -> A -> C
*)

intro H.
(*
Result:
1 subgoal

  A : Prop
  B : Prop
  C : Prop
  H : A -> B -> C
  ============================
   (A -> B) -> A -> C
*)

intros H' HA.
(*
Result:
1 subgoal

  A : Prop
  B : Prop
  C : Prop
  H : A -> B -> C
  H' : A -> B
  HA : A
  ============================
   C
*)

apply H.
(*
Result:
2 subgoals

  A : Prop
  B : Prop
  C : Prop
  H : A -> B -> C
  H' : A -> B
  HA : A
  ============================
   A

subgoal 2 is:
 B
*)

exact HA.
(*
Result:
1 subgoal

  A : Prop
  B : Prop
  C : Prop
  H : A -> B -> C
  H' : A -> B
  HA : A
  ============================
   B
*)

apply H'.
(*
Result:
1 subgoal

  A : Prop
  B : Prop
  C : Prop
  H : A -> B -> C
  H' : A -> B
  HA : A
  ============================
   A
*)

assumption.
(*
Result:
No more subgoals.
*)

Save trivial_lemma.
(*
Result:
trivial_lemma is defined
*)

Check trivial_lemma.
(*
Result:
trivial_lemma
     : (A -> B -> C) -> (A -> B) -> A -> C
*)


(** Re-doing the proof as a conjectured lemma **)

Lemma distr_impl : (A -> B -> C) -> (A -> B) -> A -> C.
(*
Result:
1 subgoal

  A : Prop
  B : Prop
  C : Prop
  ============================
   (A -> B -> C) -> (A -> B) -> A -> C
*)

intros.
(*
Result:
1 subgoal

  A : Prop
  B : Prop
  C : Prop
  H : A -> B -> C
  H0 : A -> B
  H1 : A
  ============================
   C
*)

apply H; [ assumption | apply H0; assumption ].
(*
Result:
No more subgoals.
*)

Save.
(*
Result:
intros.
apply H; [ assumption | apply H0; assumption ].

distr_impl is defined
*)


(** Re-do the proof using the automatic tactic 'auto' **)

Lemma distr_impl' : (A -> B -> C) -> (A -> B) -> A -> C.
(*
Result:
1 subgoal

  A : Prop
  B : Prop
  C : Prop
  ============================
   (A -> B -> C) -> (A -> B) -> A -> C

*)

auto.
(*
Result:
No more subgoals.
*)

Save.
(*
Result:
distr_impl' is defined
*)
