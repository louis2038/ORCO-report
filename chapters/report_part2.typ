#import "../template.typ": book, corollary, definition, lemma, proof, proposition, remark
#import "../prelude.typ": *

= Technical Preliminaries

In this section we will introduce the technical concept from generic contextuality to our all new theory of discrete contextuality.

== What is contextuality ?

Contextuality is the failure of a family of local observations to come from one global assignment. In a measurement scenario $chevron.l X, cal(M), O chevron.r$, each context $C in cal(M)$ specifies a set of measurements that can be performed together, and a local outcome is a section $s : C arrow.r O$. A classical deterministic explanation would require a single global section $g : X arrow.r O$ whose restriction $g|_C$ explains the outcome seen in every context. Thus contextuality is not merely randomness: it is an obstruction to gluing compatible local descriptions into one global description.

This report uses this standard idea in a discrete form. Instead of starting from normalized real probabilities, we keep integer counts. A local table is therefore not only a point of a convex polytope, but a finite record of occurrences. Compatibility becomes equality of marginal counts on overlaps, and contextuality asks whether these compatible integer data can be reconstructed from deterministic global sections.



== Introduction

In the following, we will use the same notation that in @Abramsky_Brandenburger_2011. We will add our theory on the top of this formalisze and we will discuss how consider discrete contextuality with this notation.

The goal is to model the experiment itself, rather than only the final
probability distribution. We consider one or several laboratories
equipped with measurement devices. Let $X$ denote the set of available
measurements, let $cal(M)$ denote the set of measurement contexts,
i.e.~the subsets of measurements that can be performed jointly, and let
$O$ be a finite set of possible outcomes. An experimental run consists
in choosing a context $C in cal(M)$ and observing an outcome assignment
$s : C arrow.r O$. Thus the primitive observational events are pairs
$\( C \, s \)$, where $C$ is the performed context and $s$ is the
observed local outcome.

For example, in the classical $\( 2 \, 2 \, 2 \)$ Bell scenario, there
are two parties, Alice and Bob, each with two possible measurements. We
write

$ X = { a_1 \, a_2 \, b_1 \, b_2 } \, $

where $a_1 \, a_2$ are Alice's measurements and $b_1 \, b_2$ are Bob's
measurements. The jointly performable contexts are

$ cal(M) = { { a_1 \, b_1 } \, { a_1 \, b_2 } \, { a_2 \, b_1 } \, { a_2 \, b_2 } } \, $

and the outcome set is

$ O = { 0 \, 1 } . $

This expresses the operational constraint that Alice and Bob can each
choose one measurement per run, but Alice cannot perform both of her
measurements simultaneously, so ${ a_1 \, a_2 } in.not cal(M)$.
Likewise, ${ b_1 \, b_2 } in.not cal(M)$.

In this sense, the scenario specifies not only which outcomes may be
observed, but also which observations can coexist in a single
experimental run.

The technical point of this section is the following. A context table is only local data. A genuine empirical model is obtained only when all context tables can be compared on overlaps and when they have a common level. Therefore we must distinguish three objects: a local counting $N_C$, a family $N = (N_C)_(C in cal(M))$, and the corresponding vector $N in NN^V$ indexed by visible contextual events. The notation is intentionally the same, but the type of the object changes with the context.


#let Set = $sans("Set")$
#definition[
  A *measurement scenario* is a triple $chevron.l X, cal(M), O chevron.r$ where $X$ is a set of measurements, $O$ is a set of outcomes, and $cal(M) ⊆ cal(P)(X)$ is a family of measurement contexts.
  The *event presheaf* associated with this scenario is the functor #footnote[A functor is a mapping between categories that preserves structure. See @Leinster_2016[Chapter 1] for a gentle introduction.] $cal(E) : cal(P)(X)^"op" -> "Set"$
  defined by $cal(E)(U) := O^U$ for every subset $U ⊆ X$.
  If $U ⊆ V ⊆ X$, the restriction map $cal(E)(V) -> cal(E)(U)$ sends a joint assignment $s : V -> O$  to its restriction $s|_U : U -> O$.
  Thus, an element $s in cal(E)(U)$ is a local assignment of outcomes to all measurements in $U$. In particular, for a *context* $C in cal(M)$, an element $s in cal(E)(C)$ represents a possible joint outcome for the measurements in $C$.
  \
  Let $R$ be a semiring. For any finite set $Y$, we define
  $
    𝒟_R (Y) := { d : Y -> R | "supp"(d) "is finite" }.
  $
  Here $Y$ is only the set on which the distribution is defined; it is not a level. The support is $"supp"(d) = { y in Y | d(y) != 0 }$. In this report, $R = RR_(>=0)$ gives ordinary non-negative weights, while $R = NN$ gives integer countings.
  \
  The *total weight* of $d$ is $|d| := sum_(y in Y) d(y)$. For a fixed level $t in R$, we write
  $
    𝒟_R^t (Y) := { d in 𝒟_R (Y) | |d| = t }.
  $
  We also use the graded object
  $
    𝒟_R^∙(Y) := union_(t in R) 𝒟_R^t (Y).
  $
  Thus the superscript is the level: $𝒟_R^t$ means exact level $t$, while $𝒟_R^∙$ means that the level is not fixed. The argument $Y$ is the underlying set of outcomes. In the probabilistic case one usually fixes $R = RR_(>=0)$ and $t = 1$. In the discrete setting one takes $R = NN$ and keeps $t in NN$ as the number of counted trials.
]


=== Empirical models as $𝒟_R ∘ ℰ$

The event presheaf $ℰ$ describes which local outcome assignments are available over each set of measurements. To pass from possible assignments to empirical data, one composes it with a distribution or counting functor. Thus the relevant object is not only $ℰ$, but the composite presheaf $𝒟_R ∘ ℰ$, defined by
$
  (𝒟_R ∘ ℰ)(U) = 𝒟_R (ℰ(U)).
$
An element $d_U in 𝒟_R (ℰ(U))$ assigns a weight to each local section $s : U -> O$. In particular, a local counting over a context $C$ is an element $N_C in 𝒟_NN^∙ (ℰ(C))$. This means only that $N_C$ has some integer level. If $N_C in 𝒟_NN^t (ℰ(C))$, then the context $C$ has exact level $t$.

In all the following we suppose that $cal(M)$ is a *measurement cover*, meaning $union_(C in cal(M)) C = X$, and that it is an antichain, meaning $C subset.eq D$ with $C,D in cal(M)$ implies $C = D$.

=== Compatibility before the level

The first notion is compatibility. It comes from the sheaf-theoretic idea that two local observations must agree on the part that they have in common.

#definition(name: "Compatible family", id: "def:compatible-family")[
  Let $R$ be a semiring. A family
  $e = (e_C)_(C in cal(M))$ of elements $e_C in 𝒟_R (ℰ(C))$
  is *compatible* if, for all contexts $C,D in cal(M)$,
  $e_C|_(C inter D) = e_D|_(C inter D)$.
]

In the probabilistic case, this says that marginal distributions coincide on overlaps. In the counting case, it says that marginal count vectors coincide exactly. Equivalently, for a counting family $N=(N_C)_(C in cal(M))$ and for $u in ℰ(C inter D)$, compatibility means
$
  sum_(s in ℰ(C), s|_(C inter D) = u) N_C (s)
  =
  sum_(r in ℰ(D), r|_(C inter D) = u) N_D (r).
$
We sometimes denote this whole family of homogeneous linear equations by $delta N = 0$.

In the standard probabilistic setting, where $R = RR_(>=0)$, one normalizes the integer counts to obtain probability distributions. To illustrate this passage, consider the following joint probability table $p(a,b|x,y)$ for a quantum strategy in the $(2,2,2)$ Bell scenario. The rows correspond to the measurement settings $(x,y)$ chosen by Alice and Bob, and the columns to the joint outcomes $(a,b)$:

#figure(
  table(
    columns: 6,
    align: center,
    inset: 6pt,
    table.header([$A$], [$B$], [$(0,0)$], [$(1,0)$], [$(0,1)$], [$(1,1)$]),
    [$a$], [$b$], [$1/2$], [$0$], [$0$], [$1/2$],
    [$a'$], [$b$], [$3/8$], [$1/8$], [$1/8$], [$3/8$],
    [$a$], [$b'$], [$3/8$], [$1/8$], [$1/8$], [$3/8$],
    [$a'$], [$b'$], [$1/8$], [$3/8$], [$3/8$], [$1/8$],
  ),
  caption: [Joint probabilities $p(a,b|x,y)$ for a quantum strategy achieving the Tsirelson bound $cos^2(pi/8) approx 0.8536$.],
)<tab:chsh-quantum-example>

The four contexts are $C_1 = {a, b}$, $C_2 = {a, b'}$, $C_3 = {a', b}$, and $C_4 = {a', b'}$. Two contexts that share a measurement must agree on its marginal.

_Alice's marginal on $a$_ : The contexts $C_1 = {a, b}$ and $C_2 = {a, b'}$ both contain $a$. Summing over Bob's outcomes in each context gives:
$
  p(a = 0 | C_1) & = p(0,0|0,0) + p(0,1|0,0) = 1/2 + 0 = 1/2, \
  p(a = 0 | C_2) & = p(0,0|0,1) + p(0,1|0,1) = 3/8 + 1/8 = 1/2.
$
These two values coincide. The same holds for $a = 1$: both marginals equal $1/2$. Thus the two contexts agree on the distribution of $a$.

_Bob's marginal on $b$_ : The contexts $C_1 = {a, b}$ and $C_3 = {a', b}$ both contain $b$. Summing over Alice's outcomes:
$
  p(b = 0 | C_1) & = p(0,0|0,0) + p(1,0|0,0) = 1/2 + 0 = 1/2, \
  p(b = 0 | C_3) & = p(0,0|1,0) + p(1,0|1,0) = 3/8 + 1/8 = 1/2.
$
Again the marginals coincide. The same check works for every shared measurement across all four contexts.

In summary, compatibility means that each measurement, when it appears in two different contexts, induces the same marginal distribution. The table is not free: the $16$ entries are constrained by $8$ independent marginal equations (two for each shared measurement), leaving only $8$ degrees of freedom. This is precisely the condition $delta N = 0$ applied to the CHSH cover. This can be called the no-signaling condition, because it says that the choice of measurement on one side does not affect the marginal distribution on the other side, that is the precise definition of what signaling mean.

=== From sheaves to hypergraphs

The sheaf-theoretic formulation and the hypergraph formulation describe the same local-to-global problem from two complementary viewpoints. In the sheaf-theoretic approach of Abramsky and Brandenburger, the event presheaf $ℰ$ assigns to each set of measurements $U subset.eq X$ the set of local sections $ℰ(U)=O^U$. Contextuality is then an obstruction to gluing local data into a global section @Abramsky_Brandenburger_2011.

The hypergraph viewpoint keeps the same operational information but makes the linear constraints explicit. Its vertices are the visible events $(C,s)$. Its hyperedges encode the tests that a table must satisfy: context normalization and marginal compatibility. This is close in spirit to the combinatorial approach to contextuality scenarios developed by Acín, Fritz, Leverrier, and Sainz @Acin_Fritz_Leverrier_Sainz_2015. It is also related to the graph-theoretic exclusivity viewpoint of Cabello, Severini, and Winter @Cabello_Severini_Winter_2014, although here we keep the measurement-cover and marginal-compatibility structure visible.

In this report, the sheaf language explains what must be glued, while the hypergraph and matrix language explains how the gluing constraints act on integer counts.

To make this concrete, consider the CHSH scenario. The visible event space is $V = { (a,b|x,y) | a,b,x,y in {0,1} }$, which has $16$ elements. If we adopt the ordering $0 |-> 0, 0 |-> 1, 1 |-> 0, 1 |-> 1$ for the question-to-answer map, then a counting vector $N in NN^V$ can be represented as a $4 times 4$ matrix. The rows represent Alice's measurement-outcome pairs $(a|x)$, and the columns represent Bob's measurement-outcome pairs $(b|y)$. Each cell $(i,j)$ then corresponds to the joint event $(a,b|x,y)$, and records the count $N(a,b|x,y)$ for that combination. @fig:chsh-matrix illustrates this representation.

#figure(
  tool.draw-nonlocal-game(
    chsh_rule,
    players: 2,
    unit-length: 2em,
    pair-order: ((0, 0), (0, 1), (1, 0), (1, 1)),
    extra-content: {},
  ),
  caption: [Matrix representation of a counting vector $N in NN^V$ in the CHSH scenario. Rows correspond to Alice's pairs $(a|x)$, columns to Bob's pairs $(b|y)$, and each cell to the joint event $(a,b|x,y)$. The blue color is for the winning event of the CHSH game and red is for the loosing event.],
)<fig:chsh-matrix>

In this matrix view, the context-normalization condition $A_cal(M) N = t 𝟙$ says that the sum over each context block equals $t$. The marginal-compatibility condition $delta N = 0$ says that the marginals are consistent across contexts that share a measurement. For instance, summing over Bob's outcomes in the rows corresponding to Alice's pair $(a|x)$ must give the same result whether Bob's measurement is $y=0$ or $y=1$, because Alice's marginal should not depend on Bob's choice.

Concretely, all these constraints can be summarized by the *contextual hypergraph* of the Bell $(2,2,2)$ scenario, shown in @fig:chsh-hypergraph. The $16$ visible events are the vertices. The hyperedges encode two types of constraints:

- *Context normalization* (blue): for each context $(x,y)$, the four events $(a,b|x,y)$ with $a,b in {0,1}$ must have counts summing to $t$. This gives $4$ hyperedges.
- *Marginal compatibility* (red for Alice, green for Bob): for each fixed measurement-outcome pair of one party, the marginal must be independent of the other party's measurement. For Alice, fixing $(a|x)$ requires that summing over Bob's outcomes gives the same result for $y=0$ and $y=1$. For Bob, fixing $(b|y)$ requires the same for Alice's measurement $x$. This gives $4 + 4 = 8$ hyperedges.

In total, the hypergraph has $12$ hyperedges. A vector $N in NN^V$ represents a compatible counting if and only if it satisfies all $12$ hyperedge constraints simultaneously.

#import "@preview/cetz:0.5.2" as cetz
#figure(
  {
    cetz.canvas({
      import cetz.draw: *

      let scale = 1.2

      // Vertex positions: (col, 3-row)
      let pos(i, j) = (j * scale, (3 - i) * scale)

      // Draw a hyperedge as a closed curve through vertices (no fill)
      let hyperedge-curve(vertices, color) = {
        let pts = vertices.map(((i, j)) => pos(i, j))
        // Draw lines connecting vertices in order
        for k in range(pts.len() - 1) {
          let next = calc.rem(k + 1, pts.len())
          line(pts.at(k), pts.at(next), stroke: color + 2pt)
        }
      }

      // Context normalization hyperedges (blue) - 2x2 blocks with diagonal cross
      // (0,0): diagonal cross through (0,0)-(1,1)-(0,1)-(1,0)
      hyperedge-curve(((0, 0), (1, 1), (0, 1), (1, 0)), blue)
      // (0,1): diagonal cross through (0,2)-(1,3)-(0,3)-(1,2)
      hyperedge-curve(((0, 2), (1, 3), (0, 3), (1, 2)), blue)
      // (1,0): diagonal cross through (2,0)-(3,1)-(2,1)-(3,0)
      hyperedge-curve(((2, 0), (3, 1), (2, 1), (3, 0)), blue)
      // (1,1): diagonal cross through (2,2)-(3,3)-(2,3)-(3,2)
      hyperedge-curve(((2, 2), (3, 3), (2, 3), (3, 2)), blue)

      // Alice compatibility hyperedges (red) - horizontal zigzag
      // a=0, x=0: row 0 with zigzag
      hyperedge-curve(((0, 0), (0, 1), (1, 2), (1, 3)), rgb(250, 0, 0, 255))
      // a=1, x=0: row 1 with zigzag
      hyperedge-curve(((1, 0), (1, 1), (0, 2), (0, 3)), rgb(200, 0, 0, 255))
      // a=0, x=1: row 2 with zigzag
      hyperedge-curve(((2, 0), (2, 1), (3, 2), (3, 3)), rgb(150, 0, 0, 255))
      // a=1, x=1: row 3 with zigzag
      hyperedge-curve(((3, 0), (3, 1), (2, 2), (2, 3)), rgb(100, 0, 0, 255))

      // Bob compatibility hyperedges (green) - vertical zigzag
      // b=0, y=0: col 0 with zigzag
      hyperedge-curve(((0, 0), (1, 0), (2, 1), (3, 1)), rgb(0, 250, 0, 255))
      // b=1, y=0: col 1 with zigzag
      hyperedge-curve(((0, 1), (1, 1), (2, 0), (3, 0)), rgb(0, 200, 0, 255))
      // b=0, y=1: col 2 with zigzag
      hyperedge-curve(((0, 2), (1, 2), (2, 3), (3, 3)), rgb(0, 150, 0, 255))
      // b=1, y=1: col 3 with zigzag
      hyperedge-curve(((0, 3), (1, 3), (2, 2), (3, 2)), rgb(0, 100, 0, 255))

      // Draw vertices on top
      for i in range(4) {
        for j in range(4) {
          let (x, y) = pos(i, j)
          circle((x, y), radius: 0.12, fill: white, stroke: 1.5pt)
        }
      }

      // Row labels (Alice)
      content((-0.5, 3 * scale), $0|0$)
      content((-0.5, 2 * scale), $0|1$)
      content((-0.5, 1 * scale), $1|0$)
      content((-0.5, 0 * scale), $1|1$)

      // Column labels (Bob)
      content((0 * scale, 4.0), $0|0$)
      content((1 * scale, 4.0), $0|1$)
      content((2 * scale, 4.0), $1|0$)
      content((3 * scale, 4.0), $1|1$)

      // Axis labels
      content((-1.1, 1.5), [Alice $(a|x)$], angle: 90deg)
      content((1.5, 4.6), [Bob $(b|y)$])
    })
  },
  caption: [Contextual hypergraph of the Bell $(2,2,2)$ scenario. The hyperedge are represented by the same color.],
)<fig:chsh-hypergraph>

Each hyperedge constrains its vertices: in the probabilistic setting, the sum of their probabilities must equal $1$; in the counting setting, the sum of their counts must equal the same level $t$.

=== How compatibility creates the level

For a local counting $N_C$, define its local level by $t_C := |N_C| = sum_(s in ℰ(C)) N_C (s).$
At first, the numbers $t_C$ may depend on the context $C$. The point is that compatibility can force them to become equal.

#proposition(name: "Compatibility creates the level", id: "prop:compatibility-creates-level")[
  Suppose that the intersection graph of the contexts is connected, where $C$ is adjacent to $D$ when $C inter D != emptyset$. If a counting family $N = (N_C)_(C in cal(M))$ is compatible, then all local levels $|N_C|$ are equal. Hence there is a unique integer $t$ such that $forall C in cal(M), quad |N_C| = t.$
]

#proof[
  If $C inter D != emptyset$ and $N$ is compatible, then the marginals of $N_C$ and $N_D$ on $C inter D$ are equal. Marginalization preserves total weight, so $|N_C| = |N_D|$. Since the intersection graph is connected, this equality propagates from one context to every other context. Thus all local levels are equal to a common integer $t$. Uniqueness is immediate, because $t = |N_C|$ for any context $C$.
]

Thus the level is not just an extra parameter added by hand. On a connected cover, it is the common normalization scale forced by compatible integer data.

#definition(name: [Discrete empirical model of level $t$], id: "def:discrete-model")[
  A *discrete empirical model of level* $t$ is a compatible family $N = (N_C)_(C in cal(M))$
  such that $N_C in 𝒟_NN^t (ℰ(C))$ for every context $C$.
]

=== Why the level matters

It may look as if the integer model contains no new information, because one can divide a level-$t$ count by $t$ and obtain a probability table. This would miss the main point. The level $t$ is not only a denominator. It records the amount of observation that supports the table in each context.

For instance, the count $(1,0)$ and the count $(1000,0)$ give the same normalized probability $(1,0)$. They do not have the same empirical status. The second table is supported by many more repetitions. In a standard statistical interpretation, this usually means that the sampling uncertainty decreases at the scale $1 / sqrt(t)$. We do not need to assume such a statistical model in this report, but the intuition is useful: $t$ is an experimental resolution scale. It is not a subjective probability of confidence. It is the amount of counted evidence that remains visible in the formal object.

Thus a discrete empirical model is not only a point in a polytope. It is an integer point at a definite level. The same probability may appear at several levels, but these levels correspond to different amounts of evidence and to different possible intermediate histories.

#remark(name: "An arithmetic effect of the level", id: "rem:arithmetic-level-effect")[
  Consider a partial CHSH count at level $6$. Suppose that one context already contains the counts $mat(3, 1, 1, 1)$.
  After normalization, this gives probabilities $mat(1/2, 1/6, 1/6, 1/6)$.
  Now suppose that a marginal compatibility equation involves two unknown probabilities $a$ and $b$ and has the form
  $1/2 + 1/6 + a + b = 1$.
  Over probabilities, this gives the continuum of solutions $a+b=1/3$ with $a,b >= 0$.

  At level $6$, however, the unknowns must come from integer counts: $a=A/6$ and $b=B/6$ with $A,B in NN$. The same equation becomes
  $3 + 1 + A + B = 6$,
  hence $A+B=2$. The continuum has been cut down to the finite arithmetic set $(A,B) in { (0,2), (1,1), (2,0) }$.

  The point is not uniqueness. The point is that the level cuts the probabilistic continuum by an arithmetic lattice. This arithmetic rigidity disappears after normalization.
]

This is the reason why the transition to automata is natural. If the level records how much of a process has stabilized, then it is also natural to ask what exists before stabilization. A count of size $3$ in CHSH is not a completed level-$t$ model. But it is not meaningless. It may be the visible past of a generator that has not closed yet.

The conceptual chain is therefore the following. The level $t$ describes closed stabilized observations. The Hilbert basis gives elementary closed bricks. Generator automata describe how these bricks can be produced step by step. Residuals record the future that is still needed for closure. The dynamic model below is designed to keep exactly this missing information: what has already been seen, and what still has to happen for the process to close.

=== Vector and hypergraph packaging

The vector notation is only a packaging of the sheaf-theoretic definition above. Define the visible event space
$
  V := ∐_(C in cal(M)) ℰ(C)
  = { (C,s) | C in cal(M) " and " s in ℰ(C) }.
$
Giving a family $(N_C)_(C in cal(M))$ is the same thing as giving a vector $N in NN^V$, by the rule $N(C,s) := N_C (s).$
The context hypergraph is $H_cal(M) = (V,E_cal(M))$, where $E_cal(M) = { e_C | C in cal(M) }$ and $e_C := { (C,s) | s in ℰ(C) }.$
Let $A_cal(M)$ be its incidence matrix. Then $(A_cal(M)N)_C = sum_(s in ℰ(C)) N(C,s) = |N_C|.$
Therefore the equation $A_cal(M)N = t 𝟙$ expresses the common-level condition. It does not express compatibility by itself.

The compatibility equations are homogeneous. If $D$ denotes their matrix, the vector form of a discrete empirical model of level $t$ is $A_cal(M) N = t 𝟙$ and $D N = 0.$
Equivalently, using the notation $delta N = 0$ for the second family of equations, the compatible counting semigroup is
$
  𝒮 := { (N,t) in NN^V times NN | A_cal(M) N = t 𝟙 " and " delta N = 0 }.
$
For a fixed level $t$, we write
$
  𝒮_t := { N in NN^V | (N,t) in 𝒮 }.
$

If the two families of constraints are assembled into one augmented matrix, then $A_("aug") N = (t 𝟙, 0).$
The zero part is important: compatibility equations are homogeneous, while normalization equations carry the level $t$.

=== From convex mixtures to Hilbert bases

This discrete framework differs from the standard probabilistic one. In the usual convex setting, if $e$ and $e'$ are empirical models, then every convex combination $r e + (1-r)e'$ with $r ∈ [0,1]$ is again an empirical model. The geometry is therefore convex.

In our setting, this operation is not primitive. An arbitrary real coefficient $r$ does not preserve integer counts. Instead, the natural operation is addition: if $(N,t)$ and $(N',t')$ belong to $𝒮$, then $(N,t) + (N',t') = (N+N', t+t')$
also belongs to $𝒮$. Hence the appropriate algebraic object is not first a convex set, but an affine semigroup.

The analogue of a convex decomposition is therefore a Hilbert-basis decomposition. The Hilbert basis $ℋ(𝒮)$ of $𝒮$ is the finite set of irreducible elements of the semigroup. Its elements are the elementary compatible counting models that cannot be decomposed into smaller compatible counting models. Thus, instead of asking whether a model is a convex mixture of deterministic models, we ask which Hilbert generators are required to build it as an integer sum.

=== Discrete noncontextuality and strong contextuality

A global section is an assignment of an outcome to every measurement at once. Formally, it is an element $g ∈ ℰ(X)$, or equivalently a function $g : X → O$. The intuitive meaning is simple: before any context is chosen, every measurement $x ∈ X$ already has a predetermined outcome value $g(x) ∈ O$.

Thus, a global section represents a deterministic *hidden-variable* assignment. If the experimenter later chooses a context $C ∈ ℳ$, the observed local outcome is not chosen anew; it is just the restriction $g|_C : C → O$ of the already fixed global assignment.

In other words, determinism means that all counterfactual outcomes are jointly defined. Even if two measurements cannot be performed together, such as $a$ and $a'$ in the Bell scenario, a deterministic model still assigns values to both of them in advance.

Given a global section $g : X → O$, we define its deterministic counting vector $d_g ∈ ℕ^V$ by
$d_g (C,s) :=
cases(
  1 "if" s = g|_C,
  0 "otherwise"
)$.
Here $V = { (C,s) ∣ C ∈ ℳ, s ∈ ℰ(C) }$ is the set of contextual events. Thus $d_g$ places one unit of mass on exactly one event in each context: the event selected by restricting the same global assignment $g$ to that context.

Equivalently, $d_g$ is the empirical model produced by the deterministic hidden state $g$. It satisfies the compatibility constraints automatically, because all its local pieces come from one and the same global assignment. In incidence form, $A_cal(M) d_g = 𝟙$ and $delta d_g = 0$; with the augmented convention, this is $A_("aug") d_g = (𝟙,0)$.

More generally, an arbitrary integer counting of global hidden assignments is an element
$c in 𝒟_NN^∙ (ℰ(X))$.
Here $c(g)$ counts how many times the global assignment $g : X -> O$ is used. Such a global counting produces a contextual-event counting by the linear map
$Phi(c) := sum_(g in ℰ(X)) c(g) d_g in NN^V$.
If $|c| = t$, then $Phi(c)$ has common level $t$ and is compatible. Thus $Phi$ maps global hidden countings into the empirical semigroup $𝒮$.

Indeed, fix a context $C$. Since each deterministic vector $d_g$ puts exactly one unit on the event $(C,g|_C)$ and zero on the other events of the same context, we have
$
  sum_(s in ℰ(C)) Phi(c)(C,s)
  = sum_(s in ℰ(C)) sum_(g in ℰ(X)) c(g) d_g (C,s)
  = sum_(g in ℰ(X)) c(g)
  = |c| = t.
$
So every context has the same level $t$. Compatibility is also automatic. If $C,D in cal(M)$ and $u in ℰ(C inter D)$, then
$
  sum_(s|_(C inter D)=u) Phi(c)(C,s)
  = sum_(g: g|_(C inter D)=u) c(g)
  = sum_(r|_(C inter D)=u) Phi(c)(D,r).
$
Both sides count exactly the same global assignments: those whose restriction to the overlap $C inter D$ is $u$. Hence $delta Phi(c)=0$.

A discrete empirical model $N ∈ ℕ^V$ is *noncontextual* if it can be written as an integer sum of deterministic global sections. That is, there exist coefficients ${c_g}_(g ∈ ℰ(X)) ∈ ℕ$ such that
$N = ∑_(g ∈ ℰ(X)) c_g d_g$.
The coefficient $c_g$ counts how many times the deterministic assignment $g$ is used in the construction of $N$.

If such a decomposition exists, then the apparent contextual data can be explained by a classical hidden-variable mechanism: each run secretly chooses a global assignment $g$, and the context merely reveals the part $g|_C$ corresponding to the measurements actually performed.

If no such decomposition exists, the model is contextual in the discrete sense. It is compatible as a counting model, because it satisfies the common-level constraints, but it cannot be reconstructed as a sum of predetermined global assignments.

In the notation above, this says simply that the noncontextual integer models are the image
$
  𝒮_("nc") := Phi(𝒟_NN^∙ (ℰ(X))) subset.eq 𝒮_("ns").
$
This notation is useful because it separates two questions. The semigroup $𝒮_("ns")$ contains all compatible integer empirical models. The subsemigroup $𝒮_("nc")$ contains only those compatible models that can be generated from global deterministic assignments. Thus $𝒮_("nc")$ is the integer analogue of the classical or local polytope, while $𝒮_("ns")$ is the integer analogue of the compatible, or no-signaling, object.

#proposition[
  The semigroup $𝒮_("nc")$ is generated by the deterministic vectors $(d_g,1)$ with $g in ℰ(X)$, and $𝒮_("nc") subset.eq 𝒮_("ns")$.
]

#proof[
  By definition, every element of $𝒟_NN^∙(ℰ(X))$ is a finite counting $c : ℰ(X) -> NN$. Hence
  $Phi(c) = sum_(g in ℰ(X)) c(g) d_g$.
  Therefore every element of $𝒮_("nc")$ is an integer sum of deterministic vectors. Conversely, every integer sum of deterministic vectors is obtained by taking $c(g)$ equal to the multiplicity of $d_g$ in the sum. Thus these vectors generate $𝒮_("nc")$.
]

In the generic case, the Hilbert basis of $𝒮_("nc")$ is obtained from these deterministic generators after removing duplicates, because two distinct global assignments may induce the same contextual vector if the measurement cover does not separate them. In the usual separated scenarios, and in particular in CHSH, the deterministic vectors are distinct and irreducible; then the Hilbert basis of $𝒮_("nc")$ is exactly $ℋ_("nc") = { (d_g,1) | g in ℰ(X) }$.

Therefore contextuality is a property of a compatible counting $N in 𝒮_("ns")$: it means $N in.not 𝒮_("nc")$. The condition $N in 𝒮_("ns")$ alone is not contextuality; it is only compatibility, or no-signaling in Bell scenarios.

We shall only use the support version briefly. For each context $C$, define
$
  "supp"(N_C) := { s ∈ 𝓔(C) ∣ N_C (s) > 0 }.
$
A compatible model $N$ is *strongly contextual* when no global section remains compatible with these supports:
$
  ∄ g ∈ 𝓔(X)
  quad "such that" quad
  ∀ C ∈ 𝓜,\ g|_C ∈ "supp"(N_C).
$
In this report, this notion is mainly used as orientation. The main constructions below concern compatible countings, noncontextual decompositions, and dynamic generator explanations.

We therefore keep three levels distinct:

- *compatibility* or *non-signaling*: the local count tables have a common level and agree on overlaps, equivalently $A_cal(M) N = t 𝟙$ and $delta N = 0$;
- *noncontextuality*: the compatible model decomposes as an integer sum of deterministic global sections;
- *strong contextuality*: not even one deterministic global section is compatible with the support of the model.

#lou[Tout ce qu'il y a au dessus est PARFAIT]

== First result #lou[A travailler]

To be clear, the $(2,2,2)$ scenario refers to the case with two parties, each having two measurement settings, and each measurement having two possible outcomes. The $"CHSH"$ setting refers to a game following the $(2,2,2)$ scenario where the winning condition is $a xor b = x and y$.

We now record the elementary consequences of the previous definitions for the $(2,2,2)$ scenario. In this subsection, $N$ denotes the counting vector. The entries of $N$ are the integer variables that we study.

For a context $C in cal(M)$ and a local section $s in ℰ(C)$, the coordinate $N(C,s)$ may also be written $N(s | C)$. In the Bell notation this becomes $N(a b | x y)$: conditionally on the chosen questions $(x,y)$, one counts the observed answers $(a,b)$.

In CHSH the vertex set is $V = { (a b | x y) | a,b,x,y in {0,1} }$, hence $|V| = 16$. The contextual hypergraph has $12$ hyperedges: four context-normalization edges and eight non-signaling marginal edges. Each edge has size $4$, and each vertex belongs to exactly $3$ edges. If $A_("aug")$ is the corresponding incidence matrix (encoding both context normalization and marginal compatibility), then the discrete non-signaling equation is
$A_("aug") N = t 𝟙$.

This is the same object as the non-signaling polytope, but seen before normalization. Indeed, if
$G_("NS") := { p in RR_(>=0)^V | A_("aug") p = 𝟙 }$,
then the equation $A_("aug") N = t 𝟙$ is equivalent, for $t > 0$, to $p := N/t in G_("NS")$. Thus
$
  { N in NN^V | A_("aug") N = t 𝟙 }
  = t G_("NS") inter ZZ^V.
$
The semigroup $𝒮_("ns")$ is therefore the semigroup of integer points in the cone over $G_("NS")$:
$
  𝒮_("ns")
  := { (N,t) in NN^V times NN | A_("aug") N = t 𝟙 }
  = { (N,t) | N in t G_("NS") inter ZZ^V }.
$
The polytope $G_("NS")$ is the normalized slice $t=1$ of this cone, while the discrete models at level $t$ are the integer points in the dilated slice $t G_("NS")$.
The local part is obtained by replacing $G_("NS")$ by the local polytope
$L_("loc") := "conv" { d_lambda | lambda " deterministic" }.$
If we define $Q_("NS")(t) := \#(t G_("NS") inter ZZ^V)$ and $Q_("loc")(t) := \#(t L_("loc") inter ZZ^V)$, then these functions count the number of discrete models at level $t$ in the non-signaling and local cases.

The first admissible nonzero level is therefore $t=1$, equivalently $k=4$. At this level, $A_("aug") N = 𝟙$ forces $N$ to select exactly one event on every hyperedge. These exact transversals are precisely the local deterministic strategies, i.e. assignments $a = f(x)$ and $b = g(y)$. Thus the first level contains only classical generators.

The first intrinsically non-local CHSH generators occur at $t=2$, equivalently $k=8$. Because a PR box has probabilities in ${0,1/2}$ and therefore is not an integer point at level $t=1$. Multiplying it by $2$ gives an integer vector $r in {0,1}^16$ with $A_("aug") r = 2 𝟙$. Hence its first discrete lift is at level $t=2$.

Let $d_lambda in {0,1}^16$ denote the $16$ local deterministic generators, with $A_("aug") d_lambda = 𝟙$, and let $r_mu = 2 p_mu^"PR" in {0,1}^16$ denote the $8$ lifted PR generators, with $A_("aug") r_mu = 2 𝟙$. The natural candidate Hilbert basis, i.e. the set of points that generate any other points in $𝒮_"ns"$ is
$
  ℋ_("ns") := { (d_lambda,1) }_(lambda=1)^16 union { (r_mu,2) }_(mu=1)^8.
$

#proposition[
  Assuming the support lemma verified by exhaustive enumeration of the CHSH supports, $ℋ_("CHSH")$ is the Hilbert basis of $𝒮_("ns")("CHSH")$.
]

#proof[
  The deterministic elements are irreducible because their level is $1$. A lifted PR element is also irreducible: a nontrivial decomposition of $(r_mu,2)$ would split it into two level-$1$ elements, hence into two deterministic local models, which would write a PR box as a convex combination of local deterministic boxes. This is impossible. For generation, the support lemma states that every nonzero $(N,t) in 𝒮_("ns")("CHSH")$ contains the support of some element $(u,s) in ℋ_("CHSH")$. Then $(N-u,t-s)$ is again in $𝒮_("ns")("CHSH")$, and induction on $t$ gives a decomposition into elements of $ℋ_("CHSH")$.
]


#proposition[
  The set of integer models $ℋ_"ns"$ is an Hilbert basis of the semigroup $𝒮_"ns"$.
]

#proof[
  By construction, all elements of $cal(H)_"ns"$ belong to $cal(S)_"ns"$.
  The deterministic generators $(d_lambda,1)$ are irreducible.
  The PR generators $(r_mu,2)$ are also irreducible. Indeed, any non-trivial decomposition
  $(r_mu,2) = (N_1,t_1) + (N_2,t_2)$
  would force $t_1 = t_2 = 1$. Hence we would have $A N_i = bb(1)$ for $i=1,2$, so $N_1$ and $N_2$ would be two local deterministic models. It would follow that
  $p_mu^"PR" = 1/2 N_1 + 1/2 N_2$,
  which would express a PR box as a convex combination of deterministic boxes, a contradiction.

  It remains to prove that $cal(H)_"ns"$ generates the whole semigroup. We proceed by induction on $t$. If $t=0$, then $A N = 0$, and since every vertex belongs to at least one edge, we necessarily get $N=0$.

  We first need the following support lemma.
  #lemma(name: "Support lemma", id: "lem:support")[
    For every nonzero $(N,t) in cal(S)_"ns"$, there exists $(U,s) in cal(H)_"ns"$ such that $U(v) <= N(v)$ for every vertex $v in V$.
  ]
  #proof[
    The proof is computer-assisted. The finite step is an exhaustive test of supports.
    Let $S subset.eq V$ be a nonempty subset of the $16$ vertices. We say that $S$ is #strong[realizable] if there is an element $(m,t) in cal(S)_"ns"$ such that
    $"supp"(m) = S$.
    Since $|V| = 16$, there are $2^16 - 1 = 65535$ nonempty supports to test.
    For each nonempty subset $S subset.eq V$, the computation solves the following feasibility problem. Find a vector $q in RR_(>=0)^V$ and a scalar $tau >= 1$ such that
    $A q = tau bold(1)$,
    with the support constraints
    $q_v >= 1$ for $v in S,
    q_v = 0$ for $v in.not S$.

    If this system has no solution, then no element of $cal(S)_"ns"$ can have support $S$. Indeed, any integer element $(m,t)$ with support $S$ would also be a real solution by taking $q=m$ and $tau=t$.

    If the system has a solution, then $S$ is realizable. The matrix $A$ and all support constraints have rational coefficients. Hence a feasible rational point exists whenever the rational polyhedron is nonempty. Multiplying by a common denominator gives an integer vector $m in NN^16$ and an integer level $t in NN$ such that
    $
      A m = t bold(1)
      quad "and" quad
      "supp"(m) = S.
    $
    Thus $(m,t) in cal(S)_("CHSH")$.

    The exhaustive computation then applies a second test to every realizable support $S$. It checks whether there exists one of the proposed generators
    $
      (u,s) in cal(H)_("CHSH")
    $
    such that
    $
      "supp"(u) subset.eq S.
    $
    The computation verifies that this condition holds for every realizable nonempty support $S subset.eq V$.

    We now use this finite verification to prove the lemma. Let $(m,t) in cal(S)_("CHSH")$ be nonzero, and set $S := "supp"(m)$. Then $S$ is a realizable nonempty support. By the exhaustive verification, there is a generator $(u,s) in cal(H)_("CHSH")$ with $"supp"(u) subset.eq S$.

    Every deterministic generator and every lifted PR generator has entries in ${0,1}$. Therefore, for each vertex $v in V$, there are two cases. If $u_v = 0$, then $u_v <= m_v$ is immediate. If $u_v = 1$, then $v in "supp"(u) subset.eq S = "supp"(m)$, so $m_v >= 1$ and again $u_v <= m_v$. Hence
    $
      u_v <= m_v quad "for every" quad v in V.
    $

    Thus every nonzero element of the semigroup contains one of the $24$ proposed generators as a sub-counting. This proves the lemma.
  ]

  We now prove generation by induction on the level $t$. The case $t=0$ was treated above. Assume that every element of level strictly smaller than $t$ is generated by $cal(H)_"CHSH"$, and let $(N,t) in cal(S)_"ns"$ with $t >= 1$.

  By the support lemma, there exists a generator $(u,s) in cal(H)_"ns"$ such that $u_v <= N_v$ for every $v in V$. Hence the difference
  $
    M := N - u
  $
  is again an element of $NN^16$. Since $(u,s) in cal(S)_"ns"$, we have
  $
    A M = A(N-u) = (t-s) bb(1).
  $
  Thus $(M, t-s) in cal(S)_("CHSH")$. Moreover, $s in {1,2}$, so $t-s < t$. By the induction hypothesis, $(M, t-s)$ is a sum of elements of $cal(H)_"CHSH"$. Adding $(u,s)$ to this sum gives a decomposition of $(N,t)$.

  Therefore, $cal(H)_"CHSH"$ generates $cal(S)_("CHSH")$. Finally, no element of $cal(H)_"CHSH"$ belongs to the subsemigroup generated by the others, since this would give a non-trivial decomposition of an irreducible element. Hence $cal(H)_"CHSH"$ is minimal, with respect to inclusion, among generating families. In other words, it is a Hilbert basis.
]

This means that, at the discrete level, CHSH non-signaling models are built from two types of irreducible bricks: local deterministic bricks of level $1$ and PR bricks of level $2$.

Finally, counting the number of int @Miller2005. Let $G_("NS") = { p in RR_(>=0)^16 | A_("aug") p = 𝟙 }$ be the CHSH non-signaling polytope and let $L_("loc")$ be the local polytope. Define $Q_("NS")(t) := \# (t G_("NS") inter ZZ^16)$ and $Q_("loc")(t) := \# (t L_("loc") inter ZZ^16)$. Since the affine dimension is $8$, these functions have degree $8$; $Q_("loc")$ is an Ehrhart polynomial, while $Q_("NS")$ is a quasi-polynomial of period $2$ because PR vertices have denominator $2$.

A direct interpolation from exact integer-point counts gives
$Q_("loc")(t) = 1 + 71/21 t + 6053/1260 t^2 + 697/180 t^3 + 91/45 t^4 + 13/18 t^5 + 31/180 t^6 + 31/1260 t^7 + 1/630 t^8$
and
$Q_("NS")(t) = 17/10080 t^8 + 17/630 t^7 + 7/36 t^6 + 37/45 t^5 + 1607/720 t^4 + 359/90 t^3 + 290/63 t^2 + 332/105 t + 63/64 + (-1)^t / 64$.
Thus the number of discrete CHSH models with parameter $k$ is $0$ if $4$ does not divide $k$, and is $Q_("NS")(k/4)$ if $k = 4t$. The local polynomial has normalized volume $8! dot 1/630 = 64$, whereas the non-signaling quasi-polynomial has normalized volume $8! dot 17/10080 = 68$. Consequently, the asymptotic non-local part $Q_("NS")(t) - Q_("loc")(t)$ has leading term $1/10080 t^8$, and the asymptotic proportion of non-local integer models inside the non-signaling ones is $1/17$.

#figure(
  {
    let data = json("../cone_data.json")

    cetz.canvas({
      import cetz.draw: *

      ortho(y: 0deg, x: -75deg, z: -45deg, {
        // Scale factors: compress x,y, keep z
        let sx = 0.2
        let sy = 0.2
        let p(x, y, z) = (x * sx, y * sy, z)

        // Axes
        line(p(-12, 0, 0), p(12, 0, 0), stroke: 1.2pt)
        line(p(0, -12, 0), p(0, 12, 0), stroke: 1.2pt)
        line(p(0, 0, 0), p(0, 0, 3), stroke: 1.2pt)

        // X ticks (S) — real values, scaled positions
        for v in (-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10) {
          let (cx, cy, cz) = p(v, 0, 0)
          line((cx, cy - 0.2, cz), (cx, cy + 0.2, cz), stroke: 0.7pt)
          // content((cx, cy - 1.0, cz), text(7pt)[$#v$])
        }

        // Y ticks (S')
        for v in (-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10) {
          let (cx, cy, cz) = p(0, v, 0)
          line((cx - 0.2, cy, cz), (cx + 0.2, cy, cz), stroke: 0.7pt)
          // content((cx - 1.3, cy, cz), text(7pt)[$#v$])
        }

        // Z ticks (t) — no scaling
        for v in (1, 2, 3) {
          line((-0.15, 0, v), (0.15, 0, v), stroke: 0.7pt)
          content((-1.3, 0, v), text(7pt)[$#v$])
        }

        // Axis labels
        let (lx, ly, lz) = p(13, 0, 0)
        content((lx, ly, lz), text(8pt)[$S$])
        let (lx2, ly2, lz2) = p(0, 13, 0)
        content((lx2, ly2, lz2), text(8pt)[$S'$])
        content((0, 0, 3.5), text(8pt)[$t$])

        // Local rays (blue)
        for pt in data.local_rays {
          line((0, 0, 0), p(pt.s, pt.sp, pt.t), stroke: blue + 0.7pt, opacity: 0.35)
          circle(p(pt.s, pt.sp, pt.t), radius: 0.14, fill: blue.transparentize(15%), stroke: none)
        }

        // PR rays (orange)
        for pt in data.pr_rays {
          line((0, 0, 0), p(pt.s, pt.sp, pt.t), stroke: orange + 0.7pt, opacity: 0.45)
          circle(p(pt.s, pt.sp, pt.t), radius: 0.16, fill: orange.transparentize(5%), stroke: none)
        }

        // Slice colors
        let slice-colors = (
          "t=1": blue.transparentize(60%),
          "t=2": orange.transparentize(50%),
          "t=3": rgb(0, 180, 0).transparentize(40%),
        )

        // Scatter points per slice
        for (name, pts) in data.slices {
          let col = slice-colors.at(name)
          for pt in pts {
            let r = 0.06 + 0.04 * calc.log(pt.mult + 1)
            circle(p(pt.s, pt.sp, pt.t), radius: r, fill: col, stroke: none)
          }
        }

        // Legend
        // let ly = -40
        // circle(p(ly, 11, 0), radius: 0.14, fill: blue, stroke: none)
        // content((p(ly, 11, 0).first() + 1.5, p(ly, 11, 0).last(), 0), text(7pt)[Locaux])
        // circle(p(ly, 9.8, 0), radius: 0.14, fill: orange, stroke: none)
        // content((p(ly, 9.8, 0).first() + 1.5, p(ly, 9.8, 0).last(), 0), text(7pt)[PR])
        // circle(p(ly, 8.6, 0), radius: 0.10, fill: blue.transparentize(60%), stroke: none)
        // content((p(ly, 8.6, 0).first() + 1.5, p(ly, 8.6, 0).last(), 0), text(7pt)[Tranche $t=1$])
        // circle(p(ly, 7.4, 0), radius: 0.10, fill: orange.transparentize(50%), stroke: none)
        // content((p(ly, 7.4, 0).first() + 1.5, p(ly, 7.4, 0).last(), 0), text(7pt)[Tranche $t=2$])
        // circle(p(ly, 6.2, 0), radius: 0.10, fill: rgb(0, 180, 0).transparentize(40%), stroke: none)
        // content((p(ly, 6.2, 0).first() + 1.5, p(ly, 6.2, 0).last(), 0), text(7pt)[Tranche $t=3$])
      })
    })
  },
  caption: [Cone representation of $𝒮_("ns")$. Each point represents a compatible integer model $N in 𝒮_("ns")$. The #text(fill: blue)[blue] points are local deterministic models ($t=1$), the #text(fill: orange)[orange] points are the PR models ($t=2$), and the semi-transparent points are integer combinations of these generators. The axes $(S,S')$ project each model via its CHSH scores: $S(N) = E(0,0)+E(0,1)+E(1,0)-E(1,1)$ and $S'(N) = E(0,0)+E(0,1)-E(1,0)+E(1,1)$, where $E(x,y) = N(0,0|x,y)+N(1,1|x,y)-N(0,1|x,y)-N(1,0|x,y)$ is the integer correlator for context $(x,y)$. Point sizes reflect projection multiplicities.],
)<fig:cone>
