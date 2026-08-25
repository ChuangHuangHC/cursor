# cursor

Helpers for grouping Mathematica sums by denominator.

See [`notes/README_SplitByDenominator.md`](notes/README_SplitByDenominator.md).

Quick start (Wolfram):

```wolfram
<< "notes/GroupTermsByDenominator.wl"
expr = yourLongSum;
GroupTermsByDenominator[expr]   (* fills resultN[i]; Verbose -> False *)
```

If a long formula makes the call return the literal `GroupTermsByDenominator[expr]`, the kernel lost the definition (usually after Abort / crash from huge `Print`). Reload the `.wl` file in its own cell, then reassign `expr`.
