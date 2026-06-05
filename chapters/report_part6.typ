#import "../template.typ": book, corollary, definition, example, lemma, proof, proposition, remark
#import "../prelude.typ": *

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
