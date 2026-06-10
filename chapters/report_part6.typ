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

$
  ξ : quad & max_i d_(eta_i)^- d_(eta_i)^+ <= A quad ∀ (eta_1,dots,η_k) ∈ ℋ_𝒢 (N_(1:k)) quad & bold((A_"dyn")) \
           & min_((eta_1,dots,η_k) ∈ ℋ_𝒢 (N_(1:k))) max_i d_(eta_i)^- d_(eta_i)^+ <= A       & bold((B_"dyn")) \
           & max_i D^-(N_i) D^+(N_i) <= A                                                    & bold((D_"dyn")) \
           & max_i D^-(N_i) D^(arrow.loop)_α (N_i) <= A                                      & bold((E_"dyn")) \
           & dots
$

The next step of this internship is to test these different constraints, each following a distinct intuition, in order to determine which of them can capture quantum phenomena.

== Algorithmic implementation

We use Constraint Programming (CP) to encode and test the various constraints of our model. The primary objective is to decide feasibility, do we have $ℋ_(𝒢,ξ) (N_(1:k)) != emptyset$? A secondary objective, useful for debugging and exploration, is to enumerate all feasible solutions and CP is well suited to this task.

We model our problem as a CP instance over integer variables. In practice, we use CP-SAT, which integrates an integer solver and supports both feasibility checking and solution enumeration.

$
  italic("Variables : ") & bold(m_(g,R)^i) ∈ ℕ quad g ∈ 𝒢 , 0 <= R <= g , i ∈ [k] \
  & bold(f_(R -> S)^(g,i)) ∈ ℕ quad g ∈ 𝒢 , 0 <= S <= R <= g , i ∈ [k] \
  \
  italic("Constraints : ") & ∑_(g ∈ 𝒢) ∑_(0 <= R <= g) (g minus R) · m_(g,R)^i = N_i quad & ∀i ∈ [k] \
  & sum_(S : S <= R) f_(R -> S)^(g,i) = m_(g,R)^i & g ∈ 𝒢 , 0 <= R <= g , i ∈ [k]\
  & sum_(S : S >= R) f_(R -> S)^(g,i) <= m_(g,R)^(i+1) & g ∈ 𝒢 , 0 <= R <= g , i ∈ [k-1] \
  & ξ
$

The choice of CP is further justified by the nature of the constraints collected in $ξ$. These include product constraints of the form $D^-(N) · D^+(N)$, which arise from the interaction between residuals and generators. Such bilinear constraints are naturally expressed in a CP framework, whereas a pure integer linear solver would require additional reformulation.

#remark[
  This problem is equivalent to a *multi-commodity flow* problem. The commodities are the $k$ counting vectors $N_1 , … , N_k$ to be decomposed. Each commodity $i$ must be transported through the network of generators: the source is the target vector $N_i$, and the admissible paths are sequences of generators $g ∈ 𝒢$ selected with residual $R$ at each step. The variables $m_(g,R)^i$ record how many units of commodity $i$ are routed through the node $(g,R)$, while the flow variables $f_(R -> S)^(g,i)$ track how residual capacity evolves from $R$ to $S$ between consecutive levels. The conservation constraints ensure that the total inflow into each node matches the outflow, and the coupling constraint $sum_(S : S >= R) f_(R -> S)^(g,i) ≤ m_(g,R)^(i+1)$ prevents a commodity from consuming more residual capacity than is available at the next level.
]
