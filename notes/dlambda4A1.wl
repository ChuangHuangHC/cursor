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
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4aQF11,
     lambda4a[p2, p4, q, p1 + p3 - q] -> lambda4aQF12,
     (*dLambda4Af*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4aQF13,
     lambda4a[p2, p3, q, p1 + p4 - q] -> lambda4aQF13,
     (*dLambda4Ag1*)
     lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4aQF9,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF15,
     lambda3a[p4, p1 + p2 - q, p3 + q] -> lambda3aQF16,
     (*dLambda4Ag2*)
     lambda4a[p1, p2, p3 - q, p4 + q] -> lambda4aQF41,
     lambda3a[p3, -q, q - p3] -> lambda3aQF21,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF48,
     (*dLambda4Ah1*)
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4aQF11,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF17,
     lambda3a[p4, p1 + p3 - q, p2 + q] -> lambda3aQF17,
     (*dLambda4Ah2*)
     lambda4a[p1, p3, p2 - q, p4 + q] -> lambda4aQF42,
     lambda3a[p2, -q, q - p2] -> lambda3aQF48,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF48,
     (*dLambda4Ai1*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4aQF13,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF17,
     lambda3a[p3, p1 + p4 - q, p2 + q] -> lambda3aQF19,
     (*dLambda4Ai2*)
     lambda4a[p1, p4, p2 - q, p3 + q] -> lambda4aQF43,
     lambda3a[p2, -q, q - p2] -> lambda3aQF48,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF15,
     (*dLambda4Aj1*)
     lambda4a[p2, p3, -q, -p2 - p3 + q] -> lambda4aQF20,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF21,
     lambda3a[p4, p2 + p3 - q, p1 + q] -> lambda3aQF22,
     (*dLambda4Aj2*)
     lambda4a[p2, p3, p1 - q, p4 + q] -> lambda4aQF44,
     lambda3a[p1, -q, q - p1] -> lambda3aQF15,
     lambda3a[p4, -p4 - q, q] -> lambda3aQF48,
     (*dLambda4Ak1*)
     lambda4a[p2, p4, -q, -p2 - p4 + q] -> lambda4aQF12,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF21,
     lambda3a[p3, p2 + p4 - q, p1 + q] -> lambda3aQF21,
     (*dLambda4Ak2*)
     lambda4a[p2, p4, p1 - q, p3 + q] -> lambda4aQF45,
     lambda3a[p1, -q, q - p1] -> lambda3aQF15,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF15,
     (*dLambda4Al1*)
     lambda4a[p3, p4, -q, -p3 - p4 + q] -> lambda4aQF41,
     lambda3a[p1, -p1 - q, q] -> lambda3aQF21,
     lambda3a[p2, p3 + p4 - q, p1 + q] -> lambda3aQF26,
     (*dLambda4Al2*)
     lambda4a[p3, p4, p1 - q, p2 + q] -> lambda4aQF42,
     lambda3a[p1, -q, q - p1] -> lambda3aQF15,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF17,
     (*dLambda4Am*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF15,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF17,
     lambda3a[p3, -p2 - p3 - q, p2 + q] -> lambda3aQF19,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3aQF29,
     (*dLambda4An*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF15,
     lambda3a[p2, -p2 - q, q] -> lambda3aQF17,
     lambda3a[p4, -p2 - p4 - q, p2 + q] -> lambda3aQF17,
     lambda3a[p3, p1 - q, p2 + p4 + q] -> lambda3aQF15,
     (*dLambda4Ao*)
     lambda3a[p1, -q, -p1 + q] -> lambda3aQF15,
     lambda3a[p3, -p3 - q, q] -> lambda3aQF15,
     lambda3a[p2, -p2 - p3 - q, p3 + q] -> lambda3aQF29,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3aQF29,
     (*dLambda4Ap*)
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
     (*dLambda4Aq*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF33, 
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF33, 
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF33,
     lambdaqqa1[-q, -p2 + q, p2] -> lambdaqqa1QF34, 
     lambdaqqa4[-q, -p2 + q, p2] -> lambdaqqa4QF34, 
     lambdaqqa7[-q, -p2 + q, p2] -> lambdaqqa7QF34,
     lambdaqqa1[p2 - q, p1 + p3 + q, p4] -> lambdaqqa1QF34, 
     lambdaqqa4[p2 - q, p1 + p3 + q, p4] -> lambdaqqa4QF34, 
     lambdaqqa7[p2 - q, p1 + p3 + q, p4] -> lambdaqqa7QF34,
     lambdaqqa1[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa1QF33, 
     lambdaqqa4[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa4QF33, 
     lambdaqqa7[-p1 - p3 - q, p1 + q, p3] -> lambdaqqa7QF33,
     (*dLambda4Ar*)
     lambdaqqa1[-p1 - q, q, p1] -> lambdaqqa1QF33, 
     lambdaqqa4[-p1 - q, q, p1] -> lambdaqqa4QF33, 
     lambdaqqa7[-p1 - q, q, p1] -> lambdaqqa7QF33,
     lambdaqqa1[-q, -p3 + q, p3] -> lambdaqqa1QF33, 
     lambdaqqa4[-q, -p3 + q, p3] -> lambdaqqa4QF33, 
     lambdaqqa7[-q, -p3 + q, p3] -> lambdaqqa7QF33,
     lambdaqqa1[p3 - q, p1 + p4 + q, p2] -> lambdaqqa1QF36, 
     lambdaqqa4[p3 - q, p1 + p4 + q, p2] -> lambdaqqa4QF36, 
     lambdaqqa7[p3 - q, p1 + p4 + q, p2] -> lambdaqqa7QF36,
     lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa1QF36, 
     lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa4QF36, 
     lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambdaqqa7QF36
     } /. {
    lambda4aQF9 -> Sqrt[lambda4aQF9^(2)],
    lambda4aQF11 -> Sqrt[lambda4aQF11^(2)],
    lambda4aQF12 -> Sqrt[lambda4aQF12^(2)],
    lambda4aQF13 -> Sqrt[lambda4aQF13^(2)],
    lambda4aQF20 -> Sqrt[lambda4aQF20^(2)],
    lambda4aQF41 -> Sqrt[lambda4aQF41^(2)],
    lambda4aQF42 -> Sqrt[lambda4aQF42^(2)],
    lambda4aQF43 -> Sqrt[lambda4aQF43^(2)],
    lambda4aQF44 -> Sqrt[lambda4aQF44^(2)],
    lambda4aQF45 -> Sqrt[lambda4aQF45^(2)],
    lambda3aQF15 -> Sqrt[lambda3aQF15^(2)],
    lambda3aQF16 -> Sqrt[lambda3aQF16^(2)],
    lambda3aQF17 -> Sqrt[lambda3aQF17^(2)],
    lambda3aQF19 -> Sqrt[lambda3aQF19^(2)],
    lambda3aQF21 -> Sqrt[lambda3aQF21^(2)],
    lambda3aQF22 -> Sqrt[lambda3aQF22^(2)],
    lambda3aQF26 -> Sqrt[lambda3aQF26^(2)],
    lambda3aQF29 -> Sqrt[lambda3aQF29^(2)],
    lambda3aQF48 -> Sqrt[lambda3aQF48^(2)]
    };
