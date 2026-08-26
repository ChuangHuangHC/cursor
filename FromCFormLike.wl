(* ::Package:: *)
(* Convert CForm-like text Power(...)/sin(...)/cos(...) into a Mathematica expression *)

ClearAll[FromCFormLike];

Options[FromCFormLike] = {
  (* Turn 8., 352., 0.0007102272727272727 into exact rationals when safe *)
  "Rationalize" -> True,
  "RationalizeTolerance" -> 0
};

FromCFormLike[str_String, opts : OptionsPattern[]] := Module[
  {chars, n, i, out, stack, s, expr, tol, doRat},
  chars = Characters[str];
  n = Length[chars];
  i = 1;
  out = {};
  stack = {};
  While[i <= n,
    If[i + 5 <= n && StringJoin[chars[[i ;; i + 5]]] === "Power(",
      AppendTo[out, "Power["]; AppendTo[stack, "f"]; i += 6; Continue[]
    ];
    If[i + 4 <= n && StringJoin[chars[[i ;; i + 4]]] === "Sqrt(",
      AppendTo[out, "Sqrt["]; AppendTo[stack, "f"]; i += 5; Continue[]
    ];
    If[i + 3 <= n && StringJoin[chars[[i ;; i + 3]]] === "sin(",
      AppendTo[out, "Sin["]; AppendTo[stack, "f"]; i += 4; Continue[]
    ];
    If[i + 3 <= n && StringJoin[chars[[i ;; i + 3]]] === "cos(",
      AppendTo[out, "Cos["]; AppendTo[stack, "f"]; i += 4; Continue[]
    ];
    Which[
      chars[[i]] === "(",
        AppendTo[out, "("]; AppendTo[stack, "p"]; i++,
      chars[[i]] === ")",
        If[Length[stack] > 0 && Last[stack] === "f",
          AppendTo[out, "]"]; stack = Most[stack],
          AppendTo[out, ")"];
          If[Length[stack] > 0 && Last[stack] === "p", stack = Most[stack]]
        ];
        i++,
      True,
        AppendTo[out, chars[[i]]]; i++
    ]
  ];
  s = StringJoin[out];
  expr = ToExpression[s];
  doRat = TrueQ[OptionValue["Rationalize"]];
  tol = OptionValue["RationalizeTolerance"];
  If[doRat, expr = Rationalize[expr, tol]];
  expr
];
