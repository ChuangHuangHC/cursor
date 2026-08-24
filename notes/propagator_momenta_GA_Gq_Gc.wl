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

(* first 9 moduli in appearance order *)
mod1 = q;                 (* Aa Gc[q] *)
mod2 = -p2 + q;           (* Aa Gc[-p2+q] *)
mod3 = p1 + p4 + q;       (* Aa Gc[p1+p4+q] *)
mod4 = p1 + q;            (* Aa Gc[p1+q] *)
mod5 = p1 + p2 - q;       (* Ad GA[p1+p2-q] *)
mod6 = p1 + p4 - q;       (* Af GA[p1+p4-q] *)
mod7 = p3 + q;            (* Ag GA[p3+q] *)
mod8 = p2 + q;            (* Ah GA[p2+q] *)
mod9 = -p3 - p4 + q;      (* Al GA[-p3-p4+q] *)

(* every single-point momentum -> first-seen representative *)
allMomToFirst9 = {
  q -> mod1,
  -p2 + q -> mod2,
  p1 + p4 + q -> mod3,
  p1 + q -> mod4,
  p1 + p3 + q -> mod1,
  -p3 + q -> mod4,
  p1 + p2 - q -> mod5,
  p1 + p3 - q -> mod1,
  p1 + p4 - q -> mod6,
  p3 + q -> mod7,
  -p1 - p2 + q -> mod5,
  p3 - q -> mod4,
  p4 + q -> mod2,
  p2 + q -> mod8,
  -p1 - p3 + q -> mod1,
  p2 - q -> mod2,
  -p1 - p4 + q -> mod6,
  -p2 - p3 + q -> mod3,
  p1 - q -> mod7,
  -p2 - p4 + q -> mod1,
  -p3 - p4 + q -> mod9,
  p2 + p3 + q -> mod6,
  -p1 + q -> mod7,
  p2 + p4 + q -> mod1
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
