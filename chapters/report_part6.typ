#import "../template.typ": book, corollary, definition, example, lemma, proof, proposition, remark
#import "../prelude.typ": *

= Towards a dynamic condition to capture quantum non-locality <chap:dynamic-condition-nonlocality>

This chapter begins by recalling the main objective of the report: to find a finite dynamic condition that can characterize quantum phenomena. We then explain how this objective can be approached through the guiding ideas of interruption, discrete reconstruction, and dynamic explanation.

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

== First candidate: the tight contextual product constraint

The _tight contextual product constraint_ is the condition
$
  ξ_A : sqrt(D^- (N) · D^(arrow.loop) (N)) <= A .
$
This quantity is the geometric mean of the past distance $D^-(N)$ and the future distance $D^(arrow.loop)(N)$. The constraint therefore keeps both distances small at the same time. We choose it as a first candidate because it expresses the working hypothesis that quantum countings lie between two successive stabilized steps: they are not fully closed, but their remaining future cost is still controlled by the already observed past. This interpretation is speculative. The role of the meta-theory is precisely to make such hypotheses testable: we can compare different choices of $ξ$ and ask which of them, if any, captures quantum behavior. We can ask also that our observation live exactly between our past and future with $|D^- (N) - D^(+) (N)| <= ε$ for example.

But a theory should be adjusted during the experiment itself. At each step, the observer may decide that the current closed explanation is too rigid, temporarily lower confidence in the extracted past, admit more candidate explanations, and inspect the future cost of these alternative explanations. In this sense, a dynamic theory does not only predict outcomes. It also revises its own explanatory criteria while the experiment is running.
In curve fitting, one usually optimizes a fixed criterion on the data collected so far. Here, we want the criterion itself to move: we ask what happens to the future cost if the past criterion is relaxed by a controlled amount. If relaxing the past suddenly makes many previously rejected explanations viable, and if their future cost remains moderate, then the theory has learned from its own uncertainty. If the future cost explodes, then the current past criterion was already close to the best available explanation.

To formalize this, let $alpha >= 1$ be a parameter that measures how often the observer expects to be wrong. We interpret $alpha$ as the frequency of revision, or equivalently as the rate at which the observer is ready to mistrust the current extraction of the past. The natural relaxed set is then
$
  cal(D)^(arrow.loop)_alpha (N)
  :=
  min { d^+_eta | eta in cal(H)_cal(G)(N) " and " d^-_eta <= D^-(N) + ceil((|N|_1)/alpha) }.
$

The case $alpha = 1$ corresponds to the tight setting: only the explanations whose past deficit realizes the contextual fraction are kept. As $alpha$ increases, the admissible past deficit grows, but only by a controlled amount compared with the total size of the observation. This is a way to make the theory explore alternative explanations without abandoning the static analysis entirely.

#align(center)[
  _In the next part of this internship, we will search for theories $𝕋$ guided by two hypotheses. First, quantum phenomena may appear in an intermediate region of stabilization. Second, the theory should be able to construct and revise itself during the experiment._
]

== Several candidate constraints and their limitations

At this stage of the research, we do not know which constraint $ξ$ is the right one. The role of this section is therefore not to choose a final theory, but to organize the first candidates and to explain what the preliminary experiments suggest.

For a single observation $N$, a direct idea is to control the product between a past distance and a future distance. This gives several possible constraints. The strongest version asks every explanation to satisfy the bound
$d_η^- d_η^+ <= A
quad forall η in cal(H)_𝒢(N)$.
A weaker version only asks that at least one explanation realizes a small product:
$min_(η in cal(H)_𝒢(N)) d_η^- d_η^+ <= A$.
Finally, one can use the global distances extracted from the observation:
$D^-(N) D^(arrow.loop)(N) <= A$.
The relaxed variants replace $D^(arrow.loop) (N)$ by $D^(arrow.loop)_α (N)$. The parameter $α$ controls how much the observer is allowed to mistrust the tight past extraction. The dual variants exchange the roles of past and future.

The preliminary computations suggest that the simple product is not sufficient. In the tested examples, it evolves in a way that is close to fractional contextuality. This means that the product detects non-classicality, but it does not isolate the quantum region.

For a sequence of observations $N_(1:k)$, the same idea can be lifted to the dynamic setting. Instead of testing one counting, we test the worst step of the trajectory. A typical dynamic constraint has the form
$max_i D^-(N_i) D^(arrow.loop)_α (N_i) <= A$.
This condition says that the trajectory is accepted only if no observed step accumulates too much past/future tension. More refined versions can optimize over the whole sequence of explanations $(η_1,dots,η_k)$, but the principle is the same: the dynamic theory should control the evolution of the explanatory debt along the experiment.

== Interruption profiles: a dynamic distance enrichment

The previous constraints still have a limitation. They compress a dynamic explanation $η$ into one or two numbers, such as $d_η^-$ and $d_η^+$. This is useful, but it is also dangerous: if we represent $η$ only as a point between its closed past $P_η$ and its completed future $F_η$, then we lose the main information carried by the dynamic formalism. We return to a scalar quantity close to the contextual fraction, and we no longer use the fact that an explanation is interruptible.

The dynamic point of view suggests a finer object. An interrupted state is not only located between $P_η$ and $F_η$. It also tells us which coordinates have already advanced and which coordinates remain delayed. Thus the line from $P_η$ to $F_η$ should be used only as a reference trajectory, not as a replacement for the state itself.

Let $η$ be a dynamic explanation, with closed part $P_η$, visible part $N_η$, and completed part $F_η$. For every coordinate $v in V$, define
$
  a_η (v) := N_η (v) - P_η (v),
  quad
  b_η (v) := F_η (v) - N_η (v),
  quad
  h_η (v) := a_η (v) + b_η (v) = F_η (v) - P_η (v).
$
Here $a_η (v)$ is the amount already emitted after the closed past, $b_η (v)$ is the amount still missing before closure, and $h_η (v)$ is the total height of the interruption at coordinate $v$. Since $P_η <= N_η <= F_η$ these numbers are non-negative integers. The scalar distances are recovered by summing them:
$
  d_η^- = sum_(v in V) a_η (v),
  quad
  d_η^+ = sum_(v in V) b_η (v).
$
Thus $d_η^-$ and $d_η^+$ forget how the emitted and residual masses are distributed among the coordinates.

The _active coordinates_ are those for which something really happens between past and future:
$V_η^"act" := {v in V | h_η (v) > 0}$.
Instead of introducing rational local times, we keep the construction integer. If $V_η^"act"$ is non-empty, set
$bold(Δ_η) := "lcm" { h_η (v) | v in V_η^"act" }$.
Then each $h_η (v)$ divides $Δ_η$. We define the _local resolution factor_
$q_η (v) := Δ_η \/ h_η (v)$
and the _discrete interruption time_
$k_η (v) := a_η (v) q_η (v)$.
The number $k_η (v)$ is an integer between $0$ and $Δ_η$. It is the position of the coordinate $v$ on the common grid of resolution $1 \/ Δ_η$. If $k_η (v)=0$, the coordinate has not yet advanced beyond the closed past. If $k_η (v)=Δ_η$, it is already closed. Intermediate values describe partial advancement.

#definition(name: "Interruption profile", id: "def:interruption-profile")[
  Let $η ∈ ℋ_𝒢 (N)$ be a dynamic explanation. If $V_η^"act"$ is non-empty, let $Δ_η$, $q_η$, and $k_η$ be defined as above. The *interruption profile* of $η$ is the map
  $
    k_η : cases(V_η^"act" &→ {0,dots,Δ_η}, quad v &↦ k_η (v))
  $
  If $V_η^"act"$ is empty, the state is already closed and the profile is empty.
]

A small two-coordinate calculation is given in @ex:interruption-profile-two-coordinates.

The interruption profile $k_η$ is the raw per-coordinate information. It tells us, for each active coordinate, at which discrete time the interruption has occurred. Crucially, it does not compress this information into a scalar. Two explanations $η$ and $η'$ can have the same values of $d_η^-$ and $d_η^+$ while having very different profiles $k_η$ and $k_η'$. The profile is therefore a genuinely dynamic object: it records #emph[how] the interruption has occurred, not only #emph[how much] has been emitted and how much remains.

The profile $k_η$ also carries geometric information: two coordinates $v$ and $v'$ can be constrained independently by the theory. For example, a constraint can require that two coupled CHSH coordinates have the same interruption time, or that one coordinate is always emitted before another. Such local synchronization conditions cannot be expressed by a single scalar.

// === Discrete moments of the profile

// When a single integer summary is needed, one can extract integer moments from the profile without normalizing or dividing. Define the following quantities:
// $
//   H_η := sum_(v in V_η^"act") h_η (v),
//   quad
//   S_η := sum_(v in V_η^"act") h_η (v) k_η (v),
//   quad
//   R_η := sum_(v in V_η^"act") h_η (v) k_η (v)^2.
// $
// $
//   K_η := sum_(v in V_η^"act") k_η (v),
//   quad
//   Q_η := sum_(v in V_η^"act") k_η (v)^2.
// $

// These are all non-negative integers. Their meanings are:

// - $H_η$ is the total height of the interruption, equal to $d_η^- + d_η^+$;
// - $S_η$ is the #emph[weighted temporal mass]: it sums, for each active coordinate, the product of the interruption height $h_η (v)$ and the discrete time $k_η (v)$. A coordinate with large $h_η$ and large $k_η$ contributes more than a coordinate with small values;
// - $R_η$ is the #emph[weighted second moment]: it sums $h_η (v) k_η (v)^2$. Together with $H_η$ and $S_η$, it controls the weighted dispersion;
// - $K_η$ is the #emph[raw temporal sum], which ignores the weights $h_η (v)$;
// - $Q_η$ is the #emph[raw second moment], which measures how spread out the interruption times are without weighting.

=== Constraints on the interruption profile

The profile $k_η$ can be used directly in the admissibility constraint $ξ$. Several types of constraints are possible.

*Full synchronization.* All active coordinates have the same interruption time:
$
  k_η (v) = k_η (v') quad forall v,v' in V_η^"act".
$
In that case, $N_η$ is genuinely on the straight line from $P_η$ to $F_η$: on the active coordinates, $N_η = A_η (k_0 \/ Δ_η)$ for a common $k_0$.

*Local ordering.* Some pairs of coordinates must be emitted in a fixed order:
$
  k_η (v) <= k_η (v') quad forall (v,v') in E,
$
where $E subset.eq V_η^"act" times V_η^"act"$ is a set of ordered pairs. This captures the idea that certain events must occur before others.

*Maximal spread.* The interruption times are bounded:
$
  max_(v in V_η^"act") k_η (v) - min_(v in V_η^"act") k_η (v) <= B,
$
for a given integer $B$. This prevents the interruption from being too chaotic.

// *Moment bounds.* One can bound the integer moments directly:
// $
//   S_η <= S_max,
//   quad
//   Q_η <= Q_max,
//   quad
//   H_η R_η - S_η^2 <= M,
// $
// for given integer thresholds. The last expression is the #emph[weighted dispersion residual]: by the Cauchy--Schwarz inequality, $H_η R_η - S_η^2 >= 0$ always holds. It equals zero if and only if all $k_η (v)$ with $h_η (v) > 0$ are equal, and it grows when the interruption times become more heterogeneous.

=== Why the profile is not just fractional contextuality

In the sheaf-theoretic framework, the contextual fraction compresses the whole empirical model into a single number between $0$ and $1$. The scalar distances $d_η^-$ and $d_η^+$ do the same for the dynamic state: they record the total emitted and residual mass, but forget where these masses are located and in what order they were emitted.

The interruption profile $k_η$ breaks this compression. It remembers, for each coordinate, its temporal position in the process. The constraints above can therefore express synchronization conditions, emission orderings, and dispersion bounds that are invisible to any scalar measure. The profile is still an abstraction: it does not remember which open copy of which generator produced each coordinate. But it keeps the coordinate-wise temporal structure that the product $d_η^- d_η^+$ erases. This is the extra information that makes the theory genuinely dynamic.

== Ideal experimental signature

The ideal experiment should not test only one observation. It should test a whole finite family of observations. Fix a level $t$, and let ${N_x^(t)}_x$ be a parametrized family of integer countings. For example, on the isotropic CHSH line one may consider a probability model of the form $P_v = v P_"PR" + (1 - v) P_"white"$, and then choose integer countings $N_v^(t)$ whose normalization approximates $P_v$. Here, $v$ is the visibility parameter, $P_"PR"$ is a PR-type box, and $P_"white"$ is the uniform noise distribution.

For each value of $x$, or of $v$ in the isotropic case, we compute a score associated with the constraint $ξ$. The desired behaviour is not only monotone growth with contextuality. A good candidate for $ξ_q$ should show a specific signature near the quantum boundary.
In the ideal case, this signature would be localized around the quantum value. For instance, along the isotropic CHSH line, one would like to observe a curve shaped like a peak or a Gaussian bump centered near the quantum visibility $v_Q$. This would mean that the constraint is sensitive to the transition between classical, quantum, and post-quantum behaviours, rather than merely measuring how far the point is from the local polytope.

The algorithmic problem is therefore the following. Given a generator set $cal(G)$, a counting $N$, and possibly a constraint $ξ$, we want to describe the admissible explanations
$
  η in cal(H)_(cal(G),ξ)(N) .
$
Once these explanations are available, we can compute $d_η^-$, $d_η^+$, the profile $k_η$, and the discrete moments for each of them, and then evaluate the candidate metric. The role of the constraint-programming formulation below is exactly to make this computation explicit.

== Algorithmic implementation

We now explain how to compute the explanations used by the previous metrics. Indeed, the distances $d_η^-$ and $d_η^+$, as well as the interruption profile $k_η$ and its moments, are defined from an explanation $η$. Before one can evaluate a score such as $d_η^- d_η^+$, or optimize over all explanations, one must first construct the possible explanations of the observation.

We encode this search problem by Constraint Programming (CP). A solution of the CP instance is an explanation $η$: it tells which generators are used, which residual parts remain open, and how these residual parts are transported from one observation to the next.

In practice, we use CP-SAT, which integrates an integer solver and supports both feasibility checking and solution enumeration.
If this constraint program has a solution $m^i$, then $m^i$ defines the multiplicity function of the dynamic state $η_i in cal(H)_(𝒢,ξ)(N_i)$.
$
  italic("Variables : ") & bold(m_(g,R)^i) ∈ ℕ quad g ∈ 𝒢 , 0 <= R <= g , i ∈ [k] \
  & bold(f_(R -> S)^(g,i)) ∈ ℕ quad g ∈ 𝒢 , 0 <= S <= R <= g , i ∈ [k] \
  \
  italic("Constraints : ") & ∑_(g ∈ 𝒢) ∑_(0 <= R <= g) (g minus R) · m_(g,R)^i = N_i quad & ∀i ∈ [k] \
  & sum_(S : S <= R) f_(R -> S)^(g,i) = m_(g,R)^i & g ∈ 𝒢 , 0 <= R <= g , i ∈ [k]\
  & sum_(S : S >= R) f_(R -> S)^(g,i) <= m_(g,R)^(i+1) & g ∈ 𝒢 , 0 <= R <= g , i ∈ [k-1] \
  & ξ
$

The variable $m_(g,R)^i$ counts how many copies of the generator $g$ are used at step $i$ with residual part $R$. The visible contribution of such a copy is $g minus R$. The first constraint therefore says that the sum of all visible contributions must reconstruct the observation $N_i$. The variable $f_(R -> S)^(g,i)$ describes how many copies of $g$ move from residual state $R$ at step $i$ to residual state $S$ at the next step. The second constraint conserves the number of copies leaving a residual state. The third constraint ensures that the flow entering a residual state at step $i+1$ does not exceed the number of copies available there. The final line adds the chosen admissibility constraint $ξ$.

The choice of CP is also justified by the nature of the constraints collected in $ξ$. These include product constraints of the form $D^-(N) · D^+(N)$. Such bilinear constraints are naturally expressed in a CP framework, whereas a pure integer linear solver would require additional reformulation.

#remark[
  This problem is equivalent to a *multi-commodity flow* problem. The commodities are the $k$ counting vectors $N_1 , … , N_k$ to be decomposed. Each commodity $i$ must be transported through the network of generators: the source is the target vector $N_i$, and the admissible paths are sequences of generators $g ∈ 𝒢$ selected with residual $R$ at each step. The variables $m_(g,R)^i$ record how many units of commodity $i$ are routed through the node $(g,R)$, while the flow variables $f_(R -> S)^(g,i)$ track how residual capacity evolves from $R$ to $S$ between consecutive levels. The conservation constraints ensure that the total inflow into each node matches the outflow, and the coupling constraint $sum_(S : S >= R) f_(R -> S)^(g,i) ≤ m_(g,R)^(i+1)$ prevents a commodity from consuming more residual capacity than is available at the next level.
]
