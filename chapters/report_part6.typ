#import "../template.typ": book, corollary, definition, example, lemma, proof, proposition, remark
#import "../prelude.typ": *

= Exploring dynamic constraints for quantum non-locality <chap:dynamic-condition-nonlocality>

This chapter explores how the dynamic framework developed in the previous chapters can be used to investigate quantum correlations. We then explain how this objective can be approached through the guiding ideas of interruption, discrete reconstruction, and dynamic explanation. The investigation starts from simple scalar constraints, tests them on concrete examples, and shows how their limitations lead to finer objects like the interruption profile. The results of this section are still a work in progress.

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

This chapter does not claim to have found such a theory. It formulates the target clearly and presents the first explorations toward it.

== Warm-up: open-generator stability

The first constraint we tried was to control the number of open generators. For a dynamic state ${eta_i} ∈ ℋ_𝒢 (N_(1:k))$, let $o_i$ be the number of open copies and let $c_i$ be the number of closed copies of the state $η_i$. The basic stability constraint is
$
  ξ_(λ,B) : quad o_i <= λ c_i + B quad forall i .
$
The parameter $λ$ is a slope and $B$ is a buffer. This is the formal version of the magnet analogy from @rem:magnet-analogy: the constraint does not determine the next event, but it prevents a trajectory from accumulating too many unfinished copies compared with the number of stabilized copies.

This first constraint was useful as a sanity check, because it showed that open-generator debt increases when one moves from local points toward PR-like points. It counts how many generators are open, but it does not measure how much of the observed past is still not closed, nor how much future remains to be emitted. For the quantum problem, the more informative object is therefore not only $o_i$, but the past/future distance discuss in @chap:contextual-fraction.

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
$ξ_A : sqrt(D^- (N) · D^(arrow.loop) (N)) <= A$.
This quantity is the geometric mean of the past distance $D^-(N)$ and the future distance $D^(arrow.loop)(N)$. The constraint therefore keeps both distances small at the same time. We choose it as a first candidate because it expresses the working hypothesis that quantum countings lie between two successive stabilized steps: they are not fully closed, but their remaining future cost is still controlled by the already observed past. This interpretation is speculative. The role of the meta-theory is precisely to make such hypotheses testable: we can compare different choices of $ξ$ and ask which of them, if any, captures quantum behavior. We can ask also that our observation live exactly between our past and future with $|D^- (N) - D^(+) (N)| <= ε$ for example.

Following the guiding idea of @chap:context-motivation (illustrated by the curve fitting example), the model allows for feedback during the experiment. At each step, the observer may decide that the current closed explanation is too rigid, temporarily lower confidence in the extracted past, admit more candidate explanations, and inspect the future cost of these alternative explanations. In this sense, the model does not only predict outcomes. It also revises its own explanatory criteria while the experiment is running.
In curve fitting, one usually optimizes a fixed criterion on the data collected so far. Here, the criterion itself can move: we ask what happens to the future cost if the past criterion is relaxed by a controlled amount. If relaxing the past suddenly makes many previously rejected explanations viable, and if their future cost remains moderate, then the model has learned from its own uncertainty. If the future cost explodes, then the current past criterion was already close to the best available explanation.

To formalize this, let $alpha >= 1$ be a parameter that measures how often the observer expects to be wrong. We interpret $alpha$ as the frequency of revision, or equivalently as the rate at which the observer is ready to mistrust the current extraction of the past. The natural relaxed set is then
$
  bold(cal(D)^(arrow.loop)_alpha (N))
  :=
  min { d^+_eta | eta in cal(H)_cal(G)(N) " and " d^-_eta <= D^-(N) + ceil((|N|_1)/alpha) }.
$

The case $alpha = 1$ corresponds to the tight setting: only the explanations whose past deficit realizes the contextual fraction are kept. As $alpha$ increases, the admissible past deficit grows, but only by a controlled amount compared with the total size of the observation. This is a way to make the theory explore alternative explanations without abandoning the static analysis entirely like we can see in @fig:trajectory-relaxed.

#import "@preview/cetz:0.5.2"
#figure(
  cetz.canvas({
    import cetz.draw: *
    let cblue(it) = text(fill: blue, it)
    let cred(it) = text(fill: red, it)

    content((3, 0), $N$, name: "N")
    polygon((0, -3), 9, name: "past", stroke: (blue))

    set-style(polygon: (radius: 2))
    polygon((6, -3), 12, name: "futur", stroke: red)

    {
      rotate(-45deg)
      circle("past.north-east", radius: (0.2, 0.5), anchor: 0, name: "subpast")
      rotate(45deg)
    }

    circle((6, -3), radius: (0.9, 1.6), name: "subfutur")

    content("past.north", $cblue({P_η}_η)$, anchor: "south")
    content("futur.north", $cred({F_η}_η)$, anchor: "south")

    line("N", "past", name: "line1", mark: (end: ">>"))
    line("past.north-east", "subfutur.north", name: "line2")
    line("subpast.south", "subfutur.south", name: "line3")

    content("subfutur", $D_α^(arrow.loop) (N)$)
  }),
  //placement: top,
  caption: [Same as @fig:trajectory-completion, but with a relaxed past distance. The set of possible completions is larger.],
)<fig:trajectory-relaxed>

== Testing variations of the product constraint

Several variations were tried, and this section reports what they revealed.

For a single observation $N$, a direct idea is to control the product between a past distance and a future distance. This gives several possible constraints. The strongest version asks every explanation to satisfy the bound
$d_η^- d_η^+ <= A
quad forall η in cal(H)_𝒢 (N)$.
A weaker version only asks that at least one explanation realizes a small product:
$min_(η in cal(H)_𝒢 (N)) d_η^- d_η^+ <= A$.
Finally, one can use the global distances extracted from the observation:
$D^-(N) D^(arrow.loop)(N) <= A$.
The relaxed variants replace $D^(arrow.loop) (N)$ by $D^(arrow.loop)_α (N)$. The dual variants exchange the roles of past and future.
For a sequence of observations $N_(1:k)$, the same idea can be lifted to the dynamic setting. Instead of testing one counting, we test the worst step of the trajectory. A typical dynamic constraint has the form
$max_i D^-(N_i) D^(arrow.loop)_α (N_i) <= A$.
This condition says that the trajectory is accepted only if no observed step accumulates too much past/future tension. More refined versions can optimize over the whole sequence of explanations $(η_1,dots,η_k)$, but the principle is the same: the dynamic constraint controls the evolution of the explanatory debt along the experiment.

Preliminary computations suggest that all these constraints are equivalent and behave like fractional contextuality: they detect non-classicality, but do not isolate the quantum region. This motivates the search for finer objects, such as the interruption profile, that can capture more structure than a single scalar distance.

== Interruption profiles: from scalar distances to trajectory

The scalar constraints tested above compress a dynamic explanation $η$ into one or two numbers, such as $d_η^-$ and $d_η^+$. This is useful, but it also loses information: if we represent $η$ only as a point between its closed past $P_η$ and its completed future $F_η$, then we forget how the interruption is distributed across coordinates. The exploration of scalar constraints showed that they detect non-classicality, but do not isolate the quantum region. This observation suggested looking for a finer object.

The dynamic point of view suggests a finer object. An interrupted state is not only located between $P_η$ and $F_η$. It also tells us which coordinates have already advanced and which coordinates remain delayed. Thus the line from $P_η$ to $F_η$ serves only as a reference trajectory, not as a replacement for the state itself.

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

A first way to visualize this information is to count how many coordinates have the same interruption time. We define the histogram
$"Hist"_η (k) := \#{v ∈ V_η^"act" | k_η (v) = k}$.
It gives a coarse picture of the profile: instead of remembering which coordinate has which time, it records how the active coordinates are distributed along the internal trajectory from the closed past $P_η$ to the completed future $F_η$.


#import "@preview/lilaq:0.6.0" as lq
#figure(
  grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,

    lq.diagram(
      width: 3.5cm,
      xaxis: (subticks: none),
      xlabel: $k_η$,
      lq.bar(
        (0, 1, 2, 3, 4, 5, 6),
        (2, 2, 2, 2, 2, 2, 2),
      ),
    ),

    lq.diagram(
      width: 3.5cm,
      xaxis: (subticks: none),
      xlabel: $k_η$,
      lq.bar(
        (0, 1, 2, 3, 4, 5, 6),
        (0, 0, 0, 14, 0, 0, 0),
      ),
    ),

    lq.diagram(
      width: 3.5cm,
      xaxis: (subticks: none),
      xlabel: $k_η$,
      lq.bar(
        (0, 1, 2, 3, 4, 5, 6),
        (0, 0, 0, 1, 1, 4, 6),
      ),
    ),
  ),
  caption: [
    Three examples of interruption histograms $"Hist"_η (k) = \#{v in V_η^"act" | k_η (v)=k}$ for an observation vector of dimension $dim(N)=14$, assuming all coordinates are active. Left: the interruption times are uniformly distributed between the closed past $P_η$ and the completed future $F_η$. Middle: all coordinates have the same interruption time, so the process is synchronized at one intermediate position. Right: most coordinates have large values of $k_η$, so the observation is closer to $F_η$ than to $P_η$.
  ],
)<fig:histo>

#v(1em)

The histogram suggests an analogy with the way a statistical profile appears in quantum mechanics. In a quantum experiment, one detection is point-like. Only after many repeated detections does a spatial distribution appear, usually described by $|ψ(x,t)|^2$. Here, each active coordinate gives one discrete interruption time $k_η (v)$, and the histogram reveals the global distribution of these times.

The analogy is only partial. The histogram $"Hist"_η (k)$ is not a wave function: it has no phase, no complex amplitude, and no interference structure. It is closer to a discrete density of interruption times. The difference is also important: in ordinary wave mechanics, the horizontal axis is physical space, while here the horizontal axis is the internal time between $P_η$ and $F_η$. In this sense, $"Hist"_η$ gives a density-like view of the interruption, but in the temporal direction of the dynamic explanation rather than in physical space.

The full profile $k_η$ still contains more information than the histogram. The histogram only counts how many coordinates occur at each interruption time, whereas the profile remembers #emph[which] coordinate has #emph[which] time. This coordinate-wise information can be used to impose constraints with a physical interpretation. For example, one may require two coupled CHSH coordinates to be synchronized, require one coordinate to be emitted before another, or bound the delay between two coordinates by a condition such as $|k_η (v)-k_η (v')| <= B$. More generally, a causal relation $v -> v'$ could be represented by an ordering constraint $k_η (v) <= k_η (v')$.

These constraints do not only measure how much mass has been emitted or remains to be completed. They constrain the internal organization of the process. This is why they cannot be expressed by a single scalar such as $d_η^-$, $d_η^+$, or their product. At this exploratory stage, the interruption profile therefore appears as a more expressive object: it provides a place where synchronization, ordering, bounded delay, and causal-type constraints can be tested directly.

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

// === Constraints on the interruption profile

// The profile $k_η$ can be used directly in the admissibility constraint $ξ$. Here are some examples of what it can express.

// *Full synchronization.* All active coordinates have the same interruption time:
// $
//   k_η (v) = k_η (v') quad forall v,v' in V_η^"act".
// $
// In that case, $N_η$ is genuinely on the straight line from $P_η$ to $F_η$: on the active coordinates, $N_η = A_η (k_0 \/ Δ_η)$ for a common $k_0$.

// *Local ordering.* Some pairs of coordinates must be emitted in a fixed order:
// $
//   k_η (v) <= k_η (v') quad forall (v,v') in E,
// $
// where $E subset.eq V_η^"act" times V_η^"act"$ is a set of ordered pairs. This captures the idea that certain events must occur before others.

// *Maximal spread.* The interruption times are bounded:
// $
//   max_(v in V_η^"act") k_η (v) - min_(v in V_η^"act") k_η (v) <= B,
// $
// for a given integer $B$. This prevents the interruption from being too chaotic.

// *Moment bounds.* One can bound the integer moments directly:
// $
//   S_η <= S_max,
//   quad
//   Q_η <= Q_max,
//   quad
//   H_η R_η - S_η^2 <= M,
// $
// for given integer thresholds. The last expression is the #emph[weighted dispersion residual]: by the Cauchy--Schwarz inequality, $H_η R_η - S_η^2 >= 0$ always holds. It equals zero if and only if all $k_η (v)$ with $h_η (v) > 0$ are equal, and it grows when the interruption times become more heterogeneous.

// === The profile captures more than fractional contextuality

// In the sheaf-theoretic framework, the contextual fraction compresses the whole empirical model into a single number between $0$ and $1$. The scalar distances $d_η^-$ and $d_η^+$ do the same for the dynamic state: they record the total emitted and residual mass, but forget where these masses are located and in what order they were emitted.

// The interruption profile $k_η$ breaks this compression. It remembers, for each coordinate, its temporal position in the process. The constraints above can therefore express synchronization conditions, emission orderings, and dispersion bounds that are invisible to any scalar measure. The profile is still an abstraction: it does not remember which open copy of which generator produced each coordinate. But it keeps the coordinate-wise temporal structure that the product $d_η^- d_η^+$ erases. This is the extra information that makes the theory genuinely dynamic.

== Experimental observations

The constraints were tested on a family of observations parametrized by a visibility parameter. Fix a level $t$, and let ${N_v^(t)}_v$ be a family of integer countings whose normalization approximates a probability model of the form $P_v = v P_"PR" + (1 - v) P_"white"$. Here, $v$ is the visibility parameter, $P_"PR"$ is a PR-type box, and $P_"white"$ is the uniform noise distribution.

For each value of $v$, we computed a score associated with the constraint $ξ$. The simple product constraint did not show a specific signature near the quantum boundary. Its behaviour was close to fractional contextuality: it detected non-classicality, but did not isolate the quantum region. This observation motivated the search for finer objects, such as the interruption profile.

To compute these scores, we needed to describe the admissible explanations
$
  η in cal(H)_(cal(G),ξ)(N) .
$
Once these explanations are available, we can compute $d_η^-$, $d_η^+$, the profile $k_η$, and the discrete moments for each of them, and then evaluate the candidate metric. The constraint-programming formulation below makes this computation explicit.

== Algorithmic implementation

To compute the explanations used by the previous metrics, we encoded the search problem as a Constraint Programming (CP) instance. A solution of the CP instance is an explanation $η$: it tells which generators are used, which residual parts remain open, and how these residual parts are transported from one observation to the next.

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
  This formulation can be seen as a *multi-commodity flow* problem. The commodities are the $k$ counting vectors $N_1 , … , N_k$ to be decomposed. Each commodity $i$ must be transported through the network of generators: the source is the target vector $N_i$, and the admissible paths are sequences of generators $g ∈ 𝒢$ selected with residual $R$ at each step. The variables $m_(g,R)^i$ record how many units of commodity $i$ are routed through the node $(g,R)$, while the flow variables $f_(R -> S)^(g,i)$ track how residual capacity evolves from $R$ to $S$ between consecutive levels. The conservation constraints ensure that the total inflow into each node matches the outflow, and the coupling constraint $sum_(S : S >= R) f_(R -> S)^(g,i) ≤ m_(g,R)^(i+1)$ prevents a commodity from consuming more residual capacity than is available at the next level.
]
