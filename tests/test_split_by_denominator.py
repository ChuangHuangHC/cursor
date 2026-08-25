#!/usr/bin/env python3
"""
Verification suite for split_by_denominator (SymPy stand-in for the
Mathematica SplitByDenominator.wl helper).

Run:
  python3 tests/test_split_by_denominator.py
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "notes"))

from split_by_denominator import (  # noqa: E402
    split_by_denominator,
    verify_split_by_denominator,
)
from sympy import Integer, simplify, symbols, together  # noqa: E402


a, b, c, p, q, r, x, y, z = symbols("a b c p q r x y z")


class TestSplitByDenominator(unittest.TestCase):
    def test_merge_same_denominator(self):
        """Same denominator -> one term; complex numerator stays one term."""
        terms = [a / b, (x + y + z) / b, (p + q) / c, r]
        result = split_by_denominator(
            a / b + (x + y + z) / b + (p + q) / c + r,
            terms=terms,
        )
        self.assertEqual(result["Count"], 3)
        self.assertEqual(
            [together(t) for t in result["Terms"]],
            [together((a + x + y + z) / b), together((p + q) / c), r],
        )
        self.assertEqual(result["Denominators"], [b, c, Integer(1)])

    def test_sum_equals_original(self):
        expr = a / b + (x + y + z) / b + (p + q) / c + r
        terms = [a / b, (x + y + z) / b, (p + q) / c, r]
        v = verify_split_by_denominator(expr, terms=terms)
        self.assertTrue(v["SumEqualsOriginal"])
        self.assertEqual(v["Difference"], 0)
        self.assertEqual(v["Count"], 3)

    def test_already_expanded_rational(self):
        """Even if (x+y)/a became x/a + y/a, group back to one term."""
        # SymPy may keep (x+y)/a intact; force separate addends via terms=.
        terms = [x / a, y / a, z / a]
        result = split_by_denominator(x / a + y / a + z / a, terms=terms)
        self.assertEqual(result["Count"], 1)
        self.assertEqual(simplify(result["Terms"][0] - (x + y + z) / a), 0)

    def test_pure_polynomial_single_group(self):
        """No denominators (all denom=1) -> a single term."""
        expr = x**2 + y + z
        result = split_by_denominator(expr)
        self.assertEqual(result["Count"], 1)
        self.assertEqual(simplify(result["Terms"][0] - expr), 0)
        self.assertEqual(result["Denominators"], [Integer(1)])

    def test_order_follows_first_seen_denominator(self):
        terms = [1 / c, 1 / a, 1 / c, 1 / b]
        result = split_by_denominator(
            1 / c + 1 / a + 1 / c + 1 / b,
            terms=terms,
        )
        self.assertEqual(result["Count"], 3)
        self.assertEqual(result["Denominators"], [c, a, b])
        self.assertEqual(
            [together(t) for t in result["Terms"]],
            [together(2 / c), together(1 / a), together(1 / b)],
        )

    def test_single_term(self):
        result = split_by_denominator((x + y) / a)
        self.assertEqual(result["Count"], 1)
        self.assertEqual(simplify(result["Terms"][0] - (x + y) / a), 0)

    def test_normalize_denominator_option(self):
        # Without normalize, (x-1) and Factor form still match after together
        # for this simple case; check the option path does not break equality.
        expr = 1 / (x - 1) + x / (x - 1)
        v = verify_split_by_denominator(expr, normalize_denominator=True)
        self.assertTrue(v["SumEqualsOriginal"])
        self.assertEqual(v["Count"], 1)


class TestVerificationHarness(unittest.TestCase):
    def test_report_fields(self):
        v = verify_split_by_denominator(
            "a/b + (x+y)/b + r",
            terms=["a/b", "(x+y)/b", "r"],
        )
        self.assertIn("Terms", v)
        self.assertIn("Count", v)
        self.assertIn("Denominators", v)
        self.assertIn("SumEqualsOriginal", v)
        self.assertIn("Difference", v)
        self.assertEqual(v["Count"], 2)
        self.assertTrue(v["SumEqualsOriginal"])


if __name__ == "__main__":
    unittest.main(verbosity=2)
