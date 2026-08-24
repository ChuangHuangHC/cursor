(* Single-point (propagator) momenta in Lambda4A / dLambda4A,
   classified by GA, Gq, Gc.

   Source: 4*ccA (a,b,c), 2*4A (d,e,f), 1*4A+2*3A (g–l, including g2–l2),
           4*3A (m,n,o), 4*qqA (p,q,r).

   4A kinematics for the |k| collapse only:
     p1 = {p, 0, 0, 0} = -p3
     p2 = {0, p, 0, 0} = -p4
*)

(* ---- as written, unique algebraic arguments ---- *)

momGc = {
  q,
  -p2 + q,
  p1 + p4 + q,
  p1 + q,
  p1 + p3 + q,
  -p3 + q
};

(* quark box: same six last-slot momenta as the ghost box *)
momGq = momGc;

momGA = {
  q,
  p1 + p2 - q,
  p1 + p3 - q,
  p1 + p4 - q,
  p3 + q,
  -p1 - p2 + q,
  p3 - q,
  p4 + q,
  p2 + q,
  -p1 - p3 + q,
  p2 - q,
  -p1 - p4 + q,
  p1 + q,
  -p2 - p3 + q,
  p1 - q,
  -p2 - p4 + q,
  -p3 - p4 + q,
  p2 + p3 + q,
  -p1 + q,
  p2 + p4 + q
};

(* GA even: k ~ -k, 16 representatives *)
momGAEven = {
  q,
  p1 + p2 - q,
  p1 + p3 - q,
  p1 + p4 - q,
  p3 + q,
  p3 - q,
  p4 + q,
  p2 + q,
  p2 - q,
  p1 + q,
  p1 - q,
  -p2 - p3 + q,
  -p2 - p4 + q,
  -p3 - p4 + q,
  p2 + p3 + q,
  p2 + p4 + q
};

(* ---- |k| collapse at the 4A point (9 labels) ---- *)

(*
xq            = |q|
xMp2Pq4       = |-p2 + q|
xPp1Pp4Pq4    = |p1 + p4 + q|
xPp1Pq4       = |p1 + q|
xPp1Pp2Mq4    = |p1 + p2 - q|
xPp1Pp4Mq4    = |p1 + p4 - q|
xPp3Pq4       = |p3 + q|
xPp2Pq4       = |p2 + q|
xMp3Mp4Pq4    = |-p3 - p4 + q|
*)

singleMomRepl4 = {
  q -> xq,
  -p2 + q -> xMp2Pq4,
  p1 + p4 + q -> xPp1Pp4Pq4,
  p1 + q -> xPp1Pq4,
  p1 + p3 + q -> xq,
  -p3 + q -> xPp1Pq4,
  p1 + p2 - q -> xPp1Pp2Mq4,
  p1 + p3 - q -> xq,
  p1 + p4 - q -> xPp1Pp4Mq4,
  p3 + q -> xPp3Pq4,
  -p1 - p2 + q -> xPp1Pp2Mq4,
  p3 - q -> xPp1Pq4,
  p4 + q -> xMp2Pq4,
  p2 + q -> xPp2Pq4,
  -p1 - p3 + q -> xq,
  p2 - q -> xMp2Pq4,
  -p1 - p4 + q -> xPp1Pp4Mq4,
  -p2 - p3 + q -> xPp1Pp4Pq4,
  p1 - q -> xPp3Pq4,
  -p2 - p4 + q -> xq,
  -p3 - p4 + q -> xMp3Mp4Pq4,
  p2 + p3 + q -> xPp1Pp4Mq4,
  -p1 + q -> xPp3Pq4,
  p2 + p4 + q -> xq
};

(* unique |k| used by each propagator *)
GcLabels4 = {xq, xMp2Pq4, xPp1Pp4Pq4, xPp1Pq4};
GqLabels4 = GcLabels4;
GALabels4 = {
  xq, xMp2Pq4, xPp1Pp4Pq4, xPp1Pq4,
  xPp1Pp2Mq4, xPp1Pp4Mq4, xPp3Pq4, xPp2Pq4, xMp3Mp4Pq4
};

(* first 9 moduli in appearance order:
   q -> xq
   -p2 + q -> xMp2Pq4
   p1 + p4 + q -> xPp1Pp4Pq4
   p1 + q -> xPp1Pq4
   p1 + p2 - q -> xPp1Pp2Mq4
   p1 + p4 - q -> xPp1Pp4Mq4
   p3 + q -> xPp3Pq4
   p2 + q -> xPp2Pq4
   -p3 - p4 + q -> xMp3Mp4Pq4
*)

(* 20 GA momenta *)
GAMomRepl4 = {
  q -> xq,
  p1 + p2 - q -> xPp1Pp2Mq4,
  p1 + p3 - q -> xq,
  p1 + p4 - q -> xPp1Pp4Mq4,
  p3 + q -> xPp3Pq4,
  -p1 - p2 + q -> xPp1Pp2Mq4,
  p3 - q -> xPp1Pq4,
  p4 + q -> xMp2Pq4,
  p2 + q -> xPp2Pq4,
  -p1 - p3 + q -> xq,
  p2 - q -> xMp2Pq4,
  -p1 - p4 + q -> xPp1Pp4Mq4,
  p1 + q -> xPp1Pq4,
  -p2 - p3 + q -> xPp1Pp4Pq4,
  p1 - q -> xPp3Pq4,
  -p2 - p4 + q -> xq,
  -p3 - p4 + q -> xMp3Mp4Pq4,
  p2 + p3 + q -> xPp1Pp4Mq4,
  -p1 + q -> xPp3Pq4,
  p2 + p4 + q -> xq
};

(* 6 Gq momenta *)
GqMomRepl4 = {
  q -> xq,
  -p2 + q -> xMp2Pq4,
  p1 + p4 + q -> xPp1Pp4Pq4,
  p1 + q -> xPp1Pq4,
  p1 + p3 + q -> xq,
  -p3 + q -> xPp1Pq4
};

(* 6 Gc momenta *)
GcMomRepl4 = {
  q -> xq,
  -p2 + q -> xMp2Pq4,
  p1 + p4 + q -> xPp1Pp4Pq4,
  p1 + q -> xPp1Pq4,
  p1 + p3 + q -> xq,
  -p3 + q -> xPp1Pq4
};

(* drop-in: replace propagator arguments by |k| labels *)
GcRepl4 = {
  Gc[q] -> Gc[xq], dGc[q] -> dGc[xq],
  Gc[-p2 + q] -> Gc[xMp2Pq4],
  Gc[p1 + p4 + q] -> Gc[xPp1Pp4Pq4],
  Gc[p1 + q] -> Gc[xPp1Pq4],
  Gc[p1 + p3 + q] -> Gc[xq],
  Gc[-p3 + q] -> Gc[xPp1Pq4]
};

GqRepl4 = {
  Gq[i_, j_, q] -> Gq[i, j, xq], dGq[i_, j_, q] -> dGq[i, j, xq],
  Gq[i_, j_, -p2 + q] -> Gq[i, j, xMp2Pq4],
  Gq[i_, j_, p1 + p4 + q] -> Gq[i, j, xPp1Pp4Pq4],
  Gq[i_, j_, p1 + q] -> Gq[i, j, xPp1Pq4],
  Gq[i_, j_, p1 + p3 + q] -> Gq[i, j, xq],
  Gq[i_, j_, -p3 + q] -> Gq[i, j, xPp1Pq4]
};

GARepl4 = {
  GA[q] -> GA[xq], dGA[q] -> dGA[xq],
  GA[p1 + p2 - q] -> GA[xPp1Pp2Mq4],
  GA[p1 + p3 - q] -> GA[xq],
  GA[p1 + p4 - q] -> GA[xPp1Pp4Mq4],
  GA[p3 + q] -> GA[xPp3Pq4],
  GA[-p1 - p2 + q] -> GA[xPp1Pp2Mq4],
  GA[p3 - q] -> GA[xPp1Pq4],
  GA[p4 + q] -> GA[xMp2Pq4],
  GA[p2 + q] -> GA[xPp2Pq4],
  GA[-p1 - p3 + q] -> GA[xq],
  GA[p2 - q] -> GA[xMp2Pq4],
  GA[-p1 - p4 + q] -> GA[xPp1Pp4Mq4],
  GA[p1 + q] -> GA[xPp1Pq4],
  GA[-p2 - p3 + q] -> GA[xPp1Pp4Pq4],
  GA[p1 - q] -> GA[xPp3Pq4],
  GA[-p2 - p4 + q] -> GA[xq],
  GA[-p3 - p4 + q] -> GA[xMp3Mp4Pq4],
  GA[p2 + p3 + q] -> GA[xPp1Pp4Mq4],
  GA[-p1 + q] -> GA[xPp3Pq4],
  GA[p2 + p4 + q] -> GA[xq]
};

(* Dressing-function replacements for the 32 propagator momenta.
   RHS = head + first-seen |k| label (xq, xMp2Pq4, ...).
   dR* only on the q-line (regulator insertion). *)
paraRepl = {
   (*gluon prop*)
   dRA[q] -> dRAxq,
   ZA[q] -> ZAxq, RA[q] -> RAxq,
   ZA[p1 + p2 - q] -> ZAxPp1Pp2Mq4, RA[p1 + p2 - q] -> RAxPp1Pp2Mq4,
   ZA[p1 + p3 - q] -> ZAxq, RA[p1 + p3 - q] -> RAxq,
   ZA[p1 + p4 - q] -> ZAxPp1Pp4Mq4, RA[p1 + p4 - q] -> RAxPp1Pp4Mq4,
   ZA[p3 + q] -> ZAxPp3Pq4, RA[p3 + q] -> RAxPp3Pq4,
   ZA[-p1 - p2 + q] -> ZAxPp1Pp2Mq4, RA[-p1 - p2 + q] -> RAxPp1Pp2Mq4,
   ZA[p3 - q] -> ZAxPp1Pq4, RA[p3 - q] -> RAxPp1Pq4,
   ZA[p4 + q] -> ZAxMp2Pq4, RA[p4 + q] -> RAxMp2Pq4,
   ZA[p2 + q] -> ZAxPp2Pq4, RA[p2 + q] -> RAxPp2Pq4,
   ZA[-p1 - p3 + q] -> ZAxq, RA[-p1 - p3 + q] -> RAxq,
   ZA[p2 - q] -> ZAxMp2Pq4, RA[p2 - q] -> RAxMp2Pq4,
   ZA[-p1 - p4 + q] -> ZAxPp1Pp4Mq4, RA[-p1 - p4 + q] -> RAxPp1Pp4Mq4,
   ZA[p1 + q] -> ZAxPp1Pq4, RA[p1 + q] -> RAxPp1Pq4,
   ZA[-p2 - p3 + q] -> ZAxPp1Pp4Pq4, RA[-p2 - p3 + q] -> RAxPp1Pp4Pq4,
   ZA[p1 - q] -> ZAxPp3Pq4, RA[p1 - q] -> RAxPp3Pq4,
   ZA[-p2 - p4 + q] -> ZAxq, RA[-p2 - p4 + q] -> RAxq,
   ZA[-p3 - p4 + q] -> ZAxMp3Mp4Pq4, RA[-p3 - p4 + q] -> RAxMp3Mp4Pq4,
   ZA[p2 + p3 + q] -> ZAxPp1Pp4Mq4, RA[p2 + p3 + q] -> RAxPp1Pp4Mq4,
   ZA[-p1 + q] -> ZAxPp3Pq4, RA[-p1 + q] -> RAxPp3Pq4,
   ZA[p2 + p4 + q] -> ZAxq, RA[p2 + p4 + q] -> RAxq,
   
   (*ghost prop*)
   dRc[q] -> dRcxq,
   Zc[q] -> Zcxq, Rc[q] -> Rcxq,
   Zc[-p2 + q] -> ZcxMp2Pq4, Rc[-p2 + q] -> RcxMp2Pq4,
   Zc[p1 + p4 + q] -> ZcxPp1Pp4Pq4, Rc[p1 + p4 + q] -> RcxPp1Pp4Pq4,
   Zc[p1 + q] -> ZcxPp1Pq4, Rc[p1 + q] -> RcxPp1Pq4,
   Zc[p1 + p3 + q] -> Zcxq, Rc[p1 + p3 + q] -> Rcxq,
   Zc[-p3 + q] -> ZcxPp1Pq4, Rc[-p3 + q] -> RcxPp1Pq4,
   
   (*quark prop*)
   dRq[q] -> dRqxq,
   Zq[q] -> Zqxq, mq[q] -> mqxq, Rq[q] -> Rqxq,
   Zq[-p2 + q] -> ZqxMp2Pq4, mq[-p2 + q] -> mqxMp2Pq4,
   Rq[-p2 + q] -> RqxMp2Pq4,
   Zq[p1 + p4 + q] -> ZqxPp1Pp4Pq4, mq[p1 + p4 + q] -> mqxPp1Pp4Pq4,
   Rq[p1 + p4 + q] -> RqxPp1Pp4Pq4,
   Zq[p1 + q] -> ZqxPp1Pq4, mq[p1 + q] -> mqxPp1Pq4, Rq[p1 + q] -> RqxPp1Pq4,
   Zq[p1 + p3 + q] -> Zqxq, mq[p1 + p3 + q] -> mqxq, Rq[p1 + p3 + q] -> Rqxq,
   Zq[-p3 + q] -> ZqxPp1Pq4, mq[-p3 + q] -> mqxPp1Pq4,
   Rq[-p3 + q] -> RqxPp1Pq4
   };
paraRepl4 = paraRepl;
