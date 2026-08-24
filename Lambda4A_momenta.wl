(* ::Package:: *)
(*
  Lambda4A 图中出现的单点动量（传播子动量），按 GA / Gq / Gc 分类。

  约定：
  - 只提取传播子 GA, dGA, Gq, dGq, Gc, dGc 的动量宗量；
    PiPerp / delta / 顶点函数的动量不计入单点动量。
  - Gq 的前两个指标为 Dirac 指标，第三宗量为动量。
  - 列表中动量按“书写原样”去重；GA/Gc 另给 p <-> -p 等价的约化列表
    （胶子/鬼传播子通常只依赖 p^2）。夸克传播子因 slash p 结构保留符号。
*)

ClearAll[
  momGA, momGq, momGc,
  momGAUniqueModSign, momGcUniqueModSign,
  momGAByDiagram, momGqByDiagram, momGcByDiagram,
  dMomGAByDiagram, dMomGqByDiagram, dMomGcByDiagram
];

(* ============================================================ *)
(* 一、按类型汇总：出现过的全部单点动量（书写原样，去重）        *)
(* ============================================================ *)

(* --- 胶子传播子 GA / dGA --- *)
momGA = {
  q,
  p1 + q, p1 - q, -p1 + q,
  p2 + q, p2 - q,
  p3 + q, p3 - q,
  p4 + q,
  p1 + p2 - q, -p1 - p2 + q,
  p1 + p3 - q, -p1 - p3 + q,
  p1 + p4 - q, -p1 - p4 + q,
  -p2 - p3 + q,
  -p2 - p4 + q,
  -p3 - p4 + q,
  p2 + p3 + q,
  p2 + p4 + q
};

(* 取 p ~ -p 后的独立胶子动量（共 16 个） *)
momGAUniqueModSign = {
  q,
  p1 + q, p1 - q,
  p2 + q, p2 - q,
  p3 + q, p3 - q,
  p4 + q,
  p1 + p2 - q,
  p1 + p3 - q,
  p1 + p4 - q,
  p2 + p3 - q,   (* 来自 -p2 - p3 + q *)
  p2 + p4 - q,   (* 来自 -p2 - p4 + q *)
  p3 + p4 - q,   (* 来自 -p3 - p4 + q *)
  p2 + p3 + q,
  p2 + p4 + q
};

(* --- 夸克传播子 Gq / dGq --- *)
(* 拓扑与 4*ccA 鬼圈相同，但 Dirac 结构要求保留动量符号 *)
momGq = {
  q,
  -p2 + q,
  -p3 + q,
  p1 + q,
  p1 + p3 + q,
  p1 + p4 + q
};

(* --- 鬼传播子 Gc / dGc --- *)
momGc = {
  q,
  -p2 + q,
  -p3 + q,
  p1 + q,
  p1 + p3 + q,
  p1 + p4 + q
};

momGcUniqueModSign = {
  q,
  p1 + q,
  p2 - q,        (* 来自 -p2 + q *)
  p3 - q,        (* 来自 -p3 + q *)
  p1 + p3 + q,
  p1 + p4 + q
};

(* ============================================================ *)
(* 二、按图分类：每张图上的传播子动量                            *)
(* ============================================================ *)

(* ---------- 4*ccA  鬼圈（四条鬼传播子） ---------- *)

momGcByDiagram = <|
  "Lambda4Aa" -> {q, -p2 + q, p1 + p4 + q, p1 + q},
  "Lambda4Ab" -> {q, -p2 + q, p1 + p3 + q, p1 + q},
  "Lambda4Ac" -> {q, -p3 + q, p1 + p4 + q, p1 + q}
|>;

dMomGcByDiagram = <|
  "dLambda4Aa" -> {q},
  "dLambda4Ab" -> {q},
  "dLambda4Ac" -> {q}
|>;

(* ---------- 2*4A  两条四胶子顶点 ---------- *)

momGAByDiagram = <|
  "Lambda4Ad" -> {q, p1 + p2 - q},
  "Lambda4Ae" -> {q, p1 + p3 - q},
  "Lambda4Af" -> {q, p1 + p4 - q},

  (* ---------- 1*4A + 2*3A ---------- *)
  "Lambda4Ag"  -> {q, p3 + q, -p1 - p2 + q},
  "dLambda4Ag2" -> {p3 - q, p4 + q},
  "Lambda4Ah"  -> {q, p2 + q, -p1 - p3 + q},
  "dLambda4Ah2" -> {p2 - q, p4 + q},
  "Lambda4Ai"  -> {q, p2 + q, -p1 - p4 + q},
  "dLambda4Ai2" -> {p2 - q, p3 + q},
  "Lambda4Aj"  -> {q, p1 + q, -p2 - p3 + q},
  "dLambda4Aj2" -> {p1 - q, p4 + q},
  "Lambda4Ak"  -> {q, p1 + q, -p2 - p4 + q},
  "dLambda4Ak2" -> {p1 - q, p3 + q},
  "Lambda4Al"  -> {q, p1 + q, -p3 - p4 + q},
  "dLambda4Al2" -> {p1 - q, p2 + q},

  (* ---------- 4*3A  四条三胶子顶点 ---------- *)
  "Lambda4Am" -> {q, p2 + q, p2 + p3 + q, -p1 + q},
  "Lambda4An" -> {q, p2 + q, p2 + p4 + q, -p1 + q},
  "Lambda4Ao" -> {q, p3 + q, p2 + p3 + q, -p1 + q}
|>;

dMomGAByDiagram = <|
  "dLambda4Ad"  -> {q},
  "dLambda4Ae"  -> {q},
  "dLambda4Af"  -> {q},
  "dLambda4Ag1" -> {q},
  "dLambda4Ag2" -> {q},
  "dLambda4Ah1" -> {q},
  "dLambda4Ah2" -> {q},
  "dLambda4Ai1" -> {q},
  "dLambda4Ai2" -> {q},
  "dLambda4Aj1" -> {q},
  "dLambda4Aj2" -> {q},
  "dLambda4Ak1" -> {q},
  "dLambda4Ak2" -> {q},
  "dLambda4Al1" -> {q},
  "dLambda4Al2" -> {q},
  "dLambda4Am"  -> {q},
  "dLambda4An"  -> {q},
  "dLambda4Ao"  -> {q}
|>;

(* ---------- 4*qqA  夸克圈（四条夸克传播子） ---------- *)

momGqByDiagram = <|
  "Lambda4Ap" -> {q, -p2 + q, p1 + p4 + q, p1 + q},
  "Lambda4Aq" -> {q, -p2 + q, p1 + p3 + q, p1 + q},
  "Lambda4Ar" -> {q, -p3 + q, p1 + p4 + q, p1 + q}
|>;

dMomGqByDiagram = <|
  "dLambda4Ap" -> {q},
  "dLambda4Aq" -> {q},
  "dLambda4Ar" -> {q}
|>;
