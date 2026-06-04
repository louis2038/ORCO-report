#import "../template.typ": book, corollary, definition, lemma, proof, proposition, remark
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
