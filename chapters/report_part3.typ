#import "../template.typ": book, corollary, definition, lemma, proof, proposition, remark
#import "../prelude.typ": *

= Main concept : dynamic contextual automata <chap:dynamic-contextual-automata>

The previous section described compatible counts as elements of an affine semigroup. This is a static description. It tells us which completed integer tables are possible at each level $t$. The level is important because it records the scale at which the observation has stabilized.

In CHSH, a completed compatible count has total size $k = 4t$. Hence, completed objects appear only at sizes divisible by $4$. The dynamic question is therefore unavoidable: what can be said after only one, two, or three visible events have occurred ? Such a prefix is not a completed empirical model, but it may still be the beginning of a process that will later close into one.

The aim of dynamic contextual automata is to describe these intermediate states without reducing them to noise. A completed count is built from elementary generators. An interrupted count is built from completed generators and from generators that are still open. The open part contains information about the future: it records what must still be emitted in order to close the process. This makes the later definition of a dynamic state almost forced: it must contain closed copies, open copies, and the residual future of each open copy.

The following sections present the result of our work, from the initial definitions and motivations to the final proposition. The first part introduces the foundations of our meta-theory of theories. The second part shows how this framework can account for simple examples of contextuality. We also emphasize the advantage of replacing probabilistic models with an integer-based dynamic model.

== Basic of dynamic contextual automata

=== Generators as complete processes

Let $V$ be the visible event space introduced above. A count is an element of $NN^V$. A generator is a finite counting vector $g in NN^V$ that is regarded as one elementary complete process.
Generators are not introduced as arbitrary formal objects. They are meant to be elementary bricks of stabilization. A closed empirical table is not explained by a probability point alone, but by a finite production of such bricks.
In $(2,2,2)$ bell scenarios, the previous semigroup computation gives the intended examples. The local deterministic generators are the minimal classical bricks. The lifted PR generators are the minimal non-local bricks of the compatible semigroup. A local deterministic generator has total size $4$. A lifted PR generator has total size $8$. The automata below do not change these bricks. They only describe their progressive production.

At this stage, we do not need to assume that these are the only possible generators in every scenario. The set of generators is a modelling choice, but it is a constrained choice: it must be rich enough to reconstruct the completed countings that we want to explain, and structured enough to make intermediate states meaningful.

#definition(name: "Generator family", id: "def:generator-family")[
  A *generator family* is a finite set
  $cal(G) subset.eq NN^V$
  whose elements are called generators. Each $g in cal(G)$ has a level $ell(g) in NN$ such that $(g,ell(g)) in 𝒮$.
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
  ${ R in NN^V | 0 <= R <= g }$.
  The initial state is $R=g$, and the final state is $R=0$.
  If $R(v) > 0$, there is a transition
  $R arrow.r R - epsilon_v$
  labelled by $v$. This transition emits the visible event $v$ and decreases the residual part by one unit at $v$.
]

The state $R$ is the part of $g$ that remains to be emitted. The emitted part is $g - R$. Thus an interruption of the automaton at residual state $R$ gives a past/future decomposition
$g = (g - R) + R$.
The first term is already visible. The second term is the future required to close this copy of the generator.

#remark(name: "A four-event generator", id: "rem:four-event-generator")[
  Suppose that $g = epsilon_(v_1) + epsilon_(v_2) + epsilon_(v_3) + epsilon_(v_4)$. The automaton $cal(A)_g$ starts at residual state $g$. If the first three emitted events are $v_1,v_2,v_3$, then the residual state is $R = epsilon_(v_4)$ and the visible count is $g - R = epsilon_(v_1)+epsilon_(v_2)+epsilon_(v_3)$.

  This prefix has size $3$. It is not a closed generator. It is nevertheless meaningful, because it knows that the missing future is $epsilon_(v_4)$.
]

=== Global states and open generators

An experiment can contain several copies of generators at the same time. Some copies are already closed. Other copies are open and have only been partially emitted. The correct hidden state must remember this distinction. To define this notion properly, we first introduce the concept of a multiset, that is, a set whose elements may appear with multiplicity. Traditionally, a multiset is represented by a set together with a multiplicity function. In our setting, instead of writing expressions such as $sum_(x in M) x dot m(x)$ where $m$ is the multiplicity function, we use the notation $sum_(x ins M) x$, which can be read as a sum over an array in the sense of a programming language. The $x ∈ M$ represents the condition that $x$ is an element of the multiset $M$.

#definition(name: "Dynamic state", id: "def:dynamic-state")[
  A *dynamic state* is a pair
  $eta = (c_eta, O_eta)$.
  Here $c_eta : cal(G) -> NN$ counts the closed copies of each generator. The object $O_eta$ is a finite multiset of open copies. An open copy is a pair $(g,R)$, where $g in cal(G)$ is the complete generator and $R in NN^V$ is its residual part, with $0 < R <= g$.
  The visible counting associated with $eta$ is
  $N_eta
  :=
  sum_(g in cal(G)) c_eta (g) g
  +
  sum_((g,R) ins O_eta) (g - R)$.

  We may equivalently define a dynamic state using only a multiset $OO_eta$, where elements with null residuals, such as $(g,0)$, are also allowed. In this formulation,
  $N_eta = sum_((g,R) ins OO_eta) (g - R)$,
  so closed copies correspond precisely to open copies with null residual.

  We will note $𝕞(g, R)$ the multiplicity of the open copy $(g,R)$ in $OO_eta$.
]
The first sum is the contribution of closed copies. The second sum is the contribution of open copies: each open copy has already emitted $g-R$ and still owes the residual $R$.

#lou[problem : R c'est la completions ici pas le residus !]

The future residual of the state is
$R_eta := sum_((g,R) ins O_eta) R$.
If no new generator is opened, then closing all current open copies would produce the completed count
$
  K_eta := N_eta + R_eta
  =
  sum_(g in cal(G)) c_eta (g) g
  +
  sum_((g,R) ins O_eta) g.
$
Thus the natural signature of an interrupted state is the pair
$Phi(eta) := (N_eta, K_eta)$.
It records both the stabilized visible count (the past) and the completed count (the futur) that would be obtained if all open generators were closed

#remark[
  There is no reason for the map $eta -> N_eta$ to be injective. Two different hidden states may have the same visible count but different open generators and different residual futures. This is why the dynamic theory cannot be reduced to the visible counting vector alone.
]

In the following, we extend the notation $N_η$ to $c_η : 𝒢 -> ℕ$ that is the number of closed generators, but also to $o_η : 𝒢 -> ℕ$ that is the number of open generators. Then by consequence $∀g in 𝒢, sum_(0 <= R <= g) 𝕞_η (g,R) = 𝕞_η (g,0) + sum_(0 < R <= g) 𝕞_η (g,R) = c_η + o_η$.

=== Petri-net reading and concurrency

The previous definitions can be read as a Petri net. A marking is a multi set of tokens. In our case, a token is either a closed copy of a generator or an open copy with a residual state. The marking is therefore the hidden interface of the experiment.

There are three elementary kinds of transitions.

- *Opening*: choose $g in cal(G)$ and create a new open copy $(g,g)$.
- *Emission*: if an open copy is $(g,R)$ and $R(v)>0$, emit the event $v$ and replace $(g,R)$ by $(g,R-epsilon_v)$.
- *Closing*: if an open copy has residual $0$, replace it by one closed copy of $g$.

The emission transitions on two different open copies are independent. They can be performed in either order and lead to the same marking. This is the basic Petri-net notion of concurrency: the model does not force a single total order between independent local emissions. The observer may later apply the Parikh #footnote[A reference to Parikh vector define by counting the letter use in a word.] compression and keep only the count $N_eta$, but the hidden marking still remembers which copies are open and what remains to be produced.

#proposition(name: "Closed states recover the semigroup", id: "prop:closed-states-recover-semigroup")[
  Suppose that $cal(G)$ is closed-complete for $𝒮$. If a dynamic state $eta$ has no open copy, then $(N_eta,t_eta) in 𝒮$, where
  $t_eta := sum_(g in cal(G)) c_eta (g) ell(g)$.
  Conversely, every $(N,t) in 𝒮$ is represented by at least one dynamic state with no open copy.
]

#proof[
  If $O_eta$ is empty, then $N_eta = sum_(g in cal(G)) c_eta (g) g$. Since each $(g,ell(g))$ belongs to $𝒮$ and $𝒮$ is closed under addition, $(N_eta,t_eta)$ belongs to $𝒮$. Conversely, closed completeness gives a decomposition of every $(N,t) in 𝒮$ as a finite sum of generators. This decomposition defines a state with the corresponding closed multiplicities and with no open copy.
]

== From observations to theory: the three-layer architecture

We now describe the full architecture of a dynamic contextual theory. The framework separates three layers: the raw observations, the dynamic explanations, and the constraint that selects admissible dynamics.

=== Layer 1: The sequence of observations

An experiment that can be interrupted produces not a single completed counting, but a sequence of partial observations. At each interruption time $i$, the experimenter records an integer counting $N_i in NN^V$. The full experimental record is the sequence
$N_(1:k) = (N_1, dots, N_k)$.
Each $N_i$ is a snapshot of the process at time $i$. It records what has been seen so far, but not how it was produced. The sequence carries more information than the final count alone: it preserves the order of events, the intermediate states, and the possibility of interruption.

=== Layer 2: The dynamic states and their transitions

For each observation $N_i$, the theory assigns a set of possible _hidden explanations_
$cal(H)_cal(G) (N_i) = { eta_i = (c_i, O_i) | N_(eta_i) = N_i }$.
Each $eta_i$ remembers which generators are closed (stabilized) and which are open (still in progress). The _transition condition_ $eta_i arrow.squiggly eta_(i+1)$ says that the explanation at time $i+1$ is compatible with the explanation at time $i$. No copy that already exists may disappear. Moreover, a copy cannot change its generator, and its residual future can only shrink. Thus the dynamics preserves the identity of the elementary process while allowing part of its remaining future to be emitted.

To define this condition formally, we use the extended multiset $OO_eta$ rather than $O_eta$. Recall that $OO_eta$ also contains closed copies, represented as pairs $(g,0)$. Since $OO_eta$ is a multiset, a function between two multisets must distinguish individual occurrences. We therefore introduce the *occurrence set* of a multiset $OO$:
$
  hat(OO) := { (g, R, i) | (g,R) ins OO, quad 1 <= i <= 𝕞(g,R) }.
$
Each triple $(g, R, i)$ represents one specific copy: $g$ is the generator, $R$ is the residual, and $i$ distinguishes copies that share the same pair $(g,R)$.

#definition(name: "Transition condition", id: "def:transition-condition")[
  Let $eta$ and $eta'$ be two dynamic states. We define the condition $eta arrow.squiggly eta'$ by the existence of a function
  $phi : hat(OO)_eta -> hat(OO)_eta'$
  such that:

  + $phi$ is injective: for all $x, y in hat(OO)_eta$, if $x != y$ then $phi(x) != phi(y)$;
  + $phi$ preserves the generator and reduces the residual: for every $(g, R, i) in hat(OO)_eta$, if $phi(g, R, i) = (g', R', i')$, then $g' = g$ and $0 <= R' <= R$.
]

The injectivity of $phi$ means that two old copies cannot be identified with the same new copy. The second condition means that a copy of $g$ remains a copy of $g$, and its residual future has decreased. In particular, if $R = 0$, then $R' = 0$, so closed generators remain closed.

The full fibre of _dynamic explanations_ for the sequence is
$
  cal(H)_cal(G) (N_(1:k)) = { (eta_1, dots, eta_k) | forall i, eta_i in cal(H)_cal(G) (N_i) " and " eta_i arrow.squiggly eta_(i+1) }.
$
This fibre may contain many trajectories. Two different trajectories can explain the same observation sequence with different distributions of open and closed copies, different residual futures, and different intermediate costs.

#proposition(name: "Monotonicity of visible counts", id: "prop:visible-counts-monotone")[
  If $(eta_1, dots, eta_k) in cal(H)_cal(G) (N_(1:k))$, then the observed countings are monotone:
  $N_1 <= N_2 <= dots <= N_k$
  componentwise in $NN^V$.
]

#proof[
  It is enough to prove the claim for one transition $eta arrow.squiggly eta'$. By definition, there exists an injective map $phi : hat(OO)_eta -> hat(OO)_eta'$ such that every $(g, R, i) in hat(OO)_eta$ is sent to some $(g, S, j)$ with $S <= R$.
  For each $x = (g, R, i) in hat(OO)_eta$, write $phi(x) = (g, S_x, j_x)$ with $S_x <= R$. The visible contribution of $x$ in $eta$ is $g - R$, whereas the visible contribution of $phi(x)$ in $eta'$ is $g - S_x$. Since $S_x <= R$, we have $g - R <= g - S_x$ componentwise.
  We now sum over all occurrences. The total visible contribution of $OO_eta$ is $N_eta = sum_(x in hat(OO)_eta) (g_x - R_x)$. We claim that $N_eta <= N_(eta')$. The argument proceeds in three steps:
  $
    N_eta
    = sum_(x in hat(OO)_eta) (g_x - R_x)
    <=_1 sum_(x in hat(OO)_eta) (g_x - S_x)
    =_2 sum_(y in phi(hat(OO)_eta)) (g_y - S_y)
    <=_3 sum_(y in hat(OO)_eta') (g_y - S_y)
    = N_(eta').
  $
  + For each $x in hat(OO)_eta$, the term $g_x - R_x <= g_x - S_x$ componentwise, because $S_x <= R_x$.
  + Since $phi$ is injective, the map $x mapsto phi(x)$ is a bijection from $hat(OO)_eta$ onto $phi(hat(OO)_eta)$. Reindexing the sum over the image gives $sum_(x in hat(OO)_eta) (g_x - S_x) = sum_(y in phi(hat(OO)_eta)) (g_y - S_y)$.
  + Since $phi(hat(OO)_eta) subset.eq hat(OO)_eta'$, we decompose:
  $
    sum_(y in hat(OO)_eta') (g_y - S_y)
    =
    sum_(y in phi(hat(OO)_eta)) (g_y - S_y)
    +
    underbrace(sum_(y in hat(OO)_eta' without phi(hat(OO)_eta)) (g_y - S_y), >= 0 " since " S_y <= g_y).
  $
  Dropping the non-negative remainder gives the inequality.
  Now let $(eta_1, dots, eta_k) in cal(H)_cal(G) (N_(1:k))$. For every $i < k$, the definition of the fibre gives $eta_i arrow.squiggly eta_(i+1)$ and $N_(eta_i) = N_i$. Applying the previous paragraph gives
  $N_i = N_(eta_i) <= N_(eta_(i+1)) = N_(i+1)$.
  Thus $N_1 <= N_2 <= dots <= N_k$.
]

#remark(name: [Monotonicity is independent of $cal(G)$], id: "rem:monotonicity-independent")[
  The implication proved in @prop:visible-counts-monotone does not require any completeness assumption on $cal(G)$. Once a trajectory of dynamic states exists, monotonicity follows only from the transition condition: old copies are mapped injectively to new copies, and their residuals can only decrease.

  The converse question is different. A monotone sequence $N_1 <= dots <= N_k$ admits a dynamic explanation for every choice of visible countings if and only if $cal(G)$ is complete. This notion is defined in the appendix @def:dynamic-complete. There, @prop:dynamic-complete-support shows that dynamic completeness is equivalent to the condition that the generators cover all visible events, and @prop:converse-monotonicity-dynamic-complete proves the converse of monotonicity under this assumption.
]

=== Layer 3: The dynamic constraint $xi$

The fibre $cal(H)_cal(G) (N_(1:k))$ is typically too large to be useful by itself. The third layer introduces a constraint $xi$ that filters the fibre to select only those trajectories that satisfy a global stability condition.

The dynamic fit under constraint $xi$ is
$
  cal(H)_(cal(G), xi) (N_(1:k)) = { (eta_1, dots, eta_k) in cal(H)_cal(G) (N_(1:k)) | (eta_1, dots, eta_k) models xi }.
$
The observation sequence is *explained* by the theory $(cal(G), xi)$ if this set is non-empty.

=== The theory $TT = (cal(G), xi)$

A dynamic contextual theory is a pair
$TT = (cal(G), xi)$,
where $cal(G)$ is the *structure* and $xi$ is the *dynamics*.

The *structure* $cal(G)$ specifies the elementary processes: which generators are available, what their levels are, and how they decompose compatible countings. The choice of $cal(G)$ is a modelling decision. A coarse theory uses only low-level generators. A fine-grained theory uses higher-level generators that can explain more complex observations.

The *dynamics* $xi$ specifies how the generators can evolve over time. It does not determine a unique trajectory. It constrains the set of admissible trajectories, removing those that violate a stability condition. The dynamics is what makes the theory predictive: it says not only what can be observed, but how the hidden process must behave between observations.

#remark[
  If $cal(G)$ is not complete (see @def:dynamic-complete), then the choice of $cal(G)$ already imposes a structural restriction: some completed observations cannot be generated. If $cal(G)$ is complete, however, the structure alone does not select a proper subclass of completed observations. It only re-expresses them as sums of elementary bricks. In that case, a non-trivial theory requires an additional constraint on admissible trajectories. This is the role of $xi$.
]
=== A first example of $xi$: bounding open generators

The symbol $xi$ denotes a constraint on trajectories of hidden states. It is not fixed by the definition of a dynamic contextual automaton. It is an additional modelling choice. A first possible choice, and the one that initially motivated this layer, is to bound the number of open copies of each generator.

For a state $eta$, write
$o_eta (g) := sum_(0 < R <= g) 𝕞_eta (g,R)$
for the number of open copies of $g$, and write $c_eta (g) := 𝕞_eta (g,0)$ for the number of closed copies of $g$. Fix a slope $lambda >= 0$ and a tolerance $B in NN$. The open-generator constraint is
$
  xi_B : quad o_(eta_i) (g) <= lambda c_(eta_i) (g) + B
  quad ∀i ∈ [k] , quad forall (η_1,dots,η_k) ∈ ℋ_𝒢 (N_(1:k)), quad forall g in cal(G).
$
This condition says that a trajectory is admissible only if, at each interruption time, each generator has a controlled number of open copies relative to its closed copies. The tolerance $B$ allows a bounded amount of unfinished work. The slope $lambda$ allows the system to carry more unfinished copies once it has already stabilized many closed copies of the same generator.

This simple constraint already has a dynamic effect. Suppose that an observation $N$ forces many open copies of a generator $g$. This can be measured by the minimal open pressure
$
  omega_g (N)
  :=
  min_(eta in cal(H)_cal(G) (N))
  (o_eta (g) - lambda c_eta (g)).
$
If $omega_g (N) > B$, then every hidden explanation of $N$ violates $xi_B$. Hence no trajectory satisfying $xi_B$ can pass through this observation. If $omega_g (N)$ is close to $B$, then the trajectory is not yet impossible, but its future is strongly constrained: it cannot keep opening new copies of $g$ without also emitting residual events that help existing copies close.

#remark(name: "Magnet analogy", id: "rem:magnet-analogy")[
  The constraint $xi_B$ behaves like a magnet guiding a trajectory. It does not determine the path: the dynamics of opening, emitting, and closing generators is not fixed by $xi_B$ alone. But if the trajectory strays too far, meaning that the number of open copies grows too large relative to the closed ones, the constraint creates a wall that pushes the process back toward stabilization.
  The magnet does not choose the destination. It prevents the trajectory from escaping into unbounded instability. More precisely, $xi_B$ does not select a unique trajectory $eta_1 arrow.squiggly eta_2 arrow.squiggly dots arrow.squiggly eta_k$. It filters the set of admissible trajectories by removing those that violate the stability bound at some step. The surviving trajectories are not deterministic, but their open/closed ratio stays inside the prescribed envelope.
]

*What $xi$ is not.* It is important to clarify the status of this constraint.

- $xi$ does not determine a unique hidden state. The same observation sequence may have several admissible trajectories.
- $xi$ does not choose which event will be emitted next. It only removes continuations that would make the hidden state unstable.
- $xi$ is not a hidden-variable assignment in the usual sense. It does not assign predetermined values to all measurements. It constrains the evolution of the explanatory process.
- $xi$ is not part of the visible data. It is a theoretical filter placed on the fibre $cal(H)_cal(G) (N_(1:k))$.

In this sense, $xi$ is closer to a stability law than to a hidden cause. It says which dynamic explanations are admissible. It does not say that one specific explanation is the real one.
