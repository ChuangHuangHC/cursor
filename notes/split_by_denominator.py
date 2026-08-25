"""
split_by_denominator.py
-----------------------
Python / SymPy mirror of notes/SplitByDenominator.wl

Groups additive terms that share the same denominator into one term.
A complicated numerator still counts as a single term.

Run self-check:
  python3 notes/split_by_denominator.py
"""

from __future__ import annotations

from collections import OrderedDict
from typing import Any, Iterable, List, Optional, Sequence, Tuple, Union

from sympy import Add, Expr, Integer, factor, fraction, simplify, together
from sympy.parsing.sympy_parser import parse_expr


ExprLike = Union[str, Expr]


def _as_expr(expr: ExprLike) -> Expr:
    if isinstance(expr, Expr):
        return expr
    return parse_expr(expr, evaluate=True)


def _additive_terms(expr: Expr) -> Tuple[Expr, ...]:
    """Top-level Plus leaves (after SymPy evaluation)."""
    e = together(expr)
    if isinstance(e, Add):
        return e.args
    return (e,)


def _denom_key(den: Expr, normalize: bool) -> Expr:
    d = together(den)
    if normalize:
        return factor(d)
    return d


def split_by_denominator(
    expr: ExprLike,
    *,
    normalize_denominator: bool = False,
    terms: Optional[Sequence[ExprLike]] = None,
) -> dict:
    """
    Split ``expr`` into sub-terms grouped by denominator.

    Parameters
    ----------
    expr :
        SymPy expression or parseable string. Used both as the source of
        additive terms (unless ``terms`` is given) and as the reference
        for verification.
    normalize_denominator :
        If True, Factor denominators before comparing keys.
    terms :
        Optional explicit ordered list of addends. Use this when you need
        first-seen denominator order that matches a handwritten sum
        (SymPy's Add is commutative and may reorder).

    Returns
    -------
    dict with keys:
      Terms : list[Expr]
      Count : int
      Denominators : list[Expr]
    """
    if terms is None:
        addends: Iterable[Expr] = _additive_terms(_as_expr(expr))
    else:
        addends = (_as_expr(t) for t in terms)

    groups: "OrderedDict[Expr, Expr]" = OrderedDict()

    for t in addends:
        num, den = fraction(together(t))
        key = _denom_key(den, normalize_denominator)
        if key in groups:
            groups[key] = groups[key] + num
        else:
            groups[key] = num

    dens = list(groups.keys())
    out_terms = [together(groups[d] / d) for d in dens]
    return {
        "Terms": out_terms,
        "Count": len(out_terms),
        "Denominators": dens,
    }


def verify_split_by_denominator(
    expr: ExprLike,
    *,
    normalize_denominator: bool = False,
    terms: Optional[Sequence[ExprLike]] = None,
) -> dict:
    """Split, then check that the sum of sub-terms equals the original."""
    original = _as_expr(expr)
    result = split_by_denominator(
        original,
        normalize_denominator=normalize_denominator,
        terms=terms,
    )
    reconstructed = Add(*result["Terms"]) if result["Terms"] else Integer(0)
    diff = simplify(together(reconstructed - original))
    ok = diff == 0
    return {
        **result,
        "SumEqualsOriginal": ok,
        "Difference": diff,
    }


def print_split_terms(expr: ExprLike, **kwargs: Any) -> dict:
    r = split_by_denominator(expr, **kwargs)
    print(f"Count = {r['Count']}")
    for i, (den, term) in enumerate(zip(r["Denominators"], r["Terms"]), start=1):
        print(f"  [{i}]  denom = {den}   ->   {term}")
    return r


# ---------------------------------------------------------------------------
# Built-in demonstration (also used by the test suite)
# ---------------------------------------------------------------------------

def _demo() -> None:
    # Explicit term list preserves handwritten order: b, then c, then 1.
    terms = ["a/b", "(x + y + z)/b", "(p + q)/c", "r"]
    expr = "a/b + (x + y + z)/b + (p + q)/c + r"
    r = verify_split_by_denominator(expr, terms=terms)
    print("Example: a/b + (x+y+z)/b + (p+q)/c + r")
    print(f"  Count = {r['Count']}")
    for i, t in enumerate(r["Terms"], start=1):
        print(f"  [{i}] {t}")
    print(f"  SumEqualsOriginal = {r['SumEqualsOriginal']}")


if __name__ == "__main__":
    _demo()
