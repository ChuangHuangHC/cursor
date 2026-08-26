(* ::Package:: *)
(* UltraSimplify: group by denominator → Simplify each → Sum → Simplify *)

ClearAll[GroupTermsByDenominator, clearResultN, UltraSimplify];

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
(* UltraSimplify                                                      *)
(*   GroupTermsByDenominator → Simplify each group → Sum → Simplify   *)
(*   Silent; arbitrary number of groups; no domain-specific rules.    *)
(* ================================================================== *)

SetAttributes[UltraSimplify, HoldAll];
Options[UltraSimplify] = {
  TimeLimit -> Infinity,
  "NormalizeDenominator" -> False
};

UltraSimplify::groupfail = "GroupTermsByDenominator failed.";

UltraSimplify[sym_Symbol /; OwnValues[sym] =!= {},
    opts : OptionsPattern[]] :=
  UltraSimplify[Evaluate[sym], opts];

UltraSimplify[expr_, opts : OptionsPattern[]] :=
  Module[{grouped, parts},
   grouped = GroupTermsByDenominator[expr,
     TimeLimit -> OptionValue[TimeLimit],
     "NormalizeDenominator" -> OptionValue["NormalizeDenominator"]
     ];
   If[grouped === $Failed,
    Message[UltraSimplify::groupfail];
    Return[$Failed]
    ];
   parts = Table[
     Simplify[grouped[[i, 2]]],
     {i, Length[grouped]}
     ];
   Simplify[Total[parts]]
   ];
