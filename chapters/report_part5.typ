#import "../template.typ": book, corollary, definition, lemma, proof, proposition, remark
#import "../prelude.typ": *

= fractionnal contextuality is equivalent to half distance

The previous sections introduced the past/future product $d^- d^+$ as a dynamic measure of tension between what has been emitted and what remains to be closed. We now show that this construction recovers, as a first coordinate, the contextual fraction of Abramsky, Barbosa, and Mansfield @Abramsky_Barbosa_Mansfield_2016. The goal is to translate their entire argument into the integer counting setting and to show that the two frameworks coincide at the level of the non-contextual part.

== Step 0: The probabilistic setting (recap)

In the standard sheaf-theoretic approach, an empirical model is a compatible family of probability distributions
$
  e = (e_C)_(C in cal(M)),
  quad e_C in cal(D)_(RR_(>=0)) (cal(E)(C)),
  quad sum_(s in cal(E)(C)) e_C (s) = 1.
$
Compatibility means $e_C|_(C inter D) = e_D|_(C inter D)$ for all contexts $C, D$. A global section $g : X -> O$ is *consistent* with $e$ if $e_C(g|_C) > 0$ for every context $C$. The set of consistent global sections is
$
  S_e (X) = { g in cal(E)(X) | forall C in cal(M), e_C (g|_C) > 0 }.
$
When $S_e (X) = emptyset$, the model is strongly contextual: no single global assignment is compatible with the support of every context.

== Step 1: Relaxing to a fraction (probabilistic)

If no global section explains the entire model, one can ask whether a global section explains a *fraction* of it.

#definition(name: [Global sections consistent with a fraction $r$], id: "def:Se-geq-r")[
  For $r in (0,1]$, define
  $
    S_e^(>= r) (X) = { g in cal(E)(X) | forall C in cal(M), e_C (g|_C) >= r }.
  $
  A global section $g in S_e^(>= r) (X)$ is one whose restriction to each context has probability at least $r$.
]

The sets form an anti-monotone family: if $r <= r'$, then $S_e^(>= r)(X) supset.eq S_e^(>= r')(X)$. Their union recovers the possibilistic notion:
$
  union.big_(r in (0,1]) S_e^(>= r)(X) = S_e (X).
$

The key observation is that a global section in $S_e^(>= r)(X)$ can explain away a fraction $r$ of the model.

#proposition(name: [Decomposition via a consistent fraction], id: "prop:decomposition-fraction")[
  If $g in S_e^(>= r)(X)$, then $e$ admits a convex decomposition
  $
    e = r delta_g + (1-r) e'
  $
  where $delta_g$ is the deterministic model at $g$ and $e'$ is another empirical model.
]

#proof[
  At each context $C$, since $e_C(g|_C) >= r$, we can write
  $
    e_C = r delta_(g|_C) + (1-r) e'_C
  $
  where $e'_C = (e_C - r delta_(g|_C)) / (1-r)$ is a well-defined distribution because $e_C(g|_C) >= r$ ensures non-negativity. Compatibility of $e$ and linearity of the no-signaling condition imply that $e'$ is also compatible.
]

This says: a fraction $r$ of the model is explained by the classical history $g$. The remainder $(1-r)$ is another model $e'$.

== Step 2: The overlap problem

Now suppose we find *two* global sections:

- $g_1 in S_e^(>= r_1)(X)$, explaining a fraction $r_1$;
- $g_2 in S_e^(>= r_2)(X)$, explaining a fraction $r_2$.

Can we combine them to explain a fraction $r_1 + r_2$?

$
  e ?^= r_1 delta_(g_1) + r_2 delta_(g_2) + (1 - r_1 - r_2) e''.
$

The answer is *no*, in general. The problem is that $g_1$ and $g_2$ may explain the *same part* of the model. If both assign the same local outcome $s$ in a context $C$, and $e_C(s) = 0.6$, then $r_1 = 0.4$ and $r_2 = 0.4$ would require $r_1 + r_2 = 0.8 > 0.6 = e_C(s)$, which is impossible. The explanations *overlap*.

In the possibilistic case, this is harmless: $1 or 1 = 1$. In the probabilistic case, $0.4 + 0.4 = 0.8 > 0.6$: double counting is real.

== Step 3: The solution --- subdistributions

To handle overlap, Abramsky, Barbosa, and Mansfield introduce *subdistributions*: functions whose weights sum to *at most* $1$, instead of exactly $1$.

#definition(name: [Subdistribution], id: "def:subdistribution")[
  An *$RR$-subdistribution* on a set $S$ is a function $c : S -> RR_(>=0)$ with finite support and total weight
  $
    omega(c) = sum_(s in S) c(s) <= 1.
  $
  The weight $omega(c)$ is the fraction of the model explained by $c$.
]

The subdistribution framework allows multiple global sections to be combined without exceeding the probability of any local event.

#definition(name: [Consistent subdistributions], id: "def:Ce")[
  The set of *consistent subdistributions* is
  $
    C_e (X) = { c in cal(S)cal(D)_(RR_(>=0)) (cal(E)(X)) | forall C in cal(M), forall s in cal(E)(C), e_C(s) >= c|_C (s) }.
  $
  The condition $e_C(s) >= c|_C(s)$ means: the mass that $c$ places on global assignments restricting to $s$ must not exceed the probability that $e$ gives to $s$.
]

This condition prevents double counting: if two global sections $g_1$ and $g_2$ both restrict to $s$ in context $C$, then $c(g_1) + c(g_2) <= e_C(s)$.

#proposition(name: [Decomposition via a consistent subdistribution], id: "prop:decomposition-subdistribution")[
  If $c in C_e(X)$, then
  $
    e = (sum_(g in cal(E)(X)) c(g) delta_g) + (1 - omega(c)) e'.
  $
  This decomposes $e$ into a non-contextual part of weight $omega(c)$ and a remainder $e'$.
]

#proof[
  At each context $C$ and each local outcome $s in cal(E)(C)$, the constraint $e_C(s) >= sum_{g|_C = s} c(g)$ ensures that
  $
    e_C(s) - sum_(g|_C = s) c(g) >= 0.
  $
  The remainder, normalized by $1 - omega(c)$, defines $e'_C(s)$. Compatibility follows from linearity.
]

== Step 4: The non-contextual fraction

The *non-contextual fraction* of $e$ is the maximum weight achievable by a consistent subdistribution:

$
  "NCF"(e) = max { omega(c) | c in C_e(X) }.
$

The *contextual fraction* is

$
  "CF"(e) = 1 - "NCF"(e).
$

This maximum exists because $C_e(X)$ is closed and bounded in $RR^(|cal(E)(X)|)$, hence compact by Heine--Borel, and $omega$ is continuous.

The dual linear program produces a Bell inequality whose normalised violation by $e$ equals $"CF"(e)$. Thus the contextual fraction is both a measure of non-classicality and a witness of Bell violation.

== Step 5: Translation to integer counts

We now translate the entire construction into the integer counting setting. Let $N in NN^V$ be a compatible integer counting of level $t$. The normalized model is $e_N = N / t$.

#definition(name: [Integer consistent subcountings], id: "def:CN")[
  The set of *consistent subcountings* is
  $
    C_N (X) = { z in NN^(cal(E)(X)) | forall C in cal(M), forall s in cal(E)(C), sum_(g|_C = s) z(g) <= N_C (s) }.
  $
  Equivalently, in matrix form:
  $
    C_N (X) = { z in NN^(cal(E)(X)) | M z <= N },
  $
  where $M$ is the incidence matrix with $M_((C,s),g) = 1$ if $g|_C = s$ and $0$ otherwise.
]

The weight of a subcounting $z$ is $omega(z) = sum_g z(g) = bold(1)^tack.t z$.

#proposition(name: [Integer decomposition], id: "prop:integer-decomposition")[
  If $z in C_N(X)$, then
  $
    N = M z + R
  $
  where $R = N - M z >= 0$. Here $M z$ is the *closed part* (a combination of deterministic global sections) and $R$ is the *open part* (the residue not yet explained by classical histories).
]

#proof[
  By definition, $M z <= N$ componentwise, so $R = N - M z >= 0$. The matrix $M z$ is compatible because each column of $M$ is a deterministic model, and compatibility is preserved under non-negative integer combinations.
]

This decomposition is the integer analogue of Proposition~@prop:decomposition-subdistribution. It says exactly what the dynamic framework says: an observation $N$ splits into a closed part $M z$ (stabilized, non-contextual) and an open part $R$ (still in progress, potentially contextual).

== Step 6: The first coordinate recovers the contextual fraction

We now state the main theorem linking the two frameworks.

#proposition(name: [The closed deficit equals the contextual fraction], id: "thm:closed-deficit-equals-CF")[
  Let $N in NN^V$ be a compatible integer counting of level $t$, and let $e_N = N / t$. Define the *closed deficit* as the minimal mass not explained by deterministic global sections:
  $
    D^-(N) := min_(z in C_N(X)) |N - M z|_1.
  $
  Then
  $
    D^-(N) = |N|_1 dot "CF"(e_N).
  $
  Equivalently,
  $
    (D^-(N)) / (|N|_1) = "CF"(e_N).
  $
]

#proof[
  Since $M z <= N$, we have $|N - M z|_1 = |N|_1 - |M z|_1$. Each column of $M$ has exactly $|cal(M)|$ entries equal to $1$ (one per context), so $|M z|_1 = |cal(M)| dot bold(1)^tack.t z$. Also $|N|_1 = |cal(M)| t$. Therefore:
  $
    D^-(N) = |cal(M)| t - |cal(M)| max_(z in C_N(X)) bold(1)^tack.t z = |cal(M)| (t - max_(z in C_N(X)) bold(1)^tack.t z).
  $
  Now set $c = z / t$. The constraint $M z <= N$ becomes $M c <= N / t = e_N$. Hence
  $
    max_(z in C_N(X)) bold(1)^tack.t z = t max_(c >= 0, M c <= e_N) bold(1)^tack.t c = t dot "NCF"(e_N).
  $
  Substituting:
  $
    D^-(N) = |cal(M)| t (1 - "NCF"(e_N)) = |N|_1 dot "CF"(e_N).
  $
]

This theorem says: the minimal mass of a compatible counting that cannot be explained by deterministic global sections is *exactly* the contextual fraction of the normalized model, multiplied by the total count.

== Step 7: The dynamic enrichment

The sheaf-theoretic framework stops at the contextual fraction: it measures *how much* of the model is non-classical. The dynamic framework adds a second layer: it measures *how far* the non-classical residue is from being closed.

For a dynamic state $eta$ explaining $N$, the past/future distances are
$
  d^-_eta = |N - P_eta|_1, quad d^+_eta = |F_eta - N|_1,
$
where $P_eta = M z$ is the closed part and $F_eta = P_eta + sum_((g,R) in O_eta) g$ is the completed part.

When the closed part is *maximized* (i.e. $z$ solves the LP above), we have
$
  d^-_eta = D^-(N) = |N|_1 dot "CF"(e_N).
$
Thus the first coordinate of the dynamic measure recovers the contextual fraction exactly. The second coordinate, $d^+_eta$, measures the additional cost of completing the non-contextual residue:
$
  d^+_eta = |F_eta - N|_1 = |sum_((g,R) in O_eta) R|_1.
$

The product $d^-_eta d^+_eta$ is therefore
$
  d^-_eta d^+_eta
  =
  underbrace(|N|_1 dot "CF"(e_N), "contextual fraction (sheaf theory)")
  dot
  underbrace(d^+_eta, "completion cost (dynamic)").
$
The first factor is purely static: it depends only on the model $e_N$. The second factor is dynamic: it depends on the choice of generators, the residuals, and the degree of openness of the explanation.

#figure(
  table(
    columns: 3,
    align: center,
    inset: 8pt,
    table.header([Quantity], [Origin], [What it measures]),
    [$"CF"(e_N)$], [Sheaf theory], [Fraction non-explained by global sections],
    [$D^-(N) / |N|_1$], [Dynamic (closed part)], [Same quantity, integer version],
    [$d^+_eta$], [Dynamic (open part)], [Cost to complete the non-classical residue],
    [$d^-_eta d^+_eta$], [Dynamic (product)], [Tension between past and future],
  ),
  caption: [Decomposition of the dynamic measure. The first coordinate recovers the contextual fraction; the second adds the completion cost.],
) <tab:decomposition-measure>

== Step 8: The overlap problem in the integer setting

The integer setting has exactly the same overlap problem as the probabilistic one, but now with counts instead of probabilities.

Consider a context $C$ with $N_C(s_1) = 6$ and $N_C(s_2) = 4$ (so $t = 10$). Suppose two global sections $g_1$ and $g_2$ both restrict to $s_1$ in context $C$. If we naively assign $z(g_1) = 4$ and $z(g_2) = 4$, the total mass on $s_1$ is $4 + 4 = 8 > 6 = N_C(s_1)$. This is impossible: we are trying to explain $8$ occurrences of an event that was only observed $6$ times.

The constraint $sum_{g|_C = s} z(g) <= N_C(s)$ in the definition of $C_N(X)$ prevents exactly this. It is the integer analogue of the subdistribution condition $e_C(s) >= c|_C(s)$.

In the possibilistic case, $1 or 1 = 1$: double counting is harmless. In the integer case, $4 + 4 = 8 > 6$: double counting is real and must be controlled.

== Step 9: Summary of the correspondence

The following table summarizes the parallel between the probabilistic and integer frameworks.

#figure(
  table(
    columns: 3,
    align: center,
    inset: 6pt,
    table.header([Sheaf theory (probabilistic)], [Our framework (integer)], [Relationship]),
    [$e_C in cal(D)_(RR)(cal(E)(C))$], [$N_C in NN^(cal(E)(C))$], [$e_C = N_C / t$],
    [$sum_s e_C(s) = 1$], [$sum_s N_C(s) = t$], [normalization],
    [$S_e^(>= r)(X)$], [$S_N^(>= r)(X)$], [same definition],
    [$e = r delta_g + (1-r)e'$], [$N = r delta_g + R$], [fractional decomposition],
    [$C_e(X) = {c : M c <= e}$], [$C_N(X) = {z : M z <= N}$], [$c = z / t$],
    [$e = sum c(g) delta_g + (1-omega(e))e'$], [$N = M z + R$], [subdistribution decomposition],
    [$"NCF"(e) = max omega(c)$], [$"NCF"(e_N) = max bold(1)^tack.t z / t$], [same LP],
    [$"CF"(e) = 1 - "NCF"(e)$], [$D^-(N) / |N|_1 = "CF"(e_N)$], [#strong[main theorem]],
  ),
  caption: [Complete correspondence between the probabilistic sheaf-theoretic framework and the integer counting framework.],
) <tab:correspondence>

The last row is the main result: the normalized closed deficit in the integer framework equals the contextual fraction in the probabilistic framework. The two measures are the same quantity, seen from two sides of the normalization barrier.
