#import "../template.typ": book, corollary, definition, lemma, proof, proposition, remark
#import "../prelude.typ": *

= Main concept : dynamic contextual automata

The previous section described compatible countings as elements of an affine semigroup. This is a static description. It tells us which completed integer tables are possible at each level $t$. The level is important because it records the scale at which the observation has stabilized.

In CHSH, a completed compatible count has total size $k = 4t$. Hence completed objects appear only at sizes divisible by $4$. The dynamic question is therefore unavoidable: what can be said after only one, two, or three visible events have occurred? Such a prefix is not a completed empirical model, but it may still be the beginning of a process that will later close into one.

The aim of dynamic contextual automata is to describe these intermediate states without reducing them to noise. A completed count is built from elementary generators. An interrupted count is built from completed generators and from generators that are still open. The open part contains information about the future: it records what must still be emitted in order to close the process. This makes the later definition of a dynamic state almost forced: it must contain closed copies, open copies, and the residual future of each open copy.

The following sections present the result of our work, from the initial definitions and motivations to the final proposition. The first part introduces the foundations of our meta-theory of theories. The second part shows how this framework can account for simple examples of contextuality. We also emphasize the advantage of replacing probabilistic models with an integer-based dynamic model.

== Basic of dynamic contextual automata

=== Generators as complete processes

Let $V$ be the visible event space introduced above. A count is an element of $NN^V$. A generator is a finite counting vector $g in NN^V$ that is regarded as one elementary complete process.

Generators are not introduced as arbitrary formal objects. They are meant to be elementary bricks of stabilization. A closed empirical table is not explained by a probability point alone, but by a finite production of such bricks.

In CHSH, the previous semigroup computation gives the intended examples. The local deterministic generators are the minimal classical bricks. The lifted PR generators are the minimal non-local bricks of the compatible semigroup. A local deterministic generator has total size $4$. A lifted PR generator has total size $8$. The automata below do not change these bricks. They only describe their progressive production.

At this stage, we do not need to assume that these are the only possible generators in every scenario. The set of generators is a modelling choice, but it is a constrained choice: it must be rich enough to reconstruct the completed countings that we want to explain, and structured enough to make intermediate states meaningful.

#definition(name: "Generator family", id: "def:generator-family")[
  A *generator family* is a finite set
  $
    cal(G) subset.eq NN^V
  $
  whose elements are called complete generators. Each $g in cal(G)$ has a level $ell(g) in NN$ such that $(g,ell(g)) in 𝒮$.

  The family is *closed-complete* for $𝒮$ if every completed compatible model can be written as a finite sum of generators:
  $
    forall (N,t) in 𝒮, quad
    exists c : cal(G) -> NN,
    quad
    N = sum_(g in cal(G)) c(g) g
    " and "
    t = sum_(g in cal(G)) c(g) ell(g).
  $
]

This condition is the closed, semigroup-level requirement. It says that the chosen generators can explain every completed compatible counting. When $cal(G)$ is the Hilbert basis of $𝒮$, this condition is automatic. In practice, the choice of $cal(G)$ must be made carefully: if it is too small, some counts cannot be explained; if it is too large, the explanation loses structure.

*This point is crucial for understanding the framework:* the model, or theory, chosen to account for a phenomenon can be more or less fine-grained. The choice of generators is therefore part of the modelling process. A more precise theory requires families of generators with higher levels $l(g)$, whereas a less precise theory may only require generators of lower levels.

=== The automaton of one generator

A generator is complete, but it can be produced in several orders. To model this, we attach a small automaton to each $g in cal(G)$.

For $v in V$, let $ε_v in NN^V$ be the unit vector at $v$. Thus $epsilon_v (v)=1$ and $epsilon_v (w)=0$ for $w != v$.

#definition(name: "Residual automaton of a generator", id: "def:residual-automaton")[
  Let $g in cal(G)$. The residual automaton $cal(A)_g$ has states
  $
    { R in NN^V | 0 <= R <= g }.
  $
  The initial state is $R=g$, and the final state is $R=0$.

  If $R(v) > 0$, there is a transition
  $
    R arrow.r R - epsilon_v
  $
  labelled by $v$. This transition emits the visible event $v$ and decreases the residual part by one unit at $v$.
]

The state $R$ is the part of $g$ that remains to be emitted. The emitted part is $g - R$. Thus an interruption of the automaton at residual state $R$ gives a past/future decomposition
$
  g = (g - R) + R.
$
The first term is already visible. The second term is the future required to close this copy of the generator.

#remark(name: "A four-event generator", id: "rem:four-event-generator")[
  Suppose that $g = epsilon_(v_1) + epsilon_(v_2) + epsilon_(v_3) + epsilon_(v_4)$. The automaton $cal(A)_g$ starts at residual state $g$. If the first three emitted events are $v_1,v_2,v_3$, then the residual state is $R = epsilon_(v_4)$ and the visible count is $g - R = epsilon_(v_1)+epsilon_(v_2)+epsilon_(v_3)$.

  This prefix has size $3$. It is not a closed generator. It is nevertheless meaningful, because it knows that the missing future is $epsilon_(v_4)$.
]

=== Global states and open generators

An experiment can contain several copies of generators at the same time. Some copies are already closed. Other copies are open and have only been partially emitted. The correct hidden state must remember this distinction.

#definition(name: "Dynamic state", id: "def:dynamic-state")[
  A *dynamic state* is a pair
  $
    eta = (c_eta, O_eta).
  $
  Here $c_eta : cal(G) -> NN$ counts the closed copies of each generator. The object $O_eta$ is a finite multiset of open copies. An open copy is a pair $(g,R)$, where $g in cal(G)$ is the complete generator and $R in NN^V$ is its residual part, with $0 <= R <= g$.
]

The visible counting associated with $eta$ is
$
  N_eta
  :=
  sum_(g in cal(G)) c_eta (g) g
  +
  sum_((g,R) in O_eta) (g - R).
$
The first sum is the contribution of closed copies. The second sum is the contribution of open copies: each open copy has already emitted $g-R$ and still owes the residual $R$.

The future residual of the state is
$
  R_eta := sum_((g,R) in O_eta) R.
$
If no new generator is opened, then closing all current open copies would produce the completed count
$
  K_eta := N_eta + R_eta
  =
  sum_(g in cal(G)) c_eta (g) g
  +
  sum_((g,R) in O_eta) g.
$
Thus the natural signature of an interrupted state is the pair
$
  Phi(eta) := (N_eta, K_eta).
$
It records both the stabilized visible count (the past) and the completed count (the futur) that would be obtained if all open generators were closed

#remark[
  There is no reason for the map $eta -> N_eta$ to be injective. Two different hidden states may have the same visible count but different open generators and different residual futures. This is why the dynamic theory cannot be reduced to the visible counting vector alone.
]

=== Dynamic explainability

The central question is now not only whether a count is closed, but whether it can be explained as the visible part of an interrupted process.

#definition(name: "Dynamic explanation", id: "def:dynamic-explanation")[
  Let $N in NN^V$. A *dynamic explanation* of $N$ over $cal(G)$ is a dynamic state $eta=(c_eta,O_eta)$ such that
  $
    N = N_eta
    =
    sum_(g in cal(G)) c_eta (g) g
    +
    sum_((g,R) in O_eta) (g - R).
  $
  The set of all such explanations is denoted
  $
    cal(H)_(cal(G))(N)
    := { eta | N_eta = N }.
  $
]

This formula is the basic accounting rule of the model. A visible count is explained by a number of closed generators and by a multiset of open generators. Each open generator contributes only the part already emitted. Its residual part is not visible yet, but it is part of the hidden state.

#definition(name: "Dynamic completeness", id: "def:dynamic-completeness")[
  Let $cal(A) subset.eq NN^V$ be a class of visible counts that we want to explain. The generator family $cal(G)$ is *dynamically complete* for $cal(A)$ if
  $
    forall N in cal(A), quad cal(H)_(cal(G))(N) != emptyset.
  $
]

Dynamic completeness is stronger than closed completeness when $cal(A)$ contains prefixes. Closed completeness only explains final compatible models. Dynamic completeness asks that the intermediate counts also come from some population of closed and open generators.

=== Petri-net reading and concurrency

The previous definitions can be read as a Petri net. A marking is a multiset of tokens. In our case, a token is either a closed copy of a generator or an open copy with a residual state. The marking is therefore the hidden interface of the experiment.

There are three elementary kinds of transitions.

- *Opening*: choose $g in cal(G)$ and create a new open copy $(g,g)$.
- *Emission*: if an open copy is $(g,R)$ and $R(v)>0$, emit the event $v$ and replace $(g,R)$ by $(g,R-epsilon_v)$.
- *Closing*: if an open copy has residual $0$, replace it by one closed copy of $g$.

The emission transitions on two different open copies are independent. They can be performed in either order and lead to the same marking. This is the basic Petri-net notion of concurrency: the model does not force a single total order between independent local emissions. The observer may later apply the Parikh compression and keep only the count $N_eta$, but the hidden marking still remembers which copies are open and what remains to be produced.

#proposition(name: "Closed states recover the semigroup", id: "prop:closed-states-recover-semigroup")[
  Suppose that $cal(G)$ is closed-complete for $𝒮$. If a dynamic state $eta$ has no open copy, then $(N_eta,t_eta) in 𝒮$, where
  $
    t_eta := sum_(g in cal(G)) c_eta (g) ell(g).
  $
  Conversely, every $(N,t) in 𝒮$ is represented by at least one dynamic state with no open copy.
]

#proof[
  If $O_eta$ is empty, then $N_eta = sum_(g in cal(G)) c_eta (g) g$. Since each $(g,ell(g))$ belongs to $𝒮$ and $𝒮$ is closed under addition, $(N_eta,t_eta)$ belongs to $𝒮$. Conversely, closed completeness gives a decomposition of every $(N,t) in 𝒮$ as a finite sum of generators. This decomposition defines a state with the corresponding closed multiplicities and with no open copy.
]

=== Set of possible explanations

We want to define if $N subset.eq N'$:
$
  ℋ_𝒢 (N -> N') = { (η,η') | η ∈ ℋ_𝒢 (N) , η' ∈ ℋ_𝒢 (N') , η arrow.squiggly η'}
$
with the condition $η := (c,O) arrow.squiggly η' := (c',O')$ is equivalent to $∀ g ∈ 𝒢 , c(g) <= c'(g)$ and $∀g, ∀ R,R' , (g,R) ∈ O and (g,R') ∈ O' => R(v) <= R'(v)$. This means that first the second observation don't erase the past of the first observation and has the same possible view of the future.

It means that given two observation, we have a theory of sheaf but about past and futur, we take the uninion of the past and the intersection of the futur like the restriction of the sheaf.

This proposition explains the relation between the static and dynamic viewpoints. The static semigroup is recovered when all generators are closed. The dynamic model adds the missing layer: it also describes states that occur before closure.

=== First interpretation

The model separates three levels.

- A *trace* is an ordered sequence of visible events produced by hidden transitions.
- A *count* is the Parikh compression of a trace. It forgets the order and keeps only multiplicities.
- A *dynamic state* is a hidden explanation of a count by closed and open generators.

This distinction is essential. A completed count such as an element of $𝒮_("ns")$ is only the endpoint of a process. An interrupted experiment is described by an interface $eta$, or equivalently by its past/future signature $Phi(eta)=(N_eta,R_eta)$. The visible past says what has already happened. The residual future says how the process can still stabilize.

The next step will be to use this interface structure to compare interrupted states, to define costs of open non-local resources, and to study which choices of generators give a meaningful reconstruction of contextual phenomena.

=== From observations to theory: the three-layer architecture

We now describe the full architecture of a dynamic contextual theory. The framework separates three layers: the raw observations, the dynamic explanations, and the constraint that selects admissible dynamics.

==== Layer 1: The sequence of observations

An experiment that can be interrupted produces not a single completed counting, but a sequence of partial observations. At each interruption time $i$, the experimenter records an integer counting $N_i in NN^V$. The full experimental record is the sequence
$
  N_(1:k) = (N_1, dots, N_k).
$
Each $N_i$ is a snapshot of the process at time $i$. It records what has been seen so far, but not how it was produced. The sequence carries more information than the final count alone: it preserves the order of events, the intermediate states, and the possibility of interruption.

For example, in CHSH, if the experiment is interrupted after $17$ events, the visible count $N_3$ may contain $3$ complete local generators and part of a fourth. This prefix is not a closed empirical model, but it is a meaningful intermediate state.

==== Layer 2: The dynamic states and their transitions

For each observation $N_i$, the theory assigns a set of possible hidden explanations
$
  cal(H)_cal(G) (N_i) = { eta_i = (c_i, O_i) | N_(eta_i) = N_i }.
$
Each $eta_i$ remembers which generators are closed (stabilized) and which are open (still in progress). The transition condition $eta_i arrow.squiggly eta_(i+1)$ ensures that the explanation at time $i+1$ is compatible with the explanation at time $i$: closed generators remain closed, and the residual future can only shrink.

The full fibre of dynamic explanations for the sequence is
$
  cal(H)_cal(G) (N_(1:k)) = { (eta_1, dots, eta_k) | forall i, eta_i in cal(H)_cal(G) (N_i) " and " eta_i arrow.squiggly eta_(i+1) }.
$
This fibre may contain many trajectories. Two different trajectories can explain the same observation sequence with different distributions of open and closed copies, different residual futures, and different intermediate costs.

==== Layer 3: The dynamic constraint $xi$

The fibre $cal(H)_cal(G) (N_(1:k))$ is typically too large to be useful by itself. It contains every possible way of explaining the observations, including explanations that accumulate unbounded open-generator debt. The third layer introduces a constraint $xi$ that filters the fibre to select only those trajectories that satisfy a global stability condition.

The dynamic fit under constraint $xi$ is
$
  cal(H)_(cal(G), xi) (N_(1:k)) = { (eta_1, dots, eta_k) in cal(H)_cal(G) (N_(1:k)) | (eta_1, dots, eta_k) models xi }.
$
The observation sequence is *explained* by the theory $(cal(G), xi)$ if this set is non-empty.

==== The theory $TT = (cal(G), xi)$

A dynamic contextual theory is a pair
$
  TT = (cal(G), xi),
$
where $cal(G)$ is the *structure* and $xi$ is the *dynamics*.

The *structure* $cal(G)$ specifies the elementary processes: which generators are available, what their levels are, and how they decompose compatible countings. The choice of $cal(G)$ is a modelling decision. A coarse theory uses only low-level generators. A fine-grained theory uses higher-level generators that can explain more complex observations.

The *dynamics* $xi$ specifies how the generators can evolve over time. It does not determine a unique trajectory. It constrains the set of admissible trajectories, removing those that violate a stability condition. The dynamics is what makes the theory predictive: it says not only what can be observed, but how the hidden process must behave between observations.

==== The three approaches to $xi$

We now describe three ways to define the dynamic constraint $xi$, in order of increasing sophistication.

*Approach 1: Open-generator constraint.* The simplest constraint limits the number of open generators relative to closed ones:
$
  xi_B : quad O_i <= lambda C_i + B quad forall i.
$
Here $O_i$ is the number of open copies and $C_i$ is the number of closed copies. This constraint acts like a magnet: it does not determine the trajectory, but if the process accumulates too many open generators, the constraint forces it back toward stabilization. The trajectory is free to choose its path within the stability envelope.

*Approach 2: Calibrated slope.* A refined version calibrates the slope $lambda$ to the trison bound $T(n)$ at the relevant level:
$
  xi_(B,T) : quad O_i <= lambda_T (n) C_i + B quad forall i,
$
where $lambda_T (n)$ is computed from the rational approximation $w_Q (n)/n$ of the Tsirelson probability. This targets the discrete quantum bound rather than the abstract irrational limit.

*Approach 3: Past/future product constraint.* The most refined approach uses the past/future distances $d^-$ and $d^+$. For each dynamic state $eta_i$, define
$
  d^-_i = |N_i - P_(eta_i)|_1, quad d^+_i = |F_(eta_i) - N_i|_1,
$
where $P_(eta_i)$ is the closed part and $F_(eta_i)$ is the completed part. The constraint is
$
  xi_"PF" : quad d^-_i dot d^+_i <= A_T (n) quad forall i.
$
The product $d^- d^+$ measures the simultaneous tension between past and future. It is the dynamic analogue of the contextual fraction: a classical observation has $d^- = d^+ = 0$, a quantum-like observation has moderate tension, and a post-quantum observation has excessive tension.

The key result is that $d^- d^+$ is strictly monotonically increasing in the CHSH score $S$ for $S > 2$, on the isotropic line. Therefore the constraint $d^- d^+ <= A_T (n)$ captures exactly the quantum set at each finite level $n$, without any reference to $sqrt(2)$.

==== What $xi$ is not

It is important to clarify what $xi$ does not do.

- $xi$ does not determine a unique hidden state. Multiple trajectories can satisfy $xi$ for the same observation sequence.
- $xi$ does not choose which event will be emitted next. It only filters the set of admissible continuations.
- $xi$ is not a hidden-variable theory in the traditional sense. It does not assign predetermined values to all measurements. It constrains the dynamics of the explanatory process.

In this sense, $xi$ is closer to a conservation law than to a hidden variable. It says what must be preserved (the stability bound), not what must happen (the next event). The theory $TT = (cal(G), xi)$ is therefore a theory of constraints on explanations, not a theory of hidden causes.
