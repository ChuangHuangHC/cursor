(* A3--A3 regulator insertion for gluon triangles (1*A4 + 2*A3).
   Note convention: regulator sits on the internal line of momentum q,
   so the loop is re-routed relative to Lambda4Ag..l / dLambda4A*1.
   Cf. ∂Λ^{4A}_{g_2,...,l_2} in the note.                                 *)

dLambda4Ag2 = (1)*
   (-1) lambda4a[p1, p2, p3 - q, p4 + q] SA4[a, b, b1, 
    a1, \[Mu], \[Nu], \[Nu]1, \[Mu]1, p1, p2, p3 - q, p4 + q]*
   delta[adj, b1, c2] PiPerp[\[Nu]1, \[Rho]2, p3 - q] GA[p3 - q]*
   (-1) lambda3a[p3, -q, q - p3] SA3[c, c1, c2, \[Rho], \[Rho]1, \[Rho]2, 
    p3, -q, q - p3]*
   delta[adj, c1, d2] PiPerp[\[Rho]1, \[Sigma]2, q] dGA[q]*
   (-1) lambda3a[p4, -p4 - q, q] SA3[d, d1, 
    d2, \[Sigma], \[Sigma]1, \[Sigma]2, p4, -p4 - q, q]*
   delta[adj, d1, a1] PiPerp[\[Sigma]1, \[Mu]1, p4 + q] GA[p4 + q];

dLambda4Ah2 = (1)*
   (-1) lambda4a[p1, p3, p2 - q, p4 + q] SA4[a, c, c1, 
    a1, \[Mu], \[Rho], \[Rho]1, \[Mu]1, p1, p3, p2 - q, p4 + q]*
   delta[adj, c1, b2] PiPerp[\[Rho]1, \[Nu]2, p2 - q] GA[p2 - q]*
   (-1) lambda3a[p2, -q, q - p2] SA3[b, b1, b2, \[Nu], \[Nu]1, \[Nu]2, 
    p2, -q, q - p2]*
   delta[adj, b1, d2] PiPerp[\[Nu]1, \[Sigma]2, q] dGA[q]*
   (-1) lambda3a[p4, -p4 - q, q] SA3[d, d1, 
    d2, \[Sigma], \[Sigma]1, \[Sigma]2, p4, -p4 - q, q]*
   delta[adj, d1, a1] PiPerp[\[Sigma]1, \[Mu]1, p4 + q] GA[p4 + q];

dLambda4Ai2 = (1)*
   (-1) lambda4a[p1, p4, p2 - q, p3 + q] SA4[a, d, d1, 
    a1, \[Mu], \[Sigma], \[Sigma]1, \[Mu]1, p1, p4, p2 - q, p3 + q]*
   delta[adj, d1, b2] PiPerp[\[Sigma]1, \[Nu]2, p2 - q] GA[p2 - q]*
   (-1) lambda3a[p2, -q, q - p2] SA3[b, b1, b2, \[Nu], \[Nu]1, \[Nu]2, 
    p2, -q, q - p2]*
   delta[adj, b1, c2] PiPerp[\[Nu]1, \[Rho]2, q] dGA[q]*
   (-1) lambda3a[p3, -p3 - q, q] SA3[c, c1, 
    c2, \[Rho], \[Rho]1, \[Rho]2, p3, -p3 - q, q]*
   delta[adj, c1, a1] PiPerp[\[Rho]1, \[Mu]1, p3 + q] GA[p3 + q];

dLambda4Aj2 = (1)*
   (-1) lambda4a[p2, p3, p1 - q, p4 + q] SA4[b, c, c1, 
    b1, \[Nu], \[Rho], \[Rho]1, \[Nu]1, p2, p3, p1 - q, p4 + q]*
   delta[adj, c1, a2] PiPerp[\[Rho]1, \[Mu]2, p1 - q] GA[p1 - q]*
   (-1) lambda3a[p1, -q, q - p1] SA3[a, a1, a2, \[Mu], \[Mu]1, \[Mu]2, 
    p1, -q, q - p1]*
   delta[adj, a1, d2] PiPerp[\[Mu]1, \[Sigma]2, q] dGA[q]*
   (-1) lambda3a[p4, -p4 - q, q] SA3[d, d1, 
    d2, \[Sigma], \[Sigma]1, \[Sigma]2, p4, -p4 - q, q]*
   delta[adj, d1, b1] PiPerp[\[Sigma]1, \[Nu]1, p4 + q] GA[p4 + q];

dLambda4Ak2 = (1)*
   (-1) lambda4a[p2, p4, p1 - q, p3 + q] SA4[b, d, d1, 
    b1, \[Nu], \[Sigma], \[Sigma]1, \[Nu]1, p2, p4, p1 - q, p3 + q]*
   delta[adj, d1, a2] PiPerp[\[Sigma]1, \[Mu]2, p1 - q] GA[p1 - q]*
   (-1) lambda3a[p1, -q, q - p1] SA3[a, a1, a2, \[Mu], \[Mu]1, \[Mu]2, 
    p1, -q, q - p1]*
   delta[adj, a1, c2] PiPerp[\[Mu]1, \[Rho]2, q] dGA[q]*
   (-1) lambda3a[p3, -p3 - q, q] SA3[c, c1, 
    c2, \[Rho], \[Rho]1, \[Rho]2, p3, -p3 - q, q]*
   delta[adj, c1, b1] PiPerp[\[Rho]1, \[Nu]1, p3 + q] GA[p3 + q];

dLambda4Al2 = (1)*
   (-1) lambda4a[p3, p4, p1 - q, p2 + q] SA4[c, d, d1, 
    c1, \[Rho], \[Sigma], \[Sigma]1, \[Rho]1, p3, p4, p1 - q, p2 + q]*
   delta[adj, d1, a2] PiPerp[\[Sigma]1, \[Mu]2, p1 - q] GA[p1 - q]*
   (-1) lambda3a[p1, -q, q - p1] SA3[a, a1, a2, \[Mu], \[Mu]1, \[Mu]2, 
    p1, -q, q - p1]*
   delta[adj, a1, b2] PiPerp[\[Mu]1, \[Nu]2, q] dGA[q]*
   (-1) lambda3a[p2, -p2 - q, q] SA3[b, b1, 
    b2, \[Nu], \[Nu]1, \[Nu]2, p2, -p2 - q, q]*
   delta[adj, b1, c1] PiPerp[\[Nu]1, \[Rho]1, p2 + q] GA[p2 + q];
