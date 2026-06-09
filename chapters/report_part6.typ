#import "../template.typ": book, corollary, definition, example, lemma, proof, proposition, remark
#import "../prelude.typ": *

= Towards a dynamic condition to capture quantum non-locality <chap:dynamic-condition-nonlocality>

== Objective: a dynamic theory for the finite quantum set

The previous chapters built the static and dynamic language. We now state the target of the programme more explicitly. At each finite level $t$, let $cal(Q)_t$ be the set of compatible integer countings whose normalization belongs to the Hilbert-space quantum set:
$
  cal(Q)_t := { N in cal(S)_t | N / t in Q }.
$
Here $cal(S)_t$ is the set of compatible integer countings at level $t$, and $Q$ is the usual quantum set of correlations.

The ideal goal is to find a dynamic contextual theory
$𝕋_q = (𝒢_q, ξ_q)$
such that, for every finite level $t$ and every compatible counting $N in cal(S)_t$,
$
  N in 𝕋_q quad <=> quad N in cal(Q)_t.
$
The notation $N in 𝕋_q$ means that $N$ admits at least one admissible dynamic explanation under the theory:
$
  N in 𝕋_q
  quad :<=> quad
  cal(H)_(𝒢_q, ξ_q)(N) != emptyset.
$

This chapter does not prove that such a theory has been found. It formulates the target and presents the first experimental route toward it. The guiding idea is simple: quantum countings should be exactly those countings that can be dynamically explained without creating too much unfinished generator debt. Classical countings should close easily. Post-quantum countings should force too many open obligations.

== Warm-up: open-generator stability

The first constraint we tried was to control the number of open generators. For a dynamic state ${eta_i} ∈ ℋ_𝒢 (N_(1:k))$, let $o_i$ be the number of open copies and let $c_i$ be the number of closed copies of the state $η_i$. The basic stability constraint is
$
  ξ_(λ,B) : quad o_i <= λ c_i + B quad forall i .
$
The parameter $λ$ is a slope and $B$ is a buffer. This is the formal version of the magnet analogy from @rem:magnet-analogy: the constraint does not determine the next event, but it prevents a trajectory from accumulating too many unfinished copies compared with the number of stabilized copies.

This first constraint was useful as a sanity check, because it showed that open-generator debt increases when one moves from local points toward PR-like points. However, it is too coarse to be the main candidate for $ξ_q$. It counts how many generators are open, but it does not measure how much of the observed past is still not closed, nor how much future remains to be emitted. For the quantum problem, the more informative object is therefore not only $o_i$, but the past/future distance discuss in @chap:contextual-fraction.

// One can still calibrate the slope on the isotropic CHSH line. If $p=w/n$ is the winning probability, the open/closed calculation gives
// $
//   λ(p) = ((4p)/3 - 1) / (1 - p).
// $
// At finite level $n$, with $w_Q(n) := floor(n p^*)$ and $p^* := (2+sqrt(2))/4$, this gives
// $
//   λ_T(n) := ((4/3)(w_Q(n)/n) - 1) / (1 - w_Q(n)/n).
// $
// We keep this calibrated slope as a useful baseline. It is not the main object of this chapter.

== Main candidate: the tight contextual product constraint

The tied past/future distances defined in @subchap:dynamic-enrichemnt capture one methodological idea from @chap:context-motivation: a theory should be adjusted during the experiment itself. At each step, the observer may decide that the current closed explanation is too rigid, temporarily lower confidence in the extracted past, admit more candidate explanations, and inspect the future cost of these alternative explanations. In this sense, a dynamic theory does not only predict outcomes. It also revises its own explanatory criteria while the experiment is running.

This idea is not classical curve fitting. In curve fitting, one usually optimizes a fixed criterion on the data collected so far. Here, we allow the criterion itself to move: we ask what happens to the future cost if the past criterion is relaxed by a controlled amount. If relaxing the past suddenly makes many previously rejected explanations viable, and if their future cost remains moderate, then the theory has learned from its own uncertainty. If the future cost explodes, then the current past criterion was already close to the best available explanation.

In the formalism, take an observed counting $N$. The closed part $P_eta$ of an explanation $eta$ is the part of $N$ that is already stabilized by the chosen generators $cal(G)$. The tight choice is to minimize $d^-_eta = |N - P_eta|_1$, which gives the strongest classical explanation of the visible record. But the observer may be wrong to trust this choice completely. Instead of filtering explanations by the tight past, one can enlarge the admissible set: allow explanations whose past deficit is slightly larger, then observe the impact of this relaxed choice on the future. The goal is not to replace the tight profile, but to test whether relaxing it improves the explanatory power of the theory.

The tight product $d^-_i d^+_i$ is small when the process is almost closed, and it becomes large only when the state simultaneously has a large unexplained past and a large residual future. This is more precise than merely counting open generators: two open copies can have very different residual obligations, and the product sees this difference.

This tight product is natural when one fully trusts the static extraction of the contextual residue. But in the spirit of a meta-theory that adjusts itself during the experiment, one may want to test what happens if this trust is weakened. Concretely, the observer can ask: if I allow my past criterion to deteriorate by a controlled amount, how does the future cost react?

To formalize this, let $alpha >= 1$ be a parameter that measures how often the observer expects to be wrong. We interpret $alpha$ as the frequency of revision, or equivalently as the rate at which the observer is ready to mistrust the current extraction of the past. The natural relaxed set is then
$
  cal(D)^(arrow.loop)_alpha (N)
  :=
  min { d^+_eta | eta in cal(H)_cal(G)(N) " and " d^-_eta <= D^-(N) + ceil((|N|_1)/alpha) }.
$

The case $alpha = 1$ corresponds to the tight setting: only the explanations whose past deficit realizes the contextual fraction are kept. As $alpha$ increases, the admissible past deficit grows, but only by a controlled amount compared with the total size of the observation. This is a way to make the theory explore alternative explanations without abandoning the static analysis entirely.

The parameter $alpha$ has a direct operational reading: it answers the question #emph[how many experiments pass before the observer revises the model?] If $alpha$ is small, the observer mostly trusts the current past extraction and allows very few alternative explanations. If $alpha$ is large, the observer revises more often, accepts a wider set of explanations, and watches the effect of this revision on the future cost.

== Multiple possibility

In this step of the research, we don't know what is the candidate that will be the best, we have multiple choice that we can make for the constrain $ξ$. In the static case where we have only one observation $N$ we have the following choice :
$
  ξ : quad & d_η^- d_η^+ <= A quad ∀ η ∈ ℋ_𝒢 (N)                                               &   bold((A)) \
           & min_(η ∈ ℋ_𝒢 (N)) d_η^- d_η^+ <= A                                                &   bold((B)) \
           & min {d_η^- | η ∈ ℋ_𝒢 (N)} · min {d_η^+ | η ∈ ℋ_𝒢 (N)} = D^- (N) D^+ (N) <= A quad &   bold((C)) \
           & D^-(N) D^(arrow.loop) (N) <= A                                                    &   bold((D)) \
           & D^(arrow.l.loop) (N) D^+ (N) <= A                                                 & bold((D_d)) \
           & D^-(N) D^(arrow.loop)_α (N) <= A                                                  &   bold((E)) \
           & D^(arrow.l.loop)_α (N) D^+ (N) <= A                                               & bold((E_d)) \
           & (D^-(N) + ceil((|N|_1)/alpha)) D^(arrow.loop)_α (N) <= A                          &   bold((F)) \
           & D^(arrow.l.loop)_α (N) (D^+(N) + ceil((|N|_1)/alpha)) <= A                        & bold((F_d))
$

And in the dynamic case where we have a sequence of observation $N_(1:k)$ we have the following choice :


== Experimental part: testing the product constraint

This section collects the computational experiments. The aim is not to prove the equivalence $N in 𝕋_q <=> N in cal(Q)_t$. The aim is to test whether the tight product debt $d^- d^+$ behaves like a finite, integer witness of the quantum/post-quantum transition.

=== Goal

Given a candidate theory $𝕋_A^"PF" = (𝒢_"loc",ξ_A^"PF")$ and an observed sequence of countings $N_(1:k)$, we want to know whether there exists a coherent hidden trajectory
$
  eta_1 arrow.squiggly eta_2 arrow.squiggly dots arrow.squiggly eta_k
$
such that $N_(eta_i) = N_i$ for every $i$ and $d^-_i d^+_i <= A$ for every $i$. If such a trajectory exists, the data fit the tight product constraint at threshold $A$. The score $A_"PF"^*(N_(1:k))$ is the smallest threshold for which this is possible.

=== Method

The current implementation is a prototype for the CHSH isotropic line. It uses the following modelling choices.

+ The generator family is $𝒢_"loc"$, the $16$ local deterministic CHSH generators. Each generator emits one event in each of the four CHSH contexts.
+ An isotropic counting is specified by two integers $(w,l)$: each winning event has count $w$, and each losing event has count $l$.
+ The counting is expanded into a trace $τ = (e_1,dots,e_k)$ of visible events. In the code, the trace is obtained by shuffling the multiset of events with a fixed random seed.
+ The cumulative prefix countings are
  $
    N_i := sum_(j <= i) epsilon_(e_j),
    quad i = 1,dots,k.
  $
+ A hidden state records which generator copies are open, which generator each copy belongs to, and which events of that generator have already been emitted.
+ For each prefix, the algorithm computes $d^-_i$ as the emitted mass carried by open copies and $d^+_i$ as their residual mass.
+ A trajectory is accepted at threshold $A$ if $d^-_i d^+_i <= A$ at every prefix.

The Rust prototype in `chsh_global_peak` implements this pipeline. The dynamic-programming code records the two quantities $d^-$ and $d^+$ and filters configurations by the product threshold. The MILP code is an auxiliary feasibility prototype; it is useful for global trajectory constraints, but the product constraint is the main quantity to implement and test.

=== Algorithm

The experimental algorithm can be written as follows.

+ *Choose a candidate theory.* Fix $𝒢_"loc"$ and the product constraint $ξ_A^"PF"$.
+ *Generate the observation.* Choose an isotropic CHSH counting $N(w,l)$ and expand it into a trace $τ = (e_1,dots,e_k)$.
+ *Build prefixes.* For each time $i$, compute $N_i = sum_(j <= i) epsilon_(e_j)$.
+ *Build the hidden transition system.* Enumerate all open states $(g,R)$ and all event-labelled transitions: start, advance, and close.
+ *Search for a trajectory.* For a fixed threshold $A$, test whether there exists $eta_1,dots,eta_k$ with $N_(eta_i)=N_i$, $eta_i arrow.squiggly eta_(i+1)$, and $d^-_i d^+_i <= A$ for every $i$.
+ *Optimize the threshold.* Perform a binary search on $A$ and record the minimal feasible value $A_"PF"^*$.
+ *Compare with the quantum threshold.* Compare $A_"PF"^*$ with the value calibrated at the finite trison threshold.

=== Preliminary product calibration

On the isotropic line, the first calibration is static. Let $w_Q(n) = floor(n p^*)$ be the finite quantum winning count. Let $A_T(n)$ be the product $d^- d^+$ at the quantum-optimal isotropic point of level $n$. The intended test is:
$
  d^- d^+ <= A_T(n)
$
for quantum-like countings, and violation of this inequality for the first post-quantum countings above the finite trison threshold.

#figure(
  table(
    columns: 6,
    align: center,
    inset: 6pt,
    table.header([$n$], [$w_Q$], [$T(n)$], [$A_T(n)$], [$S_"post"$], [Separation]),
    [5], [4], [2.400], [32], [--], [--],
    [10], [8], [2.400], [128], [3.20], [Yes],
    [17], [14], [2.588], [640], [3.06], [Yes],
    [20], [17], [2.800], [1536], [3.20], [Yes],
    [34], [29], [2.824], [4480], [3.06], [Yes],
    [50], [42], [2.720], [6912], [2.88], [Yes],
    [70], [59], [2.743], [14976], [2.86], [Yes],
    [100], [85], [2.800], [34560], [2.88], [Yes],
  ),
  caption: [Preliminary calibration of the product threshold $A_T(n)$ on the isotropic CHSH line.],
) <tab:product-calibration>

This table is the main preliminary evidence for the product constraint. It suggests that the past/future product is sensitive to the finite quantum threshold. The result is still restricted to the isotropic line and to the chosen generator family, so it should be read as a guide for the next experiments rather than as a theorem.

=== Interpretation and next step

The working hypothesis is now sharper. Quantum-like observations are not characterized by having no debt. They are characterized by having a controlled product of debts: the unexplained past and the residual future can both be non-zero, but their simultaneous tension remains below the calibrated threshold. Post-quantum observations should force the product above this threshold.

The next implementation step is to make the global trajectory search fully centered on $ξ_A^"PF"$. Concretely, the solver should compute $A_"PF"^*(τ) = min_eta max_i d^-_i d^+_i$ for many traces, seeds, levels, and generator families. The comparison with the NPA approximation of $cal(Q)_t$ from @chap:quantum-dynamic-automata will then test whether this product constraint is a plausible candidate for the dynamic part $ξ_q$ of the desired theory $𝕋_q$.
