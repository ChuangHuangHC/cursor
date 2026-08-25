(* ::Package:: *)
(*
  VerifySplitByDenominator.wls
  ----------------------------
  Mathematica verification script for SplitByDenominator.

  Run (requires a Wolfram kernel):
    wolframscript -file notes/VerifySplitByDenominator.wls

  If wolframscript is unavailable, use the SymPy suite instead:
    python3 tests/test_split_by_denominator.py
*)

SetDirectory[DirectoryName[$InputFileName]];
Get["SplitByDenominator.wl"];

pass = 0;
fail = 0;

check[label_, cond_] := (
  If[TrueQ[cond],
    pass++; Print["  PASS  ", label],
    fail++; Print["  FAIL  ", label]
  ]
);

Print["=== SplitByDenominator verification ==="];

Module[{res, v},
  (* 1. Same denominator merges; complex numerator stays one term. *)
  res = SplitByDenominator[a/b + (x + y + z)/b + (p + q)/c + r];
  check["count is 3", res["Count"] === 3];
  check["first denom is b", Simplify[res["Denominators"][[1]] - b] === 0];

  (* 2. Reconstruction equals original. *)
  v = VerifySplitByDenominator[a/b + (x + y + z)/b + (p + q)/c + r];
  check["sum equals original", v["SumEqualsOriginal"]];

  (* 3. Expanded rationals regroup. *)
  res = SplitByDenominator[x/a + y/a + z/a];
  check["expanded x/a+y/a+z/a -> 1 term", res["Count"] === 1];
  check[
    "merged numerator",
    PossibleZeroQ[Simplify[res["Terms"][[1]] - (x + y + z)/a]]
  ];

  (* 4. Pure polynomial -> one group (denom 1). *)
  res = SplitByDenominator[x^2 + y + z];
  check["pure polynomial count 1", res["Count"] === 1];

  (* 5. Single term. *)
  res = SplitByDenominator[(x + y)/a];
  check["single term count 1", res["Count"] === 1];

  (* 6. Symbol OwnValue must unwrap under HoldAll. *)
  Module[{expr},
    expr = a/b + (x + y)/b + r;
    res = SplitByDenominator[expr];
    check["symbol argument count 2", res["Count"] === 2];
  ];

  (* 7. Many repeated denominators stay O(groups), not a kernel death. *)
  Module[{expr, n = 300},
    expr = Total[Table[k/(a + Mod[k, 3]), {k, 1, n}]];
    res = SplitByDenominator[Evaluate[expr]];
    check["long sum groups == 3", res["Count"] === 3];
  ];
];

(* Compatibility loader for the notebook drop-in. *)
Get["GroupTermsByDenominator.wl"];
Module[{g, expr},
  expr = a/x + b/(x + 1) + c/(x + 1);
  g = GroupTermsByDenominator[expr];
  check["GroupTermsByDenominator count 2", Length[g] === 2];
  check["resultN[1] assigned", Head[resultN[1]] =!= resultN];
];

Print["Results: ", pass, " passed, ", fail, " failed"];
If[fail > 0, Quit[1], Quit[0]];