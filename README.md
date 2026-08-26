# cursor

Mathematica helpers for simplifying large rational sums by grouping terms that share a denominator.

## `SimplifyByDenominator.wl`

Load in a notebook:

```wolfram
Get["/path/to/SimplifyByDenominator.wl"]
```

### One-shot simplify (recommended)

```wolfram
SimplifyByDenominator[expr]
SimplifyByDenominator[expr, TimeLimit -> 18000, Verbose -> True]
SimplifyByDenominator[expr, "FinalSimplify" -> False]
SimplifyByDenominator[expr, "SimplifyOptions" -> {Assumptions -> p > 0}]
```

Pipeline inside:

1. `GroupTermsByDenominator` — merge terms with the same denominator into `resultN[i]`
2. `Simplify` each `resultN[i]` in place
3. `Sum` the simplified pieces (optional final `Simplify`)

### Lower-level grouping only

```wolfram
grouped = GroupTermsByDenominator[expr, TimeLimit -> 18000];
resultN[1] (* … *)
```
