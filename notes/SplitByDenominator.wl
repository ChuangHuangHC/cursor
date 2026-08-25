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
  "NormalizeDenominator" -> False
};

(* Top-level Plus addends, each wrapped in Hold to preserve structure. *)
heldTopPlusTerms[Hold[Plus[terms___]]] := Map[Hold, Unevaluated[{terms}]];
heldTopPlusTerms[Hold[term_]] := {Hold[term]};

denomKeyOf[den_, True] := Factor[Together[den]];
denomKeyOf[den_, False] := Together[den];

(* Main entry: returns Association with Terms / Count / Denominators. *)
SplitByDenominator[expr_, opts : OptionsPattern[]] := Module[
  {
    heldTerms, normalize, groups, order, den, num, key, termsOut, densOut
  },
  heldTerms = heldTopPlusTerms[Hold[expr]];
  normalize = TrueQ[OptionValue["NormalizeDenominator"]];
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
];

(* Pretty-print ordered sub-terms and the count. *)
PrintSplitTerms[expr_, opts : OptionsPattern[SplitByDenominator]] := Module[
  {r, i},
  r = SplitByDenominator[expr, opts];
  Print["Count = ", r["Count"]];
  Do[
    Print["  [", i, "]  denom = ", r["Denominators"][[i]],
      "   ->   ", r["Terms"][[i]]],
    {i, r["Count"]}
  ];
  r
];

(* Verification: merged terms sum back to the original expression. *)
VerifySplitByDenominator[expr_, opts : OptionsPattern[SplitByDenominator]] := Module[
  {r, reconstructed, ok},
  r = SplitByDenominator[expr, opts];
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
