#import "../template.typ": book, corollary, definition, lemma, proof, proposition, remark
#import "../prelude.typ": *


= Quantum viewed by dynamic contextual automata <chap:quantum-dynamic-automata>

#v(4em)

The previous sections established the static and dynamic tools and how we define a theory $𝕋 = (𝒢,ξ)$. We now use these tools to analyse quantum experimental data. The central question is: can the dynamic framework distinguish quantum-like observations from classical and post-quantum ones, and can it do so at each finite level $t$ without invoking the idealized Tsirelson bound ?

== The trison bound at level $t$

We have seen that a discrete empirical model of level $t$ is a compatible integer counting $N in NN^V$ with $A_cal(M) N = t 𝟙$ and $delta N = 0$.

In the CHSH scenario, the _integer correlator_ for context $(x,y)$ is
$E(x,y) := N(0,0|x,y) + N(1,1|x,y) - N(0,1|x,y) - N(1,0|x,y)$.
The _CHSH score_ of a counting $N$ is
$ S(N) := E(0,0) + E(0,1) + E(1,0) - E(1,1). $
Each correlator $E(x,y)$ is an integer bounded by $t$, so $S(N)$ is an integer bounded by $4t$. The normalized score $S(N)/t$ recovers the usual probabilistic CHSH expression.

A counting $N$ lies on the _isotropic line_ if all four contexts share the same winning count: there exists $w in NN$ such that $N(0,0|x,y) + N(1,1|x,y) = w$ for $(x,y) in {(0,0),(0,1),(1,0)}$, and $N(0,1|1,1) + N(1,0|1,1) = w$. Equivalently, the correlators satisfy $E(0,0) = E(0,1) = E(1,0) = -E(1,1) =: c$. The CHSH score is then $S(N)/t = 4c/t$. At the quantum optimum, $w = floor(t p^*)$ with $p^* = (2+sqrt(2))/4$, giving

$
  T_"iso" (t) := (4(2 floor(t p^*) - t)) / t.
$

Let $Q$ denote the _quantum set_: the set of correlations achievable by some finite-dimensional quantum strategy. The preimage $t dot Q$ scaled to level $t$ is the set of countings $N$ whose normalization $N/t$ lies in $Q$.

#definition(name: [Trison bound at level $t$], id: "def:trison-bound")[
  Let $cal(S)_t$ denote the set of compatible integer countings at level $t$ (those satisfying $A_cal(M) N = t 𝟙$ and $delta N = 0$). The *quantum-realizable* countings at level $t$ are
  $cal(Q)_t := cal(S)_t inter t dot Q$.
  That is, $cal(Q)_t$ consists of the integer countings at level $t$ whose normalization $N/t$ lies in the quantum set $Q$. The *trison bound* at level $t$ is
  $
    T(t) := max_(N in cal(Q)_t) S(N)/t.
  $
  Since $cal(Q)_t$ is a finite set, the maximum is attained and $T(t)$ is a rational number.
]

The trison bound $T(t)$ is the best normalized CHSH score achievable by any quantum strategy using exactly $t$ repetitions of the experiment. It is a discrete, rational, finite-time quantity.

== The Tsirelson bound is an asymptotic idealization

The celebrated Tsirelson bound states that quantum mechanics cannot produce a CHSH score exceeding $2 sqrt(2)$. In the standard probabilistic framework, this bound is derived from the algebraic structure of Hilbert-space observables. However, from the discrete perspective, the situation is fundamentally different.
All the calculation of this part can be found in @part:details-calculations-1 .

#proposition(name: [$sqrt(2)$ requires infinite experiments], id: "thm:sqrt2-infinite")[
  For every finite level $t in NN$, the trison bound satisfies $T(t) < 2 sqrt(2)$. The Tsirelson bound is recovered only in the limit:
  $
    lim_(t -> oo) T(t) = 2 sqrt(2).
  $
]

#proof[
  The proof proceeds in two steps.

  + *Rationality.* For any $N in cal(Q)_t$, each correlator $E(x,y)$ is an integer and $S(N)$ is an integer. Hence $S(N)/t in QQ$. If $2 sqrt(2) = p/q$ for some integers $p,q$, then $sqrt(2) = p/(2q)$ would be rational, which is a contradiction. Therefore $S(N)/t != 2 sqrt(2)$ for any finite $t$.
  + *Convergence.* On the isotropic line, one can construct explicit quantum strategies that approach $2 sqrt(2)$ as $t$ grows. The optimal winning probability at level $t$ is $w^*(t) = floor(t p^*)$ where $p^* = (2+sqrt(2))/4$. The resulting score is $T_"iso"(t) = (4(2 w^*(t) - t)) / t$, and the gap satisfies
    $2 sqrt(2) - T_"iso" (t) = (8 dot "frac"(t p^*)) / t$,
    which tends to $0$ as $t -> oo$. Since $T(t) >= T_"iso" (t)$, the result follows.
]

This theorem has a striking interpretation: the $sqrt(2)$ of Tsirelson is not a parameter of the discrete model. It is an emergent, asymptotic, purely abstract quantity. No finite experiment can ever reach it. The irrationality of $sqrt(2)$ creates an arithmetic obstruction: at every finite level $t$, the quantum score is rational, and the gap to $2 sqrt(2)$ is controlled by the Diophantine properties of $sqrt(2)$ through its continued fraction expansion $sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(dots)))$.

#remark(id: "rem:factor-two")[
  The gap formula admits a natural decomposition:
  $
    2 sqrt(2) - T_"iso"(t)
    =
    underbrace((sqrt(2) - r_t), "past deficit")
    +
    underbrace((sqrt(2) - r_t), "future deficit")
    =
    2 (sqrt(2) - r_t),
  $
  where $r_t := (4 floor(t p^*) - 2t) / t$ is the rational approximation to $sqrt(2)$ at level $t$.
  This decomposition reflects the structure of the CHSH game. The score splits into two complementary pairs of contexts:
  $
    S(N) = underbrace((E(0,0) + E(1,0)), "pair 1") + underbrace((E(0,1) - E(1,1)), "pair 2").
  $
  Each pair ideally contributes $t sqrt(2)$, but at level $t$ each contributes only $t r_t$. The per-pair deficit is $t(sqrt(2) - r_t)$, and the total deficit is twice this value.
  In the dynamic framework, this factor of 2 has a natural interpretation. Each generator decomposes as $g = (g - R) + R$ into past and future. The CHSH score at interruption depends on both halves. On the isotropic line, both halves contribute equally to the deficit, so the total gap is the sum of two equal terms. #lou[Vraiment pas sur de cette interprétation]
]

== Approximation via the NPA hierarchy

Computing $T(t)$ exactly is a hard combinatorial problem. The NPA hierarchy @Navascues_Pironio_Acin_2008 provides a systematic way to approximate the quantum set from the outside via semidefinite programming.

=== The idea

A quantum behavior is a collection of probabilities $p(a,b|x,y)$ that can be realized by measurements on a quantum state. That is, there exist a Hilbert space $cal(H)$, a state $|psi chevron.r in cal(H)$, and measurement operators $A_x^a, B_y^b$ such that
$
  p(a,b|x,y) = chevron.l psi|A_x^a B_y^b|psi chevron.r.
$
The problem is that verifying directly whether a given $p$ is quantum is very hard: one would need to find the Hilbert space, the state, and the operators satisfying all the rules of quantum mechanics.

NPA circumvents this problem by constructing a _moment matrix_ $Gamma$. One chooses a finite set of operators
$B_k = {O_0 = I, O_1, dots, O_(n_k - 1)}$
containing all products of measurement operators up to degree $k$, and defines
$Gamma_(i,j) := chevron.l psi | O_i^dagger O_j | psi chevron.r$.
Each entry of $Gamma$ represents a correlation between operators. Some entries correspond directly to the observed probabilities. For instance,
$
  Gamma_(A_x^a, B_y^b) = chevron.l psi|A_x^a B_y^b|psi chevron.r = p(a,b|x,y).
$
Thus, if one can construct a coherent matrix $Gamma$ containing the probabilities $p(a,b|x,y)$, then these probabilities are compatible with a quantum realization.

=== The constraints

The idea of NPA is therefore: instead of searching explicitly for the quantum state and operators, one searches only for a matrix $Gamma$ compatible with the quantum rules. This matrix must satisfy:

- *Positive semidefiniteness:* $Gamma succ.eq 0$. This is the core constraint: it forces the expectation values to be consistent with a genuine Hilbert space.
- *Normalization:* $Gamma_(0,0) = 1$.
- *Algebraic relations:* the entries must respect the operator algebra. These relations become linear constraints on the entries of $Gamma$. They come from four sources:
  - Idempotence. Each measurement operator is a projector: $(A_x^a)^2 = A_x^a$. This implies $Gamma_(A_x^a, A_x^a) = Gamma_(I, A_x^a)$.
  - Orthogonality. Outcomes of the same measurement are exclusive: $A_x^a A_x^(a') = 0$ for $a != a'$. This forces certain entries to be zero.
  - Completeness. The outcomes of each measurement sum to identity: $sum_a A_x^a = I$. This gives normalization relations.
  - Commutativity. Alice's and Bob's operators commute: $[A_x^a, B_y^b] = 0$. This imposes symmetries: $Gamma_(A_x^a, B_y^b) = Gamma_(B_y^b, A_x^a)$.

=== The SDP

The problem becomes a semidefinite program:
$
  max quad S(Gamma) quad "subject to" quad Gamma succ.eq 0, quad "algebraic constraints on" Gamma,
$
where $S(Gamma) = sum_(x,y) (-1)^(x and y) Gamma_(A_x, B_y)$ is the CHSH value.
The _$k$-th NPA relaxation_ $cal(Q)_k$ is the set of all correlation vectors $p = (p(a,b|x,y))$ for which there exists a matrix $Gamma$ satisfying the constraints above with $Gamma_(A_x^a, B_y^b) = p(a,b|x,y)$. The _NPA bound at level $k$_ is
$omega_k := max_(p in cal(Q)_k) S(p)$.
This is a semidefinite program. Its value satisfies $omega_k >= 2 sqrt(2)$ for every $k$, and $omega_k$ decreases to $2 sqrt(2)$ as $k -> oo$.

The psd condition $Gamma succ.eq 0$ is what makes $cal(Q)_k$ a quantum set: it forces the expectation values to be consistent with a genuine Hilbert space, a state, and bounded operators. Without it, one could choose arbitrary correlators; with it, only quantum-realizable correlations survive.

More precisely, if $Gamma succ.eq 0$, one can construct a Hilbert space, a state, and operators that realize $Gamma$ as a Gram matrix. This is the GNS (Gelfand--Naimark--Segal) construction: the psd condition is exactly the condition that the moment matrix comes from a genuine quantum system.

=== From SDP to linear inequalities

By solving the dual SDP for several objective functions, one obtains a finite system of $M$ linear inequalities that outer-approximates $cal(Q)_k$. The detailed derivation of this passage is given in @Navascues_Pironio_Acin_2008.

=== The MILP for $T_k (t)$

To compute $T_k (t)$ over integer countings, one replaces $p(a,b|x,y)$ by $N(a,b|x,y)/t$ and optimizes:

$
  T_k (t) = max quad & 1/t sum_(a,b,x,y) (-1)^(a xor b xor (x and y)) N(a,b,x,y) \
   "subject to" quad & A_cal(M) N = t 𝟙 quad "(normalization)", \
                     & delta N = 0 quad "(no-signaling)", \
                     & sum_(a,b,x,y) alpha_(a,b,x,y)^((m)) N(a,b,x,y) <= t beta_m quad forall m quad "(NPA cuts)", \
                     & N(a,b,x,y) in NN quad forall a,b,x,y.
$

This MILP is solvable by standard solvers (Gurobi, SCIP, CPLEX). The NPA cuts prune the integer search space: they eliminate countings whose normalization lies outside $cal(Q)_k$, without requiring the solver to handle semidefinite constraints.

=== Sandwich

#proposition(name: [NPA sandwich], id: "prop:npa-sandwich")[
  For every finite $t$ and every NPA level $k$:
  $
    T_"iso" (t) quad <= quad T(t) quad <= quad 2 sqrt(2) quad <= quad T_k (t).
  $
]

#proof[
  + *$T_"iso"(t) <= T(t)$.* The isotropic strategy is a particular quantum strategy.

  + *$T(t) <= 2 sqrt(2)$.* The Tsirelson bound holds for all quantum correlations.

  + *$2 sqrt(2) <= T_k(t)$.* Since $cal(Q) subset.eq cal(Q)_k$, the Tsirelson-optimal correlation lies in $cal(Q)_k$. At level $t$, one can approximate it by an integer counting, so the maximum over $cal(Q)_k$ is at least $2 sqrt(2)$.
]

The both direct and NPA approch squeeze the trison bound: $T(t) <= T_k (t)$, and both converge to $2 sqrt(2)$ as $t$ and $k$ grow.

=== The see-saw method for lower bounds

The NPA hierarchy approximates the quantum set $cal(Q)$ from the outside. It therefore gives upper bounds on $T(t)$. Lower bounds require explicit quantum strategies whose normalized countings have high CHSH scores at level $t$. Since such strategies are hard to find by direct enumeration, one can use the #emph[see-saw method], also called alternating optimization @Abbott_Mhalla_Pocreau_2024.

The idea is to relax the optimization over quantum strategies as a sequence of semidefinite programs. Fix a dimension $d$ for the Hilbert space. Starting from a randomly chosen quantum state $rho in cal(H)_A times.circle cal(H)_B$ and measurement operators ${A_x^a}, {B_y^b}$, the algorithm alternates between three steps:

+ *Fix the state, optimize the measurements.* For each party separately, solve an SDP to find the measurement operators that maximize the CHSH score while keeping $rho$ and the other party's measurements fixed.
+ *Fix the measurements, optimize the state.* Solve an SDP to find the state $rho$ that maximizes the CHSH score given the current measurements.
+ *Repeat* until convergence (or for a fixed number of iterations).

The best CHSH score found across multiple random initializations provides a lower bound $T_"seesaw" (t)$ on $T(t)$.

#remark(name: [See-saw: no convergence guarantee], id: "rem:seesaw-convergence")[
  The see-saw method is a heuristic. The optimization landscape is biconvex (convex in the state when the measurements are fixed, and vice versa), but *not jointly convex*. Therefore:
  - There is no guarantee of convergence to the global optimum.
  - The algorithm may get stuck in local optima.
  - Different random initializations may yield different results.
]


== The three levels at each $t$

At each finite level $t$, the discrete framework separates three sets of integer countings:

- *Local:* $cal(S)_"loc" (t)$ contains the noncontextual integer models. These satisfy $S(N)/t <= 2$.
- *Quantum:* $cal(S)_"quant" (t) = cal(Q)_t$ contains the quantum-realizable integer models. These satisfy $S(N)/t <= T(t) < 2 sqrt(2)$.
- *No-signaling:* $cal(S)_"ns" (t)$ contains all compatible integer models. These satisfy $S(N)/t <= 4$.

The inclusions $cal(S)_"loc" (t) subset.eq cal(S)_"quant" (t) subset.eq cal(S)_"ns" (t)$ hold at every level. The trison bound $T(t)$ is the frontier of the quantum set inside the no-signaling set. It is a rational number that depends on the arithmetic of $t$ and on the Diophantine properties of $sqrt(2)$.

#remark(name: [Non-monotonicity of $T(t)$], id: "rem:non-monotone-T")[
  The function $t mapsto T(t)$ is not monotone. For example, $T(7) = 2.571 < T(6) = 2.667$. This happens because the arithmetic structure of the integer lattice changes with $t$: some levels admit particularly good rational approximations to the quantum set, while others do not.
]
