(* Coupling + Sqrt replacements for dlambda4A1, including A3--A3
   insertions dLambda4Ag2..l2.  Apply as:
     dlambda4A1 = dlambda4A /. paraRepl4 /. couplingRepl4A /. sqrtRepl4A
   New QF labels start at 41 (after qqA QF40).                               *)

couplingRepl4A = {
  (* dLambda4Aa *)
  lambdacca[-p1 - q, q, p1] -> lambdaccaQF1,
  lambdacca[-q, -p2 + q, p2] -> lambdaccaQF2,
  lambdacca[p2 - q, p1 + p4 + q, p3] -> lambdaccaQF3,
  lambdacca[-p1 - p4 - q, p1 + q, p4] -> lambdaccaQF4,
  (* dLambda4Ab *)
  lambdacca[p2 - q, p1 + p3 + q, p4] -> lambdaccaQF5,
  lambdacca[-p1 - p3 - q, p1 + q, p3] -> lambdaccaQF6,
  (* dLambda4Ac *)
  lambdacca[-q, -p3 + q, p3] -> lambdaccaQF7,
  lambdacca[p3 - q, p1 + p4 + q, p2] -> lambdaccaQF8,
  (* dLambda4Ad *)
  lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4aQF9,
  lambda4a[p3, p4, q, p1 + p2 - q] -> lambda4aQF10,
  (* dLambda4Ae *)
  lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4aQF11,
  lambda4a[p2, p4, q, p1 + p3 - q] -> lambda4aQF12,
  (* dLambda4Af *)
  lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4aQF13,
  lambda4a[p2, p3, q, p1 + p4 - q] -> lambda4aQF14,
  (* dLambda4Ag1 *)
  lambda3a[p3, -p3 - q, q] -> lambda3aQF15,
  lambda3a[p4, p1 + p2 - q, p3 + q] -> lambda3aQF16,
  (* dLambda4Ah1 *)
  lambda3a[p2, -p2 - q, q] -> lambda3aQF17,
  lambda3a[p4, p1 + p3 - q, p2 + q] -> lambda3aQF18,
  (* dLambda4Ai1 *)
  lambda3a[p3, p1 + p4 - q, p2 + q] -> lambda3aQF19,
  (* dLambda4Aj1 *)
  lambda4a[p2, p3, -q, -p2 - p3 + q] -> lambda4aQF20,
  lambda3a[p1, -p1 - q, q] -> lambda3aQF21,
  lambda3a[p4, p2 + p3 - q, p1 + q] -> lambda3aQF22,
  (* dLambda4Ak1 *)
  lambda4a[p2, p4, -q, -p2 - p4 + q] -> lambda4aQF23,
  lambda3a[p3, p2 + p4 - q, p1 + q] -> lambda3aQF24,
  (* dLambda4Al1 *)
  lambda4a[p3, p4, -q, -p3 - p4 + q] -> lambda4aQF25,
  lambda3a[p2, p3 + p4 - q, p1 + q] -> lambda3aQF26,
  (* dLambda4Am *)
  lambda3a[p1, -q, -p1 + q] -> lambda3aQF27,
  lambda3a[p3, -p2 - p3 - q, p2 + q] -> lambda3aQF28,
  lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3aQF29,
  (* dLambda4An *)
  lambda3a[p4, -p2 - p4 - q, p2 + q] -> lambda3aQF30,
  lambda3a[p3, p1 - q, p2 + p4 + q] -> lambda3aQF31,
  (* dLambda4Ao *)
  lambda3a[p2, -p2 - p3 - q, p3 + q] -> lambda3aQF32,
  (* ----- A3--A3 insertions (*2): new kinematic points ----- *)
  (* dLambda4Ag2 *)
  lambda4a[p1, p2, p3 - q, p4 + q] -> lambda4aQF41,
  lambda3a[p3, -q, q - p3] -> lambda3aQF47,
  lambda3a[p4, -p4 - q, q] -> lambda3aQF49,
  (* dLambda4Ah2 *)
  lambda4a[p1, p3, p2 - q, p4 + q] -> lambda4aQF42,
  lambda3a[p2, -q, q - p2] -> lambda3aQF48,
  (* dLambda4Ai2 *)
  lambda4a[p1, p4, p2 - q, p3 + q] -> lambda4aQF43,
  (* lambda3a[p3, -p3 - q, q] already -> QF15 *)
  (* dLambda4Aj2 *)
  lambda4a[p2, p3, p1 - q, p4 + q] -> lambda4aQF44,
  (* lambda3a[p1, -q, q - p1] == lambda3a[p1, -q, -p1 + q] -> QF27 *)
  lambda3a[p1, -q, q - p1] -> lambda3aQF27,
  (* dLambda4Ak2 *)
  lambda4a[p2, p4, p1 - q, p3 + q] -> lambda4aQF45,
  (* dLambda4Al2 *)
  lambda4a[p3, p4, p1 - q, p2 + q] -> lambda4aQF46,
  (* dLambda4Ap *)
  lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF33,
  lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF33,
  lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF33,
  lambdaqqa1[-q, -p2 + q, p2] -> lambdaqqa1QF34,
  lambdaqqa4[-q, -p2 + q, p2] -> lambdaqqa4QF34,
  lambdaqqa7[-q, -p2 + q, p2] -> lambdaqqa7QF34,
  lambdaqqa1[p2 - q, p1 + p4 + q, p3] -> lambdaqqa1QF35,
  lambdaqqa4[p2 - q, p1 + p4 + q, p3] -> lambdaqqa4QF35,
  lambdaqqa7[p2 - q, p1 + p4 + q, p3] -> lambdaqqa7QF35,
  lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa1QF36,
  lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa4QF36,
  lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa7QF36,
  (* dLambda4Aq *)
  lambdaqqa1[p2 - q, p1 + p3 + q, p4] -> lambdaqqa1QF37,
  lambdaqqa4[p2 - q, p1 + p3 + q, p4] -> lambdaqqa4QF37,
  lambdaqqa7[p2 - q, p1 + p3 + q, p4] -> lambdaqqa7QF37,
  lambdaqqa1[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa1QF38,
  lambdaqqa4[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa4QF38,
  lambdaqqa7[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa7QF38,
  (* dLambda4Ar *)
  lambdaqqa1[-q, -p3 + q, p3] -> lambdaqqa1QF39,
  lambdaqqa4[-q, -p3 + q, p3] -> lambdaqqa4QF39,
  lambdaqqa7[-q, -p3 + q, p3] -> lambdaqqa7QF39,
  lambdaqqa1[p3 - q, p1 + p4 + q, p2] -> lambdaqqa1QF40,
  lambdaqqa4[p3 - q, p1 + p4 + q, p2] -> lambdaqqa4QF40,
  lambdaqqa7[p3 - q, p1 + p4 + q, p2] -> lambdaqqa7QF40
};

sqrtRepl4A = {
  lambda4aQF9 -> Sqrt[lambda4aQF9^(2)],
  lambda4aQF10 -> Sqrt[lambda4aQF10^(2)],
  lambda4aQF11 -> Sqrt[lambda4aQF11^(2)],
  lambda4aQF12 -> Sqrt[lambda4aQF12^(2)],
  lambda4aQF13 -> Sqrt[lambda4aQF13^(2)],
  lambda4aQF14 -> Sqrt[lambda4aQF14^(2)],
  lambda3aQF15 -> Sqrt[lambda3aQF15^(2)],
  lambda3aQF16 -> Sqrt[lambda3aQF16^(2)],
  lambda3aQF17 -> Sqrt[lambda3aQF17^(2)],
  lambda3aQF18 -> Sqrt[lambda3aQF18^(2)],
  lambda3aQF19 -> Sqrt[lambda3aQF19^(2)],
  lambda4aQF20 -> Sqrt[lambda4aQF20^(2)],
  lambda3aQF21 -> Sqrt[lambda3aQF21^(2)],
  lambda3aQF22 -> Sqrt[lambda3aQF22^(2)],
  lambda4aQF23 -> Sqrt[lambda4aQF23^(2)],
  lambda3aQF24 -> Sqrt[lambda3aQF24^(2)],
  lambda4aQF25 -> Sqrt[lambda4aQF25^(2)],
  lambda3aQF26 -> Sqrt[lambda3aQF26^(2)],
  lambda3aQF27 -> Sqrt[lambda3aQF27^(2)],
  lambda3aQF28 -> Sqrt[lambda3aQF28^(2)],
  lambda3aQF29 -> Sqrt[lambda3aQF29^(2)],
  lambda3aQF30 -> Sqrt[lambda3aQF30^(2)],
  lambda3aQF31 -> Sqrt[lambda3aQF31^(2)],
  lambda3aQF32 -> Sqrt[lambda3aQF32^(2)],
  (* *2 new *)
  lambda4aQF41 -> Sqrt[lambda4aQF41^(2)],
  lambda4aQF42 -> Sqrt[lambda4aQF42^(2)],
  lambda4aQF43 -> Sqrt[lambda4aQF43^(2)],
  lambda4aQF44 -> Sqrt[lambda4aQF44^(2)],
  lambda4aQF45 -> Sqrt[lambda4aQF45^(2)],
  lambda4aQF46 -> Sqrt[lambda4aQF46^(2)],
  lambda3aQF47 -> Sqrt[lambda3aQF47^(2)],
  lambda3aQF48 -> Sqrt[lambda3aQF48^(2)],
  lambda3aQF49 -> Sqrt[lambda3aQF49^(2)]
};

(* Extra paraRepl4 entries needed for *2 momenta (merge into paraRepl4): *)
paraRepl4A3A3extra = {
  ZA[p1 - q] -> ZAxPp1Mq4, RA[p1 - q] -> RAxPp1Mq4,
  ZA[p2 - q] -> ZAxPp2Mq4, RA[p2 - q] -> RAxPp2Mq4,
  ZA[p3 - q] -> ZAxPp3Mq4, RA[p3 - q] -> RAxPp3Mq4,
  ZA[p2 + q] -> ZAxPp2Pq4, RA[p2 + q] -> RAxPp2Pq4,
  ZA[p3 + q] -> ZAxPp3Pq4, RA[p3 + q] -> RAxPp3Pq4, (* often already present *)
  ZA[p4 + q] -> ZAxPp4Pq4, RA[p4 + q] -> RAxPp4Pq4
};

(* Usage:
dlambda4A1 = dlambda4A /. Join[paraRepl4, paraRepl4A3A3extra] /.
  couplingRepl4A /. sqrtRepl4A;
*)
