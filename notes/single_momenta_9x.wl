(* Single-leg momenta at the 4A point, collapsed by |k| to 9 labels.
   Naming: q -> xq; otherwise x, then P/M for each +/- term, then 4.
   Later momenta with the same |k| reuse the first-seen label. *)

(* 9 independent labels (first appearance) *)
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
