# Four-gluon triangle regulator correction

## Organisational principle of the note

The Hard QCD Note builds every flow in two layers:

1. **Topology + external-leg distribution.** Inequivalent assignments of external legs are written once as undifferentiated $\Lambda$ diagrams.
2. **Regulator insertion.** $\partial\Lambda$ puts $\otimes$ on one internal line (routed to carry loop momentum $q$). Insertions related by a loop-momentum shift are absorbed into a multiplicity; insertions that change which vertices bound the regulated line are written separately (same pattern as $\partial\Lambda^{\bar{c}cA}_{a_1,a_2,a_3}$).

## Bug in the original Sec. 2.6

For the gluon triangle (one $A_4$ + two $A_3$) the three internal lines are **not** equivalent:

| Line type | Count | Related by $q$-shift? |
|-----------|-------|------------------------|
| $A_4$–$A_3$ | 2 | yes |
| $A_3$–$A_3$ | 1 | no (different adjacent vertices) |

The original text used a single representative $\partial\Lambda^{4A}_{g,\ldots,l}$ with multiplicity **3**. That incorrectly identifies the $A_3$–$A_3$ insertion with the $A_4$–$A_3$ insertion.

## Correction

- Keep $\partial\Lambda^{4A}_{g_1,\ldots,l_1}$ = original $\partial\Lambda^{4A}_{g,\ldots,l}$ (regulator on an $A_4$–$A_3$ line), multiplicity **2**.
- Add $\partial\Lambda^{4A}_{g_2,\ldots,l_2}$ with regulator on the $A_3$–$A_3$ line (momentum routed to $q$), multiplicity **1**.
- Total triangle weight remains $2\times 6 + 1\times 6 = 18$; the one-loop sum $24+3+18+12+24$ is unchanged.

Full replacement text and equations: [`four_gluon_triangle_regulator_correction.tex`](four_gluon_triangle_regulator_correction.tex).
