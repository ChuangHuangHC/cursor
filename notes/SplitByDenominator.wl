(* ::Package:: *)
(*
  SplitByDenominator
  ------------------
  Split a (possibly huge) Mathematica sum into sub-terms grouped by
  denominator.  Addends that share the same denominator are merged into
  ONE term, even when the numerator itself contains Plus.

  Example
    In[1]:= SplitByDenominator[a/b + (x + y + z)/b + (p + q)/c + r]
    Out[1]= <|
      "Terms" -> {(a + x + y + z)/b, (p + q)/c, r},
      "Count" -> 3,
      "Denominators" -> {b, c, 1}
    |>

  HoldAll keeps the input structure so that (x+y)/b is still one addend
  with denominator b (not expanded into x/b + y/b before grouping).
  Even if Mathematica has already expanded the sum, grouping by
  Denominator still reconstitutes the same merged terms.

  If you call SplitByDenominator[expr] where expr is a Symbol whose
  OwnValue is the sum, that OwnValue is evaluated once automatically
  (otherwise HoldAll would treat the Symbol as a single opaque term).

  Usage
    << "notes/SplitByDenominator.wl"
    r = SplitByDenominator[yourLongExpr];
    r["Count"]
    r["Terms"]
    PrintSplitTerms[yourLongExpr]
    VerifySplitByDenominator[yourLongExpr]
*)

ClearAll[
  SplitByDenominator,
  heldTopPlusTerms,
  denomKeyOf,
  PrintSplitTerms,
  VerifySplitByDenominator
];

SetAttributes[SplitByDenominator, HoldAll];
SetAttributes[PrintSplitTerms, HoldAll];
SetAttributes[VerifySplitByDenominator, HoldAll];

Options[SplitByDenominator] = {
  (* Factor denominators before comparing keys, so 1/(x-1) and -1/(1-x)
     can share a group after Factor+Together normalization. *)
  "NormalizeDenominator" -> False,
  (* seconds; Infinity disables. On timeout returns <|"Failed"->True,...|> *)
  TimeLimit -> Infinity
};

(* Top-level Plus addends, each wrapped in Hold to preserve structure. *)
heldTopPlusTerms[Hold[Plus[terms___]]] := Map[Hold, Unevaluated[{terms}]];
heldTopPlusTerms[Hold[term_]] := {Hold[term]};

denomKeyOf[den_, True] := Factor[Together[den]];
denomKeyOf[den_, False] := Together[den];

(* Evaluate Symbol OwnValues so SplitByDenominator[expr] works. *)
SplitByDenominator[sym_Symbol /; OwnValues[sym] =!= {}, opts : OptionsPattern[]] :=
  SplitByDenominator[Evaluate[sym], opts];

PrintSplitTerms[sym_Symbol /; OwnValues[sym] =!= {}, opts : OptionsPattern[SplitByDenominator]] :=
  PrintSplitTerms[Evaluate[sym], opts];

VerifySplitByDenominator[sym_Symbol /; OwnValues[sym] =!= {}, opts : OptionsPattern[SplitByDenominator]] :=
  VerifySplitByDenominator[Evaluate[sym], opts];

(* Main entry: returns Association with Terms / Count / Denominators. *)
SplitByDenominator[expr_, opts : OptionsPattern[]] := Module[
  {
    heldTerms, normalize, timeLimit, groups, order, den, num, key,
    termsOut, densOut, body, result
  },
  normalize = TrueQ[OptionValue["NormalizeDenominator"]];
  timeLimit = OptionValue[TimeLimit];

  body := (
    heldTerms = heldTopPlusTerms[Hold[expr]];
    groups = <||>;
    order = {};

    Do[
      With[{released = ReleaseHold[h]},
        den = Denominator[Together[released]];
        num = Numerator[Together[released]];
        key = denomKeyOf[den, normalize];
        If[! KeyExistsQ[groups, key],
          AppendTo[order, key];
          groups[key] = num;
          ,
          groups[key] = groups[key] + num;
        ];
      ],
      {h, heldTerms}
    ];

    densOut = order;
    termsOut = Table[Together[groups[k]/k], {k, order}];

    <|
      "Terms" -> termsOut,
      "Count" -> Length[termsOut],
      "Denominators" -> densOut
    |>
  );

  If[timeLimit === Infinity,
    body
    ,
    result = TimeConstrained[body, timeLimit, $Failed];
    If[result === $Failed,
      <|"Failed" -> True, "TimeLimit" -> timeLimit, "Count" -> 0,
        "Terms" -> {}, "Denominators" -> {}|>
      ,
      result
    ]
  ]
];

(* Pretty-print ordered sub-terms and the count. Uses Short for safety. *)
PrintSplitTerms[expr_, opts : OptionsPattern[SplitByDenominator]] := Module[
  {r, i},
  r = SplitByDenominator[expr, opts];
  If[TrueQ[Lookup[r, "Failed", False]],
    Print["FAILED: timed out after ", r["TimeLimit"], " s"];
    Return[r]
  ];
  Print["Count = ", r["Count"]];
  Do[
    Print["  [", i, "]  denom = ", Short[r["Denominators"][[i]], 3],
      "   ->   ", Short[r["Terms"][[i]], 3],
      "   (LeafCount=", LeafCount[r["Terms"][[i]]], ")"],
    {i, r["Count"]}
  ];
  r
];

(* Verification: merged terms sum back to the original expression. *)
VerifySplitByDenominator[expr_, opts : OptionsPattern[SplitByDenominator]] := Module[
  {r, reconstructed, ok},
  r = SplitByDenominator[expr, opts];
  If[TrueQ[Lookup[r, "Failed", False]],
    Return[<|
      "Failed" -> True,
      "Count" -> 0,
      "Terms" -> {},
      "Denominators" -> {},
      "SumEqualsOriginal" -> False,
      "Difference" -> $Failed
    |>]
  ];
  reconstructed = Total[r["Terms"]];
  ok = TrueQ[PossibleZeroQ[Simplify[reconstructed - (expr)]]];
  <|
    "Count" -> r["Count"],
    "Terms" -> r["Terms"],
    "Denominators" -> r["Denominators"],
    "SumEqualsOriginal" -> ok,
    "Difference" -> Simplify[reconstructed - (expr)]
  |>
];
