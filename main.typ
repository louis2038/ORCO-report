// #import "@local/tool-box-louis:1.0.0": book, corollary, definition, lemma, proof, proposition, remark
#import "template.typ": book, corollary, definition, lemma, proof, proposition, remark

// s#import "@preview/physica:0.9.8": *

#import "title.typ": title-page-report

#set page(paper: "us-letter")
#set par(spacing: 1.2em, first-line-indent: 0pt)

#show: book.with(
  title: [Contextuality as Automata: Open Generators and the Dynamics of Quantum Phenomena],
  author: "Louis TRIOULEYRE--ROBERJOT",
  title-page-fct: title-page-report,
)

#include "prelude.typ"

// ====================================== //

#outline(title: "Review", target: figure.where(kind: "todo"))

#outline()

// = Context and Motivation
#include "chapters/report_part1.typ"

// = Technical Preliminaries
#include "chapters/report_part2.typ"

// = Main concept : dynamic contextual automata
#include "chapters/report_part3.typ"


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

== Comparison with quantification of contextuality in sheaf theory

The previous sections introduced the past/future product $d^- d^+$ as a dynamic measure of tension between what has been emitted and what remains to be closed. We now show that this construction recovers, as a first coordinate, the contextual fraction of Abramsky, Barbosa, and Mansfield @Abramsky_Barbosa_Mansfield_2016. The goal is to translate their entire argument into the integer counting setting and to show that the two frameworks coincide at the level of the non-contextual part.

=== Step 0: The probabilistic setting (recap)

In the standard sheaf-theoretic approach, an empirical model is a compatible family of probability distributions
$
  e = (e_C)_(C in cal(M)),
  quad e_C in cal(D)_(RR_(>=0)) (cal(E)(C)),
  quad sum_(s in cal(E)(C)) e_C (s) = 1.
$
Compatibility means $e_C|_(C inter D) = e_D|_(C inter D)$ for all contexts $C, D$. A global section $g : X -> O$ is *consistent* with $e$ if $e_C(g|_C) > 0$ for every context $C$. The set of consistent global sections is
$
  S_e (X) = { g in cal(E)(X) | forall C in cal(M), e_C (g|_C) > 0 }.
$
When $S_e (X) = emptyset$, the model is strongly contextual: no single global assignment is compatible with the support of every context.

=== Step 1: Relaxing to a fraction (probabilistic)

If no global section explains the entire model, one can ask whether a global section explains a *fraction* of it.

#definition(name: [Global sections consistent with a fraction $r$], id: "def:Se-geq-r")[
  For $r in (0,1]$, define
  $
    S_e^(>= r) (X) = { g in cal(E)(X) | forall C in cal(M), e_C (g|_C) >= r }.
  $
  A global section $g in S_e^(>= r) (X)$ is one whose restriction to each context has probability at least $r$.
]

The sets form an anti-monotone family: if $r <= r'$, then $S_e^(>= r)(X) supset.eq S_e^(>= r')(X)$. Their union recovers the possibilistic notion:
$
  union.big_(r in (0,1]) S_e^(>= r)(X) = S_e (X).
$

The key observation is that a global section in $S_e^(>= r)(X)$ can explain away a fraction $r$ of the model.

#proposition(name: [Decomposition via a consistent fraction], id: "prop:decomposition-fraction")[
  If $g in S_e^(>= r)(X)$, then $e$ admits a convex decomposition
  $
    e = r delta_g + (1-r) e'
  $
  where $delta_g$ is the deterministic model at $g$ and $e'$ is another empirical model.
]

#proof[
  At each context $C$, since $e_C(g|_C) >= r$, we can write
  $
    e_C = r delta_(g|_C) + (1-r) e'_C
  $
  where $e'_C = (e_C - r delta_(g|_C)) / (1-r)$ is a well-defined distribution because $e_C(g|_C) >= r$ ensures non-negativity. Compatibility of $e$ and linearity of the no-signaling condition imply that $e'$ is also compatible.
]

This says: a fraction $r$ of the model is explained by the classical history $g$. The remainder $(1-r)$ is another model $e'$.

=== Step 2: The overlap problem

Now suppose we find *two* global sections:

- $g_1 in S_e^(>= r_1)(X)$, explaining a fraction $r_1$;
- $g_2 in S_e^(>= r_2)(X)$, explaining a fraction $r_2$.

Can we combine them to explain a fraction $r_1 + r_2$?

$
  e ?^= r_1 delta_(g_1) + r_2 delta_(g_2) + (1 - r_1 - r_2) e''.
$

The answer is *no*, in general. The problem is that $g_1$ and $g_2$ may explain the *same part* of the model. If both assign the same local outcome $s$ in a context $C$, and $e_C(s) = 0.6$, then $r_1 = 0.4$ and $r_2 = 0.4$ would require $r_1 + r_2 = 0.8 > 0.6 = e_C(s)$, which is impossible. The explanations *overlap*.

In the possibilistic case, this is harmless: $1 or 1 = 1$. In the probabilistic case, $0.4 + 0.4 = 0.8 > 0.6$: double counting is real.

=== Step 3: The solution --- subdistributions

To handle overlap, Abramsky, Barbosa, and Mansfield introduce *subdistributions*: functions whose weights sum to *at most* $1$, instead of exactly $1$.

#definition(name: [Subdistribution], id: "def:subdistribution")[
  An *$RR$-subdistribution* on a set $S$ is a function $c : S -> RR_(>=0)$ with finite support and total weight
  $
    omega(c) = sum_(s in S) c(s) <= 1.
  $
  The weight $omega(c)$ is the fraction of the model explained by $c$.
]

The subdistribution framework allows multiple global sections to be combined without exceeding the probability of any local event.

#definition(name: [Consistent subdistributions], id: "def:Ce")[
  The set of *consistent subdistributions* is
  $
    C_e (X) = { c in cal(S)cal(D)_(RR_(>=0)) (cal(E)(X)) | forall C in cal(M), forall s in cal(E)(C), e_C(s) >= c|_C (s) }.
  $
  The condition $e_C(s) >= c|_C(s)$ means: the mass that $c$ places on global assignments restricting to $s$ must not exceed the probability that $e$ gives to $s$.
]

This condition prevents double counting: if two global sections $g_1$ and $g_2$ both restrict to $s$ in context $C$, then $c(g_1) + c(g_2) <= e_C(s)$.

#proposition(name: [Decomposition via a consistent subdistribution], id: "prop:decomposition-subdistribution")[
  If $c in C_e(X)$, then
  $
    e = (sum_(g in cal(E)(X)) c(g) delta_g) + (1 - omega(c)) e'.
  $
  This decomposes $e$ into a non-contextual part of weight $omega(c)$ and a remainder $e'$.
]

#proof[
  At each context $C$ and each local outcome $s in cal(E)(C)$, the constraint $e_C(s) >= sum_{g|_C = s} c(g)$ ensures that
  $
    e_C(s) - sum_(g|_C = s) c(g) >= 0.
  $
  The remainder, normalized by $1 - omega(c)$, defines $e'_C(s)$. Compatibility follows from linearity.
]

=== Step 4: The non-contextual fraction

The *non-contextual fraction* of $e$ is the maximum weight achievable by a consistent subdistribution:

$
  "NCF"(e) = max { omega(c) | c in C_e(X) }.
$

The *contextual fraction* is

$
  "CF"(e) = 1 - "NCF"(e).
$

This maximum exists because $C_e(X)$ is closed and bounded in $RR^(|cal(E)(X)|)$, hence compact by Heine--Borel, and $omega$ is continuous.

The dual linear program produces a Bell inequality whose normalised violation by $e$ equals $"CF"(e)$. Thus the contextual fraction is both a measure of non-classicality and a witness of Bell violation.

=== Step 5: Translation to integer counts

We now translate the entire construction into the integer counting setting. Let $N in NN^V$ be a compatible integer counting of level $t$. The normalized model is $e_N = N / t$.

#definition(name: [Integer consistent subcountings], id: "def:CN")[
  The set of *consistent subcountings* is
  $
    C_N (X) = { z in NN^(cal(E)(X)) | forall C in cal(M), forall s in cal(E)(C), sum_(g|_C = s) z(g) <= N_C (s) }.
  $
  Equivalently, in matrix form:
  $
    C_N (X) = { z in NN^(cal(E)(X)) | M z <= N },
  $
  where $M$ is the incidence matrix with $M_((C,s),g) = 1$ if $g|_C = s$ and $0$ otherwise.
]

The weight of a subcounting $z$ is $omega(z) = sum_g z(g) = bold(1)^tack.t z$.

#proposition(name: [Integer decomposition], id: "prop:integer-decomposition")[
  If $z in C_N(X)$, then
  $
    N = M z + R
  $
  where $R = N - M z >= 0$. Here $M z$ is the *closed part* (a combination of deterministic global sections) and $R$ is the *open part* (the residue not yet explained by classical histories).
]

#proof[
  By definition, $M z <= N$ componentwise, so $R = N - M z >= 0$. The matrix $M z$ is compatible because each column of $M$ is a deterministic model, and compatibility is preserved under non-negative integer combinations.
]

This decomposition is the integer analogue of Proposition~@prop:decomposition-subdistribution. It says exactly what the dynamic framework says: an observation $N$ splits into a closed part $M z$ (stabilized, non-contextual) and an open part $R$ (still in progress, potentially contextual).

=== Step 6: The first coordinate recovers the contextual fraction

We now state the main theorem linking the two frameworks.

#proposition(name: [The closed deficit equals the contextual fraction], id: "thm:closed-deficit-equals-CF")[
  Let $N in NN^V$ be a compatible integer counting of level $t$, and let $e_N = N / t$. Define the *closed deficit* as the minimal mass not explained by deterministic global sections:
  $
    D^-(N) := min_(z in C_N(X)) |N - M z|_1.
  $
  Then
  $
    D^-(N) = |N|_1 dot "CF"(e_N).
  $
  Equivalently,
  $
    (D^-(N)) / (|N|_1) = "CF"(e_N).
  $
]

#proof[
  Since $M z <= N$, we have $|N - M z|_1 = |N|_1 - |M z|_1$. Each column of $M$ has exactly $|cal(M)|$ entries equal to $1$ (one per context), so $|M z|_1 = |cal(M)| dot bold(1)^tack.t z$. Also $|N|_1 = |cal(M)| t$. Therefore:
  $
    D^-(N) = |cal(M)| t - |cal(M)| max_(z in C_N(X)) bold(1)^tack.t z = |cal(M)| (t - max_(z in C_N(X)) bold(1)^tack.t z).
  $
  Now set $c = z / t$. The constraint $M z <= N$ becomes $M c <= N / t = e_N$. Hence
  $
    max_(z in C_N(X)) bold(1)^tack.t z = t max_(c >= 0, M c <= e_N) bold(1)^tack.t c = t dot "NCF"(e_N).
  $
  Substituting:
  $
    D^-(N) = |cal(M)| t (1 - "NCF"(e_N)) = |N|_1 dot "CF"(e_N).
  $
]

This theorem says: the minimal mass of a compatible counting that cannot be explained by deterministic global sections is *exactly* the contextual fraction of the normalized model, multiplied by the total count.

=== Step 7: The dynamic enrichment

The sheaf-theoretic framework stops at the contextual fraction: it measures *how much* of the model is non-classical. The dynamic framework adds a second layer: it measures *how far* the non-classical residue is from being closed.

For a dynamic state $eta$ explaining $N$, the past/future distances are
$
  d^-_eta = |N - P_eta|_1, quad d^+_eta = |F_eta - N|_1,
$
where $P_eta = M z$ is the closed part and $F_eta = P_eta + sum_((g,R) in O_eta) g$ is the completed part.

When the closed part is *maximized* (i.e. $z$ solves the LP above), we have
$
  d^-_eta = D^-(N) = |N|_1 dot "CF"(e_N).
$
Thus the first coordinate of the dynamic measure recovers the contextual fraction exactly. The second coordinate, $d^+_eta$, measures the additional cost of completing the non-contextual residue:
$
  d^+_eta = |F_eta - N|_1 = |sum_((g,R) in O_eta) R|_1.
$

The product $d^-_eta d^+_eta$ is therefore
$
  d^-_eta d^+_eta
  =
  underbrace(|N|_1 dot "CF"(e_N), "contextual fraction (sheaf theory)")
  dot
  underbrace(d^+_eta, "completion cost (dynamic)").
$
The first factor is purely static: it depends only on the model $e_N$. The second factor is dynamic: it depends on the choice of generators, the residuals, and the degree of openness of the explanation.

#figure(
  table(
    columns: 3,
    align: center,
    inset: 8pt,
    table.header([Quantity], [Origin], [What it measures]),
    [$"CF"(e_N)$], [Sheaf theory], [Fraction non-explained by global sections],
    [$D^-(N) / |N|_1$], [Dynamic (closed part)], [Same quantity, integer version],
    [$d^+_eta$], [Dynamic (open part)], [Cost to complete the non-classical residue],
    [$d^-_eta d^+_eta$], [Dynamic (product)], [Tension between past and future],
  ),
  caption: [Decomposition of the dynamic measure. The first coordinate recovers the contextual fraction; the second adds the completion cost.],
) <tab:decomposition-measure>

=== Step 8: The overlap problem in the integer setting

The integer setting has exactly the same overlap problem as the probabilistic one, but now with counts instead of probabilities.

Consider a context $C$ with $N_C(s_1) = 6$ and $N_C(s_2) = 4$ (so $t = 10$). Suppose two global sections $g_1$ and $g_2$ both restrict to $s_1$ in context $C$. If we naively assign $z(g_1) = 4$ and $z(g_2) = 4$, the total mass on $s_1$ is $4 + 4 = 8 > 6 = N_C(s_1)$. This is impossible: we are trying to explain $8$ occurrences of an event that was only observed $6$ times.

The constraint $sum_{g|_C = s} z(g) <= N_C(s)$ in the definition of $C_N(X)$ prevents exactly this. It is the integer analogue of the subdistribution condition $e_C(s) >= c|_C(s)$.

In the possibilistic case, $1 or 1 = 1$: double counting is harmless. In the integer case, $4 + 4 = 8 > 6$: double counting is real and must be controlled.

=== Step 9: Summary of the correspondence

The following table summarizes the parallel between the probabilistic and integer frameworks.

#figure(
  table(
    columns: 3,
    align: center,
    inset: 6pt,
    table.header([Sheaf theory (probabilistic)], [Our framework (integer)], [Relationship]),
    [$e_C in cal(D)_(RR)(cal(E)(C))$], [$N_C in NN^(cal(E)(C))$], [$e_C = N_C / t$],
    [$sum_s e_C(s) = 1$], [$sum_s N_C(s) = t$], [normalization],
    [$S_e^(>= r)(X)$], [$S_N^(>= r)(X)$], [same definition],
    [$e = r delta_g + (1-r)e'$], [$N = r delta_g + R$], [fractional decomposition],
    [$C_e(X) = {c : M c <= e}$], [$C_N(X) = {z : M z <= N}$], [$c = z / t$],
    [$e = sum c(g) delta_g + (1-omega(e))e'$], [$N = M z + R$], [subdistribution decomposition],
    [$"NCF"(e) = max omega(c)$], [$"NCF"(e_N) = max bold(1)^tack.t z / t$], [same LP],
    [$"CF"(e) = 1 - "NCF"(e)$], [$D^-(N) / |N|_1 = "CF"(e_N)$], [#strong[main theorem]],
  ),
  caption: [Complete correspondence between the probabilistic sheaf-theoretic framework and the integer counting framework.],
) <tab:correspondence>

The last row is the main result: the normalized closed deficit in the integer framework equals the contextual fraction in the probabilistic framework. The two measures are the same quantity, seen from two sides of the normalization barrier.


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
