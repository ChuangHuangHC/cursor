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

Counted **by propagator** this is **20 + 6 + 6 = 32** momenta (GA and Gq/Gc share `q`, `p1+q` algebraically, so the unique-expression union is 24). Below every one of the 32 is rewritten by the first nine moduli.

The 4 Gq/Gc labels are a subset of the 9 GA labels (`xq`, `xMp2Pq4`, `xPp1Pp4Pq4`, `xPp1Pq4`). GA uses all 9.

---

## All 32 momenta rewritten by the first 9 moduli

4A kinematics: \(p_1=-p_3\), \(p_2=-p_4\). Independent quantity is \(|k|\). Naming: `q -> xq`; otherwise `x` then `P`/`M` for each \(\pm\) term, then trailing `4`. First nine **new** moduli in appearance order:

```
q -> xq
-p2 + q -> xMp2Pq4
p1 + p4 + q -> xPp1Pp4Pq4
p1 + q -> xPp1Pq4
p1 + p2 - q -> xPp1Pp2Mq4
p1 + p4 - q -> xPp1Pp4Mq4
p3 + q -> xPp3Pq4
p2 + q -> xPp2Pq4
-p3 - p4 + q -> xMp3Mp4Pq4
```

The 32 propagator momenta (20 GA + 6 Gq + 6 Gc) mapped onto those nine:

**GA (20)**

```
q -> xq
p1 + p2 - q -> xPp1Pp2Mq4
p1 + p3 - q -> xq
p1 + p4 - q -> xPp1Pp4Mq4
p3 + q -> xPp3Pq4
-p1 - p2 + q -> xPp1Pp2Mq4
p3 - q -> xPp1Pq4
p4 + q -> xMp2Pq4
p2 + q -> xPp2Pq4
-p1 - p3 + q -> xq
p2 - q -> xMp2Pq4
-p1 - p4 + q -> xPp1Pp4Mq4
p1 + q -> xPp1Pq4
-p2 - p3 + q -> xPp1Pp4Pq4
p1 - q -> xPp3Pq4
-p2 - p4 + q -> xq
-p3 - p4 + q -> xMp3Mp4Pq4
p2 + p3 + q -> xPp1Pp4Mq4
-p1 + q -> xPp3Pq4
p2 + p4 + q -> xq
```

**Gq (6)**

```
q -> xq
-p2 + q -> xMp2Pq4
p1 + p4 + q -> xPp1Pp4Pq4
p1 + q -> xPp1Pq4
p1 + p3 + q -> xq
-p3 + q -> xPp1Pq4
```

**Gc (6)**

```
q -> xq
-p2 + q -> xMp2Pq4
p1 + p4 + q -> xPp1Pp4Pq4
p1 + q -> xPp1Pq4
p1 + p3 + q -> xq
-p3 + q -> xPp1Pq4
```

Grouped by representative:

```
xq            :  q,  p1 + p3 + q,  p1 + p3 - q,  -p1 - p3 + q,  -p2 - p4 + q,  p2 + p4 + q
xMp2Pq4       :  -p2 + q,  p4 + q,  p2 - q
xPp1Pp4Pq4    :  p1 + p4 + q,  -p2 - p3 + q
xPp1Pq4       :  p1 + q,  -p3 + q,  p3 - q
xPp1Pp2Mq4    :  p1 + p2 - q,  -p1 - p2 + q
xPp1Pp4Mq4    :  p1 + p4 - q,  -p1 - p4 + q,  p2 + p3 + q
xPp3Pq4       :  p3 + q,  p1 - q,  -p1 + q
xPp2Pq4       :  p2 + q
xMp3Mp4Pq4    :  -p3 - p4 + q
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

Nine moduli as `momentum4` assignments (paraRepl4 names): [`nine_moduli_momentum4.wl`](nine_moduli_momentum4.wl).

```
xq = momentum4[q]
xMp2Pq4 = momentum4[-p2 + q]
xPp1Mp2Pq4 = momentum4[p1 - p2 + q]
xPp1Pq4 = momentum4[p1 + q]
xPp1Pp2Mq4 = momentum4[p1 + p2 - q]
xPp1Mp4Mq4 = momentum4[p1 + p4 - q]
xMp1Pq4 = momentum4[-p1 + q]
xPp2Pq4 = momentum4[p2 + q]
xPp1Pp2Pq4 = momentum4[p1 + p2 + q]
```

---

## `paraRepl` for the 32 momenta

Dressing functions use the same nine labels (`ZA`/`RA` on the 20 GA arguments, `Zc`/`Rc` on the 6 Gc arguments, `Zq`/`mq`/`Rq` on the 6 Gq arguments). `dR*` only on `q`.

```
paraRepl = {
   (*gluon prop*)
   dRA[q] -> dRAxq,
   ZA[q] -> ZAxq, RA[q] -> RAxq,
   ZA[p1 + p2 - q] -> ZAxPp1Pp2Mq4, RA[p1 + p2 - q] -> RAxPp1Pp2Mq4,
   ZA[p1 + p3 - q] -> ZAxq, RA[p1 + p3 - q] -> RAxq,
   ZA[p1 + p4 - q] -> ZAxPp1Pp4Mq4, RA[p1 + p4 - q] -> RAxPp1Pp4Mq4,
   ZA[p3 + q] -> ZAxPp3Pq4, RA[p3 + q] -> RAxPp3Pq4,
   ZA[-p1 - p2 + q] -> ZAxPp1Pp2Mq4, RA[-p1 - p2 + q] -> RAxPp1Pp2Mq4,
   ZA[p3 - q] -> ZAxPp1Pq4, RA[p3 - q] -> RAxPp1Pq4,
   ZA[p4 + q] -> ZAxMp2Pq4, RA[p4 + q] -> RAxMp2Pq4,
   ZA[p2 + q] -> ZAxPp2Pq4, RA[p2 + q] -> RAxPp2Pq4,
   ZA[-p1 - p3 + q] -> ZAxq, RA[-p1 - p3 + q] -> RAxq,
   ZA[p2 - q] -> ZAxMp2Pq4, RA[p2 - q] -> RAxMp2Pq4,
   ZA[-p1 - p4 + q] -> ZAxPp1Pp4Mq4, RA[-p1 - p4 + q] -> RAxPp1Pp4Mq4,
   ZA[p1 + q] -> ZAxPp1Pq4, RA[p1 + q] -> RAxPp1Pq4,
   ZA[-p2 - p3 + q] -> ZAxPp1Pp4Pq4, RA[-p2 - p3 + q] -> RAxPp1Pp4Pq4,
   ZA[p1 - q] -> ZAxPp3Pq4, RA[p1 - q] -> RAxPp3Pq4,
   ZA[-p2 - p4 + q] -> ZAxq, RA[-p2 - p4 + q] -> RAxq,
   ZA[-p3 - p4 + q] -> ZAxMp3Mp4Pq4, RA[-p3 - p4 + q] -> RAxMp3Mp4Pq4,
   ZA[p2 + p3 + q] -> ZAxPp1Pp4Mq4, RA[p2 + p3 + q] -> RAxPp1Pp4Mq4,
   ZA[-p1 + q] -> ZAxPp3Pq4, RA[-p1 + q] -> RAxPp3Pq4,
   ZA[p2 + p4 + q] -> ZAxq, RA[p2 + p4 + q] -> RAxq,
   
   (*ghost prop*)
   dRc[q] -> dRcxq,
   Zc[q] -> Zcxq, Rc[q] -> Rcxq,
   Zc[-p2 + q] -> ZcxMp2Pq4, Rc[-p2 + q] -> RcxMp2Pq4,
   Zc[p1 + p4 + q] -> ZcxPp1Pp4Pq4, Rc[p1 + p4 + q] -> RcxPp1Pp4Pq4,
   Zc[p1 + q] -> ZcxPp1Pq4, Rc[p1 + q] -> RcxPp1Pq4,
   Zc[p1 + p3 + q] -> Zcxq, Rc[p1 + p3 + q] -> Rcxq,
   Zc[-p3 + q] -> ZcxPp1Pq4, Rc[-p3 + q] -> RcxPp1Pq4,
   
   (*quark prop*)
   dRq[q] -> dRqxq,
   Zq[q] -> Zqxq, mq[q] -> mqxq, Rq[q] -> Rqxq,
   Zq[-p2 + q] -> ZqxMp2Pq4, mq[-p2 + q] -> mqxMp2Pq4,
   Rq[-p2 + q] -> RqxMp2Pq4,
   Zq[p1 + p4 + q] -> ZqxPp1Pp4Pq4, mq[p1 + p4 + q] -> mqxPp1Pp4Pq4,
   Rq[p1 + p4 + q] -> RqxPp1Pp4Pq4,
   Zq[p1 + q] -> ZqxPp1Pq4, mq[p1 + q] -> mqxPp1Pq4, Rq[p1 + q] -> RqxPp1Pq4,
   Zq[p1 + p3 + q] -> Zqxq, mq[p1 + p3 + q] -> mqxq, Rq[p1 + p3 + q] -> Rqxq,
   Zq[-p3 + q] -> ZqxPp1Pq4, mq[-p3 + q] -> mqxPp1Pq4,
   Rq[-p3 + q] -> RqxPp1Pq4
   };
```
