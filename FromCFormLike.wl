(* Convert CForm-like text: Power(...), sin(...), cos(...) -> Mathematica *)
ClearAll[FromCFormLike];
FromCFormLike[str_String] := Module[{chars, n, i, out, stack, name, j},
  chars = Characters[str];
  n = Length[chars];
  i = 1;
  out = {};
  stack = {};
  While[i <= n,
    If[i + 5 <= n && StringJoin[chars[[i ;; i + 5]]] === "Power(",
      AppendTo[out, "Power["]; AppendTo[stack, "f"]; i += 6; Continue[]
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
        If[Length[stack] > 0 && stack[[-1]] === "f",
          AppendTo[out, "]"]; stack = Drop[stack, -1],
          AppendTo[out, ")"]; If[Length[stack] > 0 && stack[[-1]] === "p", stack = Drop[stack, -1]]
        ]; i++,
      True,
        AppendTo[out, chars[[i]]]; i++
    ]
  ];
  ToExpression[StringJoin[out]]
];
