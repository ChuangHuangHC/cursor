(* dlambda4A1: replace every vertex momentum combo by QFn of its
   central momentum  kbar = Sqrt[Mean[k_i^2]]  at
     p1={p,0,0,0}, p2={0,p,0,0}, p3={-p,0,0,0}, p4={0,-p,0,0}.
   Same kbar -> same QFn (17 values). Head keeps the vertex type.
   Sqrt[x^2] only on lambda4a / lambda3a (tree vertices with a sign). *)

dlambda4A1 = dlambda4A /. paraRepl4 /. {
     (*dLambda4Aa*)
     lambdacca[-p1 - q, q, p1] -> lambdaccaQF1,
     lambdacca[-q, -p2 + q, p2] -> lambdaccaQF2,
     lambdacca[p2 - q, p1 + p4 + q, p3] -> lambdaccaQF3,
     lambdacca[-p1 - p4 - q, p1 + q, p4] -> lambdaccaQF4,
     (*dLambda4Ab*)
     lambdacca[-p1 - q, q, p1] -> lambdaccaQF1,
     lambdacca[-q, -p2 + q, p2] -> lambdaccaQF2,
     lambdacca[p2 - q, p1 + p3 + q, p4] -> lambdaccaQF2,
     lambdacca[-p1 - p3 - q, p1 + q, p3] -> lambdaccaQF1,
     (*dLambda4Ac*)
     lambdacca[-p1 - q, q, p1] -> lambdaccaQF1,
     lambdacca[-q, -p3 + q, p3] -> lambdaccaQF1,
     lambdacca[p3 - q, p1 + p4 + q, p2] -> lambdaccaQF4,
     lambdacca[-p1 - p4 - q, p1 + q, p4] -> lambdaccaQF4,
     (*dLambda4Ad*)
     lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4aQF5,
     lambda4a[p3, p4, q, p1 + p2 - q] -> lambda4aQF5,
     (*dLambda4Ae*)
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4aQF6,
     lambda4a[p2, p4, q, p1 + p3 - q] -> lambda4aQF6,
     (*dLambda4Af*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4aQF7,
     lambda4a[p2, p3, q, p1 + p4 - q] -> lambda4aQF7,
     (*dLambda4Ag / dLambda4Ag1*)
     lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4aQF5,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF8,
     lambda3a[p4, p1 + p2 - q, p3 + q] -> lambda3aQF9,
     (*dLambda4Ag2*)
     lambda4a[p1, p2, p3 - q, p4 + q] -> lambda4aQF10,
     lambda3a[p3, -q, q - p3] -> lambda3aQF1,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF2,
     (*dLambda4Ah / dLambda4Ah1*)
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4aQF6,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF11,
     lambda3a[p4, p1 + p3 - q, p2 + q] -> lambda3aQF11,
     (*dLambda4Ah2*)
     lambda4a[p1, p3, p2 - q, p4 + q] -> lambda4aQF12,
     lambda3a[p2, -q, q - p2] -> lambda3aQF2,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF2,
     (*dLambda4Ai / dLambda4Ai1*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4aQF7,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF11,
     lambda3a[p3, p1 + p4 - q, p2 + q] -> lambda3aQF13,
     (*dLambda4Ai2*)
     lambda4a[p1, p4, p2 - q, p3 + q] -> lambda4aQF5,
     lambda3a[p2, -q, q - p2] -> lambda3aQF2,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF8,
     (*dLambda4Aj / dLambda4Aj1*)
     lambda4a[p2, p3, -q, -p2 - p3 + q] -> lambda4aQF10,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF1,
     lambda3a[p4, p2 + p3 - q, p1 + q] -> lambda3aQF4,
     (*dLambda4Aj2*)
     lambda4a[p2, p3, p1 - q, p4 + q] -> lambda4aQF5,
     lambda3a[p1, -q, q - p1] -> lambda3aQF8,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF2,
     (*dLambda4Ak / dLambda4Ak1*)
     lambda4a[p2, p4, -q, -p2 - p4 + q] -> lambda4aQF6,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF1,
     lambda3a[p3, p2 + p4 - q, p1 + q] -> lambda3aQF1,
     (*dLambda4Ak2*)
     lambda4a[p2, p4, p1 - q, p3 + q] -> lambda4aQF14,
     lambda3a[p1, -q, q - p1] -> lambda3aQF8,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF8,
     (*dLambda4Al / dLambda4Al1*)
     lambda4a[p3, p4, -q, -p3 - p4 + q] -> lambda4aQF15,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF1,
     lambda3a[p2, p3 + p4 - q, p1 + q] -> lambda3aQF16,
     (*dLambda4Al2*)
     lambda4a[p3, p4, p1 - q, p2 + q] -> lambda4aQF7,
     lambda3a[p1, -q, q - p1] -> lambda3aQF8,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF11,
     (*dLambda4Am*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF8,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF11,
     lambda3a[p3, -p2 - p3 - q, p2 + q] -> lambda3aQF13,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3aQF17,
     (*dLambda4An*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF8,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF11,
     lambda3a[p4, -p2 - p4 - q, p2 + q] -> lambda3aQF11,
     lambda3a[p3, p1 - q, p2 + p4 + q] -> lambda3aQF8,
     (*dLambda4Ao*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF8,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF8,
     lambda3a[p2, -p2 - p3 - q, p3 + q] -> lambda3aQF17,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3aQF17,
     (*dLambda4Ap*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF1,
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF1,
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF1,
     lambdaqqa1[-q, -p2 + q, p2] -> lambdaqqa1QF2,
     lambdaqqa4[-q, -p2 + q, p2] -> lambdaqqa4QF2,
     lambdaqqa7[-q, -p2 + q, p2] -> lambdaqqa7QF2,
     lambdaqqa1[p2 - q, p1 + p4 + q, p3] -> lambdaqqa1QF3,
     lambdaqqa4[p2 - q, p1 + p4 + q, p3] -> lambdaqqa4QF3,
     lambdaqqa7[p2 - q, p1 + p4 + q, p3] -> lambdaqqa7QF3,
     lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa1QF4,
     lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa4QF4,
     lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa7QF4,
     (*dLambda4Aq*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF1,
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF1,
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF1,
     lambdaqqa1[-q, -p2 + q, p2] -> lambdaqqa1QF2,
     lambdaqqa4[-q, -p2 + q, p2] -> lambdaqqa4QF2,
     lambdaqqa7[-q, -p2 + q, p2] -> lambdaqqa7QF2,
     lambdaqqa1[p2 - q, p1 + p3 + q, p4] -> lambdaqqa1QF2,
     lambdaqqa4[p2 - q, p1 + p3 + q, p4] -> lambdaqqa4QF2,
     lambdaqqa7[p2 - q, p1 + p3 + q, p4] -> lambdaqqa7QF2,
     lambdaqqa1[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa1QF1,
     lambdaqqa4[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa4QF1,
     lambdaqqa7[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa7QF1,
     (*dLambda4Ar*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF1,
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF1,
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF1,
     lambdaqqa1[-q, -p3 + q, p3] -> lambdaqqa1QF1,
     lambdaqqa4[-q, -p3 + q, p3] -> lambdaqqa4QF1,
     lambdaqqa7[-q, -p3 + q, p3] -> lambdaqqa7QF1,
     lambdaqqa1[p3 - q, p1 + p4 + q, p2] -> lambdaqqa1QF4,
     lambdaqqa4[p3 - q, p1 + p4 + q, p2] -> lambdaqqa4QF4,
     lambdaqqa7[p3 - q, p1 + p4 + q, p2] -> lambdaqqa7QF4,
     lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa1QF4,
     lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa4QF4,
     lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa7QF4
     } /. {
    lambda4aQF5 -> Sqrt[lambda4aQF5^(2)],
    lambda4aQF6 -> Sqrt[lambda4aQF6^(2)],
    lambda4aQF7 -> Sqrt[lambda4aQF7^(2)],
    lambda4aQF10 -> Sqrt[lambda4aQF10^(2)],
    lambda4aQF12 -> Sqrt[lambda4aQF12^(2)],
    lambda4aQF14 -> Sqrt[lambda4aQF14^(2)],
    lambda4aQF15 -> Sqrt[lambda4aQF15^(2)],
    lambda3aQF1 -> Sqrt[lambda3aQF1^(2)],
    lambda3aQF2 -> Sqrt[lambda3aQF2^(2)],
    lambda3aQF4 -> Sqrt[lambda3aQF4^(2)],
    lambda3aQF8 -> Sqrt[lambda3aQF8^(2)],
    lambda3aQF9 -> Sqrt[lambda3aQF9^(2)],
    lambda3aQF11 -> Sqrt[lambda3aQF11^(2)],
    lambda3aQF13 -> Sqrt[lambda3aQF13^(2)],
    lambda3aQF16 -> Sqrt[lambda3aQF16^(2)],
    lambda3aQF17 -> Sqrt[lambda3aQF17^(2)]
    };
