// #import "@local/tool-box-louis:1.0.0": book, corollary, definition, lemma, proof, proposition, remark
#import "template.typ": book, corollary, definition, lemma, proof, proposition, remark

#import "@preview/physica:0.9.8": *

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

Before introducing the sheaf-theoretic notation, we fix the dynamic viewpoint used later in the report. An observable event is the smallest visible record produced by an experiment. In a one-party situation it can be written $e = (a | x)$, where $x$ is an input or measurement choice and $a$ is the corresponding output. In a bipartite Bell situation it is written $e = (a b | x y)$. If $Sigma$ denotes the finite alphabet of such events, a trace is a finite word $tau = e_1 dots e_n in Sigma^*$. The trace is more informative than the final table, because it still remembers order and repetition.

The passage from traces to count vectors is given by the Parikh map $Psi : Sigma^* arrow.r NN^Sigma$, where $Psi(tau)_e = |{ i | e_i = e }|$. This compression forgets the order of events and keeps only their multiplicities. The count tables studied below should be understood as such compressed observations. Thus the basic chain is $text("hidden run") arrow.r text("trace") arrow.r text("count vector")$.

A hidden dynamic explanation may be represented by a finite automaton $A = (Sigma,S,s_0,delta,E)$, where $S$ is a finite set of hidden states, $s_0 in S$ is an initial state, $delta subset.eq S times S$ is a transition relation, and $E : S arrow.r 2^Sigma$ specifies which visible events are compatible with each hidden state. A trace $tau = e_1 dots e_n$ is explainable by $A$ if there are states $s_1,dots,s_n$ with $(s_0,s_1) in delta$, $(s_(i-1),s_i) in delta$ for $2 <= i <= n$, and $e_i in E(s_i)$ for all $i$. A count vector $N in NN^Sigma$ is explainable by $A$ when $N in Psi(L(A))$. Since $L(A)$ is regular, Parikh's theorem implies that $Psi(L(A))$ is semilinear. This is the bridge between hidden dynamics and the affine semigroups introduced below.

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


#let Set = $sans("Set")$
#definition[
  A *measurement scenario* is a triple $chevron.l X, cal(M), O chevron.r$ where $X$ is a set of measurements, $O$ is a set of outcomes, and $cal(M) ⊆ cal(P)(X)$ is a family of measurement contexts.
  The *event presheaf* associated with this scenario is the functor $cal(E) : cal(P)(X)^"op" -> "Set"$
  defined by $cal(E)(U) := O^U$ for every subset $U ⊆ X$.
  If $U ⊆ V ⊆ X$, the restriction map $cal(E)(V) -> cal(E)(U)$ sends a joint assignment $s : V -> O$  to its restriction $s|_U : U -> O$.
  Thus, an element $s in cal(E)(U)$ is a local assignment of outcomes to all measurements in $U$. In particular, for a *context* $C in cal(M)$, an element $s in cal(E)(C)$ represents a possible joint outcome for the measurements in $C$.
  \
  We also define the distribution functor $𝒟_R : "Set" -> "Set"$ by
  $
    𝒟_R (S) = { d : S -> R | "supp"(d) "is finite" }
  $
  where $R$ is a semiring, typically $R = RR_+$
  for probabilistic models or $R = NN$ for counting models.
  \
  For a fixed total weight $t in R$, we write
  $
    𝒟^t_R (S) = { d in 𝒟_R (S) | sum_(s in S) d(s) = t }.
  $
  In the usual probabilistic case, one takes $t = 1$.
  In our integer-counting setting, one takes $R = NN$ and keeps $t in NN$
  as the level, i.e. the number of counted trials.
]


=== Empirical models as $𝒟_R ∘ ℰ$

The event presheaf $ℰ$ describes which local outcome assignments are available over each set of measurements. To pass from possible assignments to empirical data, one composes it with a distribution or counting functor. Thus the relevant object is not only $ℰ$, but the composite presheaf $𝒟_R ∘ ℰ$, defined by
$
  (𝒟_R ∘ ℰ)(U) = 𝒟_R (ℰ(U)).
$
An element $d_U ∈ 𝒟_R (ℰ(U))$ assigns a weight to each local section $s : U → O$.

In the usual probabilistic case, one takes $R = ℝ_(≥0)$ and restricts to total weight $1$. In the discrete experimental case considered here, one takes $R = ℕ$ and keeps the total weight as an integer level $t ∈ ℕ$, interpreted as the number of counted trials.

In all the following we will suppose that $ℳ$ is *measurement cover*, that means $∪_(C ∈ ℳ) C = X$ and $ℳ$ is anti-chain, i.e. $∀ C, C′ ∈ M, C ⊆ C′ ⇒ C = C′$ (any context is strictly contain in a other one).

#definition[
  An *empirical model* over $⟨X, ℳ, O⟩$ is a family $e = (e_C)_(C ∈ ℳ)$ with $e_C ∈ 𝒟_R (ℰ(C))$, satisfying compatibility on overlaps. Namely, for all contexts $C,D ∈ ℳ$, the restrictions of $e_C$ and $e_D$ to $C ∩ D$ must agree:
  $
    e_C|_(C ∩ D) = e_D|_(C ∩ D).
  $
]<def:empirical_model>
In the probabilistic case, this says that the marginal distributions coincide. In the counting case, it says that the marginal count vectors coincide exactly.

#definition[
  A *discrete empirical model of level* $t$ is a family $N = (N_C)_(C ∈ ℳ)$ with $N_C ∈ 𝒟_ℕ^t ℰ(C)$ such that, for all $C,D ∈ ℳ$,
  $
    N_C|_(C ∩ D) = N_D|_(C ∩ D).
  $
]<def:discrete_model>

Equivalently, one may encode the same data by a contextual hypergraph. Its vertices are the primitive observational events $(C,s)$, where $C ∈ ℳ$ and $s ∈ ℰ(C)$. Its hyperedges encode the normalization and marginal-compatibility constraints.

#definition[
  Let define the hypergraph $H := (V,E)$ associate with $⟨X,ℳ,O⟩$ like $V := {(C,s) | C ∈ ℳ "and" s ∈ ℰ(C)}$ and $E := {e ∋ (C,s) | C ∈ ℳ "and" s ∈ ℰ(C)}$
]

If $V$ is the set of vertices, then a discrete model define previously by $N = (N_C)_(C ∈ ℳ)$ with $N_C ∈ 𝒟_ℕ^t ℰ(C)$ can be view as a vector $N ∈ ℕ^V$. We can also view the discrete empirical model of level $t$ by a vector $N ∈ ℕ^V$ satisfying $A N = t 𝟙$ with $A$ the incidence matrix of this hypergraph.

#remark[
  The fact that the same constant $t$ appears on every hyperedge is essential: it means that all local pieces are normalized at the same integer level and can therefore be regarded as parts of one coherent empirical object.
]

The link between the hypergraph formalism and the Sheaf-theory is describe in #todo[paper].
Thus the relevant discrete object is the affine semigroup
$
  𝒮(A) := { (N,t) ∈ ℕ^V × ℕ ∣ A N = t 𝟙 }.
$

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
The contextual hypergraph packages the context normalizations and these non-signaling marginal constraints into one linear equation $A N = t 𝟙$.

=== From convex mixtures to Hilbert bases

This discrete framework differs from the standard probabilistic one. In the usual convex setting, if $e$ and $e'$ are empirical models, then every convex combination $r e + (1-r)e'$ with $r ∈ [0,1]$ is again an empirical model. The geometry is therefore convex.

In our setting, this operation is not primitive. An arbitrary real coefficient $r$ does not preserve integer counts. Instead, the natural operation is addition: if $(m,t)$ and $(m',t')$ belong to $𝒮(A)$, then
$
  (m,t) + (m',t') = (m+m', t+t')
$
also belongs to $𝒮(A)$. Hence the appropriate algebraic object is not first a convex set, but an affine semigroup.

The analogue of a convex decomposition is therefore a Hilbert-basis decomposition. The Hilbert basis $ℋ(A)$ of $𝒮(A)$ is the finite set of irreducible elements of the semigroup. Its elements are the elementary compatible counting models that cannot be decomposed into smaller compatible counting models. Thus, instead of asking whether a model is a convex mixture of deterministic models, we ask which Hilbert generators are required to build it as an integer sum.

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

Equivalently, $d_g$ is the empirical model produced by the deterministic hidden state $g$. It satisfies the compatibility constraints automatically, because all its local pieces come from one and the same global assignment. In incidence form, if $A$ is the contextual incidence matrix, then $A d_g = 𝟙$.

A discrete empirical model $N ∈ ℕ^V$ is *noncontextual* if it can be written as an integer sum of deterministic global sections. That is, there exist coefficients ${c_g}_(g ∈ ℰ(X)) ∈ ℕ$ such that
$
  N = ∑_(g ∈ 𝓔(X)) c_g d_g.
$
The coefficient $c_g$ counts how many times the deterministic assignment $g$ is used in the construction of $N$.

This is the discrete analogue of the usual hidden-variable decomposition. In the probabilistic setting one asks whether an empirical model is a convex mixture of deterministic assignments. In the counting setting, one asks whether the observed integer table is a finite sum of deterministic counting vectors.

If such a decomposition exists, then the apparent contextual data can be explained by a classical hidden-variable mechanism: each run secretly chooses a global assignment $g$, and the context merely reveals the part $g|_C$ corresponding to the measurements actually performed.

If no such decomposition exists, the model is contextual in the discrete sense. It is compatible as a counting model, because it satisfies the common-level constraints, but it cannot be reconstructed as a sum of predetermined global assignments.

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

Thus we have three distinct levels:

- *compatibility* or *non-signaling*: the local count tables agree on overlaps, or equivalently satisfy a common-constant equation such as $A N = t 𝟙$;
- *noncontextuality*: the compatible model decomposes as an integer sum of deterministic global sections;
- *strong contextuality*: not even one deterministic global section is compatible with the support of the model.

In the shifted convention $N = 𝟙 + m$, the support condition should usually be applied to the excess part $m$, not to $N$ itself. Indeed, if $N$ contains the uniform background $𝟙$, then every event has positive count and $"supp"(N)$ is automatically full. In that convention, the strong contextuality condition should be written as
$
  ∀ g ∈ 𝓔(X), quad "supp"(d_g) ⊄ "supp"(m).
$

== Small results on the discrete CHSH semigroup

We now record the elementary consequences of the previous definitions for the CHSH scenario. This subsection deliberately keeps only the semigroup, Hilbert-basis, and Ehrhart-counting facts; no distance-to-model or norm-based construction is used here.

In CHSH the vertex set is $V = { (a b | x y) | a,b,x,y in {0,1} }$, hence $|V| = 16$. The contextual hypergraph has $12$ hyperedges: four context-normalization edges and eight non-signaling marginal edges. Each edge has size $4$, and each vertex belongs to exactly $3$ edges. If $A$ is the corresponding incidence matrix and if $N = 𝟙 + m$ with $m in NN^16$, then the discrete non-signaling equation is $A m = t 𝟙$.

#proposition[
  In the CHSH scenario, every shifted discrete model $(m,t)$ satisfies $k = sum_(v in V) m_v = 4 t$. In particular, there are no shifted discrete models with $k = 1,2,3$, nor with any $k$ not divisible by $4$.
]

#proof[
  Summing all coordinates of $A m = t 𝟙$ gives $12 t$ because CHSH has $12$ hyperedges. The same sum also equals $3 sum_(v in V) m_v$, because each vertex belongs to exactly $3$ hyperedges. Hence $12 t = 3 k$, so $k = 4 t$.
]

The first admissible nonzero level is therefore $t=1$, equivalently $k=4$. At this level, $A m = 𝟙$ forces $m$ to select exactly one event on every hyperedge. These exact transversals are precisely the local deterministic strategies, i.e. assignments $a = f(x)$ and $b = g(y)$. Thus the first level contains only classical generators.

#proposition[
  The first intrinsically non-local CHSH generators occur at $t=2$, equivalently $k=8$.
]

#proof[
  A PR box has probabilities in ${0,1/2}$ and therefore is not an integer point at level $t=1$. Multiplying it by $2$ gives an integer vector $r in {0,1}^16$ with $A r = 2 𝟙$. Hence its first discrete lift is at level $t=2$, so $k = 4t = 8$.
]

The affine semigroup associated with CHSH is
$
  𝒮_("CHSH") := { (m,t) in NN^16 times NN | A m = t 𝟙 }.
$
Let $d_lambda in {0,1}^16$ denote the $16$ local deterministic generators, with $A d_lambda = 𝟙$, and let $r_mu = 2 p_mu^"PR" in {0,1}^16$ denote the $8$ lifted PR generators, with $A r_mu = 2 𝟙$. The natural candidate Hilbert basis is
$
  ℋ_("CHSH") := { (d_lambda,1) }_(lambda=1)^16 union { (r_mu,2) }_(mu=1)^8.
$

#proposition[
  Assuming the support lemma verified by exhaustive enumeration of the CHSH supports, $ℋ_("CHSH")$ is the Hilbert basis of $𝒮_("CHSH")$.
]

#proof[
  The deterministic elements are irreducible because their level is $1$. A lifted PR element is also irreducible: a nontrivial decomposition of $(r_mu,2)$ would split it into two level-$1$ elements, hence into two deterministic local models, which would write a PR box as a convex combination of local deterministic boxes. This is impossible. For generation, the support lemma states that every nonzero $(m,t) in 𝒮_("CHSH")$ contains the support of some element $(u,s) in ℋ_("CHSH")$. Then $(m-u,t-s)$ is again in $𝒮_("CHSH")$, and induction on $t$ gives a decomposition into elements of $ℋ_("CHSH")$.
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
Thus the number of shifted discrete CHSH models with parameter $k$ is $0$ if $4$ does not divide $k$, and is $Q_("NS")(k/4)$ if $k = 4t$. The local polynomial has normalized volume $8! dot 1/630 = 64$, whereas the non-signaling quasi-polynomial has normalized volume $8! dot 17/10080 = 68$. Consequently, the asymptotic non-local part $Q_("NS")(t) - Q_("loc")(t)$ has leading term $1/10080 t^8$, and the asymptotic proportion of non-local integer models inside the non-signaling ones is $1/17$.

#bibliography("refs.bib")
