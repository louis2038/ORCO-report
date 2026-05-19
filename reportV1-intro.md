# Technical Preliminaries

In this section we will introduce the technical concept from generic contextuality to our theory of discrete contextuality.

## What is contextuality ?

Contextuality is the failure of a family of local observations to come from one global assignment. In a measurement scenario $chevron.l X, cal(M), O chevron.r$, each context $C in cal(M)$ specifies a set of measurements that can be performed together, and a local outcome is a section $s : C arrow.r O$. A classical deterministic explanation would require a single global section $g : X arrow.r O$ whose restriction $g|_C$ explains the outcome seen in every context. Thus contextuality is not merely randomness: it is an obstruction to gluing compatible local descriptions into one global description.

This report uses this standard idea in a discrete form. Instead of starting from normalized real probabilities, we keep integer counts. A local table is therefore not only a point of a convex polytope, but a finite record of occurrences. Compatibility becomes equality of marginal counts on overlaps, and contextuality asks whether these compatible integer data can be reconstructed from deterministic global sections.

## Introduction

In the following, we will use the same notation that in @Abramsky_Brandenburger_2011. We will add our theory on the top of this formalisze and we will discuss how consider discrete contextuality with this notation.

The goal is to model the experiment itself, rather than only the final probability distribution. We consider one or several laboratories equipped with measurement devices. Let $X$ denote the set of available measurements, let $cal(M)$ denote the set of measurement contexts, i.e.\~the subsets of measurements that can be performed jointly, and let $O$ be a finite set of possible outcomes. An experimental run consists in choosing a context $C in cal(M)$ and observing an outcome assignment $s : C arrow.r O$. Thus the primitive observational events are pairs $(C, s)$, where $C$ is the performed context and $s$ is the observed local outcome.

For example, in the classical $(2, 2, 2)$ Bell scenario, there are two parties, Alice and Bob, each with two possible measurements. We write

$ X = { a_1, a_2, b_1, b_2 }, $

where $a_1, a_2$ are Alice's measurements and $b_1, b_2$ are Bob's measurements. The jointly performable contexts are

$ cal(M) = { { a_1, b_1 }, { a_1, b_2 }, { a_2, b_1 }, { a_2, b_2 } }, $

and the outcome set is

$ O = { 0, 1 } . $

This expresses the operational constraint that Alice and Bob can each choose one measurement per run, but Alice cannot perform both of her measurements simultaneously, so ${ a_1, a_2 } in.not cal(M)$. Likewise, ${ b_1, b_2 } in.not cal(M)$.

In this sense, the scenario specifies not only which outcomes may be observed, but also which observations can coexist in a single experimental run.

The technical point of this section is the following. A context table is only local data. A genuine empirical model is obtained only when all context tables can be compared on overlaps and when they have a common level. Therefore we must distinguish three objects: a local counting $N_C$, a family $N = (N_C)_(C in cal(M))$, and the corresponding vector $N in NN^V$ indexed by visible contextual events. The notation is intentionally the same, but the type of the object changes with the context.

#let Set = $sans("Set")$

::: definition
A *measurement scenario* is a triple $chevron.l X, cal(M), O chevron.r$ where $X$ is a set of measurements, $O$ is a set of outcomes, and $cal(M) ⊆ cal(P)(X)$ is a family of measurement contexts. The *event presheaf* associated with this scenario is the functor $cal(E) : cal(P)(X)^"op" -> "Set"$ defined by $cal(E)(U) := O^U$ for every subset $U ⊆ X$. If $U ⊆ V ⊆ X$, the restriction map $cal(E)(V) -> cal(E)(U)$ sends a joint assignment $s : V -> O$ to its restriction $s|_U : U -> O$. Thus, an element $s in cal(E)(U)$ is a local assignment of outcomes to all measurements in $U$. In particular, for a *context* $C in cal(M)$, an element $s in cal(E)(C)$ represents a possible joint outcome for the measurements in $C$.\
Let $R$ be a semiring. For any finite set $Y$, we define

$
    𝒟_R (Y) := { d : Y -> R | "supp"(d) "is finite" }.
$

Here $Y$ is only the set on which the distribution is defined; it is not a level. The support is $"supp"(d) = { y in Y | d(y) != 0 }$. In this report, $R = RR_(>=0)$ gives ordinary non-negative weights, while $R = NN$ gives integer countings.\
The *total weight* of $d$ is $|d| := sum_(y in Y) d(y)$. For a fixed level $t in R$, we write

$
    𝒟_R^t (Y) := { d in 𝒟_R (Y) | |d| = t }.
$

We also use the graded object

$
    𝒟_R^∙(Y) := union_(t in R) 𝒟_R^t (Y).
$

Thus the superscript is the level: $𝒟_R^t$ means exact level $t$, while $𝒟_R^∙$ means that the level is not fixed. The argument $Y$ is the underlying set of outcomes. In the probabilistic case one usually fixes $R = RR_(>=0)$ and $t = 1$. In the discrete setting one takes $R = NN$ and keeps $t in NN$ as the number of counted trials.
:::

### Empirical models as $𝒟_R ∘ ℰ$

The event presheaf $ℰ$ describes which local outcome assignments are available over each set of measurements. To pass from possible assignments to empirical data, one composes it with a distribution or counting functor. Thus the relevant object is not only $ℰ$, but the composite presheaf $𝒟_R ∘ ℰ$, defined by

$
  (𝒟_R ∘ ℰ)(U) = 𝒟_R (ℰ(U)).
$

An element $d_U in 𝒟_R (ℰ(U))$ assigns a weight to each local section $s : U -> O$. In particular, a local counting over a context $C$ is an element $N_C in 𝒟_NN^∙ (ℰ(C))$. This means only that $N_C$ has some integer level. If $N_C in 𝒟_NN^t (ℰ(C))$, then the context $C$ has exact level $t$.

In the usual probabilistic case, one takes $R = RR_(>=0)$ and restricts each context to level $1$. In the discrete experimental case considered here, one takes $R = NN$ and keeps the integer level explicit. This matters because a raw family $(N_C)_(C in cal(M))$ may initially have different local levels $t_C := |N_C|$. Such a raw family is not yet a discrete empirical model of level $t$ unless all $t_C$ are equal to the same integer $t$.

In all the following we suppose that $cal(M)$ is a *measurement cover*, meaning $union_(C in cal(M)) C = X$, and that it is an antichain, meaning $C subset.eq D$ with $C,D in cal(M)$ implies $C = D$.

::: {#def:empirical_model .definition}
An *empirical model* over $chevron.l X, cal(M), O chevron.r$ is a family $e = (e_C)_(C in cal(M))$ with $e_C in 𝒟_R (ℰ(C))$, satisfying compatibility on overlaps. Namely, for all contexts $C,D in cal(M)$, the restrictions of $e_C$ and $e_D$ to $C inter D$ must agree:

$
    e_C|_(C inter D) = e_D|_(C inter D).
$
:::

In the probabilistic case, this says that the marginal distributions coincide. In the counting case, it says that the marginal count vectors coincide exactly.

::: {#def:discrete_model .definition}
A *discrete empirical model of level* $t$ is a family $N = (N_C)_(C in cal(M))$ with $N_C in 𝒟_NN^t (ℰ(C))$ such that, for all $C,D in cal(M)$,

$
    N_C|_(C inter D) = N_D|_(C inter D).
$
:::

The order of the conditions is important. First, every local table must have the same level $t$, i.e. $|N_C| = t$ for all $C$. Second, after this common level has been fixed, the restrictions to overlaps must agree. If the levels are not equal, then the family may still define normalized probabilities $p_C := N_C /(|N_C|)$ context by context, but it is not an integer empirical model of common level. In that normalized situation, compatibility would be a condition on the $p_C$, not on the raw integer counts $N_C$.

Equivalently, if $u in ℰ(C inter D)$, the compatibility equation is

$
  sum_(s in ℰ(C), s|_(C inter D) = u) N_C (s)
  =
  sum_(r in ℰ(D), r|_(C inter D) = u) N_D (r).
$

We write this family of linear equations compactly as $delta N = 0$.

The vector notation is obtained by separating the contexts in a disjoint union. Define

$
  V := ∐_(C in cal(M)) ℰ(C) = { (C,s) | C in cal(M), s in ℰ(C) }.
$

Giving a family $(N_C)_(C in cal(M))$ is then the same thing as giving a vector $N in NN^V$, by the rule $N(C,s) := N_C(s)$.

::: definition
The *context hypergraph* is $H_cal(M) = (V,E_cal(M))$, where $V = ∐_(C in cal(M)) ℰ(C)$ and $E_cal(M) = { e_C | C in cal(M) }$ with $e_C := { (C,s) | s in ℰ(C) }$.
:::

Let $A_cal(M)$ be the incidence matrix of this context hypergraph. Then $A_cal(M) N = t 𝟙$ expresses only the common-level condition $N_C in 𝒟_NN^t (ℰ(C))$ for every context $C$. It does not, by itself, express compatibility on overlaps. Therefore the safe vector formulation is

$
  "Emp"_NN^t (X,cal(M),O)
  = { N in NN^V | A_cal(M) N = t 𝟙 " and " delta N = 0 }.
$

Equivalently, starting from the graded object, one first has $N_C in 𝒟_NN^∙ (ℰ(C))$ for each context. The equation $A_cal(M)N = t 𝟙$ then selects the common-level slice: it says that every $N_C$ actually lies in $𝒟_NN^t (ℰ(C))$. The equation $delta N = 0$ is a second and independent condition: it says that these equal-level tables glue correctly on overlaps.

If one wants a single equation $A N = t 𝟙$, then $A$ must be understood as an augmented constraint matrix: its rows include the context-normalization equations and also the marginal-compatibility equations. In that convention, $A$ is not merely the incidence matrix of the context hypergraph.

::: remark
The fact that the same constant $t$ appears on every hyperedge is essential: it means that all local pieces are normalized at the same integer level and can therefore be regarded as parts of one coherent empirical object.
:::

The link between the hypergraph formalism and the sheaf-theoretic formalism is precisely the operator $delta$: it measures the failure of recollement between local context tables. Thus the relevant discrete object is the affine semigroup

$
  𝒮 := { (N,t) in NN^V times NN | A_cal(M) N = t 𝟙 " and " delta N = 0 }.
$

Equivalently, one may package the two kinds of linear constraints in a block system. If $D$ denotes the matrix of the gluing operator $delta$, then

$
  N in "Emp"_NN^t(X,cal(M),O)
  quad <==> quad
  A_cal(M) N = t 𝟙 " and " D N = 0.
$

In block form this is

$
  A_("aug") N = (t 𝟙, 0)
  quad "with" quad
  A_("aug") := mat(A_cal(M); D).
$

Equivalently, if one treats $t$ as an additional variable, one can write a homogeneous system

$
  mat(A_cal(M), -𝟙; D, 0) vec(N, t) = 0.
$

This is the precise meaning of the augmented-matrix notation.

::: proposition
Suppose that the intersection graph of the contexts is connected, where $C$ is adjacent to $D$ when $C inter D != emptyset$. If $N = (N_C)_(C in cal(M))$ is compatible, i.e. $delta N = 0$, then all local levels $|N_C|$ are equal. Hence a compatible family in $∏_(C in cal(M)) 𝒟_NN^∙ (ℰ(C))$ automatically belongs to $∏_(C in cal(M)) 𝒟_NN^t (ℰ(C))$ for a unique $t$.
:::

::: proof
If $C inter D != emptyset$ and $delta N = 0$, then the marginals of $N_C$ and $N_D$ on $C inter D$ are equal. Marginalization preserves total weight, so the total weight of $N_C$ equals the total weight of $N_D$. Connectedness propagates this equality to every context.
:::

### Example: non-signaling as hypergraph compatibility

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

and can be view by a set of At a common discrete level $t$, these become equalities of marginal counts:

$
  ∑_b N(a b ∣ x_0) = ∑_b N(a b ∣ x_1),
  quad
  ∑_a N(a b ∣ 0y) = ∑_a N(a b ∣ 1y).
$

Equivalently, the context normalizations give $A_cal(M) N = t 𝟙$, while the non-signaling marginal constraints give $delta N = 0$. If these two families of equations are assembled into one augmented matrix $A_("aug") = mat(A_cal(M); D)$, where $D$ is the matrix of $delta$, the same condition is $A_("aug") N = (t 𝟙,0)$. The zero part is important: compatibility equations are homogeneous, while normalization equations have level $t$.

### From convex mixtures to Hilbert bases

This discrete framework differs from the standard probabilistic one. In the usual convex setting, if $e$ and $e'$ are empirical models, then every convex combination $r e + (1-r)e'$ with $r ∈ [0,1]$ is again an empirical model. The geometry is therefore convex.

In our setting, this operation is not primitive. An arbitrary real coefficient $r$ does not preserve integer counts. Instead, the natural operation is addition: if $(m,t)$ and $(m',t')$ belong to $𝒮(A)$, then

$
  (m,t) + (m',t') = (m+m', t+t')
$

also belongs to $𝒮(A)$. Hence the appropriate algebraic object is not first a convex set, but an affine semigroup.

The analogue of a convex decomposition is therefore a Hilbert-basis decomposition. The Hilbert basis $ℋ(A)$ of $𝒮(A)$ is the finite set of irreducible elements of the semigroup. Its elements are the elementary compatible counting models that cannot be decomposed into smaller compatible counting models. Thus, instead of asking whether a model is a convex mixture of deterministic models, we ask which Hilbert generators are required to build it as an integer sum.

### Discrete noncontextuality and strong contextuality

A global section is an assignment of an outcome to every measurement at once. Formally, it is an element $g ∈ 𝓔(X)$, or equivalently a function $g : X → O$. The intuitive meaning is simple: before any context is chosen, every measurement $x ∈ X$ already has a predetermined outcome value $g(x) ∈ O$.

Thus, a global section represents a deterministic *hidden-variable* assignment. If the experimenter later chooses a context $C ∈ 𝓜$, the observed local outcome is not chosen anew; it is just the restriction $g|_C : C → O$ of the already fixed global assignment.

In other words, determinism means that all counterfactual outcomes are jointly defined. Even if two measurements cannot be performed together, such as $a_1$ and $a_2$ in the Bell scenario, a deterministic model still assigns values to both of them in advance.

Given a global section $g : X → O$, we define its deterministic counting vector $d_g ∈ ℕ^V$ by

$
  d_g (C,s) :=
  cases(1 "if" s = g|_C,
    0 "otherwise".)
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

::: proposition
The semigroup $𝒮_("nc")$ is generated by the deterministic vectors $(d_g,1)$ with $g in ℰ(X)$.
:::

::: proof
By definition, every element of $𝒟_NN^∙(ℰ(X))$ is a finite counting $c : ℰ(X) -> NN$. Hence

$
    Phi(c) = sum_(g in ℰ(X)) c(g) d_g.
$

Therefore every element of $𝒮_("nc")$ is an integer sum of deterministic vectors. Conversely, every integer sum of deterministic vectors is obtained by taking $c(g)$ equal to the multiplicity of $d_g$ in the sum. Thus these vectors generate $𝒮_("nc")$.
:::

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

## Small results on the discrete CHSH semigroup [A travailler]{.todo}

We now record the elementary consequences of the previous definitions for the CHSH scenario. In CHSH the vertex set is $V = { (a b | x y) | a,b,x,y in {0,1} }$, hence $|V| = 16$. The contextual hypergraph has $12$ hyperedges: four context-normalization edges and eight non-signaling marginal edges. Each edge has size $4$, and each vertex belongs to exactly $3$ edges. If $A$ is the corresponding incidence matrix and if $N = 𝟙 + m$ with $m in NN^16$, then the discrete non-signaling equation is $A m = t 𝟙$.

This is the same object as the non-signaling polytope, but seen before normalization. Indeed, if

$
  G_("NS")(A) := { p in RR_(>=0)^V | A p = 𝟙 } = P(A),
$

then the equation $A m = t 𝟙$ is equivalent, for $t > 0$, to $p := m/t in G_("NS")(A)$. Conversely, any $p in G_("NS")(A)$ such that $t p in ZZ^V$ gives an integer model $m := t p$. Thus

$
  { m in NN^V | A m = t 𝟙 }
  = t G_("NS")(A) inter ZZ^V.
$

The semigroup $𝒮_("ns")(A)$ is therefore the semigroup of integer points in the cone over $G_("NS")(A)$:

$
  𝒮_("ns")(A)
  := { (m,t) in NN^V times NN | A m = t 𝟙 }
  = { (m,t) | m in t G_("NS")(A) inter ZZ^V }.
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

::: proposition
In the CHSH scenario, every shifted discrete model $(m,t)$ satisfies $k = sum_(v in V) m_v = 4 t$. In particular, there are no shifted discrete models with $k = 1,2,3$, nor with any $k$ not divisible by $4$.
:::

::: proof
Summing all coordinates of $A m = t 𝟙$ gives $12 t$ because CHSH has $12$ hyperedges. The same sum also equals $3 sum_(v in V) m_v$, because each vertex belongs to exactly $3$ hyperedges. Hence $12 t = 3 k$, so $k = 4 t$.
:::

The first admissible nonzero level is therefore $t=1$, equivalently $k=4$. At this level, $A m = 𝟙$ forces $m$ to select exactly one event on every hyperedge. These exact transversals are precisely the local deterministic strategies, i.e. assignments $a = f(x)$ and $b = g(y)$. Thus the first level contains only classical generators.

::: proposition
The first intrinsically non-local CHSH generators occur at $t=2$, equivalently $k=8$.
:::

::: proof
A PR box has probabilities in ${0,1/2}$ and therefore is not an integer point at level $t=1$. Multiplying it by $2$ gives an integer vector $r in {0,1}^16$ with $A r = 2 𝟙$. Hence its first discrete lift is at level $t=2$, so $k = 4t = 8$.
:::

The compatible, or non-signaling, affine semigroup associated with CHSH is

$
  𝒮_("ns")("CHSH") := { (m,t) in NN^16 times NN | A m = t 𝟙 }.
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

::: proposition
Assuming the support lemma verified by exhaustive enumeration of the CHSH supports, $ℋ_("CHSH")$ is the Hilbert basis of $𝒮_("ns")("CHSH")$.
:::

::: proof
The deterministic elements are irreducible because their level is $1$. A lifted PR element is also irreducible: a nontrivial decomposition of $(r_mu,2)$ would split it into two level-$1$ elements, hence into two deterministic local models, which would write a PR box as a convex combination of local deterministic boxes. This is impossible. For generation, the support lemma states that every nonzero $(m,t) in 𝒮_("ns")("CHSH")$ contains the support of some element $(u,s) in ℋ_("CHSH")$. Then $(m-u,t-s)$ is again in $𝒮_("ns")("CHSH")$, and induction on $t$ gives a decomposition into elements of $ℋ_("CHSH")$.
:::

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

## Main concept : dynamic contextual automata
