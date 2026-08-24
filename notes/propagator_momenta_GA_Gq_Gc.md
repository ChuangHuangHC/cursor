# Single-point momenta in \(\Lambda^{4A}\) / \(\partial\Lambda^{4A}\)

Extracted from the ghost box (`4*ccA`), gluon 4–4 (`2*4A`), gluon 4–3–3 (`1*4A + 2*3A`, including \(g_2\)–\(l_2\) regulator insertions), gluon 3–3–3–3 (`4*3A`), and quark box (`4*qqA`).

A **single-point momentum** is the argument of a two-point function: `GA[k]`, `dGA[k]`, `Gc[k]`, `dGc[k]`, or the last slot of `Gq[i, j, k]` / `dGq[i, j, k]`. Vertex legs and `PiPerp` projectors are not listed.

4A kinematics used only in the \(|k|\) collapse (same as `single_momenta_9x.wl`):

```
p1 = {p, 0, 0, 0} = -p3
p2 = {0, p, 0, 0} = -p4
```

Dressings depend on \(k^2\), so \(k\sim -k\) and Euclidean-equal vectors share one label.

## Summary

| propagator | diagrams | distinct as written | unique \(\lvert k\rvert\) at 4A |
|------------|----------|---------------------|----------------------------------|
| **GA** | `d–o` (+ `g2–l2`) | 20 | **9** (all `x*` labels) |
| **Gq** | `p, q, r` | 6 | **4** |
| **Gc** | `a, b, c` | 6 | **4** (same set as Gq) |

Union of as-written arguments: **24** (= 20 GA + 6 Gc/Gq − `{q, p1+q}`).

The 4 Gq/Gc labels are a subset of the 9 GA labels (`xq`, `xMp2Pq4`, `xPp1Pp4Pq4`, `xPp1Pq4`). GA uses all 9.

---

## All 24 momenta rewritten by the first 9 moduli

4A kinematics: \(p_1=-p_3\), \(p_2=-p_4\). Independent quantity is \(|k|\). The first nine **new** moduli in appearance order are the representatives:

| 模 | representative | first seen |
|----|----------------|------------|
| 1 | `q` | Aa `Gc[q]` |
| 2 | `-p2 + q` | Aa `Gc[-p2+q]` |
| 3 | `p1 + p4 + q` | Aa `Gc[p1+p4+q]` |
| 4 | `p1 + q` | Aa `Gc[p1+q]` |
| 5 | `p1 + p2 - q` | Ad `GA[p1+p2-q]` |
| 6 | `p1 + p4 - q` | Af `GA[p1+p4-q]` |
| 7 | `p3 + q` | Ag `GA[p3+q]` |
| 8 | `p2 + q` | Ah `GA[p2+q]` |
| 9 | `-p3 - p4 + q` | Al `GA[-p3-p4+q]` |

Every later argument equals one of these nine:

```
q                 = 模1
-p2 + q           = 模2
p1 + p4 + q       = 模3
p1 + q            = 模4
p1 + p3 + q       = 模1
-p3 + q           = 模4
p1 + p2 - q       = 模5
p1 + p3 - q       = 模1
p1 + p4 - q       = 模6
p3 + q            = 模7
-p1 - p2 + q      = 模5
p3 - q            = 模4
p4 + q            = 模2
p2 + q            = 模8
-p1 - p3 + q      = 模1
p2 - q            = 模2
-p1 - p4 + q      = 模6
-p2 - p3 + q      = 模3
p1 - q            = 模7
-p2 - p4 + q      = 模1
-p3 - p4 + q      = 模9
p2 + p3 + q       = 模6
-p1 + q           = 模7
p2 + p4 + q       = 模1
```

Grouped by representative:

```
模1  |q|            :  q,  p1+p3+q,  p1+p3-q,  -p1-p3+q,  -p2-p4+q,  p2+p4+q
模2  |-p2+q|        :  -p2+q,  p4+q,  p2-q
模3  |p1+p4+q|      :  p1+p4+q,  -p2-p3+q
模4  |p1+q|         :  p1+q,  -p3+q,  p3-q
模5  |p1+p2-q|      :  p1+p2-q,  -p1-p2+q
模6  |p1+p4-q|      :  p1+p4-q,  -p1-p4+q,  p2+p3+q
模7  |p3+q|         :  p3+q,  p1-q,  -p1+q
模8  |p2+q|         :  p2+q
模9  |-p3-p4+q|     :  -p3-p4+q
```

---

## Gc (ghost box `4*ccA`)

As written (6):

```
q,  -p2 + q,  p1 + p4 + q,  p1 + q,  p1 + p3 + q,  -p3 + q
```

No pair \(\{k,-k\}\) appears, so the count stays 6 under \(k\sim -k\).

| diagram | `Gc` / `dGc` arguments | \(\lvert k\rvert\) labels |
|---------|------------------------|---------------------------|
| Aa | `q`, `-p2+q`, `p1+p4+q`, `p1+q` | `xq`, `xMp2Pq4`, `xPp1Pp4Pq4`, `xPp1Pq4` |
| Ab | `q`, `-p2+q`, `p1+p3+q`, `p1+q` | `xq`, `xMp2Pq4`, `xPp1Pq4` |
| Ac | `q`, `-p3+q`, `p1+p4+q`, `p1+q` | `xq`, `xPp1Pq4`, `xPp1Pp4Pq4` |

`dLambda4A{a,b,c}` only replaces `Gc[q] → dGc[q]`; no extra momenta.

Unique 4A labels: `{xq, xMp2Pq4, xPp1Pp4Pq4, xPp1Pq4}`.

---

## Gq (quark box `4*qqA`)

Same six algebraic arguments as Gc (last slot of `Gq[i, j, k]`):

```
q,  -p2 + q,  p1 + p4 + q,  p1 + q,  p1 + p3 + q,  -p3 + q
```

| diagram | `Gq` / `dGq` momenta | \(\lvert k\rvert\) labels |
|---------|----------------------|---------------------------|
| Ap | `q`, `-p2+q`, `p1+p4+q`, `p1+q` | `xq`, `xMp2Pq4`, `xPp1Pp4Pq4`, `xPp1Pq4` |
| Aq | `q`, `-p2+q`, `p1+p3+q`, `p1+q` | `xq`, `xMp2Pq4`, `xPp1Pq4` |
| Ar | `q`, `-p3+q`, `p1+p4+q`, `p1+q` | `xq`, `xPp1Pq4`, `xPp1Pp4Pq4` |

`dLambda4A{p,q,r}` only replaces the `q`-line by `dGq`. Same 4 labels as Gc.

---

## GA (gluon diagrams `2*4A`, `1*4A+2*3A`, `4*3A`)

As written (20):

```
q,
p1 + p2 - q,  p1 + p3 - q,  p1 + p4 - q,
p3 + q,  -p1 - p2 + q,  p3 - q,  p4 + q,
p2 + q,  -p1 - p3 + q,  p2 - q,  -p1 - p4 + q,
p1 + q,  -p2 - p3 + q,  p1 - q,  -p2 - p4 + q,
-p3 - p4 + q,  p2 + p3 + q,  -p1 + q,  p2 + p4 + q
```

Under \(k\sim -k\) (GA even) this is 16:

```
q,
p1+p2-q ≡ -p1-p2+q,
p1+p3-q ≡ -p1-p3+q,
p1+p4-q ≡ -p1-p4+q,
p3+q,  p3-q,  p4+q,  p2+q,  p2-q,  p1+q,
p1-q ≡ -p1+q,
-p2-p3+q,  -p2-p4+q,  -p3-p4+q,  p2+p3+q,  p2+p4+q
```

| diagram | `GA` / `dGA` arguments | \(\lvert k\rvert\) labels |
|---------|------------------------|---------------------------|
| Ad | `q`, `p1+p2-q` | `xq`, `xPp1Pp2Mq4` |
| Ae | `q`, `p1+p3-q` | `xq` |
| Af | `q`, `p1+p4-q` | `xq`, `xPp1Pp4Mq4` |
| Ag / Ag1 | `q`, `p3+q`, `-p1-p2+q` | `xq`, `xPp3Pq4`, `xPp1Pp2Mq4` |
| Ag2 | `p3-q`, `q`, `p4+q` | `xPp1Pq4`, `xq`, `xMp2Pq4` |
| Ah / Ah1 | `q`, `p2+q`, `-p1-p3+q` | `xq`, `xPp2Pq4` |
| Ah2 | `p2-q`, `q`, `p4+q` | `xMp2Pq4`, `xq` |
| Ai / Ai1 | `q`, `p2+q`, `-p1-p4+q` | `xq`, `xPp2Pq4`, `xPp1Pp4Mq4` |
| Ai2 | `p2-q`, `q`, `p3+q` | `xMp2Pq4`, `xq`, `xPp3Pq4` |
| Aj / Aj1 | `q`, `p1+q`, `-p2-p3+q` | `xq`, `xPp1Pq4`, `xPp1Pp4Pq4` |
| Aj2 | `p1-q`, `q`, `p4+q` | `xPp3Pq4`, `xq`, `xMp2Pq4` |
| Ak / Ak1 | `q`, `p1+q`, `-p2-p4+q` | `xq`, `xPp1Pq4` |
| Ak2 | `p1-q`, `q`, `p3+q` | `xPp3Pq4`, `xq` |
| Al / Al1 | `q`, `p1+q`, `-p3-p4+q` | `xq`, `xPp1Pq4`, `xMp3Mp4Pq4` |
| Al2 | `p1-q`, `q`, `p2+q` | `xPp3Pq4`, `xq`, `xPp2Pq4` |
| Am | `q`, `p2+q`, `p2+p3+q`, `-p1+q` | `xq`, `xPp2Pq4`, `xPp1Pp4Mq4`, `xPp3Pq4` |
| An | `q`, `p2+q`, `p2+p4+q`, `-p1+q` | `xq`, `xPp2Pq4`, `xPp3Pq4` |
| Ao | `q`, `p3+q`, `p2+p3+q`, `-p1+q` | `xq`, `xPp3Pq4`, `xPp1Pp4Mq4` |

`dLambda4A{d,e,f,m,n,o}` and `*1` insertions only replace `GA[q] → dGA[q]`. The `*2` insertions keep `dGA[q]` but change the other two gluon momenta.

Unique 4A labels: all 9.

---

## 9-label dictionary (4A point)

First appearance defines the name; later equal \(\lvert k\rvert\) reuse it.

| label | representative | also equal at 4A |
|-------|----------------|------------------|
| `xq` | `q` | `p1+p3+q`, `p1+p3-q`, `-p1-p3+q`, `-p2-p4+q`, `p2+p4+q` |
| `xMp2Pq4` | `-p2+q` | `p4+q`, `p2-q` |
| `xPp1Pp4Pq4` | `p1+p4+q` | `-p2-p3+q` |
| `xPp1Pq4` | `p1+q` | `-p3+q`, `p3-q` |
| `xPp1Pp2Mq4` | `p1+p2-q` | `-p1-p2+q` |
| `xPp1Pp4Mq4` | `p1+p4-q` | `-p1-p4+q`, `p2+p3+q` |
| `xPp3Pq4` | `p3+q` | `p1-q`, `-p1+q` |
| `xPp2Pq4` | `p2+q` | |
| `xMp3Mp4Pq4` | `-p3-p4+q` | |

Lists and replacement rules: [`propagator_momenta_GA_Gq_Gc.wl`](propagator_momenta_GA_Gq_Gc.wl).
