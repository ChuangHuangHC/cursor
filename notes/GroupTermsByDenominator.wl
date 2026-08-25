(* ::Package:: *)
(*
  GroupTermsByDenominator.wl
  --------------------------
  Drop-in replacement for the notebook helper that groups a sum by
  Denominator, merges same-denominator addends with Together, and
  assigns resultN[i].

  Why the original "stops working" on long formulas
  -------------------------------------------------
  Mathematica returning the literal
      GroupTermsByDenominator[expr]
  means the DownValue is GONE (kernel restart / Abort after ClearAll),
  not that the pattern failed on long input. Long input usually:

    1. Triggers huge Print of every sub-term  -> frontend freezes
    2. Or blows memory inside Together         -> kernel quits & restarts
    3. After restart, both the definition and OwnValues of `expr` are lost
    4. Re-evaluating only the call cell prints GroupTermsByDenominator[expr]

  This file avoids that failure mode:
    - definition is standalone (no ClearAll bundled with heavy tests)
    - Verbose -> False by default (no Print of huge expressions)
    - O(n) Association grouping (no repeated Select over all pairs)
    - accepts either a raw sum or a Symbol that OwnValue-holds a sum
    - optional TimeConstrained so a hard case returns $Failed instead of
      taking the kernel down

  Usage
    << "notes/GroupTermsByDenominator.wl"

    expr = yourLongSum;
    grouped = GroupTermsByDenominator[expr];   (* also fills resultN[i] *)
    resultN[1]
    resultN[2]

    GroupTermsByDenominator[expr, Verbose -> False, TimeLimit -> 60]
*)

ClearAll[
  GroupTermsByDenominator,
  GroupTermsByDenominator::timeout,
  clearResultN
];

SetAttributes[GroupTermsByDenominator, HoldAll];

Options[GroupTermsByDenominator] = {
  Verbose -> False,
  (* seconds; Infinity disables the cap *)
  TimeLimit -> Infinity,
  (* Factor denominators before comparing, so (1-x) vs (x-1) can merge *)
  "NormalizeDenominator" -> False
};

clearResultN[] := Quiet[ClearAll[resultN]];

(* If the user wrote GroupTermsByDenominator[expr] where expr is a Symbol
   holding the sum, evaluate that OwnValue once so we see the Plus. *)
GroupTermsByDenominator[sym_Symbol /; OwnValues[sym] =!= {}, opts : OptionsPattern[]] :=
  GroupTermsByDenominator[Evaluate[sym], opts];

GroupTermsByDenominator[expr_, opts : OptionsPattern[]] := Module[
  {
    verbose, timeLimit, normalize,
    terms, assoc, order, d, t, grouped, n, i, body, result
  },
  verbose = TrueQ[OptionValue[Verbose]];
  timeLimit = OptionValue[TimeLimit];
  normalize = TrueQ[OptionValue["NormalizeDenominator"]];

  body := (
    clearResultN[];

    (* Split top-level Plus without prematurely flattening structure. *)
    terms = If[Head[Unevaluated[expr]] === Plus,
      List @@ Unevaluated[expr],
      {Unevaluated[expr]}
    ];
    terms = ReleaseHold /@ (Hold /@ terms);

    assoc = <||>;
    order = {};
    Do[
      t = terms[[j]];
      d = Denominator[Together[t]];
      If[normalize, d = Factor[d]];
      If[! KeyExistsQ[assoc, d],
        AppendTo[order, d];
        assoc[d] = t;
        ,
        assoc[d] = assoc[d] + t;
      ],
      {j, Length[terms]}
    ];

    grouped = Table[{d, Together[assoc[d]]}, {d, order}];
    n = Length[grouped];
    Do[resultN[i] = grouped[[i, 2]], {i, 1, n}];

    If[verbose,
      Print["=========================================="];
      Print["【分组结果】"];
      Print["表达式共有 ", n, " 个不同分母的子项"];
      Print["------------------------------------------"];
      Do[
        Print["子项 ", i, ":"];
        Print["  分母 = ", Short[grouped[[i, 1]], 3]];
        Print["  表达式 = ", Short[grouped[[i, 2]], 3]];
        Print["  LeafCount(expr) = ", LeafCount[grouped[[i, 2]]]];
        Print["  已赋值给: resultN[", i, "]"];
        Print["------------------------------------------"],
        {i, 1, n}
      ];
      Print["=========================================="];
    ];

    grouped
  );

  If[timeLimit === Infinity,
    body
    ,
    result = TimeConstrained[body, timeLimit, $Failed];
    If[result === $Failed,
      Message[GroupTermsByDenominator::timeout, timeLimit];
      $Failed
      ,
      result
    ]
  ]
];

GroupTermsByDenominator::timeout =
  "Grouping aborted after `1` seconds (TimeLimit). Kernel kept alive; \
definition still loaded. Raise TimeLimit or simplify the input.";
