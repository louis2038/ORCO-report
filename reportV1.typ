// #import "@local/tool-box-louis:1.0.0": book, corollary, definition, lemma, proof, proposition, remark
#import "template.typ": book, corollary, definition, lemma, proof, proposition, remark

// s#import "@preview/physica:0.9.8": *

#import "title.typ": title-page-report

#set page(paper: "us-letter")

#show: book.with(
  title: [Contextuality as Automata: Open Generators and the Dynamics of Quantum Phenomena],
  author: "Louis TRIOULEYRE--ROBERJOT",
  title-page-fct: title-page-report,
)

#import "@preview/dashy-todo:0.1.3": todo

#set par(spacing: 1.2em, first-line-indent: 0pt)

#outline()

// = Context and Motivation
// == A non-standard internship
// == Initial motivation: locality and quantum correlations
// == Why the question had to be reformulated
// == Final scope of the report
// == Contributions

// = Conceptual Framework: Observation, Locality, and Reconstruction
// == Phenomena and hidden structure
// == Models rather than metaphysical explanations
// == Understanding as reconstruction
// == Why traces?
// == Why locality?

// = Background and State of the Art
// == Nonlocal games
// == CHSH as a minimal test case
// == Contextuality and count-based descriptions
// == Automata, traces, and Parikh images
// == Petri nets and process models

// = Technical Preliminaries
// == Events and contexts
// == Traces
// == Count vectors
// == Classical deterministic strategies
// == CHSH and PR supports

// = Dynamic Trace Model
// == Hidden mechanisms as automata
// == Compression from traces to counts
// == Explainability of compressed observations
// == Local model changes
// == Scientific mediation: lab, intermediary, verifier

// = Generators, Petri Nets, and Interfaces
// == Generators as elementary behaviours
// == Closed and open executions
// == Petri-net representation
// == Residual fragments
// == Interfaces as interrupted states
// == Past/future signatures

// = Case Study: CHSH
// == Local deterministic generators
// == PR generators
// == Count-based CHSH analysis
// == Interface-based CHSH analysis
// == Balanced half-PR interruptions
// == Appearance of the factor $1 / sqrt(2)$
// == Computational verification

// = Discussion
// == What the model explains
// == What the model does not explain
// == Relation to quantum intuition
// == Limits of the current approach

// = Conclusion and Perspectives
// == Summary
// == Contributions
// == Future work: GHZ, Tsirelson, and possible quantum extensions

= Context and Motivation

== Everything start by a philosophical question

[parler de la vision philosophie des processus - de l'interuption - des environemment - changement de résolution - du quatre on n'est jamais sur de rien - de la stabilisation des idées vu comme rayon qui rebondit - ect] mais rester trés bref !

== The open question of quantum correlations : why do they exist ? How to explain them ? What is the best theory that reconciliate relativity and quantum ?

[parler de la littérature a ce sujet] a quoi sert les jeux contextuels, les jeux non-locaux, parler de MIP = RE, quel impact sur notre vision du monde ? Théorie des faiseaux (sheaf theorie) - essayer de construire une méta théorie sur les expériences elle meme et sur le concept même de théorie scientifique.

== Our approch: Discrete contextuality

[nous voulons éviter les espaces de probabilité - les espaces tout court - les maths ainsi que tout hypothese] Le but est de partir d'aucun axiome, nous voulons douter de tout : dire soit X un ensemble de chose tel que ... cette ensemble n'existe pas ? ou alors il faut le construire ! Le rayon pousse des murs et le processus de stabilisation crée l'espace.

== What we expect from a theory of discrete contextuality

[Nous ne voulons pas remplacer le quantique - les espaces de hilbert ] MAIS le quantique soufre d'une trés mauvaise formulation, plusieurs variante (C algebra, anticommutator algebra, finite hilbert space) ne donne pas les meme résultat voir mip star egal RE. Donc nous voulons proposer une approche naturel dans le sens définie au dessus, qui puisse exprimer des choses qui sont plus complexe a exprimer avec une abstraction. Nous voulons construire une interprétation construitive du quantique qui n'oublie pas, et qui doute en permanance de ses propres hypothese.

= State of the art

The subjet has evoled a lot during my internship, this start by

== The initial state of the art and the initial subjet

#let mipstar = $"MIP"^*$

We start from a now central observation in quantum complexity theory: entangled multi-prover interactive proofs are extremely powerful, as captured by the equality $mipstar = "RE"$. In the standard $mipstar$ model, a verifier interacts with spatially separated provers that may share arbitrary quantum correlations. Importantly, the model does not impose any explicit structural constraint on how entanglement is distributed, nor on what information is operationally accessible to subsets of provers. This abstraction is theoretically useful, because it isolates the informational consequences of quantum non-locality. However, it also incorporates a strong implicit assumption: the availability of unstructured, globally coordinated correlations at no explicit cost.

In physically motivated settings, information propagation is constrained by locality. Interactions are limited by distance and propagation time, and causal structure bounds what can be coordinated within a given time window. Even when large-scale entangled resources are assumed to be pre-distributed, the ability to access and coordinate arbitrary distant subsystems is not free, since synchronization and correlation across long distances become resources in their own right.

The first idea of the interphip was to study the models that retain quantum non-locality while enforcing explicit locality constraints, whether geometric, combinatorial, or causal. The goal is not to weaken $mipstar$ a priori, but to identify which aspects of its power rely on unconstrained global correlations, and which persist under structured, bounded access to entanglement.

To this end, we would have liked to introduce a localized variant of entangled multi-prover interactive proofs, denoted $mipstar_0 (k,n)$. The definition separates two levels. First, a global resource specifies how entanglement is distributed, for instance via a large entanglement graph state. Second, each effective interaction is constrained to exploit only local correlations, represented by induced subgraphs of size at most $k$. Informally, at any point in the protocol, only a "local group" of at most $k$ provers may access and exploit the correlations supported on a $k$-vertex window of the global resource, as if the verifier could probe only bounded-size subsystems. To preserve the flexibility of multi-prover protocols, we allow $n$ independent copies of the resource state, enabling repeated use of the same local structure across many interactions, while preventing the protocol from implicitly assuming a single globally accessible instance with unbounded coordinated correlations.

This model aims to capture a simple principle: quantum non-locality is not removed, but organized. The parameter $k$ acts as a correlation granularity, or an effective locality radius, bounding the entanglement that can be operationally mobilized within one interaction. The parameter $n$ functions as a parallelism budget, modeling the ability to distribute multiple independent instances of the same resource without obtaining unconstrained global correlations inside a single instance. Consequently, any global power must arise from repetition, composition, and consistency constraints across local windows, rather than from immediate access to arbitrary global entanglement.

The framework supports two complementary objectives. First, it provides a language for threshold questions, such as determining for which growth rates of $k$ (as a function of the input size) the model recovers the full power of $mipstar$, and under which restrictions it yields strictly weaker classes. Second, it creates a common formal setting connecting tools from nonlocal games, entanglement graph theory, and distributed models, because the "induced subgraph of size $k$" constraint enforces an inherently local viewpoint compatible with notions of radius, distance, and composition. We next discuss how ideas from distributed computing offer a concrete methodology for reasoning about bounded information access.

To do so, i first read four papers @botteron2024communicationcomplexitygraphisomorphism, @balliu2024distributedquantumadvantagelocal, @Mančinska_Spaas_Spirig_Vernooij_2025 and @cui2025quantumperfectmatchings. The first goal was to find relevent link the can motivate our approch.

=== Locality and quantum advantage in distributed computing

The paper @balliu2024distributedquantumadvantagelocal exhibits a separation between classical and quantum distributed computation for a problem specified purely by local constraints. The authors define an LCL problem in a bipartite black-white formalism, where white nodes represent vertices and black nodes represent edges, allowing uniform constraints to be expressed via multisets of input-output pairs. They introduce the _iterated GHZ_ problem, which can be viewed as a local composition of GHZ-type nonlocal games whose consistency is locally checkable. Their main result shows that on graphs of maximum degree $Delta$, any classical strategy requires $Omega(Delta)$ rounds, whereas a quantum strategy achieves a constant number of rounds by locally distributing GHZ states and then performing measurements without further communication.

Methodologically, the key point for our purposes is how bounded radius induces structured uncertainty. The round elimination technique transforms a problem $Pi_i$ into a derived problem $Pi_(i+1)$ whose labels are sets of labels of $Pi_i$. This "set lifting" encodes exactly what a node can no longer distinguish when one communication round is removed. Since this transformation quickly becomes intractable at the level of explicit descriptions, the authors introduce a sequence of relaxations that preserves the operational implication: solving a relaxation in $t$ rounds implies solving the preceding problem in $t+1$ rounds.

Conceptually, this provides a template for our program. Instead of relying on implicit global coordination, one explicitly models the information available within a bounded neighborhood, replaces the inaccessible part by a structured description of possibilities, and studies how local constraints compose to enforce global correctness. This perspective suggests viewing locality as a constraint on distinguishability, and therefore as a constraint on the representation of information. One can think of an abstract "information band" whose position corresponds to the level of accessible structure. Moving toward smaller locality windows corresponds to replacing precise facts by sets of feasible possibilities consistent with local observations, which increases descriptive uncertainty and forces an expansion of the local alphabet. Moving toward larger windows corresponds to reducing uncertainty by enforcing compatibility constraints, effectively projecting ambiguous descriptions onto coherent ones. In distributed settings, this is exactly what the transformation $Pi arrow.bar R(Pi)$ formalizes: reducing the communication radius increases uncertainty, which must be compensated by richer local descriptions.

In our localized $mipstar$ framework, an analogous mechanism arises from bounding the exploitable entanglement. We assume a global resource, such as an entanglement graph, but restrict each interaction to induced subgraphs of size $k$, possibly across $n$ independent copies. Decreasing $k$ forces most of the global structure out of view, which suggests that any soundness or completeness analysis must work with coarser, set-valued descriptions of what distant provers could be doing, whereas increasing $k$ allows more direct constraints and reduces ambiguity. Our goal is to formalize this trade-off, identify which combinatorial properties of the resource graph control the power of $mipstar_0 (k,n)$, and determine how locally accessible quantum correlations can compose to enforce global language recognition.

=== Combinatorial characterizations of quantum games

A recurrent thing is that operational properties of quantum protocols can be equivalently expressed as structural properties of purely combinatorial objects. Several results in the literature illustrate this principle with remarkable precision.

In @botteron2024communicationcomplexitygraphisomorphism, the authors study the isomorphism game: given two graphs $cal(G)$ and $cal(H)$, if the graphs are isomorphic, then the game admits a perfect classical strategy. By extension, they define the notion of quantum isomorphism $cal(G) tilde.equiv_q cal(H)$ and non-signaling isomorphism $cal(G) tilde.equiv_("ns") cal(H)$, which hold whenever there exists a perfect quantum or non-signaling strategy, respectively. A key structural result is that non-signaling isomorphism is equivalent to fractional isomorphism, that is, $cal(G) tilde.equiv_("ns") cal(H)$ if and only if there exists a bistochastic matrix $u$ such that $A_cal(G) u = u A_cal(H)$. This is a clean relaxation of the classical notion of isomorphism, which requires $u$ to be a permutation matrix.

A first striking result, from @9317964, establishes that $cal(G) tilde.equiv_("ns") cal(H)$ is equivalent to $forall "tree" cal(K), space \#"Hom"(cal(K),cal(G)) = \#"Hom"(cal(K),cal(H))$. This is a beautiful correspondence because the two sides are very different in nature: on one side stands a game, which is a protocol with interactions, rules, and strategies, and on the other side stands a simple combinatorial property involving homomorphism counts. Even more surprisingly, an analogous equivalence holds for quantum isomorphism: $cal(G) tilde.equiv_q cal(H)$ if and only if $forall "planar" cal(K), space \#"Hom"(cal(K),cal(G)) = \#"Hom"(cal(K),cal(H))$. The fact that the laws of quantum mechanics can be captured by a condition on planar homomorphism counts is a striking illustration of the power of combinatorial characterizations. This result is precisely the kind of equivalence we want to find.

A second important result from the same line of work is the construction of the notion of $D$-fractional isomorphism. The authors introduce a $D$-distance game that imposes that the output node of both players must be at the same distance from the input node, but only when the distance is below $D$. This forces a kind of locally consistent isomorphism. The key observation is that this local condition $cal(G) tilde.equiv^D_("ns") cal(H)$ enforces a global property $cal(G) tilde.equiv_("frac") cal(H)$. This is directly relevant to our programme: it demonstrates that a local condition can enforce a global property.

=== Quantum perfect matchings

The paper @cui2025quantumperfectmatchings studies a family of nonlocal games built around the notion of perfect matching. In the bipartite $L$-perfect matching game $"BPM"_G$, the verifier asks questions corresponding to vertices on one side of a bipartite graph, and the players answer with edges. The winning conditions are local: each answer must be incident to the queried vertex, and two answers must be compatible with being part of the same matching. Classically, having a perfect strategy is equivalent to the existence of an actual perfect matching.

What interested us in this paper is precisely this passage from local tests to a global combinatorial object. The verifier never sees the whole matching directly; it only checks local consistency conditions. Nevertheless, in the classical case these local checks force the existence of a global perfect matching. This is close to the kind of mechanism we were looking for when trying to build a toy model for my tutor's broader intuition: global structure should emerge from local compatibility constraints.

The quantum case gives a richer picture. For some versions of the game, quantum strategies do not give an advantage over classical ones: in particular, the bipartite $L$-perfect matching game is quantum sound. But in more general settings, the paper introduces a genuine notion of quantum perfect matching. The main characterization states that a graph $G$ has a quantum perfect matching if and only if its line graph $L(G)$ admits a projective packing of the appropriate value. In this formulation, edges of the original graph are replaced by projectors, and the condition that two incident edges cannot both be selected becomes an orthogonality condition.

This result was useful for us as a methodological example. It shows that a nonlocal game can sometimes be translated into a clean algebraic-combinatorial condition on a derived graph. The line graph is not just a technical construction: it records which local choices are incompatible. This suggested a general way of thinking about local quantum protocols: instead of trying to understand the whole quantum strategy directly, one can look for a graph encoding the conflicts between local constraints, and then study projectors, orthogonality, and packing-type conditions on this graph.

The paper also contains an important warning. When the same ideas are extended to hypergraphs, deciding the existence of quantum perfect matchings becomes undecidable. This shows that local quantum constraints can quickly become extremely expressive.

=== Gap-preserving reductions for entangled-prover games

The paper @Mančinska_Spaas_Spirig_Vernooij_2025 studies gap-preserving reductions between entangled-prover games. Its main question is how to transform one nonlocal game into another while preserving the distinction between perfect strategies and strategies that are bounded away from perfect. This is important because, without control of the gap, a reduction may preserve exact satisfiability but lose all useful quantitative information.

The authors show that general synchronous games can be reduced to independent set games with only polynomial loss in the gap. Given a synchronous game $cal(G)$, they build a game graph $X(cal(G))$ whose vertices are question-answer pairs $(q,a)$. Two vertices are adjacent when the corresponding answers would make the players lose. A perfect strategy for the original game then corresponds to a suitable independent-set-type strategy on this graph. The main theorem shows that if
$
  omega^*(cal(G)) = 1,
$
then the reduced independent set game also has value $1$, while if
$
  omega^*(cal(G)) <= 1 - epsilon,
$
then the reduced game has value at most
$
  1 - Omega(epsilon^8 / t^4),
$
where $t$ is the number of questions. Thus the reduction preserves the gap up to a polynomial loss.

The technically difficult part is the approximate case. A near-perfect quantum strategy only gives relations that are approximately true: measurements are almost projective, orthogonality is almost satisfied, and consistency is only approximate. The paper proves a stability theorem showing that such approximate measurement families can be rounded to genuine projective measurements without losing too much. This is the core mechanism that makes the reduction gap-preserving rather than merely exact.

This paper was relevant to us because it gives a precise example of how local combinatorial constraints can retain the hardness of a much more general quantum game. The independent set game has a very simple rule: equal questions require equal answers, and different questions require non-adjacent answers. Yet, through the game graph construction and the stability theorem, this simple game family can encode the complexity of general entangled-prover games.

=== Conclusion

For our internship, the initial motivation was not only complexity-theoretic. My tutor had developed a broader theoretical viewpoint which seemed to become more stable and coherent over time. After many discussions, I became interested in building a toy model that could justify or at least motivate this way of seeing information, structure, and quantum behaviour. In that context, the paper was useful less as a direct roadmap toward a new complexity class, and more as a proof that local compatibility rules, when organized correctly, can preserve deep global properties. The key ideas we retained were the construction of a derived graph from a game, the role of approximate-to-exact stability, and the importance of controlling how errors accumulate when local constraints are combined.

== Philosophical view

[explique vite fait l'idée de mont tuteur sans en faire des tonnes]

== The midle state of the art

The present work is situated at the intersection of epistemic reconstructions of quantum theory, sheaf-theoretic contextuality, and process-theoretic approaches to quantum mechanics. A first important precedent is Spekkens’ toy theory, where an elementary system has four ontic states, while maximal knowledge only identifies a subset of two possible states. This model shows that many phenomena usually regarded as characteristically quantum — interference, noncommutativity of measurements, no-cloning, teleportation, dense coding, steering, and several forms of entanglement-like behaviour — can arise from structured incomplete knowledge rather than from an ontic quantum state. However, Spekkens’ model remains local and non-contextual, and therefore fails to reproduce Bell inequality violations and Kochen–Specker contextuality. This failure is crucial for my approach: it suggests that the quantum cannot be explained by *static ignorance over a hidden state alone*.

The sheaf-theoretic framework of Abramsky and Brandenburger gives the mathematical language needed to locate this obstruction. In their setting, an empirical model is a compatible family of local probability distributions over a measurement cover, and contextuality is precisely the obstruction to extending this compatible local data to a global section. Strong contextuality corresponds to the absence of even a single global assignment compatible with the support of the model. This shifts the problem from hidden variables to gluing: the non-classical feature is not merely uncertainty, but the impossibility of globally stabilizing all local descriptions at once. Later cohomological refinements show that all-vs-nothing arguments, such as GHZ-type contradictions, can be witnessed by topological or cohomological obstructions. This supports the view that contextuality is not an accidental probabilistic anomaly, but a structural failure of global reconciliation.

Quantitative approaches, especially the contextual fraction and its linear-programming formulation, refine this picture by measuring how much of an empirical model can be explained non-contextually. These methods identify the largest subdistribution over global assignments that can be extracted from a model. In my setting, this naturally suggests replacing normalized probabilities by integer-valued countings at a fixed level. Instead of working only with distributions satisfying $sum_x d(x)=1$, I consider graded counting objects satisfying $sum_x d(x)=t$. This preserves the number of experimental occurrences and leads to a semigroup of compatible countings. The Hilbert basis of this semigroup then plays the role of a set of irreducible processual generators: local deterministic generators appear at level one, while contextual generators such as PR-type atoms may appear at higher levels.

Process-theoretic approaches, especially categorical quantum mechanics, provide a further conceptual motivation. They treat quantum theory not primarily as a theory of states, but as a theory of composable processes. However, these approaches generally still represent completed morphisms or protocols. My proposal is to push the processual reading further: the relevant object is not only a process, but an interrupted process. I represent such an interruption by a past/future decomposition
// $$
// \eta=(E_\eta,R_\eta),
// $$
// where $E_\eta$ is the already actualized visible part and $R_\eta$ is the residual future required for stabilization. The completed object is
// $$
// K_\eta=E_\eta+R_\eta.
// $$
// If $K_\eta$ is compatible in the sheaf-theoretic sense, then the future exactly compensates the gluing defect of the past:
// $$
// \delta R_\eta=-\delta E_\eta.
// $$
Thus the future is not an external addition but the co-recollement that gives the past its final meaning.

This leads to the central hypothesis of my work: a quantum state should be understood as the observation of a process that has not yet stabilized. Superposition is then not the coexistence of several ontic states, but the multiplicity of possible stabilizing completions of an unfinished prefix. Entanglement is not a mysterious extra bond between subsystems, but the failure of the space of completions to factorize locally. In this sense, the quantum is a hole in stabilization: a phenomenon seen before the process has fully resolved its global meaning.

This perspective also suggests a way to avoid collapsing into unrestricted no-signaling theories. PR-type generators may be legitimate internal atoms of the Hilbert basis, but they should not be accepted as terminal stable states. A PR box is then interpreted as an interrupted or isolated phase of a larger stabilization cycle, not as a physically completed phenomenon. By contrast, GHZ-type supports can be understood as closures of contextual fibers. In computations on GHZ and related games, one can define an invariant $nu(P)$ measuring the minimal integer level at which a target support $P$ admits a compatible counting. For GHZ-type supports, this minimal level is greater than one, reflecting strong contextuality, but finite, reflecting the possibility of non-classical stabilization. A second invariant $kappa(P)$ measures how many minimal fibers are needed to reconstruct the target generator. This suggests that perfect quantum phenomena may correspond not to isolated contextual atoms, but to dynamically stabilized compositions of non-globalizable fibers.

Thus, the proposed framework combines three insights from the literature while changing their point of contact: from Spekkens, I retain the idea that quantum phenomena express structured incompleteness; from sheaf theory, I retain the idea that contextuality is obstruction to global stabilization; from process theories, I retain the primacy of compositional dynamics. The new claim is that the quantum should be modeled as an intermediate phase of an automaton of Hilbert-basis generators, where observation captures a past that has not yet received its final interpretation through future closure.

= Technical Preliminaries

In this section we will introduce the technical concept from generic contextuality to our theory of discrete contextuality.

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
  The *event presheaf* associated with this scenario is the functor $cal(E) : cal(P)(X)^"op" -> "Set"$
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

In the usual probabilistic case, one takes $R = RR_(>=0)$ and restricts each context to level $1$. In the discrete experimental case considered here, one takes $R = NN$ and keeps the integer level explicit. This matters because a raw family $(N_C)_(C in cal(M))$ may initially have different local levels $t_C := |N_C|$. Such a raw family is not yet a discrete empirical model of level $t$ unless all $t_C$ are equal to the same integer $t$.

In all the following we suppose that $cal(M)$ is a *measurement cover*, meaning $union_(C in cal(M)) C = X$, and that it is an antichain, meaning $C subset.eq D$ with $C,D in cal(M)$ implies $C = D$.

#definition[
  An *empirical model* over $chevron.l X, cal(M), O chevron.r$ is a family $e = (e_C)_(C in cal(M))$ with $e_C in 𝒟_R (ℰ(C))$, satisfying compatibility on overlaps. Namely, for all contexts $C,D in cal(M)$, the restrictions of $e_C$ and $e_D$ to $C inter D$ must agree:
  $
    e_C|_(C inter D) = e_D|_(C inter D).
  $
]<def:empirical_model>
In the probabilistic case, this says that the marginal distributions coincide. In the counting case, it says that the marginal count vectors coincide exactly.

#definition[
  A *discrete empirical model of level* $t$ is a family $N = (N_C)_(C in cal(M))$ with $N_C in 𝒟_NN^t (ℰ(C))$ such that, for all $C,D in cal(M)$,
  $
    N_C|_(C inter D) = N_D|_(C inter D).
  $
]<def:discrete_model>

The order of the conditions is important. First, every local table must have the same level $t$, i.e. $|N_C| = t$ for all $C$. Second, after this common level has been fixed, the restrictions to overlaps must agree. If the levels are not equal, then the family may still define normalized probabilities $p_C := N_C /(|N_C|)$ context by context, but it is not an integer empirical model of common level. In that normalized situation, compatibility would be a condition on the $p_C$, not on the raw integer counts $N_C$.

Equivalently, if $u in ℰ(C inter D)$, the compatibility equation is
$
  sum_(s in ℰ(C), s|_(C inter D) = u) N_C (s)
  =
  sum_(r in ℰ(D), r|_(C inter D) = u) N_D (r).
$
We write this family of linear equations compactly as $delta N = 0$.

The vector notation is obtained by separating the contexts in a disjoint union.

#definition(name: "Visible event space", id: "def:visible-event-space")[
  The *visible event space* is
  $
    V := ∐_(C in cal(M)) ℰ(C)
    = { (C,s) | C in cal(M) " and " s in ℰ(C) }.
  $
  An element $(C,s) in V$ records two pieces of data: the context $C$ that was measured, and the local outcome $s : C -> O$ that was observed. Giving a family $(N_C)_(C in cal(M))$ is the same thing as giving a vector $N in NN^V$, by the rule
  $
    N(C,s) := N_C (s).
  $
]

#definition(name: "Level map", id: "def:level-map")[
  The *context hypergraph* is $H_cal(M) = (V,E_cal(M))$, where
  $
    E_cal(M) = { e_C | C in cal(M) }
    quad "and" quad
    e_C := { (C,s) | s in ℰ(C) }.
  $
  Let $A_cal(M)$ be its incidence matrix. For $N in NN^V$, the $C$-th component of $A_cal(M) N$ is
  $
    (A_cal(M)N)_C = sum_(s in ℰ(C)) N(C,s) = |N_C|.
  $
  Thus $A_cal(M)N = t 𝟙$ means only that every context table has the same level $t$. This is a normalization condition. It is not yet a compatibility condition.
]

#definition(name: "Gluing operator", id: "def:gluing-operator")[
  The *gluing operator* $delta$ measures whether two context tables agree on their common part. For two contexts $C,D in cal(M)$ and for $u in ℰ(C inter D)$, its component is
  $
    (delta N)_(C,D,u)
    :=
    sum_(s in ℰ(C), s|_(C inter D) = u) N(C,s)
    -
    sum_(r in ℰ(D), r|_(C inter D) = u) N(D,r).
  $
  The equation $delta N = 0$ means that the two marginal countings on $C inter D$ are equal for every overlap and every local assignment $u$.
]

These two maps have different roles. The equation $A_cal(M)N = t 𝟙$ fixes the common number of counted runs in each context. The equation $delta N = 0$ says that these equal-level tables can be glued on overlaps.

#definition(name: "Compatible counting semigroup", id: "def:compatible-counting-semigroup")[
  The semigroup of compatible integer empirical models is
  $
    𝒮 := { (N,t) in NN^V times NN | A_cal(M) N = t 𝟙 " and " delta N = 0 }.
  $
  The first coordinate $N$ is the vector of observed counts. The second coordinate $t$ is the common level of all context tables. For a fixed level $t$, we write
  $
    𝒮_t := { N in NN^V | (N,t) in 𝒮 }.
  $
]

#proposition(name: [Meaning of the slice $𝒮_t$], id: "prop:slice-compatible-models")[
  A vector $N in NN^V$ belongs to $𝒮_t$ if and only if the associated family $(N_C)_(C in cal(M))$ is a discrete empirical model of level $t$.
]

#proof[
  By the definition of $A_cal(M)$, the equation $A_cal(M)N = t 𝟙$ is equivalent to $|N_C| = t$ for every context $C$. By the definition of $delta$, the equation $delta N = 0$ is equivalent to equality of the marginal countings on every overlap $C inter D$. These are exactly the two conditions in the definition of a discrete empirical model of level $t$.
]

#remark[
  The fact that the same constant $t$ appears for every context is essential. It says that all local pieces are normalized at the same integer level and can therefore be regarded as parts of one coherent empirical object.
]

If $D$ denotes the matrix of the gluing operator $delta$, the two families of constraints can be assembled in one block system:
$
  A_cal(M) N = t 𝟙
  quad "and" quad
  D N = 0.
$
Equivalently,
$
  A_("aug") N = (t 𝟙, 0)
  quad "with" quad
  A_("aug") := mat(A_cal(M); D).
$
Here $A_("aug")$ is not only the incidence matrix of the context hypergraph. Its rows also contain the compatibility equations. If one treats $t$ as an additional variable, the same constraints become the homogeneous system
$
  mat(A_cal(M), -𝟙; D, 0) vec(N, t) = 0.
$
This is the precise meaning of the augmented-matrix notation.

#proposition(name: "Compatibility fixes the level on connected covers", id: "prop:compatibility-fixes-level")[
  Suppose that the intersection graph of the contexts is connected, where $C$ is adjacent to $D$ when $C inter D != emptyset$. If $N = (N_C)_(C in cal(M))$ is compatible, i.e. $delta N = 0$, then all local levels $|N_C|$ are equal. Hence a compatible family in $∏_(C in cal(M)) 𝒟_NN^∙ (ℰ(C))$ automatically belongs to $∏_(C in cal(M)) 𝒟_NN^t (ℰ(C))$ for a unique $t$.
]

#proof[
  If $C inter D != emptyset$ and $delta N = 0$, then the marginals of $N_C$ and $N_D$ on $C inter D$ are equal. Marginalization preserves total weight, so the total weight of $N_C$ equals the total weight of $N_D$. Connectedness propagates this equality to every context.
]

=== Example: non-signaling as hypergraph compatibility

In a bipartite Bell scenario, the primitive events are written $(a b ∣ x y)$, where $x,y$ are the questions and $a,b$ the answers. A counting table assigns an integer $N(a b ∣ x y) ∈ ℕ$ to each event. For each context $(x,y)$, the context level is
$
  k_(x,y) := ∑_(a,b) N(a b ∣ x y).
$

The probabilistic non-signaling equations are
$
  p(a ∣ x_0) = p(a ∣ x_1)
  quad "and" quad
  p(b ∣ 0y) = p(b ∣ 1y).
$
and can be view by a set of
At a common discrete level $t$, these become equalities of marginal counts:
$
  ∑_b N(a b ∣ x_0) = ∑_b N(a b ∣ x_1),
  quad
  ∑_a N(a b ∣ 0y) = ∑_a N(a b ∣ 1y).
$
Equivalently, the context normalizations give $A_cal(M) N = t 𝟙$, while the non-signaling marginal constraints give $delta N = 0$. If these two families of equations are assembled into one augmented matrix $A_("aug") = mat(A_cal(M); D)$, where $D$ is the matrix of $delta$, the same condition is $A_("aug") N = (t 𝟙,0)$. The zero part is important: compatibility equations are homogeneous, while normalization equations have level $t$.

=== From convex mixtures to Hilbert bases

This discrete framework differs from the standard probabilistic one. In the usual convex setting, if $e$ and $e'$ are empirical models, then every convex combination $r e + (1-r)e'$ with $r ∈ [0,1]$ is again an empirical model. The geometry is therefore convex.

In our setting, this operation is not primitive. An arbitrary real coefficient $r$ does not preserve integer counts. Instead, the natural operation is addition: if $(N,t)$ and $(N',t')$ belong to $𝒮$, then
$
  (N,t) + (N',t') = (N+N', t+t')
$
also belongs to $𝒮$. Hence the appropriate algebraic object is not first a convex set, but an affine semigroup.

The analogue of a convex decomposition is therefore a Hilbert-basis decomposition. The Hilbert basis $ℋ(𝒮)$ of $𝒮$ is the finite set of irreducible elements of the semigroup. Its elements are the elementary compatible counting models that cannot be decomposed into smaller compatible counting models. Thus, instead of asking whether a model is a convex mixture of deterministic models, we ask which Hilbert generators are required to build it as an integer sum.

=== Discrete noncontextuality and strong contextuality

A global section is an assignment of an outcome to every measurement at once. Formally, it is an element $g ∈ 𝓔(X)$, or equivalently a function $g : X → O$. The intuitive meaning is simple: before any context is chosen, every measurement $x ∈ X$ already has a predetermined outcome value $g(x) ∈ O$.

Thus, a global section represents a deterministic *hidden-variable* assignment. If the experimenter later chooses a context $C ∈ 𝓜$, the observed local outcome is not chosen anew; it is just the restriction $g|_C : C → O$ of the already fixed global assignment.

In other words, determinism means that all counterfactual outcomes are jointly defined. Even if two measurements cannot be performed together, such as $a_1$ and $a_2$ in the Bell scenario, a deterministic model still assigns values to both of them in advance.

Given a global section $g : X → O$, we define its deterministic counting vector $d_g ∈ ℕ^V$ by
$
  d_g (C,s) :=
  cases(
    1 "if" s = g|_C,
    0 "otherwise".
  )
$
Here $V = { (C,s) ∣ C ∈ 𝓜, s ∈ 𝓔(C) }$ is the set of contextual events. Thus $d_g$ places one unit of mass on exactly one event in each context: the event selected by restricting the same global assignment $g$ to that context.

Equivalently, $d_g$ is the empirical model produced by the deterministic hidden state $g$. It satisfies the compatibility constraints automatically, because all its local pieces come from one and the same global assignment. In incidence form, $A_cal(M) d_g = 𝟙$ and $delta d_g = 0$; with the augmented convention, this is $A_("aug") d_g = (𝟙,0)$.

More generally, an arbitrary integer counting of global hidden assignments is an element
$
  c in 𝒟_NN^∙ (ℰ(X)).
$
Here $c(g)$ counts how many times the global assignment $g : X -> O$ is used. Such a global counting produces a contextual-event counting by the linear map
$
  Phi(c) := sum_(g in ℰ(X)) c(+g) d_g in NN^V.
$
If $|c| = t$, then $Phi(c)$ has common level $t$ and is compatible. Thus $Phi$ maps global hidden countings into the empirical semigroup $𝒮$.

Indeed, fix a context $C$. Since each deterministic vector $d_g$ puts exactly one unit on the event $(C,g|_C)$ and zero on the other events of the same context, we have
$
  sum_(s in ℰ(C)) Phi(c)(C,s)
  = sum_(s in ℰ(C)) sum_(g in ℰ(X)) c(g) d_g (C,s)+
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
$
  N = ∑_(g ∈ 𝓔(X)) c_g d_g.
$
The coefficient $c_g$ counts how many times the deterministic assignment $g$ is used in the construction of $N$.

This is the discrete analogue of the usual hidden-variable decomposition. In the probabilistic setting one asks whether an empirical model is a convex mixture of deterministic assignments. In the counting setting, one asks whether the observed integer table is a finite sum of deterministic counting vectors.

If such a decomposition exists, then the apparent contextual data can be explained by a classical hidden-variable mechanism: each run secretly chooses a global assignment $g$, and the context merely reveals the part $g|_C$ corresponding to the measurements actually performed.

If no such decomposition exists, the model is contextual in the discrete sense. It is compatible as a counting model, because it satisfies the common-level constraints, but it cannot be reconstructed as a sum of predetermined global assignments.

In the notation above, this says simply that the noncontextual integer models are the image
$
  𝒮_("nc") := Phi(𝒟_NN^∙ (ℰ(X))) subset.eq 𝒮.
$
This notation is useful because it separates two questions. The semigroup $𝒮$ contains all compatible integer empirical models. The subsemigroup $𝒮_("nc")$ contains only those compatible models that can be generated from global deterministic assignments. Thus $𝒮_("nc")$ is the integer analogue of the classical or local polytope, while $𝒮$ is the integer analogue of the compatible, or no-signaling, object.

#proposition[
  The semigroup $𝒮_("nc")$ is generated by the deterministic vectors $(d_g,1)$ with $g in ℰ(X)$.
]

#proof[
  By definition, every element of $𝒟_NN^∙(ℰ(X))$ is a finite counting $c : ℰ(X) -> NN$. Hence
  $
    Phi(c) = sum_(g in ℰ(X)) c(g) d_g.
  $
  Therefore every element of $𝒮_("nc")$ is an integer sum of deterministic vectors. Conversely, every integer sum of deterministic vectors is obtained by taking $c(g)$ equal to the multiplicity of $d_g$ in the sum. Thus these vectors generate $𝒮_("nc")$.
]

In the generic case, the Hilbert basis of $𝒮_("nc")$ is obtained from these deterministic generators after removing duplicates, because two distinct global assignments may induce the same contextual vector if the measurement cover does not separate them. In the usual separated scenarios, and in particular in CHSH, the deterministic vectors are distinct and irreducible; then the Hilbert basis of $𝒮_("nc")$ is exactly $ℋ_("nc") = { (d_g,1) | g in ℰ(X) }$.

Therefore contextuality is a property of a compatible counting $N in 𝒮$: it means $N in.not 𝒮_("nc")$. The condition $N in 𝒮$ alone is not contextuality; it is only compatibility, or no-signaling in Bell scenarios.

The support version gives the analogue of strong contextuality. For each context $C$, define
$
  "supp"(N_C) := { s ∈ 𝓔(C) ∣ N_C (s) > 0 }.
$
A compatible empirical model $N$ is *strongly contextual* if there is no global section $g : X → O$ whose restrictions all remain inside the observed supports. Formally,
$
  ∄ g ∈ 𝓔(X)
  quad "such that" quad
  ∀ C ∈ 𝓜,\ g|_C ∈ "supp"(N_C).
$

Equivalently, using deterministic support vectors,
$
  ∀ g ∈ 𝓔(X), quad "supp"(d_g) ⊄ "supp"(N).
$
This means that every possible predetermined global assignment is ruled out by at least one context. No matter how one tries to assign outcomes to all measurements in advance, some chosen context would force an event that is absent from the observed support.

Thus the strongly contextual part of the discrete semigroup is the support-defined subset
$
  𝒮_("sc") := { (N,t) in 𝒮 | forall g in ℰ(X), "supp"(d_g) ⊄ "supp"(N) }.
$
Equivalently, if $ℋ_("loc") := { (d_g,1) | g in ℰ(X) }$ denotes the deterministic local part of the Hilbert basis, then $(N,t) in 𝒮_("sc")$ exactly when the support of $N$ contains the support of no generator in $ℋ_("loc")$. This is often the most convenient formulation in the counting model: once the Hilbert basis of $𝒮$ is known, the classical obstructions are visible directly at the level of generator supports.

It is important not to confuse this with membership in the no-signaling semigroup. If $𝒮_("ns")$ denotes the compatible semigroup $𝒮$ in a Bell scenario, then strong contextuality is not equivalent to $N in 𝒮_("ns")$. The implication only goes one way: a strongly contextual model must first be compatible, hence it belongs to $𝒮_("ns")$. The converse is false, because every deterministic vector $d_g$ belongs to $𝒮_("ns")$ but is not strongly contextual; its own global section $g$ is compatible with its support. The correct statement is
$
  N " is strongly contextual" quad <==> quad N in 𝒮_("sc") subset.eq 𝒮_("ns").
$

Thus we have three distinct levels:

- *compatibility* or *non-signaling*: the local count tables have a common level and agree on overlaps, equivalently $A_cal(M) N = t 𝟙$ and $delta N = 0$;
- *noncontextuality*: the compatible model decomposes as an integer sum of deterministic global sections;
- *strong contextuality*: not even one deterministic global section is compatible with the support of the model.

== Small results on the discrete CHSH semigroup #todo[A travailler]

We now record the elementary consequences of the previous definitions for the CHSH scenario. In this subsection, $N$ denotes the counting vector. The entries of $N$ are the integer variables that we study.

For a context $C in cal(M)$ and a local section $s in ℰ(C)$, the coordinate $N(C,s)$ may also be written $N(s | C)$. In the Bell notation this becomes $N(a b | x y)$: conditionally on the chosen questions $(x,y)$, one counts the observed answers $(a,b)$.

In CHSH the vertex set is $V = { (a b | x y) | a,b,x,y in {0,1} }$, hence $|V| = 16$. The contextual hypergraph has $12$ hyperedges: four context-normalization edges and eight non-signaling marginal edges. Each edge has size $4$, and each vertex belongs to exactly $3$ edges. If $A$ is the corresponding incidence matrix, then the discrete non-signaling equation is
$
  A N = t 𝟙.
$

This is the same object as the non-signaling polytope, but seen before normalization. Indeed, if
$
  G_("NS")(A) := { p in RR_(>=0)^V | A p = 𝟙 } = P(A),
$
then the equation $A N = t 𝟙$ is equivalent, for $t > 0$, to $p := N/t in G_("NS")(A)$. Conversely, any $p in G_("NS")(A)$ such that $t p in ZZ^V$ gives an integer model $N := t p$. Thus
$
  { N in NN^V | A N = t 𝟙 }
  = t G_("NS")(A) inter ZZ^V.
$
The semigroup $𝒮_("ns")(A)$ is therefore the semigroup of integer points in the cone over $G_("NS")(A)$:
$
  𝒮_("ns")(A)
  := { (N,t) in NN^V times NN | A N = t 𝟙 }
  = { (N,t) | N in t G_("NS")(A) inter ZZ^V }.
$
The polytope $G_("NS")(A)$ is the normalized slice $t=1$ of this cone, while the discrete models at level $t$ are the integer points in the dilated slice $t G_("NS")(A)$.

The local part is obtained by replacing $G_("NS")(A)$ by the local polytope
$
  L_("loc")(A) := "conv" { d_lambda | lambda " deterministic" }.
$
Thus
$
  Q_("NS")(t) := \#(t G_("NS")(A) inter ZZ^V)
  quad "and" quad
  Q_("loc")(t) := \#(t L_("loc")(A) inter ZZ^V)
$
count, respectively, all compatible integer non-signaling models and the integer models lying in the local polytope at the same level. The semigroup viewpoint and the Ehrhart viewpoint are therefore two descriptions of the same graded object: $𝒮_("ns")(A)$ studies how integer points decompose into irreducible generators, while $Q_("NS")(t)$ counts how many such points occur in each slice.

#proposition[
  In the CHSH scenario, every discrete model $(N,t)$ satisfies $k = sum_(v in V) N_v = 4 t$. In particular, there are no discrete models with $k = 1,2,3$, nor with any $k$ not divisible by $4$.
]

#proof[
  Summing all coordinates of $A N = t 𝟙$ gives $12 t$ because CHSH has $12$ hyperedges. The same sum also equals $3 sum_(v in V) N_v$, because each vertex belongs to exactly $3$ hyperedges. Hence $12 t = 3 k$, so $k = 4 t$.
]

The first admissible nonzero level is therefore $t=1$, equivalently $k=4$. At this level, $A N = 𝟙$ forces $N$ to select exactly one event on every hyperedge. These exact transversals are precisely the local deterministic strategies, i.e. assignments $a = f(x)$ and $b = g(y)$. Thus the first level contains only classical generators.

#proposition[
  The first intrinsically non-local CHSH generators occur at $t=2$, equivalently $k=8$.
]

#proof[
  A PR box has probabilities in ${0,1/2}$ and therefore is not an integer point at level $t=1$. Multiplying it by $2$ gives an integer vector $r in {0,1}^16$ with $A r = 2 𝟙$. Hence its first discrete lift is at level $t=2$, so $k = 4t = 8$.
]

The compatible, or non-signaling, affine semigroup associated with CHSH is
$
  𝒮_("ns")("CHSH") := { (N,t) in NN^16 times NN | A N = t 𝟙 }.
$
Let $d_lambda in {0,1}^16$ denote the $16$ local deterministic generators, with $A d_lambda = 𝟙$, and let $r_mu = 2 p_mu^"PR" in {0,1}^16$ denote the $8$ lifted PR generators, with $A r_mu = 2 𝟙$. The natural candidate Hilbert basis is
$
  ℋ_("CHSH") := { (d_lambda,1) }_(lambda=1)^16 union { (r_mu,2) }_(mu=1)^8.
$

The noncontextual subsemigroup is
$
  𝒮_("nc")("CHSH") := { sum_(lambda=1)^16 c_lambda (d_lambda,1) | c_lambda in NN }.
$
Its Hilbert basis is the set of the $16$ deterministic generators. The larger non-signaling semigroup $𝒮_("ns")("CHSH")$ also contains irreducible non-local generators, namely the lifted PR boxes.

#proposition[
  Assuming the support lemma verified by exhaustive enumeration of the CHSH supports, $ℋ_("CHSH")$ is the Hilbert basis of $𝒮_("ns")("CHSH")$.
]

#proof[
  The deterministic elements are irreducible because their level is $1$. A lifted PR element is also irreducible: a nontrivial decomposition of $(r_mu,2)$ would split it into two level-$1$ elements, hence into two deterministic local models, which would write a PR box as a convex combination of local deterministic boxes. This is impossible. For generation, the support lemma states that every nonzero $(N,t) in 𝒮_("ns")("CHSH")$ contains the support of some element $(u,s) in ℋ_("CHSH")$. Then $(N-u,t-s)$ is again in $𝒮_("ns")("CHSH")$, and induction on $t$ gives a decomposition into elements of $ℋ_("CHSH")$.
]

This means that, at the discrete level, CHSH non-signaling models are built from two types of irreducible bricks: local deterministic bricks of level $1$ and PR bricks of level $2$. The statement depends on the enumerated support lemma; the rest of the proof is formal.

Finally, fixed-level counting is an Ehrhart problem. Let $G_("NS")("CHSH") = { p in RR_(>=0)^16 | A p = 𝟙 }$ be the CHSH non-signaling polytope and let $L_("loc")("CHSH")$ be the local polytope. Define $Q_("NS")(t) := \# (t G_("NS")("CHSH") inter ZZ^16)$ and $Q_("loc")(t) := \# (t L_("loc")("CHSH") inter ZZ^16)$. Since the affine dimension is $8$, these functions have degree $8$; $Q_("loc")$ is an Ehrhart polynomial, while $Q_("NS")$ is a quasi-polynomial of period $2$ because PR vertices have denominator $2$.

A direct interpolation from exact integer-point counts gives
$
  Q_("loc")(t) = 1 + 71/21 t + 6053/1260 t^2 + 697/180 t^3 + 91/45 t^4 + 13/18 t^5 + 31/180 t^6 + 31/1260 t^7 + 1/630 t^8
$
and
$
  Q_("NS")(t) = 17/10080 t^8 + 17/630 t^7 + 7/36 t^6 + 37/45 t^5 + 1607/720 t^4 + 359/90 t^3 + 290/63 t^2 + 332/105 t + 63/64 + (-1)^t / 64.
$
Thus the number of discrete CHSH models with parameter $k$ is $0$ if $4$ does not divide $k$, and is $Q_("NS")(k/4)$ if $k = 4t$. The local polynomial has normalized volume $8! dot 1/630 = 64$, whereas the non-signaling quasi-polynomial has normalized volume $8! dot 17/10080 = 68$. Consequently, the asymptotic non-local part $Q_("NS")(t) - Q_("loc")(t)$ has leading term $1/10080 t^8$, and the asymptotic proportion of non-local integer models inside the non-signaling ones is $1/17$.

== Main concept : dynamic contextual automata

The previous section described compatible countings as elements of an affine semigroup. This is a static description. It tells us which completed integer tables are possible. For example, in the CHSH case, a compatible count has total size $k = 4t$. Hence completed objects appear only at sizes divisible by $4$.

The dynamic question is different. What can be said after only one, two, or three visible events have occurred? Such a prefix is not a completed empirical model, but it may still be the beginning of a process that will later close into one. The aim of dynamic contextual automata is to describe these intermediate states without reducing them to noise.

The guiding idea is the following. A completed count is built from elementary generators. An interrupted count is built from completed generators and from generators that are still open. The open part contains information about the future: it records what must still be emitted in order to close the process.

=== Generators as complete processes

Let $V$ be the visible event space introduced above. A count is an element of $NN^V$. A generator is a finite counting vector $g in NN^V$ that is regarded as one elementary complete process.

In CHSH, the intended examples are the local deterministic generators and the lifted PR generators. A local deterministic generator has total size $4$. A lifted PR generator has total size $8$. At this stage, we do not need to assume that these are the only possible generators in every scenario. The set of generators is a modelling choice.

#definition(name: "Generator family", id: "def:generator-family")[
  A *generator family* is a finite set
  $
    cal(G) subset.eq NN^V
  $
  whose elements are called complete generators. Each $g in cal(G)$ has a level $ell(g) in NN$ such that $(g,ell(g)) in 𝒮$.

  The family is *closed-complete* for $𝒮$ if every completed compatible model can be written as a finite sum of generators:
  $
    forall (N,t) in 𝒮, quad
    exists c : cal(G) -> NN,
    quad
    N = sum_(g in cal(G)) c(g) g
    " and "
    t = sum_(g in cal(G)) c(g) ell(g).
  $
]

This condition is the closed, semigroup-level requirement. It says that the chosen generators can explain every completed compatible counting. When $cal(G)$ is the Hilbert basis of $𝒮$, this condition is automatic. In practice, the choice of $cal(G)$ must be made carefully: if it is too small, some counts cannot be explained; if it is too large, the explanation loses structure.

=== The automaton of one generator

A generator is complete, but it can be produced in several orders. To model this, we attach a small automaton to each $g in cal(G)$.

For $v in V$, let $ε_v in NN^V$ be the unit vector at $v$. Thus $epsilon_v (v)=1$ and $epsilon_v (w)=0$ for $w != v$.

#definition(name: "Residual automaton of a generator", id: "def:residual-automaton")[
  Let $g in cal(G)$. The residual automaton $cal(A)_g$ has states
  $
    { R in NN^V | 0 <= R <= g }.
  $
  The initial state is $R=g$, and the final state is $R=0$.

  If $R(v) > 0$, there is a transition
  $
    R arrow.r R - epsilon_v
  $
  labelled by $v$. This transition emits the visible event $v$ and decreases the residual part by one unit at $v$.
]

The state $R$ is the part of $g$ that remains to be emitted. The emitted part is $g - R$. Thus an interruption of the automaton at residual state $R$ gives a past/future decomposition
$
  g = (g - R) + R.
$
The first term is already visible. The second term is the future required to close this copy of the generator.

#remark(name: "A four-event generator", id: "rem:four-event-generator")[
  Suppose that $g = epsilon_(v_1) + epsilon_(v_2) + epsilon_(v_3) + epsilon_(v_4)$. The automaton $cal(A)_g$ starts at residual state $g$. If the first three emitted events are $v_1,v_2,v_3$, then the residual state is $R = epsilon_(v_4)$ and the visible count is $g - R = epsilon_(v_1)+epsilon_(v_2)+epsilon_(v_3)$.

  This prefix has size $3$. It is not a closed generator. It is nevertheless meaningful, because it knows that the missing future is $epsilon_(v_4)$.
]

=== Global states and open generators

An experiment can contain several copies of generators at the same time. Some copies are already closed. Other copies are open and have only been partially emitted. The correct hidden state must remember this distinction.

#definition(name: "Dynamic state", id: "def:dynamic-state")[
  A *dynamic state* is a pair
  $
    eta = (c_eta, O_eta).
  $
  Here $c_eta : cal(G) -> NN$ counts the closed copies of each generator. The object $O_eta$ is a finite multiset of open copies. An open copy is a pair $(g,R)$, where $g in cal(G)$ is the complete generator and $R in NN^V$ is its residual part, with $0 <= R <= g$.
]

The visible counting associated with $eta$ is
$
  N_eta
  :=
  sum_(g in cal(G)) c_eta (g) g
  +
  sum_((g,R) in O_eta) (g - R).
$
The first sum is the contribution of closed copies. The second sum is the contribution of open copies: each open copy has already emitted $g-R$ and still owes the residual $R$.

The future residual of the state is
$
  R_eta := sum_((g,R) in O_eta) R.
$
If no new generator is opened, then closing all current open copies would produce the completed count
$
  K_eta := N_eta + R_eta
  =
  sum_(g in cal(G)) c_eta (g) g
  +
  sum_((g,R) in O_eta) g.
$
Thus the natural signature of an interrupted state is the pair
$
  Phi(eta) := (N_eta, R_eta).
$
It records both the visible past and the residual future.

#remark[
  There is no reason for the map $eta -> N_eta$ to be injective. Two different hidden states may have the same visible count but different open generators and different residual futures. This is why the dynamic theory cannot be reduced to the visible counting vector alone.
]

=== Dynamic explainability

The central question is now not only whether a count is closed, but whether it can be explained as the visible part of an interrupted process.

#definition(name: "Dynamic explanation", id: "def:dynamic-explanation")[
  Let $N in NN^V$. A *dynamic explanation* of $N$ over $cal(G)$ is a dynamic state $eta=(c_eta,O_eta)$ such that
  $
    N = N_eta
    =
    sum_(g in cal(G)) c_eta (g) g
    +
    sum_((g,R) in O_eta) (g - R).
  $
  The set of all such explanations is denoted
  $
    cal(E)_(cal(G))(N)
    := { eta | N_eta = N }.
  $
]

This formula is the basic accounting rule of the model. A visible count is explained by a number of closed generators and by a multiset of open generators. Each open generator contributes only the part already emitted. Its residual part is not visible yet, but it is part of the hidden state.

#definition(name: "Dynamic completeness", id: "def:dynamic-completeness")[
  Let $cal(A) subset.eq NN^V$ be a class of visible counts that we want to explain. The generator family $cal(G)$ is *dynamically complete* for $cal(A)$ if
  $
    forall N in cal(A), quad cal(E)_(cal(G))(N) != emptyset.
  $
]

Dynamic completeness is stronger than closed completeness when $cal(A)$ contains prefixes. Closed completeness only explains final compatible models. Dynamic completeness asks that the intermediate counts also come from some population of closed and open generators.

=== Petri-net reading and concurrency

The previous definitions can be read as a Petri net. A marking is a multiset of tokens. In our case, a token is either a closed copy of a generator or an open copy with a residual state. The marking is therefore the hidden interface of the experiment.

There are three elementary kinds of transitions.

- *Opening*: choose $g in cal(G)$ and create a new open copy $(g,g)$.
- *Emission*: if an open copy is $(g,R)$ and $R(v)>0$, emit the event $v$ and replace $(g,R)$ by $(g,R-epsilon_v)$.
- *Closing*: if an open copy has residual $0$, replace it by one closed copy of $g$.

The emission transitions on two different open copies are independent. They can be performed in either order and lead to the same marking. This is the basic Petri-net notion of concurrency: the model does not force a single total order between independent local emissions. The observer may later apply the Parikh compression and keep only the count $N_eta$, but the hidden marking still remembers which copies are open and what remains to be produced.

#proposition(name: "Closed states recover the semigroup", id: "prop:closed-states-recover-semigroup")[
  Suppose that $cal(G)$ is closed-complete for $𝒮$. If a dynamic state $eta$ has no open copy, then $(N_eta,t_eta) in 𝒮$, where
  $
    t_eta := sum_(g in cal(G)) c_eta (g) ell(g).
  $
  Conversely, every $(N,t) in 𝒮$ is represented by at least one dynamic state with no open copy.
]

#proof[
  If $O_eta$ is empty, then $N_eta = sum_(g in cal(G)) c_eta(g) g$. Since each $(g,ell(g))$ belongs to $𝒮$ and $𝒮$ is closed under addition, $(N_eta,t_eta)$ belongs to $𝒮$. Conversely, closed completeness gives a decomposition of every $(N,t) in 𝒮$ as a finite sum of generators. This decomposition defines a state with the corresponding closed multiplicities and with no open copy.
]

This proposition explains the relation between the static and dynamic viewpoints. The static semigroup is recovered when all generators are closed. The dynamic model adds the missing layer: it also describes states that occur before closure.

=== First interpretation

The model separates three levels.

- A *trace* is an ordered sequence of visible events produced by hidden transitions.
- A *count* is the Parikh compression of a trace. It forgets the order and keeps only multiplicities.
- A *dynamic state* is a hidden explanation of a count by closed and open generators.

This distinction is essential. A completed count such as an element of $𝒮_("ns")$ is only the endpoint of a process. An interrupted experiment is described by an interface $eta$, or equivalently by its past/future signature $Phi(eta)=(N_eta,R_eta)$. The visible past says what has already happened. The residual future says how the process can still stabilize.

The next step will be to use this interface structure to compare interrupted states, to define costs of open non-local resources, and to study which choices of generators give a meaningful reconstruction of contextual phenomena.

= Contributions



#bibliography("refs.bib")
