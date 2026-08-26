(* ::Package:: *)
(* SimplifyByDenominator: GroupTermsByDenominator + per-term Simplify + Sum *)

ClearAll[GroupTermsByDenominator, clearResultN, SimplifyByDenominator];

SetAttributes[GroupTermsByDenominator, HoldAll];
Options[GroupTermsByDenominator] = {
  Verbose -> False,
  TimeLimit -> Infinity,
  "NormalizeDenominator" -> False
};

clearResultN[] := Quiet[ClearAll[resultN]];

GroupTermsByDenominator[sym_Symbol /; OwnValues[sym] =!= {},
    opts : OptionsPattern[]] :=
  GroupTermsByDenominator[Evaluate[sym], opts];

GroupTermsByDenominator[expr_, opts : OptionsPattern[]] :=
  Module[{verbose, timeLimit, normalize, terms, assoc, order, d, t,
    grouped, n, i, j, body, result},
   verbose = TrueQ[OptionValue[Verbose]];
   timeLimit = OptionValue[TimeLimit];
   normalize = TrueQ[OptionValue["NormalizeDenominator"]];
   body := (
     clearResultN[];
     terms = If[Head[Unevaluated[expr]] === Plus,
       List @@ Unevaluated[expr], {Unevaluated[expr]}];
     terms = ReleaseHold /@ (Hold /@ terms);
     assoc = <||>;
     order = {};
     Do[
      t = terms[[j]];
      d = Denominator[Together[t]];
      If[normalize, d = Factor[d]];
      If[! KeyExistsQ[assoc, d],
       AppendTo[order, d];
       assoc[d] = t;,
       assoc[d] = assoc[d] + t;
       ],
      {j, Length[terms]}
      ];
     grouped = Table[{d, Together[assoc[d]]}, {d, order}];
     n = Length[grouped];
     Do[resultN[i] = grouped[[i, 2]], {i, 1, n}];
     If[verbose,
      Print["子项数 = ", n];
      Do[Print["resultN[", i, "] = ", Short[resultN[i], 3]], {i, 1, n}];
      ];
     grouped
     );
   If[timeLimit === Infinity,
    body,
    result = TimeConstrained[body, timeLimit, $Failed];
    If[result === $Failed,
     Message[GroupTermsByDenominator::timeout, timeLimit];
     $Failed,
     result]
    ]
   ];

GroupTermsByDenominator::timeout = "超时 `1` 秒，请加大 TimeLimit。";


(* ================================================================== *)
(* SimplifyByDenominator                                              *)
(*   1) GroupTermsByDenominator                                       *)
(*   2) Simplify each resultN[i] in place                             *)
(*   3) Sum the simplified terms (optional final Simplify)            *)
(* ================================================================== *)

SetAttributes[SimplifyByDenominator, HoldAll];
Options[SimplifyByDenominator] = {
  Verbose -> False,
  TimeLimit -> Infinity,
  "NormalizeDenominator" -> False,
  (* Whether to Simplify the Sum once more after merging *)
  "FinalSimplify" -> True,
  (* Extra options forwarded to Simplify, e.g. Assumptions -> ... *)
  "SimplifyOptions" -> {}
};

SimplifyByDenominator::timeout = "超时 `1` 秒，请加大 TimeLimit。";
SimplifyByDenominator::groupfail = "GroupTermsByDenominator 失败，返回 $Failed。";

SimplifyByDenominator[sym_Symbol /; OwnValues[sym] =!= {},
    opts : OptionsPattern[]] :=
  SimplifyByDenominator[Evaluate[sym], opts];

SimplifyByDenominator[expr_, opts : OptionsPattern[]] :=
  Module[{verbose, finalQ, simpOpts, groupOpts, grouped, n, i, result,
    t0, t1},
   verbose = TrueQ[OptionValue[Verbose]];
   finalQ = TrueQ[OptionValue["FinalSimplify"]];
   simpOpts = OptionValue["SimplifyOptions"];
   If[! ListQ[simpOpts], simpOpts = {simpOpts}];
   groupOpts = FilterRules[
     {
      Verbose -> False, (* per-term progress printed below *)
      TimeLimit -> OptionValue[TimeLimit],
      "NormalizeDenominator" -> OptionValue["NormalizeDenominator"]
      },
     Options[GroupTermsByDenominator]
     ];

   t0 = AbsoluteTiming[
     grouped = GroupTermsByDenominator[expr, Sequence @@ groupOpts]
     ];
   If[grouped === $Failed,
    Message[SimplifyByDenominator::groupfail];
    Return[$Failed]
    ];
   n = Length[grouped];
   If[verbose,
    Print["分组完成：", n, " 项，用时 ", t0[[1]], " s"];
    ];

   t1 = AbsoluteTiming[
     Do[
      resultN[i] = Simplify[resultN[i], Sequence @@ simpOpts];
      If[verbose,
       Print["已简化 resultN[", i, "/", n, "]"]
       ];,
      {i, 1, n}
      ];
     result = Sum[resultN[i], {i, 1, n}];
     If[finalQ,
      result = Simplify[result, Sequence @@ simpOpts]
      ];
     result
     ];
   If[verbose,
    Print["逐项 Simplify + Sum", If[finalQ, " + FinalSimplify", ""],
     " 用时 ", t1[[1]], " s"];
    ];
   t1[[2]]
   ];
