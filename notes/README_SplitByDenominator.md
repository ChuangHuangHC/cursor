# Split by denominator (long-expression safe)

Mathematica helpers that split a sum into sub-terms **grouped by denominator**.

Rule: addends with the same denominator form **one** term. A complicated numerator (with its own `+`) still counts as that one term.

## Why `GroupTermsByDenominator[expr]` comes back unevaluated

That return value means **the function definition is not in the kernel**, not that the formula was “too long for the pattern”.

Typical chain with the original notebook:

1. Definition + `ClearAll` + heavy `Print` of every sub-term live in **one** giant cell.
2. A long `expr` makes `Print` / `Together` freeze the front end or exhaust memory.
3. You `Abort`, or the kernel **restarts**. All definitions and `expr = ...` are gone.
4. Re-running only the call cell yields the literal `GroupTermsByDenominator[expr]`.

Quick check after a failure:

```wolfram
DownValues[GroupTermsByDenominator]   (* {}  => need to reload *)
OwnValues[expr]                       (* {}  => need to reassign expr *)
```

Then reload the definition **alone** (never bundle `ClearAll` with a huge test run):

```wolfram
<< "notes/GroupTermsByDenominator.wl"
```

## Recommended API (drop-in for the notebook)

```wolfram
<< "notes/GroupTermsByDenominator.wl"

expr = yourLongSum;          (* keep assignment in its own cell *)
g = GroupTermsByDenominator[expr];  (* Verbose -> False by default *)
resultN[1]
resultN[2]

(* optional safety valve — returns $Failed instead of hanging forever *)
GroupTermsByDenominator[expr, TimeLimit -> 60]
```

Notes:

- `Verbose -> False` by default; when `True`, prints use `Short` / `LeafCount`, not the full formula.
- Calling `GroupTermsByDenominator[expr]` where `expr` is a Symbol that holds the sum is supported.
- Do **not** put `ClearAll[GroupTermsByDenominator]` in the same cell as a long evaluation.

## Association-style API

```wolfram
<< "notes/SplitByDenominator.wl"

r = SplitByDenominator[yourLongExpr];
r["Count"]
r["Terms"]
r["Denominators"]

PrintSplitTerms[yourLongExpr]
VerifySplitByDenominator[yourLongExpr]
```

`HoldAll` preserves `(x+y)/b` as one addend. Symbol arguments with OwnValues are auto-evaluated once. Optional `"NormalizeDenominator" -> True` and `TimeLimit -> 60`.

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
