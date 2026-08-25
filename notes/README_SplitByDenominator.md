# SplitByDenominator

Mathematica helper that splits a long sum into sub-terms **grouped by denominator**.

Rule: addends with the same denominator form **one** term. A complicated numerator (with its own `+`) still counts as that one term.

## Mathematica

```wolfram
<< "notes/SplitByDenominator.wl"

r = SplitByDenominator[a/b + (x + y + z)/b + (p + q)/c + r];
r["Count"]          (* 3 *)
r["Terms"]          (* {(a+x+y+z)/b, (p+q)/c, r} *)
r["Denominators"]   (* {b, c, 1} *)

PrintSplitTerms[a/b + (x + y + z)/b + (p + q)/c + r]
VerifySplitByDenominator[a/b + (x + y + z)/b + (p + q)/c + r]
```

`SplitByDenominator` has attribute `HoldAll`, so `(x+y)/b` is kept as one addend before grouping. If the sum was already expanded to `x/b + y/b`, those pieces are still merged back because they share denominator `b`.

Optional:

```wolfram
SplitByDenominator[1/(x - 1) + x/(x - 1), "NormalizeDenominator" -> True]
```

Kernel self-check (when Wolfram is installed):

```bash
wolframscript -file notes/VerifySplitByDenominator.wls
```

## Python / SymPy stand-in

This environment may not have a Wolfram kernel. The same algorithm is mirrored in SymPy and covered by unit tests:

```bash
python3 notes/split_by_denominator.py
python3 tests/test_split_by_denominator.py
```

Pass an explicit `terms=[...]` list when you need first-seen denominator order (SymPy `Add` is commutative).
