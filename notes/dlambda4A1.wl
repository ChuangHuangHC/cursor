(* QF labels are momentum-only: the same unordered leg momenta (CMA) share
   one QF regardless of vertex type.  Vertex type lives in the head:
     lambda3QF* -> ghost-gluon / three-gluon
     lambda3QQA{1,4,7}QF* -> quark-gluon (types 1/4/7, same momenta)
     lambda4QF* -> four-gluon.
   Three-point momenta: QF1..4 (shared by CCA and QQA{1,4,7}),
   QF15..23 (pure 3A).  Four-point momenta: QF5..14 (4A). *)

dlambda4A1 = dlambda4A /. paraRepl4 /. {
     (*dLambda4Aa*)
     lambdacca[-p1 - q, q, p1] -> lambda3QF1,
     lambdacca[-q, -p2 + q, p2] -> lambda3QF2,
     lambdacca[p2 - q, p1 + p4 + q, p3] -> lambda3QF3,
     lambdacca[-p1 - p4 - q, p1 + q, p4] -> lambda3QF4,
     (*dLambda4Ab*)
     lambdacca[-p1 - q, q, p1] -> lambda3QF1,
     lambdacca[-q, -p2 + q, p2] -> lambda3QF2,
     lambdacca[p2 - q, p1 + p3 + q, p4] -> lambda3QF2,
     lambdacca[-p1 - p3 - q, p1 + q, p3] -> lambda3QF1,
     (*dLambda4Ac*)
     lambdacca[-p1 - q, q, p1] -> lambda3QF1,
     lambdacca[-q, -p3 + q, p3] -> lambda3QF1,
     lambdacca[p3 - q, p1 + p4 + q, p2] -> lambda3QF4,
     lambdacca[-p1 - p4 - q, p1 + q, p4] -> lambda3QF4,
     (*dLambda4Ad*)
     lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4QF5,
     lambda4a[p3, p4, q, p1 + p2 - q] -> lambda4QF5,
     (*dLambda4Ae*)
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4QF6,
     lambda4a[p2, p4, q, p1 + p3 - q] -> lambda4QF7,
     (*dLambda4Af*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4QF8,
     lambda4a[p2, p3, q, p1 + p4 - q] -> lambda4QF8,
     (*dLambda4Ag1*)
     lambda4a[p1, p2, -q, -p1 - p2 + q] -> lambda4QF5,
     lambda3a[p3, -p3 - q, q] -> lambda3QF15,
     lambda3a[p4, p1 + p2 - q, p3 + q] -> lambda3QF16,
     (*dLambda4Ag2*)
     lambda4a[p1, p2, p3 - q, p4 + q] -> lambda4QF9,
     lambda3a[p3, -q, q - p3] -> lambda3QF17,
     lambda3a[p4, -p4 - q, q] -> lambda3QF18,
     (*dLambda4Ah1*)
     lambda4a[p1, p3, -q, -p1 - p3 + q] -> lambda4QF6,
     lambda3a[p2, -p2 - q, q] -> lambda3QF19,
     lambda3a[p4, p1 + p3 - q, p2 + q] -> lambda3QF19,
     (*dLambda4Ah2*)
     lambda4a[p1, p3, p2 - q, p4 + q] -> lambda4QF10,
     lambda3a[p2, -q, q - p2] -> lambda3QF18,
     lambda3a[p4, -p4 - q, q] -> lambda3QF18,
     (*dLambda4Ai1*)
     lambda4a[p1, p4, -q, -p1 - p4 + q] -> lambda4QF8,
     lambda3a[p2, -p2 - q, q] -> lambda3QF19,
     lambda3a[p3, p1 + p4 - q, p2 + q] -> lambda3QF20,
     (*dLambda4Ai2*)
     lambda4a[p1, p4, p2 - q, p3 + q] -> lambda4QF11,
     lambda3a[p2, -q, q - p2] -> lambda3QF18,
     lambda3a[p3, -p3 - q, q] -> lambda3QF15,
     (*dLambda4Aj1*)
     lambda4a[p2, p3, -q, -p2 - p3 + q] -> lambda4QF12,
     lambda3a[p1, -p1 - q, q] -> lambda3QF17,
     lambda3a[p4, p2 + p3 - q, p1 + q] -> lambda3QF21,
     (*dLambda4Aj2*)
     lambda4a[p2, p3, p1 - q, p4 + q] -> lambda4QF13,
     lambda3a[p1, -q, q - p1] -> lambda3QF15,
     lambda3a[p4, -p4 - q, q] -> lambda3QF18,
     (*dLambda4Ak1*)
     lambda4a[p2, p4, -q, -p2 - p4 + q] -> lambda4QF7,
     lambda3a[p1, -p1 - q, q] -> lambda3QF17,
     lambda3a[p3, p2 + p4 - q, p1 + q] -> lambda3QF17,
     (*dLambda4Ak2*)
     lambda4a[p2, p4, p1 - q, p3 + q] -> lambda4QF14,
     lambda3a[p1, -q, q - p1] -> lambda3QF15,
     lambda3a[p3, -p3 - q, q] -> lambda3QF15,
     (*dLambda4Al1*)
     lambda4a[p3, p4, -q, -p3 - p4 + q] -> lambda4QF9,
     lambda3a[p1, -p1 - q, q] -> lambda3QF17,
     lambda3a[p2, p3 + p4 - q, p1 + q] -> lambda3QF22,
     (*dLambda4Al2*)
     lambda4a[p3, p4, p1 - q, p2 + q] -> lambda4QF10,
     lambda3a[p1, -q, q - p1] -> lambda3QF15,
     lambda3a[p2, -p2 - q, q] -> lambda3QF19,
     (*dLambda4Am*)
     lambda3a[p1, -q, -p1 + q] -> lambda3QF15,
     lambda3a[p2, -p2 - q, q] -> lambda3QF19,
     lambda3a[p3, -p2 - p3 - q, p2 + q] -> lambda3QF20,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3QF23,
     (*dLambda4An*)
     lambda3a[p1, -q, -p1 + q] -> lambda3QF15,
     lambda3a[p2, -p2 - q, q] -> lambda3QF19,
     lambda3a[p4, -p2 - p4 - q, p2 + q] -> lambda3QF19,
     lambda3a[p3, p1 - q, p2 + p4 + q] -> lambda3QF15,
     (*dLambda4Ao*)
     lambda3a[p1, -q, -p1 + q] -> lambda3QF15,
     lambda3a[p3, -p3 - q, q] -> lambda3QF15,
     lambda3a[p2, -p2 - p3 - q, p3 + q] -> lambda3QF23,
     lambda3a[p4, p1 - q, p2 + p3 + q] -> lambda3QF23,
     (*dLambda4Ap*)
     lambdaqqa1[-p1 - q, q, p1] -> lambda3QQA1QF1,
     lambdaqqa4[-p1 - q, q, p1] -> lambda3QQA4QF1,
     lambdaqqa7[-p1 - q, q, p1] -> lambda3QQA7QF1,
     lambdaqqa1[-q, -p2 + q, p2] -> lambda3QQA1QF2,
     lambdaqqa4[-q, -p2 + q, p2] -> lambda3QQA4QF2,
     lambdaqqa7[-q, -p2 + q, p2] -> lambda3QQA7QF2,
     lambdaqqa1[p2 - q, p1 + p4 + q, p3] -> lambda3QQA1QF3,
     lambdaqqa4[p2 - q, p1 + p4 + q, p3] -> lambda3QQA4QF3,
     lambdaqqa7[p2 - q, p1 + p4 + q, p3] -> lambda3QQA7QF3,
     lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambda3QQA1QF4,
     lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambda3QQA4QF4,
     lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambda3QQA7QF4,
     (*dLambda4Aq*)
     lambdaqqa1[-p1 - q, q, p1] -> lambda3QQA1QF1,
     lambdaqqa4[-p1 - q, q, p1] -> lambda3QQA4QF1,
     lambdaqqa7[-p1 - q, q, p1] -> lambda3QQA7QF1,
     lambdaqqa1[-q, -p2 + q, p2] -> lambda3QQA1QF2,
     lambdaqqa4[-q, -p2 + q, p2] -> lambda3QQA4QF2,
     lambdaqqa7[-q, -p2 + q, p2] -> lambda3QQA7QF2,
     lambdaqqa1[p2 - q, p1 + p3 + q, p4] -> lambda3QQA1QF2,
     lambdaqqa4[p2 - q, p1 + p3 + q, p4] -> lambda3QQA4QF2,
     lambdaqqa7[p2 - q, p1 + p3 + q, p4] -> lambda3QQA7QF2,
     lambdaqqa1[-p1 - p3 - q, p1 + q, p3] -> lambda3QQA1QF1,
     lambdaqqa4[-p1 - p3 - q, p1 + q, p3] -> lambda3QQA4QF1,
     lambdaqqa7[-p1 - p3 - q, p1 + q, p3] -> lambda3QQA7QF1,
     (*dLambda4Ar*)
     lambdaqqa1[-p1 - q, q, p1] -> lambda3QQA1QF1,
     lambdaqqa4[-p1 - q, q, p1] -> lambda3QQA4QF1,
     lambdaqqa7[-p1 - q, q, p1] -> lambda3QQA7QF1,
     lambdaqqa1[-q, -p3 + q, p3] -> lambda3QQA1QF1,
     lambdaqqa4[-q, -p3 + q, p3] -> lambda3QQA4QF1,
     lambdaqqa7[-q, -p3 + q, p3] -> lambda3QQA7QF1,
     lambdaqqa1[p3 - q, p1 + p4 + q, p2] -> lambda3QQA1QF4,
     lambdaqqa4[p3 - q, p1 + p4 + q, p2] -> lambda3QQA4QF4,
     lambdaqqa7[p3 - q, p1 + p4 + q, p2] -> lambda3QQA7QF4,
     lambdaqqa1[-p1 - p4 - q, p1 + q, p4] -> lambda3QQA1QF4,
     lambdaqqa4[-p1 - p4 - q, p1 + q, p4] -> lambda3QQA4QF4,
     lambdaqqa7[-p1 - p4 - q, p1 + q, p4] -> lambda3QQA7QF4
     } /. {
    lambda4QF5 -> Sqrt[lambda4QF5^(2)],
    lambda4QF6 -> Sqrt[lambda4QF6^(2)],
    lambda4QF7 -> Sqrt[lambda4QF7^(2)],
    lambda4QF8 -> Sqrt[lambda4QF8^(2)],
    lambda4QF9 -> Sqrt[lambda4QF9^(2)],
    lambda4QF10 -> Sqrt[lambda4QF10^(2)],
    lambda4QF11 -> Sqrt[lambda4QF11^(2)],
    lambda4QF12 -> Sqrt[lambda4QF12^(2)],
    lambda4QF13 -> Sqrt[lambda4QF13^(2)],
    lambda4QF14 -> Sqrt[lambda4QF14^(2)],
    lambda3QF15 -> Sqrt[lambda3QF15^(2)],
    lambda3QF16 -> Sqrt[lambda3QF16^(2)],
    lambda3QF17 -> Sqrt[lambda3QF17^(2)],
    lambda3QF18 -> Sqrt[lambda3QF18^(2)],
    lambda3QF19 -> Sqrt[lambda3QF19^(2)],
    lambda3QF20 -> Sqrt[lambda3QF20^(2)],
    lambda3QF21 -> Sqrt[lambda3QF21^(2)],
    lambda3QF22 -> Sqrt[lambda3QF22^(2)],
    lambda3QF23 -> Sqrt[lambda3QF23^(2)]
    };
