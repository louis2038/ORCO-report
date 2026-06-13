#import "../template.typ": book, corollary, definition, example, lemma, proof, proposition, remark
#import "../prelude.typ": *

= Appendix <chap:appendix>

#v(-5em)
== Nature of the internship

This internship was unusual because the object studied in this report was not the initial subject. The first plan was to explore links between quantum information, combinatorial structures, and localized complexity classes. In particular, the idea was to ask whether one could define a quantum cost of using entanglement when access to the entangled resource is constrained by locality.

=== The initial subject and the state of the art <app:initial-state-of-art>

#emph[This section is technical and can be skipped (go to @chap:reading-brought) on a first reading. It describes the initial direction of the internship, which was later abandoned in favour of the dynamic framework.]

#let mipstar = $"MIP"^*$
#let mipstarzero = $"MIP"_0^*$
#let RE = $"RE"$

The starting point was a central observation in quantum complexity theory: entangled multi-prover interactive proofs are extremely powerful, as captured by the equality $mipstar = "RE"$. In the standard $mipstar$ model, a verifier interacts with spatially separated provers that may share arbitrary quantum correlations. The model does not impose any explicit structural constraint on how entanglement is distributed, nor on what information is operationally accessible to subsets of provers. This abstraction is theoretically useful, because it isolates the informational consequences of quantum non-locality. However, it also incorporates a strong implicit assumption: the availability of unstructured, globally coordinated correlations at no explicit cost.

In physically motivated settings, information propagation is constrained by locality. Interactions are limited by distance and propagation time, and causal structure bounds what can be coordinated within a given time window. Even when large-scale entangled resources are assumed to be pre-distributed, the ability to access and coordinate arbitrary distant subsystems is not free, since synchronization and correlation across long distances become resources in their own right.

The initial idea was to study models that retain quantum non-locality while enforcing explicit locality constraints, whether geometric, combinatorial, or causal. The goal was not to weaken $mipstar$ a priori, but to identify which aspects of its power rely on unconstrained global correlations, and which persist under structured, bounded access to entanglement.

To this end, we considered introducing a localized variant of entangled multi-prover interactive proofs, denoted $mipstar_0 (k,n)$. The definition separates two levels. First, a global resource specifies how entanglement is distributed, for instance via a large entanglement graph state. Second, each effective interaction is constrained to exploit only local correlations, represented by induced subgraphs of size at most $k$. Informally, at any point in the protocol, only a "local group" of at most $k$ provers may access and exploit the correlations supported on a $k$-vertex window of the global resource. To preserve the flexibility of multi-prover protocols, we allowed $n$ independent copies of the resource state, enabling repeated use of the same local structure across many interactions, while preventing the protocol from implicitly assuming a single globally accessible instance with unbounded coordinated correlations.

This model aimed to capture a simple principle: quantum non-locality is not removed, but organized. The parameter $k$ acts as a correlation granularity, or an effective locality radius, bounding the entanglement that can be operationally mobilized within one interaction. The parameter $n$ functions as a parallelism budget, modeling the ability to distribute multiple independent instances of the same resource without obtaining unconstrained global correlations inside a single instance. Consequently, any global power must arise from repetition, composition, and consistency constraints across local windows, rather than from immediate access to arbitrary global entanglement.

To explore this direction, we read four papers: @botteron2024communicationcomplexitygraphisomorphism, @balliu2024distributedquantumadvantagelocal, @Mančinska_Spaas_Spirig_Vernooij_2025 and @cui2025quantumperfectmatchings. The goal was to find connections that could motivate the approach.

==== Locality and quantum advantage in distributed computing

The paper @balliu2024distributedquantumadvantagelocal exhibits a separation between classical and quantum distributed computation for a problem specified purely by local constraints. The authors define an LCL problem in a bipartite black-white formalism, where white nodes represent vertices and black nodes represent edges, allowing uniform constraints to be expressed via multisets of input-output pairs. They introduce the _iterated GHZ_ problem, which can be viewed as a local composition of GHZ-type nonlocal games whose consistency is locally checkable. Their main result shows that on graphs of maximum degree $Delta$, any classical strategy requires $Omega(Delta)$ rounds, whereas a quantum strategy achieves a constant number of rounds by locally distributing GHZ states and then performing measurements without further communication.

The key point for our purposes was how bounded radius induces structured uncertainty. The round elimination technique transforms a problem $Pi_i$ into a derived problem $Pi_(i+1)$ whose labels are sets of labels of $Pi_i$. This "set lifting" encodes exactly what a node can no longer distinguish when one communication round is removed. Conceptually, this provided a template: instead of relying on implicit global coordination, one explicitly models the information available within a bounded neighborhood, replaces the inaccessible part by a structured description of possibilities, and studies how local constraints compose to enforce global correctness.

==== Combinatorial characterizations of quantum games

A recurrent observation is that operational properties of quantum protocols can be equivalently expressed as structural properties of purely combinatorial objects. Several results in the literature illustrate this principle with remarkable precision.

In @botteron2024communicationcomplexitygraphisomorphism, the authors study the isomorphism game: given two graphs $cal(G)$ and $cal(H)$, if the graphs are isomorphic, then the game admits a perfect classical strategy. By extension, they define the notion of quantum isomorphism $cal(G) attach(tilde.equiv, br: q) cal(H)$ and non-signaling isomorphism $cal(G) attach(tilde.equiv, br: "ns") cal(H)$, which hold whenever there exists a perfect quantum or non-signaling strategy, respectively. A key structural result is that non-signaling isomorphism is equivalent to fractional isomorphism, that is, $cal(G) attach(tilde.equiv, br: "ns") cal(H)$ if and only if there exists a bistochastic matrix $u$ such that $A_cal(G) u = u A_cal(H)$. This is a clean relaxation of the classical notion of isomorphism, which requires $u$ to be a permutation matrix.

A striking result, from @9317964, establishes that $cal(G) attach(tilde.equiv, br: "ns") cal(H)$ is equivalent to $forall "tree" cal(K), space \#"Hom"(cal(K),cal(G)) = \#"Hom"(cal(K),cal(H))$. This is a beautiful correspondence: on one side stands a game, which is a protocol with interactions, rules, and strategies, and on the other side stands a simple combinatorial property involving homomorphism counts. An analogous equivalence holds for quantum isomorphism: $cal(G) attach(tilde.equiv, br: q) cal(H)$ if and only if $forall "planar" cal(K), space \#"Hom"(cal(K),cal(G)) = \#"Hom"(cal(K),cal(H))$. The fact that the laws of quantum mechanics can be captured by a condition on planar homomorphism counts is a striking illustration of the power of combinatorial characterizations.

A second important result is the construction of $D$-fractional isomorphism. The authors introduce a $D$-distance game that imposes that the output node of both players must be at the same distance from the input node, but only when the distance is below $D$. This forces a kind of locally consistent isomorphism. The key observation is that this local condition $cal(G) attach(tilde.equiv, br: q, tr: D) cal(H)$ enforces a global property $cal(G) attach(tilde.equiv, br: "frac") cal(H)$. This demonstrates that a local condition can enforce a global property.

==== Quantum perfect matchings

The paper @cui2025quantumperfectmatchings studies a family of nonlocal games built around the notion of perfect matching. In the bipartite $L$-perfect matching game $"BPM"_G$, the verifier asks questions corresponding to vertices on one side of a bipartite graph, and the players answer with edges. The winning conditions are local: each answer must be incident to the queried vertex, and two answers must be compatible with being part of the same matching. Classically, having a perfect strategy is equivalent to the existence of an actual perfect matching.

What interested us was precisely this passage from local tests to a global combinatorial object. The verifier never sees the whole matching directly; it only checks local consistency conditions. Nevertheless, in the classical case these local checks force the existence of a global perfect matching. This was close to the kind of mechanism we were looking for: global structure should emerge from local compatibility constraints.

The quantum case gives a richer picture. The paper introduces a genuine notion of quantum perfect matching. The main characterization states that a graph $G$ has a quantum perfect matching if and only if its line graph $L(G)$ admits a projective packing of the appropriate value. In this formulation, edges of the original graph are replaced by projectors, and the condition that two incident edges cannot both be selected becomes an orthogonality condition. This showed that a nonlocal game can sometimes be translated into a clean algebraic-combinatorial condition on a derived graph. The paper also contains an important warning: when the same ideas are extended to hypergraphs, deciding the existence of quantum perfect matchings becomes undecidable.

==== Gap-preserving reductions for entangled-prover games

The paper @Mančinska_Spaas_Spirig_Vernooij_2025 studies gap-preserving reductions between entangled-prover games. Its main question is how to transform one nonlocal game into another while preserving the distinction between perfect strategies and strategies that are bounded away from perfect. The authors show that general synchronous games can be reduced to independent set games with only polynomial loss in the gap. The technically difficult part is the approximate case: a near-perfect quantum strategy only gives relations that are approximately true. The paper proves a stability theorem showing that such approximate measurement families can be rounded to genuine projective measurements without losing too much.

This paper was relevant because it gives a precise example of how local combinatorial constraints can retain the hardness of a much more general quantum game. The independent set game has a very simple rule: equal questions require equal answers, and different questions require non-adjacent answers. Yet, through the game graph construction and the stability theorem, this simple game family can encode the complexity of general entangled-prover games.

=== What these readings brought<chap:reading-brought>

The initial motivation was not only complexity-theoretic. My supervisor had developed a broader theoretical viewpoint which seemed to become more stable and coherent over time. After many discussions, I became interested in building a toy model that could justify or at least motivate this way of seeing information, structure, and quantum behaviour.

The ideas from these papers were really the very beginning of the reflection. We tried for a while to work in this direction, but it quickly became clear that it would not lead to something interesting enough on its own. At the same time, my supervisor's intuition about stabilization, interruption, and reconstruction was becoming more precise. Seeing these two directions side by side made us change course: the localized complexity approach was abandoned in favour of the dynamic framework developed in this report.

=== How the project evolved

The first month was mainly devoted to the state of the art described above. The next two months were more exploratory. I tried several directions that did not immediately become the final report. I worked on the distributed-computing framework of @balliu2024distributedquantumadvantagelocal and tried to understand how it could be applied to examples such as $C_5$ #footnote[The game has five players arranged on a cycle. Player $i$ receives a question $x_i$ and answers $a_i$. The winning conditions are:
  $(a_(i-1) + a_i + a_(i+1))(a_(j-1) + a_j + a_(j+1)) = 1$
  whenever $(x_(i-1), x_i, x_(i+1)) = (0,1,0)$, $(x_(j-1), x_j, x_(j+1)) = (0,1,0)$, and $|i - j mod 5| >= 2$. If $x_i = 1$ for all $i$, then the condition is
  $sum_i a_i = 1.$].
I also read about tensor networks, graph-state methods, the zero-gap problem, nonlocal games, and graph-theoretic encodings of quantum constraints. At the same time, I had to think about the philosophical part of the project: what it means for an observation to be only a trace of a hidden process, and how a process can be constrained without being deterministic.

The turning point was the decision to describe observations as events emitted by elementary generators. A generator can be closed, open, or partially emitted. This led to the language of traces, count, automata, Petri nets, and dynamic states. From this point on, the project became more stable. The first concrete results were the integer and Ehrhart-type viewpoint on contextuality in @chap:technical-preliminaries, followed by the construction of dynamic contextual automata in @chap:dynamic-contextual-automata.

Only at this late stage did we realize that some of the quantities introduced in this report were related to measures of contextuality, especially the contextual fraction @Abramsky_Barbosa_Mansfield_2016. This was an important point: it showed that the formalism was not merely a language built for a specific intuition, but could be compared with existing mathematical structures.

== Technical complements

=== What look like $ℋ_("ns")$?

#let local_generators = (
  // D[a0=0,a1=0,b0=0,b1=0]
  ((1, 0, 1, 0), (0, 0, 0, 0), (1, 0, 1, 0), (0, 0, 0, 0)),
  // D[a0=0,a1=0,b0=0,b1=1]
  ((1, 0, 0, 1), (0, 0, 0, 0), (1, 0, 0, 1), (0, 0, 0, 0)),
  // D[a0=0,a1=0,b0=1,b1=0]
  ((0, 1, 1, 0), (0, 0, 0, 0), (0, 1, 1, 0), (0, 0, 0, 0)),
  // D[a0=0,a1=0,b0=1,b1=1]
  ((0, 1, 0, 1), (0, 0, 0, 0), (0, 1, 0, 1), (0, 0, 0, 0)),
  // D[a0=0,a1=1,b0=0,b1=0]
  ((1, 0, 1, 0), (0, 0, 0, 0), (0, 0, 0, 0), (1, 0, 1, 0)),
  // D[a0=0,a1=1,b0=0,b1=1]
  ((1, 0, 0, 1), (0, 0, 0, 0), (0, 0, 0, 0), (1, 0, 0, 1)),
  // D[a0=0,a1=1,b0=1,b1=0]
  ((0, 1, 1, 0), (0, 0, 0, 0), (0, 0, 0, 0), (0, 1, 1, 0)),
  // D[a0=0,a1=1,b0=1,b1=1]
  ((0, 1, 0, 1), (0, 0, 0, 0), (0, 0, 0, 0), (0, 1, 0, 1)),
  // D[a0=1,a1=0,b0=0,b1=0]
  ((0, 0, 0, 0), (1, 0, 1, 0), (1, 0, 1, 0), (0, 0, 0, 0)),
  // D[a0=1,a1=0,b0=0,b1=1]
  ((0, 0, 0, 0), (1, 0, 0, 1), (1, 0, 0, 1), (0, 0, 0, 0)),
  // D[a0=1,a1=0,b0=1,b1=0]
  ((0, 0, 0, 0), (0, 1, 1, 0), (0, 1, 1, 0), (0, 0, 0, 0)),
  // D[a0=1,a1=0,b0=1,b1=1]
  ((0, 0, 0, 0), (0, 1, 0, 1), (0, 1, 0, 1), (0, 0, 0, 0)),
  // D[a0=1,a1=1,b0=0,b1=0]
  ((0, 0, 0, 0), (1, 0, 1, 0), (0, 0, 0, 0), (1, 0, 1, 0)),
  // D[a0=1,a1=1,b0=0,b1=1]
  ((0, 0, 0, 0), (1, 0, 0, 1), (0, 0, 0, 0), (1, 0, 0, 1)),
  // D[a0=1,a1=1,b0=1,b1=0]
  ((0, 0, 0, 0), (0, 1, 1, 0), (0, 0, 0, 0), (0, 1, 1, 0)),
  // D[a0=1,a1=1,b0=1,b1=1]
  ((0, 0, 0, 0), (0, 1, 0, 1), (0, 0, 0, 0), (0, 1, 0, 1)),
)

#let pr_generators = (
  // PR[alpha=0,beta=0,gamma=0]
  ((1, 0, 1, 0), (0, 1, 0, 1), (1, 0, 0, 1), (0, 1, 1, 0)),
  // PR[alpha=0,beta=0,gamma=1]
  ((0, 1, 0, 1), (1, 0, 1, 0), (0, 1, 1, 0), (1, 0, 0, 1)),
  // PR[alpha=0,beta=1,gamma=0]
  ((1, 0, 0, 1), (0, 1, 1, 0), (1, 0, 1, 0), (0, 1, 0, 1)),
  // PR[alpha=0,beta=1,gamma=1]
  ((0, 1, 1, 0), (1, 0, 0, 1), (0, 1, 0, 1), (1, 0, 1, 0)),
  // PR[alpha=1,beta=0,gamma=0]
  ((1, 0, 1, 0), (0, 1, 0, 1), (0, 1, 1, 0), (1, 0, 0, 1)),
  // PR[alpha=1,beta=0,gamma=1]
  ((0, 1, 0, 1), (1, 0, 1, 0), (1, 0, 0, 1), (0, 1, 1, 0)),
  // PR[alpha=1,beta=1,gamma=0]
  ((1, 0, 0, 1), (0, 1, 1, 0), (0, 1, 0, 1), (1, 0, 1, 0)),
  // PR[alpha=1,beta=1,gamma=1]
  ((0, 1, 1, 0), (1, 0, 0, 1), (1, 0, 1, 0), (0, 1, 0, 1)),
)

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: none, // Pas de bordures pour un look plus minimaliste
    ..local_generators
      .enumerate()
      .map(((i, vec)) => [
        #set text(0.8em, gray)
        $mat(..vec)$
      ])
  ),
  caption: [The local generator ${ (d_lambda,1) }_(lambda=1)^16$ can be views like @fig:chsh-matrix, with a matrix representation of a counting vector $N ∈ ℕ^V$ in the CHSH scenario. Rows correspond to Alice’s pairs $(𝑎|𝑥)$, columns to Bob’s pairs $(𝑏|𝑦)$, and each cell to the joint event $(𝑎, 𝑏|𝑥, 𝑦)$. In represent the matrix with the following order $0|0;1|0; 0|1 ; 1|1$ for the two axis Alice and Bob.],
)<fig:local-generator>

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: none, // Pas de bordures pour un look plus minimaliste
    ..pr_generators
      .enumerate()
      .map(((i, vec)) => [
        #set text(0.8em, gray)
        $mat(..vec)$
      ])
  ),
  caption: [The PR generator (or lifted) ${ (r_mu,2) }_(mu=1)^8$ can be views like @fig:local-generator],
)<fig:PR-generator>

=== Dynamic completeness

The main text uses only the monotonicity direction: if a dynamic trajectory exists, then the visible counts are monotone. The converse is elementary but not central to the construction, so we record it here.

#definition(name: "Completeness", id: "def:dynamic-complete")[
  A generator family $cal(G) subset.eq NN^V$ is *complete* if every visible counting admits at least one dynamic explanation:
  $
    forall N in NN^V, quad exists eta, quad N_eta = N.
  $
  Equivalently, $cal(H)_cal(G)(N) != emptyset$ for every $N in NN^V$.
]

#proposition(name: "Dynamic completeness is support coverage", id: "prop:dynamic-complete-support")[
  A generator family $cal(G)$ is complete if and only if its generators cover all visible events:
  $
    forall v in V, quad exists g in cal(G), quad g(v) > 0.
  $
]

#proof[
  Suppose first that the generators cover $V$. For each $v in V$, choose a generator $g_v in cal(G)$ such that $g_v (v) > 0$. Let $epsilon_v in NN^V$ be the unit vector at $v$, and define
  $R_v := g_v - epsilon_v$.
  Since $g_v (v) > 0$, we have $0 <= R_v <= g_v$. Thus $(g_v,R_v)$ is an admissible copy in the extended multiset formulation. Its visible contribution is
  $g_v - R_v = epsilon_v$.
  Now let $N in NN^V$. For each $v in V$, take $N(v)$ copies of $(g_v,R_v)$. The resulting dynamic state $eta$ satisfies
  $
    N_eta
    = sum_(v in V) N (v) (g_v - R_v)
    = sum_(v in V) N (v) epsilon_v
    = N.
  $
  Hence $cal(G)$ is complete.

  Conversely, suppose that the generators do not cover $V$. Then there exists $v in V$ such that $g (v)=0$ for every $g in cal(G)$. If $(g,R)$ is any open or closed copy, with $0 <= R <= g$, then
  $(g-R) (v)=0$.
  Therefore every dynamic state $eta$ satisfies $N_eta (v)=0$. In particular, the unit count $epsilon_v$ cannot be explained. Thus $cal(G)$ is not complete.
]

#proposition(
  name: "Converse monotonicity under dynamic completeness",
  id: "prop:converse-monotonicity-dynamic-complete",
)[
  Suppose that $cal(G)$ is complete. For every finite sequence $N_(1:k) = (N_1,dots,N_k)$ of visible countings in $NN^V$,
  $
    cal(H)_cal(G)(N_(1:k)) != emptyset
    quad <=> quad
    N_1 <= N_2 <= dots <= N_k
  $
  componentwise.
]

#proof[
  The implication from left to right is exactly @prop:visible-counts-monotone.

  Conversely, suppose that $N_1 <= dots <= N_k$ componentwise. Since $cal(G)$ is complete, @prop:dynamic-complete-support gives, for each $v in V$, a generator $g_v in cal(G)$ with $g_v (v)>0$. As in the previous proof, set
  $R_v := g_v - epsilon_v$,
  so that $g_v - R_v = epsilon_v$.
  For each time $i$, define a dynamic state $eta_i$ by taking $N_i (v)$ copies of $(g_v,R_v)$ for every $v in V$. Then
  $
    N_(eta_i)
    = sum_(v in V) N_i (v) (g_v - R_v)
    = sum_(v in V) N_i (v) epsilon_v
    = N_i.
  $
  It remains to check the transition condition. For each $v in V$, set $p_v := (g_v,R_v)$. Several visible events may give the same pair $p_v$, so we argue at the level of multiplicities. Let $𝕞_i (g,R)$ be the multiplicity of the pair $(g,R)$ in $OO_(eta_i)$. By construction,
  $𝕞_i(g,R)
  = sum_(v in V, p_v = (g,R)) N_i (v)$.
  Since $N_i (v) <= N_(i+1) (v)$ for every $v$, we get
  $𝕞_i (g,R)
  <=
  𝕞_(i+1) (g,R)$
  for every pair $(g,R)$.
  We now define the transition map explicitly. An occurrence of $OO_(eta_i)$ is a triple $(g,R,r)$ with $1 <= r <= 𝕞_i (g,R)$. Define
  $phi_i (g,R,r) := (g,R,r)$.
  This is well-defined because $r <= 𝕞_i (g,R) <= 𝕞_(i+1) (g,R)$, so $(g,R,r)$ is also an occurrence of $OO_(eta_(i+1))$. The map $phi_i$ is injective, it preserves the generator, and it leaves the residual unchanged. Hence the residual condition is $R <= R$, which holds. Therefore $eta_i arrow.squiggly eta_(i+1)$ for every $i < k$.
  Thus $(eta_1,dots,eta_k) in cal(H)_cal(G)(N_(1:k))$, so the fibre is non-empty.
]

=== The overlap problem in the integer setting<annex:overlap-integer>

The overlap problem of @ex:overlap has an exact integer counterpart.
Recall the scenario: three measurements $X = {a, b, c}$, contexts
$C_1 = {a,b}$, $C_2 = {b,c}$, $C_3 = {a,c}$, and binary outcomes.
The probabilistic model of @ex:overlap lifts to an integer counting at level $t = 20$:

#figure(
  table(
    columns: 6,
    align: center,
    inset: 6pt,
    table.header([$C$], [$(0,0)$], [$(1,0)$], [$(0,1)$], [$(1,1)$], [total]),
    [${a,b}$], [$7$], [$3$], [$5$], [$5$], [$20$],
    [${b,c}$], [$6$], [$4$], [$2$], [$8$], [$20$],
    [${a,c}$], [$6$], [$2$], [$4$], [$8$], [$20$],
  ),
  caption: [Integer counting at level $t = 20$, obtained by multiplying the probabilities of @ex:overlap by $20$.],
)

The same two global sections appear, now with integer multiplicities:

- $g_1 = (a|->0, b|->0, c|->0)$: restrictions $(0,0)$ in every context, with counts $7, 6, 6$.
  The maximum multiplicity is $z(g_1) = min(7, 6, 6) = 6$.
- $g_2 = (a|->0, b|->0, c|->1)$: restrictions $(0,0)$ in $C_1$, $(0,1)$ in $C_2$, $(0,1)$ in $C_3$,
  with counts $7, 2, 2$.
  The maximum multiplicity is $z(g_2) = min(7, 2, 2) = 2$.

Individually, each gives a valid subcounting: $M z_1 <= N$ with $z_1 = (6, 0, dots, 0)$,
and $M z_2 <= N$ with $z_2 = (0, 0, dots, 2, 0, dots)$.
But their #emph[sum] fails. At context $C_1$, both $g_1$ and $g_2$ restrict to the same local
event $(a|->0, b|->0)$. The combined multiplicity is $6 + 2 = 8$, while $N_(C_1)(a|->0, b|->0) = 7$.
The constraint
$
  sum_(g|_(C_1) = (a|->0, b|->0)) z(g) <= 7
$
is violated. In the language of generators: we are trying to place $8$ copies of a deterministic
explanation on an event that was only observed $7$ times. The constraint $M z <= N$ prevents this.

The integer and probabilistic overlap problems are the #emph[same linear inequality],
only seen at different scales. Dividing by $t = 20$ recovers the probabilistic version:
$6/20 + 2/20 = 0.40 > 0.35 = 7/20$.
The constraint $M z <= N$ is the integer form of $M c <= e_N$ with $c = z / t$.
In both cases, the root cause is identical: two global sections compete for the same local
event, and their combined mass exceeds what the model allows.

This is why the consistent subcounting set $C_N (X)$ is defined with a $<=$ constraint
rather than equality. The $<=$ allows multiple global sections to share a local event,
up to its observed count. Without it, any attempt to combine generators would either
overcount or force a rigid assignment that may not exist.

=== Detailed calculations for the gap formulas<part:details-calculations-1>

This appendix records the explicit algebraic steps behind two identities used in the main text. Both concern the gap between the Tsirelson bound $2 sqrt(2)$ and the isotropic Tsirelson score $T_"iso" (t)$ at finite level $t$.

==== Notation and starting point

We recall the definitions used throughout.

- $p^* := (2+sqrt(2)) \/ 4$ is the optimal winning probability on the isotropic line.
- $w^* (t) := floor(t p^*)$ is the largest integer winning count compatible with the quantum set at level $t$.
- $T_"iso" (t) := (4(2 w^* (t) - t)) \/ t$ is the isotropic Tsirelson score at level $t$.
- $"frac" (x) := x - floor(x)$ denotes the fractional part of a real number $x$.

The goal is to prove two equalities:

+ $2 sqrt(2) - T_"iso" (t) = (8 dot "frac"(t p^*)) \/ t$,
+ $2 sqrt(2) - T_"iso" (t) = 2 (sqrt(2) - r_t)$, where $r_t := (4 w^*(t) - 2t) \/ t$.

==== Derivation 1: The fractional-part formula

We want to show:

$
  2 sqrt(2) - T_"iso" (t) = (8 dot "frac"(t p^*)) / t.
$
Since $p^* = (2+sqrt(2))/4$, we have $4p^* = 2 + sqrt(2)$, hence $sqrt(2) = 4p^* - 2$, and therefore
$2 sqrt(2) = 8 p^* - 4$.
By definition,

$
  T_"iso" (t) = (4(2 w^*(t) - t)) / t = (8 w^*(t) - 4t) / t = (8 w^*(t)) / t - 4.
$

We compute the gap:
$
  2 sqrt(2) - T_"iso" (t) & = (8 p^* - 4) - ((8 w^*(t)) / t - 4) \
                          & = 8 p^* - 4 - (8 w^*(t)) / t + 4 \
                          & = 8 p^* - (8 w^*(t)) / t \
                          & = (8 t p^* - 8 w^*(t)) / t \
                          & = (8(t p^* - w^*(t))) / t.
$

Then we identify the fractional part.
By definition, $w^*(t) = floor(t p^*)$. Therefore
$
  t p^* - w^*(t) = t p^* - floor(t p^*) = "frac"(t p^*).
$
Substituting:
$
  2 sqrt(2) - T_"iso" (t) = (8 dot "frac"(t p^*)) / t.
$

==== Derivation 2: The rational-approximation formula

We want to show:
$
  2 sqrt(2) - T_"iso" (t) = 2 (sqrt(2) - r_t),
$
where $r_t := (4 w^*(t) - 2t) \/ t$ is the rational approximation to $sqrt(2)$ at level $t$.

First, verify that $r_t$ approximates $sqrt(2)$.
From the definition of $T_"iso"(t)$:
$
  T_"iso" (t) = (8 w^*(t) - 4t) / t = (4(2 w^*(t) - t)) / t.
$
Define $c_t := (2 w^*(t) - t) \/ t$. This is the integer correlator at level $t$, normalized by $t$. Then $T_"iso" (t) = 4 c_t$, and
$
  r_t = (4 w^*(t) - 2t) / t = 2 dot (2 w^*(t) - t) / t = 2 c_t.
$
At the quantum optimum, each correlator equals $sqrt(2) \/ 2$, so $c^* = sqrt(2) \/ 2$ and $r^* = 2 c^* = sqrt(2)$. Thus $r_t$ is the rational approximation to $sqrt(2)$ obtained by replacing the ideal correlator $c^*$ with the finite-level correlator $c_t$.

Then, we express the gap in terms of $r_t$.
From Derivation 1, we already know:
$
  2 sqrt(2) - T_"iso" (t) = 8 p^* - (8 w^*(t)) / t.
$
Now substitute $p^* = (2+sqrt(2))/4$:
$
  8 p^* = 8 dot (2+sqrt(2))/4 = 2(2+sqrt(2)) = 4 + 2 sqrt(2).
$
Also,
$
  (8 w^*(t)) / t = 2 dot (4 w^*(t)) / t = 2 dot (4 w^*(t) - 2t + 2t) / t = 2(r_t + 2) = 2 r_t + 4.
$
Therefore:
$
  2 sqrt(2) - T_"iso" (t) = (4 + 2 sqrt(2)) - (2 r_t + 4) = 2 sqrt(2) - 2 r_t = 2(sqrt(2) - r_t).
$

==== Summary: The two equivalent forms

The gap admits three equivalent expressions:

$
  2 sqrt(2) - T_"iso" (t)
  = (8 dot "frac"(t p^*)) / t
  = 2 (sqrt(2) - r_t)
  = 2 dot (sqrt(2) - 2 c_t),
$

where $c_t = (2 w^*(t) - t) \/ t$ is the normalized integer correlator.

The first form makes the Diophantine nature explicit: the gap is controlled by how close $t p^*$ is to an integer. The second form shows that the gap is twice the error of the rational approximation $r_t$ to $sqrt(2)$. The third form decomposes this further: the per-correlator gap is $sqrt(2)/2 - c_t$, and the total CHSH gap is four times this value (since there are four correlators), which simplifies to $2(sqrt(2) - 2 c_t)$.

==== Connection to the CHSH game structure

The factor of $2$ in the formula $2(sqrt(2) - r_t)$ has a structural origin. The CHSH score decomposes into two complementary pairs of contexts:
$
  S = underbrace((E(0,0) + E(1,0)), "pair 1") + underbrace((E(0,1) - E(1,1)), "pair 2").
$
On the isotropic line, each pair has the same value $2 c_t$. At the quantum optimum, each pair equals $sqrt(2)$. The per-pair deficit is therefore $sqrt(2) - 2 c_t = sqrt(2) - r_t$, and the total deficit is twice this value.
Equivalently, the CHSH game has three positive contexts and one negative context. The gap from the three positive contexts is $3(sqrt(2) - r_t)$ (they are below ideal), and the gap from the negative context is $-(sqrt(2) - r_t)$ (it is above ideal, i.e., less anti-correlated than optimal). The net gap is $3(sqrt(2) - r_t) - (sqrt(2) - r_t) = 2(sqrt(2) - r_t)$.
This factor of $2$ is therefore a consequence of the CHSH game structure ($3$ positive minus $1$ negative gives a net coefficient of $2$), not an artifact of the approximation.

=== Example of an interruption profile

#example(name: "Two-coordinate interruption profile", id: "ex:interruption-profile-two-coordinates")[
  This example illustrates the integer construction of the interruption profile and its moments. Consider a dynamic explanation with two visible coordinates. Let
  $
    P_η = (4,2),
    quad
    F_η = (6,10).
  $
  The total heights between past and future are
  $
    h_η = F_η - P_η = (2,8).
  $
  Hence the common resolution is
  $
    Δ_η = "lcm"(2,8) = 8.
  $
  The local resolution factors are therefore
  $
    q_η (1) = 8 / 2 = 4,
    quad
    q_η (2) = 8 / 8 = 1.
  $

  Now choose the interrupted visible state
  $
    N_η = (5,4).
  $
  Then the emitted part after the closed past is
  $
    a_η = N_η - P_η = (1,2).
  $
  The discrete interruption times are
  $
    k_η (1) = a_η (1) q_η (1) = 1 dot 4 = 4,
    quad
    k_η (2) = a_η (2) q_η (2) = 2 dot 1 = 2.
  $
  Thus the two coordinates are not synchronized. The first coordinate is at time $4 \/ 8$, while the second coordinate is at time $2 \/ 8$.
  The interruption profile is therefore
  $k_η = (4, 2)$.
  // This already contains the full dynamic information. The two coordinates have advanced at different speeds: the first has covered half of its path, while the second has covered only a quarter.

  // We can extract integer moments from this profile:
  // $
  //   H_η &= 2 + 8 = 10, \
  //   S_η &= 2 dot 4 + 8 dot 2 = 8 + 16 = 24, \
  //   R_η &= 2 dot 4^2 + 8 dot 2^2 = 32 + 32 = 64, \
  //   K_η &= 4 + 2 = 6, \
  //   Q_η &= 4^2 + 2^2 = 16 + 4 = 20.
  // $
  // All these quantities are integers. The weighted dispersion residual is
  // $
  //   H_η R_η - S_η^2
  //   = 10 dot 64 - 24^2
  //   = 640 - 576
  //   = 64.
  // $
  // This is strictly positive, which confirms that the two $k_η(v)$ are not equal.

  // Compare this with the synchronized choice
  // $
  //   N_η' = (5,6),
  //   quad
  //   a_η' = (1,4),
  //   quad
  //   k_η' = (4,4).
  // $
  // Then $K_η' = 8$, $Q_η' = 32$, $S_η' = 2 dot 4 + 8 dot 4 = 40$, $R_η' = 2 dot 16 + 8 dot 16 = 160$, and the weighted dispersion residual becomes
  // $
  //   H_η R_η' - S_η'^2
  //   = 10 dot 160 - 40^2
  //   = 1600 - 1600
  //   = 0.
  // $
  // The zero value confirms that the synchronized profile has all $k_η(v)$ equal. The two profiles have the same scalar distances $d_η^- = 3$ and $d_η^+ = 7$, but their interruption profiles are different. This illustrates why the profile $k_η$ contains more information than the product $d_η^- d_η^+$.
]
