#import "../template.typ": book, corollary, definition, example, lemma, proof, proposition, remark
#import "../prelude.typ": *

= fractionnal contextuality is equivalent to half distance <chap:contextual-fraction>

#v(4em)

The previous sections introduced the past/future product $d^- d^+$ as a dynamic measure of tension between what has been emitted and what remains to be closed. We now show that this construction recovers, as a first coordinate, the contextual fraction of Abramsky, Barbosa, and Mansfield @Abramsky_Barbosa_Mansfield_2016. The goal is to translate their entire argument into the integer counting setting and to show that the two frameworks coincide at the level of the non-contextual part.

In first part we will consider classical sheaf-theory setting with $R = ℝ_(>=0)$.

== Overview of @Abramsky_Barbosa_Mansfield_2016

In the standard sheaf-theoretic approach, an empirical model is a compatible family of probability distributions
$
  e = (e_C)_(C in cal(M)),
  quad e_C in cal(D)_(RR_(>=0)) (cal(E)(C)),
  quad sum_(s in cal(E)(C)) e_C (s) = 1.
$
Compatibility means $e_C|_(C inter D) = e_D|_(C inter D)$ for all contexts $C, D$. A global section $g : X -> O$ is *consistent* with $e$ if $e_C (g|_C) > 0$ for every context $C$. The set of consistent global sections is
$
  S_e (X) = { g in cal(E)(X) | forall C in cal(M), e_C (g|_C) > 0 }.
$
When $S_e (X) = emptyset$, the model is strongly contextual: no single global assignment is compatible with the support of every context.
If no global section explains the entire model, one can ask whether a global section explains a *fraction* of it.
For $r in (0,1]$, define
$
  S_e^(>= r) (X) = { g in cal(E)(X) | forall C in cal(M), e_C (g|_C) >= r }.
$
A global section $g in S_e^(>= r) (X)$ is one whose restriction to each context has probability at least $r$.
The sets form an anti-monotone family: if $r <= r'$, then $S_e^(>= r)(X) supset.eq S_e^(>= r')(X)$. Their union recovers the possibilistic notion:
$union.big_(r in (0,1]) S_e^(>= r)(X) = S_e (X)$.
The key observation is that a global section in $S_e^(>= r)(X)$ can explain away a fraction $r$ of the model.

#proposition(name: [See @Abramsky_Barbosa_Mansfield_2016[Proposition 3.2]], id: "prop:decomposition-fraction")[
  If $g in S_e^(>= r)(X)$, then $e$ admits a convex decomposition
  $e = r delta_g + (1-r) e'$
  where $delta_g ∈ 𝒟_(ℝ_(>=0)) ℰ (X)$ is the deterministic model at $g$, i.e. $δ_g (g') = cases(1 "if" g = g', 0 "otherwise")$ and $e'$ is another empirical model.
]

// #proof[
//   At each context $C$, since $e_C (g|_C) >= r$, we can write
//   $e_C = r delta_(g|_C) + (1-r) e'_C$
//   where $e'_C = (e_C - r delta_(g|_C)) / (1-r)$ is a well-defined distribution because $e_C (g|_C) >= r$ ensures non-negativity. Compatibility of $e$ and linearity of the no-signaling condition imply that $e'$ is also compatible.
// ]

This says: a fraction $r$ of the model is explained by the classical history $g$. The remainder $(1-r)$ is another model $e'$.

=== The overlap problem

Now suppose we find *two* global sections:

- $g_1 in S_e^(>= r_1)(X)$, explaining a fraction $r_1$;
- $g_2 in S_e^(>= r_2)(X)$, explaining a fraction $r_2$.

Can we combine them to explain a fraction $r_1 + r_2$ such that
$e =^? r_1 delta_(g_1) + r_2 delta_(g_2) + (1 - r_1 - r_2) e''$.

The answer is *no*, in general. The problem is that $g_1$ and $g_2$ may explain the *same part* of the model. If both assign the same local outcome $s$ in a context $C$, and $e_C (s) = 0.6$, then $r_1 = 0.4$ and $r_2 = 0.4$ would require $r_1 + r_2 = 0.8 > 0.6 = e_C (s)$, which is impossible. The explanations *overlap*.
In the possibilistic case, this is harmless: $1 or 1 = 1$. In the probabilistic case, $0.4 + 0.4 = 0.8 > 0.6$: double counting is real.

#example(name: [Why fractional sections cannot be naively added], id: "ex:overlap")[
  Consider three measurements $X = {a, b, c}$ with contexts
  $C_1 = {a,b}$, $C_2 = {b,c}$, $C_3 = {a,c}$ and outcomes $O = {0,1}$.
  The following is a compatible (no-signaling) probability model:


  #table(
    columns: 6,
    align: center,
    inset: 6pt,
    table.header([$C$], [$(0,0)$], [$(1,0)$], [$(0,1)$], [$(1,1)$], [total]),
    [${a,b}$], [$0.35$], [$0.15$], [$0.25$], [$0.25$], [$1$],
    [${b,c}$], [$0.30$], [$0.20$], [$0.10$], [$0.40$], [$1$],
    [${a,c}$], [$0.30$], [$0.10$], [$0.20$], [$0.40$], [$1$],
  )


  Pick two global sections:
  - $g_1 = (a|->0, b|->0, c|->0)$: its restrictions are $(0,0)$ in every context, with
    probabilities $0.35$, $0.30$, $0.30$. So $g_1 in S_e^(>= 0.30)(X)$.
  - $g_2 = (a|->0, b|->0, c|->1)$: its restrictions are $(0,0)$ in $C_1$,
    $(0,1)$ in $C_2$, $(0,1)$ in $C_3$, with probabilities $0.35$, $0.10$, $0.20$.
    So $g_2 in S_e^(>= 0.10)(X)$.

  Both sections are in $S_e (X)$: every restriction has positive weight.
  Each one, taken alone, yields a valid decomposition:
  $e = 0.30 delta_(g_1) + 0.70 e'$ and $e = 0.10 delta_(g_2) + 0.90 e''$.
  Now try to *combine* them:
  $e =^? 0.30 delta_(g_1) + 0.10 delta_(g_2) + 0.60 e'''$.
  At context $C_1$, both $g_1$ and $g_2$ restrict to the *same* local assignment
  $(a|->0, b|->0)$. The proposed mixture places mass
  $0.30 + 0.10 = 0.40$ on this event, but $e_(C_1)(a|->0, b|->0) = 0.35 < 0.40$.
  This forces $e'''_(C_1)(a|->0, b|->0) < 0$: *impossible*.

  The root cause is that $g_1$ and $g_2$ draw from the same local pool of probability.
  Each one individually can claim up to $0.35$ from the event $(a|->0, b|->0)$ in $C_1$,
  but not both at once. The fractional weights $r_1$ and $r_2$ are #emph[not independent]:
  they compete at shared local assignments.
]

This is the overlap problem: fractional explanations cannot simply be added because they may draw from the same pool of probability at some context. The next construction, subdistributions, is designed to prevent exactly this double counting.

=== Subdistributions

To handle overlap, @Abramsky_Barbosa_Mansfield_2016 introduce _subdistributions_: functions whose weights sum to *at most* $1$, instead of exactly $1$.
An _$RR$-subdistribution_ on a set $S$ is a function $c : S -> RR_(>=0)$ with finite support and total weight
$omega(c) = sum_(s in S) c(s) <= 1$.
The weight $omega(c)$ is the fraction of the model explained by $c$.
The subdistribution framework allows multiple global sections to be combined without exceeding the probability of any local event.
The set of _consistent subdistributions_ is
$
  C_e (X) = { c in cal(S)cal(D)_(RR_(>=0)) (cal(E)(X)) | forall C in cal(M), forall s in cal(E)(C), e_C (s) >= c|_C (s) }.
$
where $𝒮 𝒟_(RR_(>=0)) : sans("Set") -> sans("Set")$ is the _subdistributions functor_ #footnote[This is categorial theory notation, see @Abramsky_Barbosa_Mansfield_2016 to more details].
The condition $e_C (s) >= c|_C (s)$ means: the mass that $c$ places on global assignments restricting to $s$ must not exceed the probability that $e$ gives to $s$.
This condition prevents double counting: if two global sections $g_1$ and $g_2$ both restrict to $s$ in context $C$, then $c(g_1) + c(g_2) <= e_C (s)$.

#proposition(name: [See @Abramsky_Barbosa_Mansfield_2016[Proposition 3.5]], id: "prop:decomposition-subdistribution")[
  If $c in C_e (X)$, then
  $
    e = (sum_(g in cal(E)(X)) c(g) delta_g) + (1 - omega(c)) e'.
  $
  This decomposes $e$ into a non-contextual part of weight $omega(c)$ and a remainder $e'$.
]

// #proof[
//   At each context $C$ and each local outcome $s in cal(E)(C)$, the constraint $e_C(s) >= sum_{g|_C = s} c(g)$ ensures that
//   $
//     e_C(s) - sum_(g|_C = s) c(g) >= 0.
//   $
//   The remainder, normalized by $1 - omega(c)$, defines $e'_C(s)$. Compatibility follows from linearity.
// ]

=== The non-contextual fraction

The _non-contextual fraction_ of $e$ is the maximum weight achievable by a consistent subdistribution:

$
  "NCF"(e) = max { omega(c) | c in C_e (X) }.
$

The _contextual fraction_ is

$
  "CF"(e) = 1 - "NCF"(e).
$

This maximum exists because $C_e (X)$ is closed and bounded in $RR^(|cal(E)(X)|)$, hence compact by Heine--Borel, and $omega$ is continuous.
The dual linear program produces a Bell inequality whose normalised violation by $e$ equals $"CF"(e)$. Thus the contextual fraction is both a measure of non-classicality and a witness of Bell violation.

== Translation to integer counts

We now translate the entire construction into the integer counting setting. Let $N in NN^V$ be a compatible integer counting of level $t$. The normalized model is $e_N = N\/t$. Because we have the same problem of overlap problem, see @annex:overlap-integer, we want to define an integer analogue of consistent subdistributions.

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

#remark(name: [Subcountings as closed generators], id: "rem:subcounting-generator")[
  In the integer setting, $C_N (X)$ has a direct interpretation in terms of the dynamic framework.
  A vector $z in NN^(cal(E)(X))$ assigns to each global section $g$ a multiplicity $z(g) in NN$:
  the number of times $g$ is used as a closed (deterministic) generator.
  The constraint $M z <= N$, or equivalently $sum_(g : g|_C = s) z(g) <= N_C (s)$ for every
  local event $(C, s)$, says exactly that the closed generators must #emph[fit inside] $N$:
  no local event receives more mass from the deterministic explanation than was actually observed.
  In the notation of the dynamic framework, if $eta$ is a dynamic state with closed part
  $P_eta = M z$, then $z(g) = c_eta (g)$ counts how many times $g$ appears as a closed generator.
  The condition $z in C_N (X)$ is then simply $P_eta <= N$, i.e. the closed part does not exceed
  the observation.
]

#proposition(name: [Integer decomposition], id: "prop:integer-decomposition")[
  If $z in C_N (X)$, then
  $N = M z + R$
  where $R = N - M z >= 0$. Here $M z$ is the *closed part* (a combination of deterministic global sections) and $R$ is the *open part* (the residue not yet explained by classical histories).
]

#proof[
  By definition, $M z <= N$ componentwise, so $R = N - M z >= 0$. The matrix $M z$ is compatible because each column of $M$ is a deterministic model, and compatibility is preserved under non-negative integer combinations.
]

This decomposition is the integer analogue of Proposition~@prop:decomposition-subdistribution. It says exactly what the dynamic framework says: an observation $N$ splits into a closed part $M z$ (stabilized, non-contextual) and an open part $R$ (still in progress, potentially contextual).

== The first coordinate recovers the contextual fraction

We now state the main theorem linking the two frameworks.

#proposition(name: [The closed deficit equals the contextual fraction], id: "thm:closed-deficit-equals-CF")[
  Let $N in NN^V$ be a compatible integer counting of level $t$, and let $e_N = N \/ t$. Define the _closed deficit_ as the minimal mass not explained by deterministic global sections:
  $
    D^-(N) := min_(z in C_N (X)) |N - M z|_1.
  $
  Then
  $
    D^-(N) = |N|_1 dot "CF"(e_N).
  $
  Equivalently,
  $(D^-(N)) / (|N|_1) = "CF"(e_N)$.
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

== The dynamic enrichment<subchap:dynamic-enrichemnt>

The sheaf-theoretic framework stops at the contextual fraction: it measures *how much* of the model is non-classical. The dynamic framework adds a second layer: it measures *how far* the non-classical residue is from being closed. For this reason, the distances should first be defined for a dynamic state itself, and only then minimized over the dynamic explanations of a fixed observation.

#definition(name: [Past and future distances], id: "def:past-future-distances")[
  Let $cal(G)$ be a family of generators, and let $eta = (c_eta,O_eta)$ be a dynamic state. Its closed part is
  $P_eta := sum_(g in cal(G)) c_eta (g) g$.
  Its visible emitted counting is
  $N_eta := P_eta + sum_((g,R) ins O_eta) (g - R)$.
  Its completed counting is
  $F_eta := P_eta + sum_((g,R) ins O_eta) g$,
  obtained by closing every open generator.
  The *past and future distances* of $eta$ are
  $
    d^-_eta := |N_eta - P_eta|_1,
    quad
    d^+_eta := |F_eta - N_eta|_1.
  $
  Thus $d^-_eta$ is the emitted mass carried by open generators, while $d^+_eta$ is the residual mass still needed to close them.
]

If $eta$ explains the observed counting $N$, this means $N_eta = N$. In that case the same quantities may be written as $d^-_eta = |N - P_eta|_1$ and $d^+_eta = |F_eta - N|_1$, but $N$ is not part of the intrinsic definition of the distances.

For a fixed observed counting $N$, let $cal(H)_cal(G)(N) := {eta | N_eta = N}$ be the set of dynamic explanations of $N$ over $cal(G)$. We define
$D^-(N) := min_(eta in cal(H)_cal(G)(N)) d^-_eta$.
We can see that this is the same that
$min_(z in C_N (X)) |N - M z|_1$.

For the future distance we have two possible choice, either we fixed $η$ to me the one realize the minimum for $D^-(N)$ and we define the $D^+ (N) := d_η^+$, or we minimize overall explanations of $N$ without constraint. The second choice would be more natural if we were only interested in the future distance as a measure of how far $N$ is from being closed. But our goal is to enrich the contextual fraction, which is already captured by the past distance. We want to measure how far the *residue* left by the optimal past choice is from being closed.
The reason is that $D^-(N)$ already selects the largest closed, non-contextual part of $N$. The relevant future cost is therefore the cost of completing the residue left by such an optimal past choice. We define the residual distance
$
  D^(arrow.loop)(N) := min { d^+_eta | eta in cal(H)_cal(G)(N) and d^-_eta = D^-(N) }.
$

#definition(name: "Tight distances", id: "def:tight-distances")[
  Let $𝒢$ be a complete family of generators. Thus, for every
  visible counting $N ∈ ℕ^V$, the fibre $ℋ_𝒢 (N)$ is non-empty.
  For a dynamic state $η ∈ ℋ_𝒢 (N)$, let
  $P_η$ denote its closed part and let $F_η$ denote its completed part,
  obtained by closing all open generators. We define
  $d^-_η := |N - P_η|_1$ and $d^+_η := |F_η - N|_1$. \
  The *integer contextual deficit* of $N$, i.e. the non-normalised contextual fraction of the empirical model associated with $N$, is
  $
    D^-(N)
    :=
    min_(η ∈ ℋ_𝒢 (N)) d^-_η .
  $
  The *contextual completion deficit* of $N$ is the minimal future
  deficit among the states that already minimize the past deficit:
  $
    D^(arrow.loop)(N)
    :=
    min { d^+_η
      | η ∈ ℋ_𝒢 (N) " and " d^-_η = D^- (N) } .
  $

  The pair
  $
    (D^-(N), D^(arrow.loop)(N)) = ( underbrace(|N|_1 dot "CF"(e_N), "contextual fraction (sheaf theory)")
      , underbrace(D^(arrow.loop)(N), "completion cost after optimal past extraction")
    )
  $
  is called the *tight contextual profile* of $N$.
  We define the dual of this contextual profile, or *dual tight contextual profile* as the following pair :
  $
    (D^(arrow.l.loop)(N),D^+ (N)) & := (min{d_η^- | η ∈ ℋ_𝒢 (N) " and " d_η^+ = D^+ (N)},min{d_η^+ | η ∈ ℋ_𝒢 (N)})
  $
]

== Summary of the correspondence

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
    [$C_e (X) = {c : M c <= e}$], [$C_N (X) = {z : M z <= N}$], [$c = z / t$],
    [$e = sum c(g) delta_g + (1-omega(e))e'$], [$N = M z + R$], [subdistribution decomposition],
    [$"NCF"(e) = max omega(c)$], [$"NCF"(e_N) = max bold(1)^tack.t z / t$], [same LP],
    [$"CF"(e) = 1 - "NCF"(e)$], [$(D^-(N)) / (|N|_1) = "CF"(e_N)$], [#strong[main theorem]],
    [$crossmark$], [$D^(arrow.loop)(N)$], [*dynamic enrichment*],
  ),
  caption: [Complete correspondence between the probabilistic sheaf-theoretic framework and the integer counting framework.],
) <tab:correspondence>

The last row is the main result: the normalized closed deficit in the integer framework equals the contextual fraction in the probabilistic framework. The two measures are the same quantity, seen from two sides of the normalization barrier.
