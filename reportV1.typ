// #import "@local/tool-box-louis:1.0.0": book, corollary, definition, lemma, proof, proposition, remark
#import "template.typ": book, corollary, definition, lemma, proof, proposition, remark

// s#import "@preview/physica:0.9.8": *

#import "title.typ": title-page-report
#import "@local/tool-box-louis:1.0.0" as tool
#import "@preview/cetz:0.5.2" as cetz

#set page(paper: "us-letter")

#show: book.with(
  title: [Contextuality as Automata: Open Generators and the Dynamics of Quantum Phenomena],
  author: "Louis TRIOULEYRE--ROBERJOT",
  title-page-fct: title-page-report,
)

#import "@preview/dashy-todo:0.1.3": *
#let med(comment) = todo(position: left, stroke: blue)[*med*: #comment]
#let leo(comment) = todo(position: right, stroke: red)[*léo*: #comment]
#let lou(comment) = todo(position: right, stroke: gray)[*lou*: #comment]


// Chaque membre peux highligh des passages
#let lou_ceci(passage) = highlight(fill: gray.lighten(80%), passage)
#let med_ceci(passage) = highlight(fill: blue.lighten(80%), passage)

// Helper for CHSH visualization
#let cred(content) = text(content, fill: rgb(200, 0, 0, 200))
#let chsh_rule(A, X) = {
  let (a, b) = A
  let (x, y) = X
  if (x, y) == (1, 1) {
    if a != b {
      return true
    } else {
      return false
    }
  } else {
    if a == b {
      return true
    } else {
      return false
    }
  }
}


#set par(spacing: 1.2em, first-line-indent: 0pt)

#outline(title: "Review", target: figure.where(kind: "todo"))

#outline()

= Context and Motivation

== Why start from observation?

Scientific theories do not begin with reality given all at once. They begin with phenomena: outcomes, traces, correlations, and reports produced through concrete experimental interfaces. A hidden variable, a state, a Hilbert space vector, or an automaton is therefore not direct access to reality itself. It is a model introduced to organize what is observed.

This distinction is modest, but it is important for the rest of the report. We do not try to reveal a final hidden world. We ask which hidden structures can explain the visible data, how much structure they require, and what they still fail to explain. In that sense, the word *model* should be read operationally. A model is a disciplined way of connecting observed phenomena to a possible hidden organization.

This position is not meant to weaken science. On the contrary, it makes the task more precise. Since the hidden structure is not directly given, it must be reconstructed under constraints. It must fit the observations, respect the operational limitations of the experiment, and use a controlled amount of structure. A model is then judged by its explanatory power, by its coherence, and by the resources it needs.

== Truth, understanding, and interruption

In this report, truth is used in an operational and provisional sense. A model is accepted when it is the best available explanation of the observed phenomena under explicit constraints. If the observations change, or if the class of admissible models changes, the accepted model may change as well. This does not make truth arbitrary. The choice of a model is constrained by data, by mathematical consistency, and by the cost of the hidden resources used in the explanation.

Understanding is slightly different. A model may give correct predictions while remaining too opaque to reuse. Here, a model is understood when it can be compressed, transmitted, interrupted, and reconstructed without losing its explanatory role.

A simple analogy is curve fitting. Suppose that an experiment produces a sequence of points $(x_i,y_i)$. In a classical analysis, one may fix a class of models, for instance polynomials of degree at most $3$, and choose the polynomial that best fits the first $n$ points:
One then says that the model is good if the final error is small enough.

This report asks for a more dynamic requirement. The explanation procedure itself should be observable and interruptible. After each new point, we obtain a new model, a new error, and a transition from the model at step $n$ to the model at step $n+1$. A good explanatory process should not only end with a small error. Its successive updates should also follow a coherent pattern.

This is the sense in which we want a kind of meta-model. We do not only want a final explanation of the completed experiment. We also want to track the history of partial explanations, their errors, and their possible continuations. If the experiment is interrupted at time $n$, the current state should still have a meaning.

This point will become central later. A probability table is a completed summary. It has already forgotten the order of events, the number of occurrences before normalization, and the possible unfinished mechanisms that produced the data. If our aim is only prediction, this loss may be acceptable. If our aim is reconstruction, it is too strong. We need a language that keeps enough information to restart the process after an interruption.

The report therefore takes seriously a simple methodological principle: before normalizing, count; before completing, keep the prefix; before replacing a mechanism by a probability distribution, ask what hidden process could have produced it.

== Existing routes toward the quantum model

The question of which model best explains quantum phenomena is not new. Bell's theorem showed that local hidden-variable models cannot reproduce all quantum predictions @Bell_1964. The CHSH inequality gave a particularly clear experimental and mathematical form of this obstruction @Clauser_Horne_Shimony_Holt_1969. These results changed the status of hidden mechanisms: the difficulty is not merely that the hidden variables are unknown, but that some families of local observations cannot be glued into a single classical global assignment.

One response is to search for general operational principles that single out quantum theory. Generalized probabilistic theories provide a broad framework in which classical theory, quantum theory, and many non-classical theories can be compared @Barrett_2007. In this setting, states, effects, and transformations are not assumed to be Hilbert-space objects from the start. They are abstract operational objects constrained by axioms. Several reconstruction programs follow this direction. Hardy derived quantum theory from a small set of reasonable axioms @Hardy_2001. Chiribella, D'Ariano, and Perinotti derived the finite-dimensional formalism from informational principles, with purification playing a central role @Chiribella_DAriano_Perinotti_2011. Masanes and Müller gave another derivation from physical requirements concerning preparations, transformations, and measurements @Masanes_Muller_2011.

These works are important because they show that the Hilbert-space formalism is not the only possible starting point. One may instead ask which operational or informational constraints force that formalism. They also show how hard the problem is. If the axioms are too weak, one obtains theories larger than quantum theory. If they are too strong, the reconstruction risks hiding the quantum structure inside the assumptions.

The example of non-signaling correlations makes this tension concrete. Popescu and Rohrlich showed that there are non-signaling correlations stronger than quantum correlations @Popescu_Rohrlich_1994. Thus no-signaling alone does not characterize quantum theory. The quantum set lies between the classical local polytope and the larger non-signaling polytope. The problem is then to explain why nature seems to choose this intermediate region.

There is also a second difficulty. Even inside the mathematical formalism of quantum correlations, different completions of the model are not obviously equivalent. One may use finite-dimensional tensor-product models, infinite-dimensional limits, or commuting-operator models. The relation between these descriptions is connected to Tsirelson's problem and to Connes' embedding problem @Junge_Navascues_Palazuelos_PerezGarcia_Scholz_Werner_2011.

The distinction has a physical meaning. In a finite tensor-product model, Alice and Bob are described by two separate Hilbert spaces, and the joint system is represented by $cal(H)_A ⊗ cal(H)_B$. This is close to the usual laboratory picture of two separated devices. In the commuting-operator model, one uses a single Hilbert space $cal(H)$ and only requires Alice's and Bob's observables to commute, for example $A_x B_y = B_y A_x$. This algebraic condition says that the two measurements are compatible: changing their order does not change the predicted statistics. It is natural in algebraic quantum field theory, where observables localized in spacelike separated regions are required to commute. However, it is less directly tied to a finite experimental mechanism than a concrete tensor decomposition.

The issue can be stated in terms of correlation sets. Let $C_("q")$ denote the set of correlations obtained from finite-dimensional tensor-product strategies. Let $C_("qs")$ denote the spatial tensor-product model, where the Hilbert spaces may be infinite-dimensional. Let $C_("qa") := overline(C_("q"))$ denote the approximable quantum set, obtained by closing the finite-dimensional set. Finally, let $C_("qc")$ denote the commuting-operator set. These sets satisfy the inclusions
$
  C_("q") subset.eq C_("qs") subset.eq C_("qa") subset.eq C_("qc").
$
The inclusions are not only technical details. Slofstra showed that finite-dimensional quantum correlations need not form a closed set, so one can have $C_("q") != C_("qa")$ @Slofstra_2019. Tsirelson's problem asks, in one standard formulation, whether the approximable model and the commuting-operator model coincide, that is, whether $C_("qa") = C_("qc")$. The theorem $"MIP"^* = "RE"$ implies a negative answer: there are non-local games whose commuting-operator value cannot be approximated by finite-dimensional tensor-product strategies, hence $C_("qa") subset.neq C_("qc")$ @ji2022mipre.

The zero-gap version of this story is also relevant. In the usual gap formulation of $"MIP"^*$, a verifier must distinguish a yes-instance from a no-instance with a fixed separation between acceptance probabilities. In $"MIP"_0^*$, this uniform gap is removed. The question becomes exact: is the entangled value equal to $1$, or only strictly smaller than $1$? This looks like a small change, and it is operationally natural when one cares about perfect realizability rather than an arbitrary error threshold. However, it changes the behaviour of the associated classes in a strong way. Mousavi, Nezhadi, and Yuen show this for zero-gap $"MIP"^*$, and their Figure 1 gives a useful picture of the different inclusions between the classical, entangled, and commuting-operator variants @Mousavi_Nezhadi_Yuen_2020. Related work on commuting-operator formulations leads to a different computability-theoretic behaviour again @Lin_2025_MIPco_coRE. Thus even a small modification of the rule, such as removing the promise gap, can change the model at a structural level.

These results do not decide which mathematical completion is physically real. They show a more modest but important point: the word "quantum" does not determine a unique operational object unless the allowed idealization is specified. A finite experiment gives finite data, with finite precision. It can rule out restricted finite-dimensional models, or give lower bounds on dimension, but it cannot by itself certify an exact infinite-dimensional Hilbert space or a genuinely non-tensor commuting-operator realization. Thus the separation $C_("qa") subset.neq C_("qc")$ is mathematically decisive, while its direct physical interpretation remains more delicate.

This motivates the constructive stance of the present report. The aim is not to decide the ontology of Hilbert spaces. It is to work at the level where the experiment is actually recorded: visible events, integer counts, compatibility equations, and finite generators. A property proved at this level has a direct operational meaning before any passage to closures, limits, or operator-algebraic completions. In this sense, staying close to the experimental record is not only a simplification. It is a way to separate physically accessible structure from structure introduced by the mathematical completion of the model.

== From state spaces to constructive countings

Most operational reconstructions start with a space of states, a set of effects, and rules for composing systems. This is natural when one wants to reconstruct the full probabilistic formalism. In this report, we take a different starting point. We begin with finite observations and integer counts.

The reason is simple. A normalized probability distribution erases the level at which it was obtained. For example, consider two possible events $A$ and $B$. The distribution $PP(A)=1$ and $PP(B)=0$ may come from the count $(1,0)$, from the count $(1000,0)$, or from any count $(t,0)$ with $t>0$. After normalization, all these situations become identical. Empirically, however, they are not the same: one observation and one thousand observations do not carry the same amount of evidence. Keeping integer counts preserves this scale. It also makes it possible to ask which finite pieces of data are already compatible, which are not yet complete, and which hidden generator could still close them.

This is where contextuality enters. In the sheaf-theoretic approach, contextuality is an obstruction to gluing local data into a global section @Abramsky_Brandenburger_2011. This language is well suited to our purpose because it separates local observation from global explanation. In the discrete version used here, local probability tables are replaced by integer count tables. Compatibility becomes equality of marginal counts on overlaps. Noncontextuality becomes the possibility of reconstructing the compatible count as an integer sum of deterministic global assignments.

The change from probabilities to counts is not only cosmetic. It turns convex geometry into semigroup geometry. Instead of asking only whether a point lies in a convex hull, we ask how an integer count decomposes into irreducible generators. The Hilbert basis of the relevant semigroup then gives candidate elementary bricks of explanation. In CHSH, these bricks include local deterministic generators and lifted PR-type generators. This does not mean that PR boxes are accepted as physical final states. It means that they appear as elementary algebraic pieces of the compatible counting structure, and therefore must be interpreted.

== Quantum phenomena as unfinished stabilization

This perspective gives a useful way to read quantum phenomena. A quantum state will not be treated here as a primitive object whose meaning is already fixed. We instead ask whether some quantum features can be understood as effects of projection and incomplete stabilization. Superposition suggests that several hidden histories may give the same visible phenomenon. Entanglement suggests that local visible pieces may fail to factorize because they still come from one common hidden process.

This is deliberately only a guiding interpretation. The mathematical part of the report will be more modest. We start from finite observations, integer counts, and compatibility constraints. We then study the generators of these counts and the automata that describe their interrupted production. A completed compatible count is a stabilized object. A prefix is not an error; it is a partial observation that may still have possible completions. The residual future of an open generator records exactly what is missing for closure.

The aim is not to replace Hilbert spaces. It is to build a small discrete language in which such ideas can be tested. Contextuality is used as a laboratory for a broader question: how can visible phenomena be reconstructed from hidden processes without pretending that the hidden process is directly given?

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

In all the following we suppose that $cal(M)$ is a *measurement cover*, meaning $union_(C in cal(M)) C = X$, and that it is an antichain, meaning $C subset.eq D$ with $C,D in cal(M)$ implies $C = D$.

=== Compatibility before the level

The first notion is compatibility. It comes from the sheaf-theoretic idea that two local observations must agree on the part that they have in common. This is a local-to-local condition. It does not start by imposing a global normalization constant.

#definition(name: "Compatible family", id: "def:compatible-family")[
  Let $R$ be a semiring. A family
  $
    e = (e_C)_(C in cal(M)),
    quad e_C in 𝒟_R (ℰ(C)),
  $
  is *compatible* if, for all contexts $C,D in cal(M)$,
  $
    e_C|_(C inter D) = e_D|_(C inter D).
  $
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

For a local counting $N_C$, define its local level by
$
  t_C := |N_C| = sum_(s in ℰ(C)) N_C (s).
$
At first, the numbers $t_C$ may depend on the context $C$. The point is that compatibility can force them to become equal.

#proposition(name: "Compatibility creates the level", id: "prop:compatibility-creates-level")[
  Suppose that the intersection graph of the contexts is connected, where $C$ is adjacent to $D$ when $C inter D != emptyset$. If a counting family $N = (N_C)_(C in cal(M))$ is compatible, then all local levels $|N_C|$ are equal. Hence there is a unique integer $t$ such that
  $
    forall C in cal(M), quad |N_C| = t.
  $
]

#proof[
  If $C inter D != emptyset$ and $N$ is compatible, then the marginals of $N_C$ and $N_D$ on $C inter D$ are equal. Marginalization preserves total weight, so $|N_C| = |N_D|$. Since the intersection graph is connected, this equality propagates from one context to every other context. Thus all local levels are equal to a common integer $t$. Uniqueness is immediate, because $t = |N_C|$ for any context $C$.
]

Thus the level is not just an extra parameter added by hand. On a connected cover, it is the common normalization scale forced by compatible integer data.

#definition(name: [Discrete empirical model of level $t$], id: "def:discrete-model")[
  A *discrete empirical model of level* $t$ is a compatible family
  $
    N = (N_C)_(C in cal(M))
  $
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
Giving a family $(N_C)_(C in cal(M))$ is the same thing as giving a vector $N in NN^V$, by the rule
$
  N(C,s) := N_C(s).
$

The context hypergraph is $H_cal(M) = (V,E_cal(M))$, where
$
  E_cal(M) = { e_C | C in cal(M) }
  quad "and" quad
  e_C := { (C,s) | s in ℰ(C) }.
$
Let $A_cal(M)$ be its incidence matrix. Then
$
  (A_cal(M)N)_C = sum_(s in ℰ(C)) N(C,s) = |N_C|.
$
Therefore the equation $A_cal(M)N = t 𝟙$ expresses the common-level condition. It does not express compatibility by itself.

The compatibility equations are homogeneous. If $D$ denotes their matrix, the vector form of a discrete empirical model of level $t$ is
$
  A_cal(M) N = t 𝟙
  quad "and" quad
  D N = 0.
$
Equivalently, using the notation $delta N = 0$ for the second family of equations, the compatible counting semigroup is
$
  𝒮 := { (N,t) in NN^V times NN | A_cal(M) N = t 𝟙 " and " delta N = 0 }.
$
For a fixed level $t$, we write
$
  𝒮_t := { N in NN^V | (N,t) in 𝒮 }.
$

If the two families of constraints are assembled into one augmented matrix, then
$
  A_("aug") N = (t 𝟙, 0).
$
The zero part is important: compatibility equations are homogeneous, while normalization equations carry the level $t$.

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

In other words, determinism means that all counterfactual outcomes are jointly defined. Even if two measurements cannot be performed together, such as $a$ and $a'$ in the Bell scenario, a deterministic model still assigns values to both of them in advance.

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

== Small results on the discrete CHSH semigroup #lou[A travailler]

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

= Main concept : dynamic contextual automata

The previous section described compatible countings as elements of an affine semigroup. This is a static description. It tells us which completed integer tables are possible at each level $t$. The level is important because it records the scale at which the observation has stabilized.

In CHSH, a completed compatible count has total size $k = 4t$. Hence completed objects appear only at sizes divisible by $4$. The dynamic question is therefore unavoidable: what can be said after only one, two, or three visible events have occurred? Such a prefix is not a completed empirical model, but it may still be the beginning of a process that will later close into one.

The aim of dynamic contextual automata is to describe these intermediate states without reducing them to noise. A completed count is built from elementary generators. An interrupted count is built from completed generators and from generators that are still open. The open part contains information about the future: it records what must still be emitted in order to close the process. This makes the later definition of a dynamic state almost forced: it must contain closed copies, open copies, and the residual future of each open copy.

The following sections present the result of our work, from the initial definitions and motivations to the final proposition. The first part introduces the foundations of our meta-theory of theories. The second part shows how this framework can account for simple examples of contextuality. We also emphasize the advantage of replacing probabilistic models with an integer-based dynamic model.

== Basic of dynamic contextual automata

=== Generators as complete processes

Let $V$ be the visible event space introduced above. A count is an element of $NN^V$. A generator is a finite counting vector $g in NN^V$ that is regarded as one elementary complete process.

Generators are not introduced as arbitrary formal objects. They are meant to be elementary bricks of stabilization. A closed empirical table is not explained by a probability point alone, but by a finite production of such bricks.

In CHSH, the previous semigroup computation gives the intended examples. The local deterministic generators are the minimal classical bricks. The lifted PR generators are the minimal non-local bricks of the compatible semigroup. A local deterministic generator has total size $4$. A lifted PR generator has total size $8$. The automata below do not change these bricks. They only describe their progressive production.

At this stage, we do not need to assume that these are the only possible generators in every scenario. The set of generators is a modelling choice, but it is a constrained choice: it must be rich enough to reconstruct the completed countings that we want to explain, and structured enough to make intermediate states meaningful.

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

*This point is crucial for understanding the framework:* the model, or theory, chosen to account for a phenomenon can be more or less fine-grained. The choice of generators is therefore part of the modelling process. A more precise theory requires families of generators with higher levels $l(g)$, whereas a less precise theory may only require generators of lower levels.

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
  Phi(eta) := (N_eta, K_eta).
$
It records both the stabilized visible count (the past) and the completed count (the futur) that would be obtained if all open generators were closed

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
    cal(H)_(cal(G))(N)
    := { eta | N_eta = N }.
  $
]

This formula is the basic accounting rule of the model. A visible count is explained by a number of closed generators and by a multiset of open generators. Each open generator contributes only the part already emitted. Its residual part is not visible yet, but it is part of the hidden state.

#definition(name: "Dynamic completeness", id: "def:dynamic-completeness")[
  Let $cal(A) subset.eq NN^V$ be a class of visible counts that we want to explain. The generator family $cal(G)$ is *dynamically complete* for $cal(A)$ if
  $
    forall N in cal(A), quad cal(H)_(cal(G))(N) != emptyset.
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
  If $O_eta$ is empty, then $N_eta = sum_(g in cal(G)) c_eta (g) g$. Since each $(g,ell(g))$ belongs to $𝒮$ and $𝒮$ is closed under addition, $(N_eta,t_eta)$ belongs to $𝒮$. Conversely, closed completeness gives a decomposition of every $(N,t) in 𝒮$ as a finite sum of generators. This decomposition defines a state with the corresponding closed multiplicities and with no open copy.
]

=== Set of possible explanations

We want to define if $N subset.eq N'$:
$
  ℋ_𝒢 (N -> N') = { (η,η') | η ∈ ℋ_𝒢 (N) , η' ∈ ℋ_𝒢 (N') , η arrow.squiggly η'}
$
with the condition $η := (c,O) arrow.squiggly η' := (c',O')$ is equivalent to $∀ g ∈ 𝒢 , c(g) <= c'(g)$ and $∀g, ∀ R,R' , (g,R) ∈ O and (g,R') ∈ O' => R(v) <= R'(v)$. This means that first the second observation don't erase the past of the first observation and has the same possible view of the future.

It means that given two observation, we have a theory of sheaf but about past and futur, we take the uninion of the past and the intersection of the futur like the restriction of the sheaf.

This proposition explains the relation between the static and dynamic viewpoints. The static semigroup is recovered when all generators are closed. The dynamic model adds the missing layer: it also describes states that occur before closure.

=== First interpretation

The model separates three levels.

- A *trace* is an ordered sequence of visible events produced by hidden transitions.
- A *count* is the Parikh compression of a trace. It forgets the order and keeps only multiplicities.
- A *dynamic state* is a hidden explanation of a count by closed and open generators.

This distinction is essential. A completed count such as an element of $𝒮_("ns")$ is only the endpoint of a process. An interrupted experiment is described by an interface $eta$, or equivalently by its past/future signature $Phi(eta)=(N_eta,R_eta)$. The visible past says what has already happened. The residual future says how the process can still stabilize.

The next step will be to use this interface structure to compare interrupted states, to define costs of open non-local resources, and to study which choices of generators give a meaningful reconstruction of contextual phenomena.

=== From observations to theory: the three-layer architecture

We now describe the full architecture of a dynamic contextual theory. The framework separates three layers: the raw observations, the dynamic explanations, and the constraint that selects admissible dynamics.

==== Layer 1: The sequence of observations

An experiment that can be interrupted produces not a single completed counting, but a sequence of partial observations. At each interruption time $i$, the experimenter records an integer counting $N_i in NN^V$. The full experimental record is the sequence
$
  N_(1:k) = (N_1, dots, N_k).
$
Each $N_i$ is a snapshot of the process at time $i$. It records what has been seen so far, but not how it was produced. The sequence carries more information than the final count alone: it preserves the order of events, the intermediate states, and the possibility of interruption.

For example, in CHSH, if the experiment is interrupted after $17$ events, the visible count $N_3$ may contain $3$ complete local generators and part of a fourth. This prefix is not a closed empirical model, but it is a meaningful intermediate state.

==== Layer 2: The dynamic states and their transitions

For each observation $N_i$, the theory assigns a set of possible hidden explanations
$
  cal(H)_cal(G) (N_i) = { eta_i = (c_i, O_i) | N_(eta_i) = N_i }.
$
Each $eta_i$ remembers which generators are closed (stabilized) and which are open (still in progress). The transition condition $eta_i arrow.squiggly eta_(i+1)$ ensures that the explanation at time $i+1$ is compatible with the explanation at time $i$: closed generators remain closed, and the residual future can only shrink.

The full fibre of dynamic explanations for the sequence is
$
  cal(H)_cal(G) (N_(1:k)) = { (eta_1, dots, eta_k) | forall i, eta_i in cal(H)_cal(G) (N_i) " and " eta_i arrow.squiggly eta_(i+1) }.
$
This fibre may contain many trajectories. Two different trajectories can explain the same observation sequence with different distributions of open and closed copies, different residual futures, and different intermediate costs.

==== Layer 3: The dynamic constraint $xi$

The fibre $cal(H)_cal(G) (N_(1:k))$ is typically too large to be useful by itself. It contains every possible way of explaining the observations, including explanations that accumulate unbounded open-generator debt. The third layer introduces a constraint $xi$ that filters the fibre to select only those trajectories that satisfy a global stability condition.

The dynamic fit under constraint $xi$ is
$
  cal(H)_(cal(G), xi) (N_(1:k)) = { (eta_1, dots, eta_k) in cal(H)_cal(G) (N_(1:k)) | (eta_1, dots, eta_k) models xi }.
$
The observation sequence is *explained* by the theory $(cal(G), xi)$ if this set is non-empty.

==== The theory $TT = (cal(G), xi)$

A dynamic contextual theory is a pair
$
  TT = (cal(G), xi),
$
where $cal(G)$ is the *structure* and $xi$ is the *dynamics*.

The *structure* $cal(G)$ specifies the elementary processes: which generators are available, what their levels are, and how they decompose compatible countings. The choice of $cal(G)$ is a modelling decision. A coarse theory uses only low-level generators. A fine-grained theory uses higher-level generators that can explain more complex observations.

The *dynamics* $xi$ specifies how the generators can evolve over time. It does not determine a unique trajectory. It constrains the set of admissible trajectories, removing those that violate a stability condition. The dynamics is what makes the theory predictive: it says not only what can be observed, but how the hidden process must behave between observations.

==== The three approaches to $xi$

We now describe three ways to define the dynamic constraint $xi$, in order of increasing sophistication.

*Approach 1: Open-generator constraint.* The simplest constraint limits the number of open generators relative to closed ones:
$
  xi_B : quad O_i <= lambda C_i + B quad forall i.
$
Here $O_i$ is the number of open copies and $C_i$ is the number of closed copies. This constraint acts like a magnet: it does not determine the trajectory, but if the process accumulates too many open generators, the constraint forces it back toward stabilization. The trajectory is free to choose its path within the stability envelope.

*Approach 2: Calibrated slope.* A refined version calibrates the slope $lambda$ to the trison bound $T(n)$ at the relevant level:
$
  xi_(B,T) : quad O_i <= lambda_T (n) C_i + B quad forall i,
$
where $lambda_T (n)$ is computed from the rational approximation $w_Q (n)/n$ of the Tsirelson probability. This targets the discrete quantum bound rather than the abstract irrational limit.

*Approach 3: Past/future product constraint.* The most refined approach uses the past/future distances $d^-$ and $d^+$. For each dynamic state $eta_i$, define
$
  d^-_i = |N_i - P_(eta_i)|_1, quad d^+_i = |F_(eta_i) - N_i|_1,
$
where $P_(eta_i)$ is the closed part and $F_(eta_i)$ is the completed part. The constraint is
$
  xi_"PF" : quad d^-_i dot d^+_i <= A_T (n) quad forall i.
$
The product $d^- d^+$ measures the simultaneous tension between past and future. It is the dynamic analogue of the contextual fraction: a classical observation has $d^- = d^+ = 0$, a quantum-like observation has moderate tension, and a post-quantum observation has excessive tension.

The key result is that $d^- d^+$ is strictly monotonically increasing in the CHSH score $S$ for $S > 2$, on the isotropic line. Therefore the constraint $d^- d^+ <= A_T (n)$ captures exactly the quantum set at each finite level $n$, without any reference to $sqrt(2)$.

==== What $xi$ is not

It is important to clarify what $xi$ does not do.

- $xi$ does not determine a unique hidden state. Multiple trajectories can satisfy $xi$ for the same observation sequence.
- $xi$ does not choose which event will be emitted next. It only filters the set of admissible continuations.
- $xi$ is not a hidden-variable theory in the traditional sense. It does not assign predetermined values to all measurements. It constrains the dynamics of the explanatory process.

In this sense, $xi$ is closer to a conservation law than to a hidden variable. It says what must be preserved (the stability bound), not what must happen (the next event). The theory $TT = (cal(G), xi)$ is therefore a theory of constraints on explanations, not a theory of hidden causes.

= Analyse quantum experiences result with dynamic contextual automata

#v(5em)

The previous sections established the static and dynamic tools: compatible integer countings, Hilbert-basis generators, open/closed copies, and residual automata. We now use these tools to analyse quantum experimental data. The central question is: can the dynamic framework distinguish quantum-like observations from classical and post-quantum ones, and can it do so at each finite level $t$ without invoking the idealized Tsirelson bound?

== The trison bound at level $t$

We have seen that a discrete empirical model of level $t$ is a compatible integer counting $N in NN^V$ with $A_cal(M) N = t 𝟙$ and $delta N = 0$. In the CHSH scenario, the score $S(N)$ is a rational number at each finite level $t$, because each entry $N(a,b|x,y)$ is an integer and the correlators are ratios of integers with denominator dividing $t$.

#definition(name: [Trison bound at level $t$], id: "def:trison-bound")[
  Let $cal(Q)_t$ denote the set of integer countings at level $t$ that are quantum-realizable, that is, countings that arise from some finite-dimensional quantum strategy with $t$ repetitions. The *trison bound* at level $t$ is
  $
    T(t) := sup_(N in cal(Q)_t) S(N).
  $
  Since $cal(Q)_t$ is a finite set of integer points in a compact region, the supremum is a maximum and $T(t)$ is a rational number.
]

The trison bound $T(t)$ is the best CHSH score achievable by any quantum strategy using exactly $t$ repetitions of the experiment. It is a discrete, rational, finite-time quantity.

== The Tsirelson bound is an asymptotic idealization

The celebrated Tsirelson bound states that quantum mechanics cannot produce a CHSH score exceeding $2 sqrt(2)$. In the standard probabilistic framework, this bound is derived from the algebraic structure of Hilbert-space observables. However, from the discrete perspective, the situation is fundamentally different.

#proposition(name: "$sqrt(2)$ requires infinite experiments", id: "thm:sqrt2-infinite")[
  For every finite level $t in NN$, the trison bound satisfies $T(t) < 2 sqrt(2)$. The Tsirelson bound is recovered only in the limit:
  $
    lim_(t -> oo) T(t) = 2 sqrt(2).
  $
]

#proof[
  The proof proceeds in two steps.

  _Step 1: Rationality._ For any $N in cal(Q)_t$, each correlator $E(x,y)$ is a ratio of integers with denominator dividing $t$. The CHSH score $S = E(0,0) + E(0,1) + E(1,0) - E(1,1)$ is therefore a rational number. Hence $S(N) in QQ$.

  _Step 2: Irrationality of $2 sqrt(2)$._ If $2 sqrt(2) = p/q$ for some integers $p,q$, then $sqrt(2) = p/(2q)$ would be rational, which is a contradiction by the classical proof of irrationality. Therefore $S(N) != 2 sqrt(2)$ for any finite $t$.

  _Step 3: Convergence._ On the isotropic line of the CHSH polytope, one can construct explicit quantum strategies that approach $2 sqrt(2)$ as $t$ grows. The optimal winning probability at level $t$ is $w^*(t) = floor(t p^*)$ where $p^* = (2+sqrt(2))/4$. The resulting score is
  $
    T_"iso"(t) = (4(2 w^*(t) - t)) / t,
  $
  and the gap satisfies
  $
    2 sqrt(2) - T_"iso"(t) = (8 dot "frac"(t p^*)) / t,
  $
  which tends to $0$ as $t -> oo$. Since $T(t) >= T_"iso"(t)$, the result follows.
]

This theorem has a striking interpretation: the $sqrt(2)$ of Tsirelson is not a parameter of the discrete model. It is an emergent, asymptotic, purely abstract quantity. No finite experiment can ever reach it. The irrationality of $sqrt(2)$ creates an arithmetic obstruction: at every finite level $t$, the quantum score is rational, and the gap to $2 sqrt(2)$ is controlled by the Diophantine properties of $sqrt(2)$ through its continued fraction expansion $sqrt(2) = [1; 2, 2, 2, dots]$.

== Discrete quantum theory at level $t$

This observation motivates a shift in perspective. Instead of asking "does the data match the Tsirelson bound?", we ask "does the data match the trison bound at its own level?"

#definition(name: "Discrete quantum theory at level $t$", id: "def:discrete-quantum-theory")[
  The *discrete quantum theory at level* $t$ is the triple
  $
    TT_t = (cal(G), xi_t, T(t))
  $
  where $cal(G)$ is the generator family, $xi_t$ is a dynamic constraint calibrated to level $t$, and $T(t)$ is the trison bound at level $t$. An observation $N$ is *quantum-realizable at level $t$* if it admits a dynamic explanation compatible with $xi_t$.
]

The key idea is that the quantum set at level $t$ is not defined by the irrational bound $2 sqrt(2)$, but by the rational bound $T(t)$. This is operationally honest: a laboratory performing $t$ repetitions can only distinguish scores in $1/t$ increments. The discrete quantum theory respects this resolution.

== Approximation via the NPA hierarchy

Computing $T(t)$ exactly is in general a hard combinatorial problem: one must optimize over all integer points in the quantum set. The NPA (Navascués-Pironio-Acín) hierarchy provides a systematic way to approximate the quantum set from the outside @Navascues_Pironio_Acin_2008.

#definition(name: "NPA approximation of $T(t)$", id: "def:npa-approximation")[
  Let $cal(Q)_k$ denote the $k$-th NPA relaxation of the quantum set, which satisfies $cal(Q) subset.eq cal(Q)_k$ for all $k$ and $cal(Q)_k subset.eq cal(Q)_(k+1)$. Define
  $
    T_k (t) := max_(N in NN^V, A N = t 𝟙, delta N = 0, N/t in cal(Q)_k) S(N).
  $
  This is the best CHSH score achievable by an integer counting at level $t$ that also satisfies the $k$-th NPA relaxation.
]

The NPA hierarchy gives a sandwich:
$
  T_"iso" (t) <= T(t) <= T_k (t) <= 2 sqrt(2).
$
The first inequality holds because the isotropic strategy is a particular quantum strategy. The second holds because $cal(Q) subset.eq cal(Q)_k$. The third is the Tsirelson bound itself, which is the limit of the NPA hierarchy.

The practical interest is that $T_k (t)$ can be computed by a mixed-integer linear program (MILP): one extracts linear inequalities from the NPA semidefinite relaxation at level $k$, then optimizes the integer CHSH score subject to these inequalities, the normalization constraint $A N = t 𝟙$, and the no-signaling constraint $delta N = 0$. This MILP is solvable by standard solvers such as Gurobi or SCIP.

At NPA level $1$, the moment matrix $Gamma^((1))$ is $5 times 5$ (basis ${I, A_0, A_1, B_0, B_1}$) with the constraint $Gamma^((1)) succ.eq 0$. This gives the eight CHSH inequalities plus additional quadratic constraints. At higher levels, the matrix grows and the constraints become tighter, converging to the exact quantum set.

The duality between NPA and the discrete sheaf is:

- *NPA (top-down):* relaxes the quantum set into $cal(Q)_k$ and computes $T_k (t) >= T(t)$. The direction is from above.
- *Discrete sheaf (bottom-up):* restricts to integer points and computes $T(t)$ directly. The direction is from below.

Together they squeeze the trison bound: $T(t) <= T_k (t)$, and both converge to $2 sqrt(2)$ as $t$ and $k$ grow.

== The three levels at each $t$

At each finite level $t$, the discrete framework separates three sets of integer countings:

- *Local:* $cal(S)_"loc" (t)$ contains the noncontextual integer models. These satisfy $S <= 2$.
- *Quantum:* $cal(S)_"quant" (t) = cal(Q)_t$ contains the quantum-realizable integer models. These satisfy $S <= T(t) < 2 sqrt(2)$.
- *No-signaling:* $cal(S)_"ns" (t)$ contains all compatible integer models. These satisfy $S <= 4$.

The inclusions $cal(S)_"loc" (t) subset.eq cal(S)_"quant" (t) subset.eq cal(S)_"ns" (t)$ hold at every level. The trison bound $T(t)$ is the frontier of the quantum set inside the no-signaling set. It is a rational number that depends on the arithmetic of $t$ and on the Diophantine properties of $sqrt(2)$.

#remark(name: [Non-monotonicity of $T(t)$], id: "rem:non-monotone-T")[
  The function $t mapsto T(t)$ is not monotone. For example, $T(7) = 2.571 < T(6) = 2.667$. This happens because the arithmetic structure of the integer lattice changes with $t$: some levels admit particularly good rational approximations to the quantum set, while others do not. The convergents of the continued fraction of $sqrt(2)$, namely $t in {1, 2, 5, 12, 29, 70, 169, 408, dots}$, are the levels where $T(t)$ is closest to $2 sqrt(2)$.
]

== Non-isotropic strategies beat the isotropic line

A natural question is whether the isotropic strategy (same winning count $w$ in every context) is always optimal. The answer is no.

At level $t = 5$, the isotropic strategy with $w = 4, l = 1$ gives $S = 2.4$. But a non-isotropic strategy with correlators $(1.0, 0.6, 1.0, -0.2)$ achieves $S = 2.8$. This strategy "sacrifices" the fourth context (reducing its anti-correlation from $-0.6$ to $-0.2$) to "boost" the first and third contexts to perfect correlation. The net gain is $+0.4$.

This shows that the quantum set at finite $t$ is not symmetric under permutation of contexts. The optimal strategy depends on the arithmetic structure of $t$ and on the geometry of the integer lattice inside the no-signaling polytope.

== Interpretation: $sqrt(2)$ as a purely abstract limit

The result of this section can be summarized as follows. The quantity $sqrt(2)$ that appears in the Tsirelson bound is not a physical constant that can be measured in a single experiment. It is a purely abstract, asymptotic, irrational limit of a sequence of rational, finite-time, physically meaningful quantities $T(t)$. Each $T(t)$ is the best CHSH score achievable with $t$ repetitions. The gap $2 sqrt(2) - T(t)$ is controlled by the Diophantine properties of $sqrt(2)$ and tends to zero as $t -> oo$, but it is never zero at any finite $t$.

This has a direct consequence for the dynamic framework: the constraint $xi$ that defines the discrete quantum theory at level $t$ should not target $2 sqrt(2)$ directly. It should target $T(t)$, which is a rational, computable, finite-time quantity. The next section describes how such constraints are built from the dynamics of open and closed generators.

= Towards a dynamic condition to capture quantum non-locality

== Single data: the static constraint

The first step is to test whether a single observation $N$ can be explained by a dynamic state that satisfies a stability constraint between open and closed generators.

#definition(name: "Static stability constraint", id: "def:static-stability")[
  Let $eta = (c_eta, O_eta)$ be a dynamic state with visible count $N_eta = N$. Define
  $
    O_eta := |O_eta| = sum_((g,R) in O_eta) 1,
  $
  the number of open copies, and
  $
    C_eta := sum_(g in cal(G)) c_eta (g),
  $
  the number of closed copies. The *static stability constraint* with buffer $B >= 0$ is
  $
    xi_B : quad O_eta <= lambda C_eta + B
  $
  for some slope $lambda >= 0$.
]

This constraint says that the number of open (incomplete) generators cannot exceed a linear function of the number of closed (stabilized) generators. The parameter $lambda$ controls the allowed ratio of instability to stability. The parameter $B$ is a buffer that tolerates a fixed amount of initial instability before any generator has closed.

#remark(name: "Magnet analogy", id: "rem:magnet-analogy")[
  The constraint $xi_B$ behaves like a magnet guiding a trajectory. It does not determine the path: the dynamics of opening, emitting, and closing generators is not forced by $xi_B$ alone. But if the trajectory strays too far---if the number of open copies grows too large relative to the closed ones---the constraint applies a "wall" that pushes the process back toward stabilization. The magnet does not choose the destination, but it prevents the trajectory from escaping into unbounded instability.

  More precisely: $xi_B$ does not select a unique trajectory $eta_1 -> eta_2 -> dots -> eta_k$. It filters the set of admissible trajectories, removing those that violate the stability bound at any step. The surviving trajectories are not deterministic, but they are constrained: their open/closed ratio stays within the prescribed envelope.
]

#proposition(name: "Static separation at level $68$", id: "prop:static-separation")[
  Consider the isotropic CHSH scenario at level $n = 34$ (so $t = 2n = 68$ total events). Using the local deterministic generators $cal(G)_"loc"$ and the constraint $xi_0 : O <= C$ (no buffer, slope $lambda = 1$), the following observations are separated:

  #figure(
    table(
      columns: 6,
      align: center,
      inset: 6pt,
      table.header([Observation], [$w$], [$l$], [$S$], [Minimal $O$], [Fit $O <= C$?]),
      [Local boundary], [25], [9], [1.882], [0], [Yes],
      [Quantum-like], [29], [5], [2.824], [38], [Yes],
      [Stronger], [30], [4], [3.059], [48], [No],
      [PR], [34], [0], [4.000], [91], [No],
    ),
    caption: [Static separation by $O <= C$ at level $n = 34$. The quantum-like point passes; the post-quantum and PR points fail.],
  )<tab:static-separation>
]

The constraint $O <= C$ accepts the quantum-like observation (close to Tsirelson) but rejects the next point on the isotropic line and the PR box. This is a first, crude separation: it distinguishes the quantum regime from the post-quantum regime using only the dynamics of open and closed generators.

== Towards dynamic behavior: multiple data and dynamic constraints

A single observation $N$ is a static snapshot. A real experiment produces a sequence of observations $N_1, dots, N_k$ as the process evolves. The dynamic framework must therefore constrain not just individual states, but entire trajectories.

=== The sequence of observations

An experiment that can be interrupted produces a sequence of integer countings:
$
  N_(1:k) = (N_1, dots, N_k).
$
Each $N_i$ is the visible count at interruption time $i$. The sequence is not necessarily cumulative: the experimenter may observe partial data at each step, and the total count at time $i$ may differ from the sum of previous counts. The key constraint is that each $N_i$ must be explainable by some dynamic state $eta_i$.

=== The dynamic states and their transitions

For each observation $N_i$, the set of possible explanations is
$
  cal(H)_cal(G) (N_i) = { eta in "Dyn"_cal(G) | N_(eta_i) = N_i }.
$
Each $eta_i = (c_i, O_i)$ is a pair of closed multiplicities and open copies. The transition $eta_i -> eta_(i+1)$ means that the second state does not erase the past of the first: the closed generators at time $i$ remain closed at time $i+1$, and the residual futures are compatible.

More precisely, $eta := (c, O) arrow.squiggly eta' := (c', O')$ holds when:

- For every $g in cal(G)$, $c(g) <= c'(g)$: closed copies are never destroyed.
- For every $g$ and every pair of residuals $R, R'$, if $(g, R) in O$ and $(g, R') in O'$, then $R(v) <= R'(v)$ for every $v in V$: the future at time $i+1$ is a subset of the future at time $i$.

This condition defines a sheaf-like structure on the past and future: the past grows (union of closed generators) and the future shrinks (intersection of residual obligations).

=== The fibre of dynamic explanations

The full fibre of dynamic explanations for the sequence $N_(1:k)$ is
$
  cal(H)_cal(G) (N_(1:k)) = { (eta_1, dots, eta_k) | forall i, eta_i in cal(H)_cal(G) (N_i) " and " eta_i arrow.squiggly eta_(i+1) }.
$
This is the set of all coherent trajectories that explain the observed sequence. Without additional constraints, this set may be very large: it contains every possible way of distributing open and closed copies that is compatible with the observations and with the transition condition.

=== The extra layer: from observations to dynamics to explanation

The framework separates three layers.

+ *Observations.* The experimenter records a sequence of integer countings $N_1, dots, N_k$. These are the visible data.

+ *Dynamic explanations.* For each $N_i$, the theory assigns a set of possible hidden states $cal(H)_cal(G) (N_i)$. Each hidden state remembers which generators are closed (already stabilized) and which are open (still in progress). The transition condition $eta_i arrow.squiggly eta_(i+1)$ ensures coherence across time.

+ *The dynamic constraint $xi$.* An additional constraint $xi$ filters the fibre $cal(H)_cal(G) (N_(1:k))$ to select only those trajectories that satisfy a global stability condition. This is the layer that encodes the "theory" --- not as a deterministic hidden variable, but as a restriction on the allowed dynamics.

The theory is therefore a pair
$
  TT = (cal(G), xi),
$
where $cal(G)$ is the structure (the generators) and $xi$ is the dynamics (the constraint on trajectories). The structure says what the elementary processes are. The dynamics says how they can evolve.

=== The dynamic fit

Given a sequence of observations $N_(1:k)$, the *dynamic fit* under theory $TT = (cal(G), xi)$ is
$
  cal(H)_(cal(G), xi) (N_(1:k)) = { (eta_1, dots, eta_k) in cal(H)_cal(G) (N_(1:k)) | (eta_1, dots, eta_k) models xi }.
$
The observation sequence is *explained* by $TT$ if this set is non-empty: there exists at least one coherent trajectory that satisfies the stability constraint at every step.

=== Three approaches to $xi$

We now describe three ways to define the dynamic constraint $xi$, in order of increasing sophistication.

==== Approach 1: Open-generator constraint (the magnet)

The simplest approach constrains the number of open generators at each step:
$
  xi_B : quad O_i <= lambda C_i + B quad forall i.
$
Here $O_i = |O_(eta_i)|$ is the number of open copies and $C_i = sum_g c_i (g)$ is the number of closed copies. The slope $lambda$ controls the allowed ratio of instability to stability. The buffer $B$ tolerates initial instability.

As explained in @rem:magnet-analogy, this constraint does not determine the trajectory. It acts like a magnet: if the process accumulates too many open generators relative to closed ones, the constraint forces it back toward stabilization. The trajectory is free to choose its path, but it cannot stray beyond the stability envelope.

The experimental results show that this approach separates quantum-like observations from post-quantum ones. At level $n = 34$ with $lambda = 1$ and $B = 0$, the quantum-like point $(w, l) = (29, 5)$ fits ($O = 38, C = 40$), while the post-quantum point $(30, 4)$ does not ($O = 48, C = 32$).

==== Approach 2: Calibrated slope $O_i <= lambda C_i + B$

The constraint with slope $lambda = 1$ is crude. A more refined approach calibrates the slope to the trison bound $T(n)$ at the relevant level.

For the isotropic CHSH line, if the winning probability is $p = w/n$, then the threshold for the static constraint $O <= lambda C$ corresponds to
$
  lambda = ((4p)/3 - 1) / (1 - p).
$
At the Tsirelson probability $p^* = (2+sqrt(2))/4$, this gives $lambda_Q = (2 sqrt(2))/3$. At the finite level $n$, the calibrated slope is
$
  lambda_T (n) = ((4/3)(w_Q (n)/n) - 1) / (1 - w_Q (n)/n),
$
where $w_Q (n) = floor(n p^*)$.

The constraint
$
  xi_(B, T) : quad O_i <= lambda_T (n) C_i + B
$
targets the discrete quantum bound $T(n)$ rather than the abstract Tsirelson bound. This is operationally honest: the slope is computed from the rational approximation $w_Q (n)/n$, not from the irrational $sqrt(2)$.

Experimental results at level $n = 34$ with $lambda_T (34) = 14/15$:

- The quantum-like point $(29, 5)$ fits with buffer $B = 15$.
- The post-quantum point $(30, 4)$ requires buffer $B >= 19$.
- The PR point $(34, 0)$ requires buffer $B = 91$.

The gap between quantum-like and post-quantum is preserved, and the buffer grows sharply above the quantum threshold.

==== Approach 3: The past/future product constraint $d^- d^+ <= A_T (n)$

The most refined approach uses the past/future distances $d^-$ and $d^+$ introduced in the previous section. Recall that for a dynamic state $eta$ with visible count $N$:
$
  d^- (N, eta) = |N - P_eta|_1, quad d^+ (N, eta) = |F_eta - N|_1,
$
where $P_eta$ is the closed (past) part and $F_eta$ is the completed (future) part.

The product $d^- d^+$ measures the simultaneous tension between what has been seen and what remains to be done. A classical observation has $d^- = d^+ = 0$: everything is already closed. A quantum-like observation has moderate tension. A post-quantum observation has excessive tension.

#definition(name: "Past/future product constraint", id: "def:past-future-product")[
  Let $A_T (n)$ be the integer threshold calibrated to the trison bound $T(n)$:
  $
    A_T (n) := d^-_Q times d^+_Q,
  $
  where $d^-_Q, d^+_Q$ are the past/future distances at the quantum-optimal isotropic point $(w_Q (n), n - w_Q (n))$. The *past/future product constraint* is
  $
    xi_"PF" : quad d^- (N_i, eta_i) dot d^+ (N_i, eta_i) <= A_T (n) quad forall i.
  $
]

This constraint has a direct connection to the contextuality literature. In the work of Barbosa et al. on quantifying contextuality via linear programming, the contextual fraction measures the failure of classical explanation. Here, $d^- d^+$ plays an analogous role but in the dynamic setting: it measures the tension between past and future in the explanatory process.

The key result is that $d^- d^+$ is strictly monotonically increasing in the CHSH score $S$ for $S > 2$, on the isotropic line. Therefore:

#proposition(name: "$d^- d^+$ captures the quantum set at level $n$", id: "prop:dd-captures-quantum")[
  On the isotropic CHSH line at level $n$, the constraint $d^- d^+ <= A_T (n)$ is equivalent to $S <= T(n)$. That is:
  $
    d^- d^+ <= A_T (n) quad <=> quad S <= T(n).
  $
  Moreover, $A_T (n) < d^- d^+_"post"$ for every $n$, where $d^- d^+_"post"$ is the product at the first post-quantum point.
]

This means that the past/future product constraint captures exactly the quantum set at each finite level $n$. The constraint is purely integer-valued: no $sqrt(2)$ appears. The irrational Tsirelson bound emerges only as the limit $A_T (n) / n^2 -> 2 sqrt(2) - 1$ when $n -> oo$.

#figure(
  table(
    columns: 6,
    align: center,
    inset: 6pt,
    table.header([$n$], [$w_Q$], [$T(n)$], [$A_T (n)$], [$S_"post"$], [Separation]),
    [5], [4], [2.400], [32], [--], [--],
    [10], [8], [2.400], [128], [3.20], [Yes],
    [17], [14], [2.588], [640], [3.06], [Yes],
    [20], [17], [2.800], [1536], [3.20], [Yes],
    [34], [29], [2.824], [4480], [3.06], [Yes],
    [50], [42], [2.720], [6912], [2.88], [Yes],
    [70], [59], [2.743], [14976], [2.86], [Yes],
    [100], [85], [2.800], [34560], [2.88], [Yes],
  ),
  caption: [Calibration of $A_T (n)$ at various levels. The quantum threshold $A_T (n)$ is always strictly below the post-quantum value, confirming exact separation.],
) <tab:AT-calibration>

== The first algorithm: static verification

The first algorithm we developed tests whether a single observation $N$ can be explained by a dynamic state satisfying the stability constraint. This is a static test: it does not require a sequence of observations, only a single integer counting.

#definition(name: "Static dynamic feasibility", id: "def:static-feasibility")[
  Given an observation $N in NN^V$ and a constraint $xi$, the *static feasibility problem* asks: does there exist a dynamic state $eta = (c_eta, O_eta)$ such that

  + $N_eta = N$ (the visible count matches the observation),
  + $eta models xi$ (the stability constraint is satisfied)?

  The set of all such explanations is $cal(H)_(cal(G), xi) (N)$.
]

For the constraint $O <= lambda C + B$, this is a mixed-integer linear program (MILP). The variables are the multiplicities $c(g)$ of closed generators and the open copies $(g, R)$ with their residuals. The constraints are:

- The visible count equation: $N = sum_g c(g) g + sum_((g,R) in O) (g - R)$.
- The stability constraint: $|O| <= lambda sum_g c(g) + B$.
- Integrality: $c(g) in NN$, $R in NN^V$, $0 <= R <= g$.

The objective can be feasibility (does any solution exist?) or optimization (minimize $B$ for a given $lambda$).

=== Results

The algorithm was tested on the isotropic CHSH line at level $n = 34$ with local deterministic generators. The results confirm the theoretical predictions:

- For the quantum-like point $(29, 5)$ with $S = 2.824$: the minimal buffer is $B = 15$ at slope $lambda_T (34) = 14/15$. A global run with $k = 272$ transitions exists.

- For the post-quantum point $(30, 4)$ with $S = 3.059$: the minimal buffer is $B >= 19$ at the same slope. The instability grows sharply.

- For the PR point $(34, 0)$ with $S = 4$: the minimal buffer is $B = 91$. The open-generator debt is massive and persistent.

The algorithm was also extended from per-prefix feasibility (testing each $N_i$ independently) to global run feasibility (finding a single coherent trajectory $eta_1 -> dots -> eta_k$). The passage from per-prefix to global does not destroy the separation: the quantum-like point still fits with moderate buffer, while the post-quantum points require significantly larger buffers.

This is the first concrete result of the dynamic framework: a single integer counting $N$ can be tested for quantum-realizability by asking whether it admits a dynamic explanation with controlled open-generator debt. The test is purely combinatorial, uses only integer arithmetic, and does not require any reference to $sqrt(2)$ or to infinite-dimensional Hilbert spaces.




= Appendix

== The initial state of the art and the initial subjet

#let mipstar = $"MIP"^*$
#let mipstarzero = $"MIP"_0^*$
#let RE = $"RE"$

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

== Some genaral definition

We recall the standard definition of multi-prover interactive proof systems with entanglement. The parameters are the number of provers $r$, the number of rounds $p$, the completeness parameter $c$, and the soundness parameter $s$.

*Definition 1* ($mipstar_0 (r, p)$). A language $cal(L)$ belongs to $mipstar (r, p)$ if there exists a polynomial-time verifier $V$ interacting with $r$ non-communicating provers $P_1, dots, P_r$ over $p$ rounds of communication, such that:

+ *Shared entanglement.* Before the protocol begins, the provers share an arbitrary quantum state
  $ |psi chevron.r in cal(H)_1 times.o cal(H)_2 times.o dots.c times.o cal(H)_r $
  where each $cal(H)_i$ is a Hilbert space of _arbitrary finite dimension_. No restriction is placed on $|psi chevron.r$: it may be entangled in any way, in any dimension.

+ *Strategy.* Upon receiving question $q_i$ from the verifier, prover $P_i$ performs a measurement $\{M^((i))_(a|q_i)\}_a$ on their local subsystem $cal(H)_i$ and returns the outcome $a$. The joint probability of outcomes $(a_1, dots, a_r)$ given questions $(q_1, dots, q_r)$ is
  $
    p(a_1, dots, a_r | q_1, dots, q_r) = chevron.l psi | M^((1))_(a_1|q_1) times.o dots.c times.o M^((r))_(a_r|q_r) | psi chevron.r.
  $

+ *Completeness.* If $x in cal(L)$, there exist a state $|psi chevron.r$ and measurements such that $Pr[V "accepts"] >= 1$ (we have $c=1$).

+ *Soundness.* If $x in.not cal(L)$, for _every_ state $|psi chevron.r$ (of every dimension) and _every_ choice of measurements, $Pr[V "accepts"] <= 1/2$ (we have $s = 1/2$).

The class $mipstarzero$ is defined as $union.big_(r,p) mipstarzero (r, p)$, allowing arbitrarily many provers and rounds with perfect completeness and bounded-error soundness.

In the $mipstar$ class, instead of fixing the completeness and soundness parameters to $1$ and $1/2$, we take unions over all $c, s$ such that $c - s >= 1/"poly"(|x|)$, allowing for arbitrary completeness-soundness gaps.

=== Two-prover, one-round characterization

A fundamental simplification result shows that two provers and a single round suffice.

*Theorem 1* (see @ji2022mipre). $mipstarzero = mipstarzero (2, 1)$.

That is, every language recognizable by an entangled multi-prover interactive proof system is already recognizable by a _two-prover, one-round_ protocol with perfect completeness and soundness $1\/2$. In this simplified model, the protocol consists of a single exchange:

#block(inset: (left: 1.5em))[
  1. The verifier samples a pair of questions $(q_A, q_B)$ and sends $q_A$ to prover $A$, $q_B$ to prover $B$.

  2. The provers, who share $|psi chevron.r in cal(H)_A times.o cal(H)_B$, each measure their subsystem and return answers $a, b$.

  3. The verifier evaluates a predicate $V(q_A, q_B, a, b)$ and accepts or rejects.
]

This is precisely the framework of a _nonlocal game_, and the supremum of the acceptance probability over all quantum strategies is the _entangled value_ $omega^*$ of the game.

=== The role of unbounded dimension in $mipstar = RE$

The following is the landmark result that motivates our investigation.

*Theorem 2* (Ji, Natarajan, Vidick, Wright, Yuen @ji2022mipre). $mipstar (2, 1, 1, s) = RE$ for some constant $s < 1$.

The proof constructs, for each Turing machine $M$, a nonlocal game $cal(G)_M$ such that:
- if $M$ halts, then $omega^*(cal(G)_M) = 1$ (a perfect strategy exists in finite dimension $d$, where $d$ depends on the halting time of $M$);
- if $M$ does not halt, then $omega^*(cal(G)_M) < 1$ (no strategy in any dimension achieves value $1$).

A crucial feature of this construction is that the entangled value is defined as
$ omega^*(cal(G)) = sup_(d >= 1) sup_(|psi chevron.r in CC^d times.o CC^d) sup_({M_(a|q)}, {N_(b|q')}) Pr["win"], $
and the supremum over $d$ is _essential_. For a halting machine with halting time $T$, the dimension $d$ of the optimal strategy may grow as a function of $T$, and no uniform bound on $d$ exists across all instances. In other words, the full power of $mipstar = RE$ relies on the provers' ability to use shared entanglement of _arbitrarily large dimension_.

*Remark.* If the dimension is bounded by a fixed constant $d$, the resulting class $mipstar (2,1,s,d)$ is known _not_ to capture all of $RE$; indeed, for fixed $d$, the entangled value $omega^*_d (cal(G))$ is computable by semidefinite programming, so the class collapses to a decidable complexity class.


#bibliography("refs.bib")
