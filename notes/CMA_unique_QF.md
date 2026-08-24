# Unique CMA dressings at the chosen 4A point

```
p1 = {p,0,0,0} = -p3
p2 = {0,p,0,0} = -p4
```

CMA: permutation and overall minus of the legs are the same dressing.

## Independent QFs (kept)

| QF | representative legs |
|----|---------------------|
| lambdaccaQF1 | `{-p1-q, q, p1}` |
| lambdaccaQF2 | `{-q, -p2+q, p2}` |
| lambdaccaQF3 | `{p2-q, p1+p4+q, p3}` |
| lambdaccaQF4 | `{-p1-p4-q, p1+q, p4}` |
| lambda4aQF9 | `{p1, p2, -q, -p1-p2+q}` |
| lambda4aQF11 | `{p1, p3, -q, q}` (= `{p1,-p1,-q,q}`) |
| lambda4aQF12 | `{p2, p4, q, -q}` (= `{p2,-p2,q,-q}`) |
| lambda4aQF13 | `{p1, p4, -q, -p1-p4+q}` |
| lambda4aQF20 | `{p2, p3, -q, -p2-p3+q}` |
| lambda4aQF25 | `{p3, p4, -q, -p3-p4+q}` |
| lambda4aQF41–46 | `*2` four-gluon legs (not CMA-eq to `*1`) |
| lambda3aQF15 | `{p3, -p3-q, q}` (= `{p1, -q, q-p1}`) |
| lambda3aQF16 | `{p4, p1+p2-q, p3+q}` |
| lambda3aQF17 | `{p2, -p2-q, q}` |
| lambda3aQF19 | `{p3, p1+p4-q, p2+q}` |
| lambda3aQF21 | `{p1, -p1-q, q}` |
| lambda3aQF22 | `{p4, p2+p3-q, p1+q}` |
| lambda3aQF26 | `{p2, p3+p4-q, p1+q}` |
| lambda3aQF29 | `{p4, p1-q, p2+p3+q}` |
| lambda3aQF48 | `{p2, -q, q-p2}` |
| lambdaqqa QF33–36 | same classes as lambdacca QF1–4 |

## Dropped (mapped onto the kept label)

```
lambdaccaQF5  -> QF2
lambdaccaQF6  -> QF1
lambdaccaQF7  -> QF1
lambdaccaQF8  -> QF4
lambda4aQF10  -> QF9
lambda4aQF14  -> QF13
lambda4aQF23  -> QF12
lambda3aQF18  -> QF17
lambda3aQF24  -> QF21
lambda3aQF27  -> QF15
lambda3aQF28  -> QF19
lambda3aQF30  -> QF17
lambda3aQF31  -> QF15
lambda3aQF32  -> QF29
lambda3aQF47  -> QF21
lambda3aQF49  -> QF48
lambdaqqaQF37 -> QF34
lambdaqqaQF38 -> QF33
lambdaqqaQF39 -> QF33
lambdaqqaQF40 -> QF36
```
