# cursor

## `UltraSimplify.wl`

```wolfram
Get["UltraSimplify.wl"]

UltraSimplify[expr]
UltraSimplify[expr, TimeLimit -> 18000]
```

Pipeline (silent, like built-in `Simplify`):

1. Group terms that share a denominator (`GroupTermsByDenominator`)
2. `Simplify` each group
3. `Sum` / `Total`
4. `Simplify` again

Works for any number of groups. No printing. No coordinate substitutions.
