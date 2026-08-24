(* Sequential QF labelling at the chosen 4A point
     p1 = {p,0,0,0} = -p3
     p2 = {0,p,0,0} = -p4
   CMA: permutation and overall minus of legs share one QF.

   lambdaccaQF1..4       ghost-gluon
   lambdaqqa{1,4,7}QF5..8  quark-gluon (types 1/4/7 share the same momenta)
   lambda4aQF9..18       four-gluon
   lambda3aQF19..27      three-gluon
*)

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
     lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4aQF9,
     lambda4a[p3, p4, q, p1 + p2 - q] -> lambda4aQF9,
     (*dLambda4Ae*)
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4aQF10,
     lambda4a[p2, p4, q, p1 + p3 - q] -> lambda4aQF11,
     (*dLambda4Af*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4aQF12,
     lambda4a[p2, p3, q, p1 + p4 - q] -> lambda4aQF12,
     (*dLambda4Ag1*)
     lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4aQF9,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF19,
     lambda3a[p4, p1 + p2 - q, p3 + q] -> lambda3aQF20,
     (*dLambda4Ag2*)
     lambda4a[p1, p2, p3 - q, p4 + q] -> lambda4aQF13,
     lambda3a[p3, -q, q - p3] -> lambda3aQF21,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF22,
     (*dLambda4Ah1*)
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4aQF10,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF23,
     lambda3a[p4, p1 + p3 - q, p2 + q] -> lambda3aQF23,
     (*dLambda4Ah2*)
     lambda4a[p1, p3, p2 - q, p4 + q] -> lambda4aQF14,
     lambda3a[p2, -q, q - p2] -> lambda3aQF22,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF22,
     (*dLambda4Ai1*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4aQF12,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF23,
     lambda3a[p3, p1 + p4 - q, p2 + q] -> lambda3aQF24,
     (*dLambda4Ai2*)
     lambda4a[p1, p4, p2 - q, p3 + q] -> lambda4aQF15,
     lambda3a[p2, -q, q - p2] -> lambda3aQF22,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF19,
     (*dLambda4Aj1*)
     lambda4a[p2, p3, -q, -p2 - p3 + q] -> lambda4aQF16,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF21,
     lambda3a[p4, p2 + p3 - q, p1 + q] -> lambda3aQF25,
     (*dLambda4Aj2*)
     lambda4a[p2, p3, p1 - q, p4 + q] -> lambda4aQF17,
     lambda3a[p1, -q, q - p1] -> lambda3aQF19,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF22,
     (*dLambda4Ak1*)
     lambda4a[p2, p4, -q, -p2 - p4 + q] -> lambda4aQF11,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF21,
     lambda3a[p3, p2 + p4 - q, p1 + q] -> lambda3aQF21,
     (*dLambda4Ak2*)
     lambda4a[p2, p4, p1 - q, p3 + q] -> lambda4aQF18,
     lambda3a[p1, -q, q - p1] -> lambda3aQF19,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF19,
     (*dLambda4Al1*)
     lambda4a[p3, p4, -q, -p3 - p4 + q] -> lambda4aQF13,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF21,
     lambda3a[p2, p3 + p4 - q, p1 + q] -> lambda3aQF26,
     (*dLambda4Al2*)
     lambda4a[p3, p4, p1 - q, p2 + q] -> lambda4aQF14,
     lambda3a[p1, -q, q - p1] -> lambda3aQF19,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF23,
     (*dLambda4Am*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF19,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF23,
     lambda3a[p3, -p2 - p3 - q, p2 + q] -> lambda3aQF24,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3aQF27,
     (*dLambda4An*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF19,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF23,
     lambda3a[p4, -p2 - p4 - q, p2 + q] -> lambda3aQF23,
     lambda3a[p3, p1 - q, p2 + p4 + q] -> lambda3aQF19,
     (*dLambda4Ao*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF19,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF19,
     lambda3a[p2, -p2 - p3 - q, p3 + q] -> lambda3aQF27,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3aQF27,
     (*dLambda4Ap*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF5, 
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF5, 
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF5,
     lambdaqqa1[-q, -p2 + q, p2] -> lambdaqqa1QF6, 
     lambdaqqa4[-q, -p2 + q, p2] -> lambdaqqa4QF6, 
     lambdaqqa7[-q, -p2 + q, p2] -> lambdaqqa7QF6,
     lambdaqqa1[p2 - q, p1 + p4 + q, p3] -> lambdaqqa1QF7, 
     lambdaqqa4[p2 - q, p1 + p4 + q, p3] -> lambdaqqa4QF7, 
     lambdaqqa7[p2 - q, p1 + p4 + q, p3] -> lambdaqqa7QF7,
     lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa1QF8, 
     lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa4QF8, 
     lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa7QF8,
     (*dLambda4Aq*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF5, 
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF5, 
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF5,
     lambdaqqa1[-q, -p2 + q, p2] -> lambdaqqa1QF6, 
     lambdaqqa4[-q, -p2 + q, p2] -> lambdaqqa4QF6, 
     lambdaqqa7[-q, -p2 + q, p2] -> lambdaqqa7QF6,
     lambdaqqa1[p2 - q, p1 + p3 + q, p4] -> lambdaqqa1QF6, 
     lambdaqqa4[p2 - q, p1 + p3 + q, p4] -> lambdaqqa4QF6, 
     lambdaqqa7[p2 - q, p1 + p3 + q, p4] -> lambdaqqa7QF6,
     lambdaqqa1[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa1QF5, 
     lambdaqqa4[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa4QF5, 
     lambdaqqa7[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa7QF5,
     (*dLambda4Ar*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF5, 
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF5, 
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF5,
     lambdaqqa1[-q, -p3 + q, p3] -> lambdaqqa1QF5, 
     lambdaqqa4[-q, -p3 + q, p3] -> lambdaqqa4QF5, 
     lambdaqqa7[-q, -p3 + q, p3] -> lambdaqqa7QF5,
     lambdaqqa1[p3 - q, p1 + p4 + q, p2] -> lambdaqqa1QF8, 
     lambdaqqa4[p3 - q, p1 + p4 + q, p2] -> lambdaqqa4QF8, 
     lambdaqqa7[p3 - q, p1 + p4 + q, p2] -> lambdaqqa7QF8,
     lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa1QF8, 
     lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa4QF8, 
     lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa7QF8
     } /. {
    lambda4aQF9 -> Sqrt[lambda4aQF9^(2)],
    lambda4aQF10 -> Sqrt[lambda4aQF10^(2)],
    lambda4aQF11 -> Sqrt[lambda4aQF11^(2)],
    lambda4aQF12 -> Sqrt[lambda4aQF12^(2)],
    lambda4aQF13 -> Sqrt[lambda4aQF13^(2)],
    lambda4aQF14 -> Sqrt[lambda4aQF14^(2)],
    lambda4aQF15 -> Sqrt[lambda4aQF15^(2)],
    lambda4aQF16 -> Sqrt[lambda4aQF16^(2)],
    lambda4aQF17 -> Sqrt[lambda4aQF17^(2)],
    lambda4aQF18 -> Sqrt[lambda4aQF18^(2)],
    lambda3aQF19 -> Sqrt[lambda3aQF19^(2)],
    lambda3aQF20 -> Sqrt[lambda3aQF20^(2)],
    lambda3aQF21 -> Sqrt[lambda3aQF21^(2)],
    lambda3aQF22 -> Sqrt[lambda3aQF22^(2)],
    lambda3aQF23 -> Sqrt[lambda3aQF23^(2)],
    lambda3aQF24 -> Sqrt[lambda3aQF24^(2)],
    lambda3aQF25 -> Sqrt[lambda3aQF25^(2)],
    lambda3aQF26 -> Sqrt[lambda3aQF26^(2)],
    lambda3aQF27 -> Sqrt[lambda3aQF27^(2)]
    };
