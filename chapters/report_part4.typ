#import "../template.typ": book, corollary, definition, lemma, proof, proposition, remark
#import "../prelude.typ": *


= Quantum viewed by dynamic contextual automata

#v(4em)

The previous sections established the static and dynamic tools and how we define a theory $𝕋 = (𝒢,ξ)$. We now use these tools to analyse quantum experimental data. The central question is: can the dynamic framework distinguish quantum-like observations from classical and post-quantum ones, and can it do so at each finite level $t$ without invoking the idealized Tsirelson bound ?

== The trison bound at level $t$

We have seen that a discrete empirical model of level $t$ is a compatible integer counting $N in NN^V$ with $A_cal(M) N = t 𝟙$ and $delta N = 0$. In the CHSH scenario, the score $S(N)$ is a rational number at each finite level $t$, because each entry $N(a,b|x,y)$ is an integer and the correlators are ratios of integers with denominator dividing $t$.

#definition(name: [Trison bound at level $t$], id: "def:trison-bound")[
  Let $cal(Q)_t$ denote the set of integer countings at level $t$ that are quantum-realizable, that is, countings that arise from some finite-dimensional quantum strategy with $t$ repetitions. The *trison bound* at level $t$ is
  $
    T(t) := sup_(N in 𝒮_t ∩ t · Q) S(N).
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
