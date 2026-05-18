
#import "@preview/mousse-notes:1.0.0": *
#import "@preview/physica:0.9.8": *

#set page(paper: "us-letter")
#show: book.with(
  subtitle: [Truth and Understanding],
  author: "Louis TRIOULEYRE-ROBERJOT",
  // epigraph: quote(
  //   attribution: [Jonathan Bingus],
  // )[This is a tremendously inspirational quote that sets the tone of this course; truly, one of the epigraphs of all time.],
)

// Useful command : definition, theorem,
// glue, qed, tablef
//
//
//
//

#import "@preview/dashy-todo:0.1.3": todo

#set par(spacing: 1.2em, first-line-indent: 0pt)

// --- Your note content below ---

= Introduction

This thesis begins from a simple but demanding question: when science explains what is observed by appealing to hidden mechanisms, what exactly is it trying to recover, justify, and transmit? This question is not only philosophical. It is also mathematical and scientific. It appears whenever observations are partial, whenever data are compressed, whenever communication is finite, and whenever the mechanism to be explained is distributed, sequential, or hidden behind several layers of mediation.

In many domains, the primary object of description is an input-output relation, a probability table, or a family of correlations. Such objects are useful, but they are already compressed. They suppress the internal process that generated them, the trace through which that process unfolded, and the losses introduced by observation, memory, transmission, and interpretation. This thesis adopts the opposite starting point. It treats those intermediate layers not as technical noise, but as part of the very structure that a theory must explain.

The guiding idea is that scientific explanation should be formulated at the level of hidden dynamic processes that generate traces, while observation should be understood as a compression of those traces. A scientific report is therefore not a transparent copy of reality. It is a mediated object: produced by an observer, shaped by finite constraints, transmitted in partial form, and interpreted by a verifier. At the methodological level, this means distinguishing three roles: a laboratory that generates a hidden process, a scientist who observes and compresses its visible trace, and a verifier who reconstructs enough structure to evaluate an explanatory model. The operative chain is the following: hidden process, trace, compression, message, reconstruction, judgment.

This perspective is motivated by a broader scientific concern. In fields such as quantum information and nonlocal complexity, one often works with highly abstract descriptions of strategies and correlations. These formalisms are powerful, but they can also hide which resources are actually doing the work. Results of extreme strength, such as the expressive power revealed by modern nonlocal-game complexity, naturally raise the following question: which part of that power is genuinely tied to physical or causal structure, and which part comes from allowing extremely permissive forms of description, scaling, or abstraction? The aim of this thesis is not to reject the standard formalism. It is to build a finitary and causal language in which such questions can be asked more explicitly.

A guiding example is provided by entangled multi-prover interactive proofs. In the standard $"MIP"^*$ setting, the provers may share arbitrary entangled states in arbitrary finite dimension, and the theorem $"MIP"^* = "RE"$ shows how powerful such unrestricted strategies can be. This does not by itself tell us which resources are essential. It may be the unbounded dimension, the ability to reuse large hidden states, the abstract description of strategies, or some combination of all three. One long-term objective of the present thesis is therefore to reformulate such situations in a language where locality, memory, reuse, trace generation, and compression are all explicit.

The central hypothesis of the thesis is that three operations must be separated if one wants a scientifically useful theory of hidden structure. First, truth selects: among the currently available models, one identifies those that best explain the observed _phenomena_. Second, understanding stabilizes: one asks whether such models can survive compression, transmission, interruption, and reconstruction within finite communities of inquiry. Third, resource theory constrains: one asks what kind of hidden organization, memory, coordination, and causal support are required to make such explanation possible in the first place.

Under this view, the goal is not merely to fit data. It is to construct a theory of explanation that is dynamic, reconstructive, and resource-sensitive. The hidden mechanism must generate traces. The traces must account for the observations once compressed. The model must remain intelligible after circulation. And the resources needed to realize such a mechanism must be made explicit rather than silently absorbed into an abstract formalism.

== Core Objective

The concrete objective of this thesis is to develop a finitary framework for hidden mechanisms in which

- observable data are treated as compressed access to traces,
- traces are generated by hidden dynamic models such as finite automata or related structures,
- explanation is formulated as compatibility between observed compressions and admissible hidden evolutions,
- understanding is formulated as stability under compression and reconstruction,
- and scientific power is analyzed through an explicit theory of resources.

At a conceptual level, the ambition is to move from static descriptions of correlations to dynamic descriptions of how those correlations may be produced, transmitted, reconstructed, and compared. At a technical level, the aim is to build a mathematical scaffold strong enough to support questions about explainability, locality, compression, simulation, and complexity within a single coherent language.

== Main Research Questions

The thesis is organized around five guiding questions.

- What is the right formal object for scientific explanation when observations are incomplete: a distribution, a trace, or a hidden process generating traces?
- How should one model the passage from hidden evolution to observable report when compression and finite communication are unavoidable?
- When should a model count as understood, rather than merely predictive, once it has circulated through finite agents or communities?
- Which hidden resources are genuinely necessary to reproduce observed behaviors, especially in distributed and nonlocal settings?
- How does computational or explanatory power change when one bounds the size, memory, coordination, or build cost of the hidden mechanisms involved?

== Short-, Medium-, and Long-Term Goals

The program of the thesis is intentionally staged.

- Short term: define the formal core. This includes traces, hidden automata, compression maps, reconstruction procedures, and precise notions of explainability for partial observations such as Parikh counts.
- Short term: clarify the epistemic vocabulary. This includes the distinction between _noumenon_, _phenomenon_, model, truth, and understanding, and the translation of these ideas into operational criteria.
- Medium term: build a resource theory of dynamic hidden mechanisms. This includes free operations, convertibility, monotones, causal constraints, and bounded classes of admissible protocols.
- Medium term: extend the framework to multiparty and nonlocal settings, where hidden dynamics, shared memory, locality constraints, and compressed observations interact in a nontrivial way.
- Long term: use the framework to clarify which features of nonlocal and quantum complexity arise from concrete finitary resources, and which appear only through unbounded scaling, asymptotic closure, or highly permissive abstract descriptions.
- Long term: provide a language in which one may compare standard formalisms with constructive causal models, not in order to discard the former, but in order to reveal more clearly which resources make their power possible.

== Plan of Attack

The strategy of the thesis is cumulative.

- Step 1: establish the philosophical and methodological foundations of the project. This is the role of the present chapter: to define the status of _phenomena_, hidden structure, truth, and understanding.
- Step 2: introduce traces as the primitive temporal objects of analysis, rather than starting directly from probability tables or input-output maps.
- Step 3: model hidden mechanisms by finite-state or otherwise finitary dynamic systems capable of generating admissible traces.
- Step 4: formalize compression and reconstruction, so that partial observation becomes an explicit map rather than an implicit loss.
- Step 5: define explainability as the existence, or approximate existence, of hidden evolutions compatible with the observed compressed data.
- Step 6: construct a resource theory for these mechanisms, identifying free operations, simulation preorders, and monotones for memory, coordination, signaling, and dynamic complexity.
- Step 7: apply the framework to distributed and nonlocal scenarios, with the aim of distinguishing what is causally free, what must be built, and what may require genuinely stronger resources.
- Step 8: study bounded families of such resources and compare their explanatory and computational power with standard models from quantum information and complexity theory.

== Long Ambition

The large ambition of the thesis is to contribute a new explanatory language for science: one in which hidden mechanisms are not postulated as metaphysical absolutes, but modeled as finite or controlled dynamic structures; one in which observation is explicitly recognized as compressed access; one in which understanding is measured by what remains stable under reconstruction; and one in which the power of a theory is evaluated together with the resources that make it possible.

In its strongest form, the project asks whether a substantial part of what is currently described in highly abstract terms—especially in nonlocal and quantum settings—can be reorganized into a finitary theory of traces, hidden automata, compression, reconstruction, and resource-sensitive explanation. Even when this program does not replace existing formalisms, it may still reveal something essential: not merely whether a model fits, but what has to be built, preserved, and transmitted for that fit to count as scientific understanding.

= Philosophical Foundations

== Phenomena, Hidden Structure, and the Status of Truth

Any scientific theory of hidden mechanisms begins with a simple distinction. Some things are observed; other things are introduced in order to explain what is observed. In a broadly Kantian vocabulary, what inquiry receives is the _phenomenon_: the world as it appears under concrete conditions of observation, measurement, and thought. What may exist independently of those conditions can be called the _noumenon_, or thing-in-itself. Science does not grasp the _noumenon_ directly. It works from _phenomena_: data, traces, correlations, and measurable outcomes.

This point matters because experimental data are never a transparent window onto reality. They give access only through a specific interface: an apparatus, a protocol, a language of description, and a point of view. What is observed is therefore always partial, structured, and situated. A theory must begin from this modest fact: we do not start from reality fully given, but from appearances that must be interpreted.

At the same time, one should not turn the hidden side of explanation into a metaphysical absolute. In a broadly Nietzschean spirit, one may remain wary of the idea that behind appearances there stands a final and fully accessible "true world." That temptation is dangerous for science. It transforms a useful explanatory hypothesis into a dogma. For this reason, hidden functions, latent variables, or internal automata should not be treated as direct revelations of the _noumenon_. They are models. Their role is to organize what we observe, explain regularities, and support prediction.

This gives a clear methodological picture. On one side there are _phenomena_: outcomes, traces, correlations, summaries of traces. On the other side there are models of hidden structure: mechanisms proposed to account for those observations. The aim of theory is not to unveil a final essence, but to build and compare admissible models. These models are judged by how well they fit the data, how causally coherent they are, and how economical they are in structure and resources. A model is justified not because it reaches ultimate reality, but because, under explicit constraints, it explains the observable domain better than its competitors.

On this basis, truth must also be understood in a modest and operational sense. A statement, mechanism, or model is true only in the provisional sense that, among the models currently available, it gives the best explanation of the observed _phenomena_. Truth here does not mean absolute possession of the thing-in-itself. It means the current optimum of inquiry: the best explanatory model we presently know how to formulate and test. This notion is not arbitrary. It is constrained by observation, internal consistency, predictive success, and the cost of the resources required by the model. But it remains revisable, because both our observations and our model space can change.

Formally, let $O$ denote the observable data, and let $cal(M)_t$ be the class of models available at stage $t$ of inquiry. Let $op("Fit")(M; O)$ measure the explanatory cost of model $M$ with respect to the observations $O$. The currently accepted model is then

$ M_t^* in op("argmin", limits: #true)_(M in cal(M)_t) op("Fit")(M; O). $

Truth at stage $t$ is therefore not a final revelation. It is the model that minimizes explanatory cost within the presently available family of models. If new observations appear, if new hidden structures are invented, or if better criteria of evaluation are introduced, then the best model may change. Truth is dynamic not because reality fluctuates arbitrarily, but because scientific access to reality proceeds through revisable constructions.

This position gives a natural foundation for the study of hidden mechanisms. Observable data belong to the level of _phenomena_. Hidden functions, strategies, and automata belong to the level of explanatory hypotheses. Scientific work then consists in asking which hidden structures are compatible with the observed _phenomena_, which among them are more economical or more causally coherent, and what resources are required to realize them. In this framework, the search for hidden mechanisms is not a metaphysical claim to possess the _noumenon_. It is a disciplined effort to construct the best available account of appearances.

== Understanding as Reconstructive Stability

If truth is identified, provisionally, with the model that best fits observation, then understanding cannot be reduced to truth alone. A model may predict correctly and still remain opaque. It may fit the data while being too fragile to reuse, too obscure to teach, or too complex to reconstruct after interruption. For this reason, understanding must be defined at another level.

In this work, understanding is treated as a reconstructive capacity. To understand a structure is not simply to store a complete representation of it, nor merely to execute a formal procedure. It is to be able to recover enough of its organization to restart it after interruption, translate it into a nearby form, change its scale of description, and preserve its meaning under partial loss of memory or context. Understanding is therefore not static possession. It is stability through transformation.

This idea is inseparable from finitude. Reasoning, transmission, and interpretation do not occur in ideal minds with perfect memory and unlimited access. They occur in finite communities that forget, compress, select, and deform. Under these real conditions, the central question is not whether a representation is complete in principle, but whether it remains intelligible and revisable as it moves from one situated agent to another. A structure is understood when it survives this passage without collapsing into empty repetition or arbitrary reinterpretation.

Understanding therefore extends the provisional notion of truth introduced above. Truth asks: which model best explains what is observed? Understanding asks: can this model be reconstructed, resumed, compressed, and transmitted while preserving enough continuity with its previous uses? In short, truth concerns explanatory adequacy; understanding concerns reconstructive stability.

To make this precise, compression must appear explicitly. What circulates through a finite community is not usually the raw model itself, but a compressed and reformulated version of it. Let

$ C_K : cal(M) -> cal(C)_K $

be the compression induced by circulation through a community $K$, and let

$ R_K : cal(C)_K -> cal(M) $

be a reconstruction procedure. The reconstructed form of a model $M$ is then

$ hat(M)_K := R_K(C_K(M)). $

This suggests two distinct costs. A structural understanding cost measures distortion at the level of hidden models:

$ op("Understand-Cost")_"str" (M; K) = d_H(M, hat(M)_K). $

An observational understanding cost measures distortion at the level of observable consequences:

$ op("Understand-Cost")_"obs" (M; K) = d_O(op("Obs")(M), op("Obs")(hat(M)_K)). $

The first asks whether the hidden organization itself survives compression and reconstruction. The second asks whether the explanatory power of the model survives, even if the reconstructed hidden mechanism is not strictly identical to the original one. A model is therefore understood by a community when what matters in it remains sufficiently stable under the passage

$ M -> C_K(M) -> hat(M)_K. $

Under this view, inquiry does not aim only at correct description. It aims at representations that are faithful to observation and also compressible, resumable, and shareable within finite communities. Understanding is what allows truth to persist as more than an isolated success. It is what keeps a model alive.

== A Compact Formal Summary

The whole picture may be summarized in a simple chain.

- _Noumenon_: whatever may exist independently of our modes of access. It is a limiting idea, not a direct object of scientific observation.
- _Phenomenon_: what is actually given in inquiry—measurements, traces, outcomes, correlations, and experimentally accessible appearances.
- Model: a structured hypothesis that links hidden organization to observable consequences.
- Truth at time $t$: the currently best model among those available for explaining the observed _phenomena_.
- Understanding: the capacity of a community to reconstruct and stabilize that model after compression, transmission, and partial loss.

In compact form, one may write $M : $

$ M: H arrow O $

to indicate that a model connects a hidden structure $H$ to observable consequences $O$. Then truth selects the best currently available model,

$ M_t^* in op("argmin", limits: #true)_(M in cal(M)_t) op("Fit")(M; O), $

while understanding asks whether this model survives compression and reconstruction in practice. If

$ hat(M)_K := R_K(C_K(M)), $

then one may measure its stability either structurally or observationally through

$ d_H(M, hat(M)_K) quad text("and") quad d_O(op("Obs")(M), op("Obs")(hat(M)_K)). $

Science therefore moves from _phenomena_ to models, not from _phenomena_ to direct possession of the _noumenon_. Truth names the best current explanatory model. Understanding names the process by which that model becomes stable enough to be resumed, shared, and used again after compression. One may therefore say, in a concise formula, that truth selects and understanding stabilizes what survives compression.

== Version 2

This notion of understanding with explicit compression and decompression is not the only way to see.

#let env = $sans("ENV")$
#let model = $sans("M")$
Let's denote $env$ the environement, the community, the peaple that apply filter or compression model. The _phenomena_ will be not the same depending of $env$.

Let's $Pi^env : "Noumene" -> "Phenomene"^env$ the projection of the noumene space to the subjective phenomena of $env$.
Let $model^env : "Noumene" -> "Phenomene"^env $ the projection of the noumene space to our model of the Phenomena. We can then define the _truth_ of the model as the distance between $Pi^env$ and $model^env$. Why i say that the model depend of the environement ? Because the model is express by world, and a language is subjectif. So the model is subjectif. The is nothing we can agree without applying local filter. The true become local by nature : a model $model^*$ is true if $model^* = "argmin"_(M in cal(H)^env) "Fit"(Pi^env; model^env) $ where $cal(H)^env$ is the set of all the model i remember in my environement.

Before we say that understanding means create a stable model between two or multiple environement by transmission (compression and decompression). But what means stability, stability of what ? compare to what ? So i want to clarify this point. We can imagine understanding by taking our distance, zoom out the picture. This quantifier "Let $env_1$ and $env_2$" is quantifier from what believe ? We can consider multiple environement only by considering ones. To studies two environement we need to say that we are in the environement $env$ and we contain two other environement $env_1$ and $env_2$. But by doing that we add extra meaning to this two primitive environement because otherwise it would be not possible to consider it. But i claim that by doing this incociously we syncronous the two environement (If we say that an environement is a machine that do test at each click, we need to syncronise arbitrarily the two environement to studies it in the same global environement).

The syncronous mechanism come naturally when i try to understand multiple environement.

=== first exemple

Let say that our environement is $env$. We want to studies a game with two player for exemple CHSH game alice and bob. This not because we consider Alice and Bob that we can predict the comportement of this two players, but we can say because we consider that everyone is syncronous. We ask Alice and Bob a question $x$ and $y$, this means that our environement place the question into a register that is at the interface of Alice and Bob. We need to describe the possible process of Alice and Bob.

We can say that Alice and Bob ask at the same frequence that us the following : - Alice look him two register $Q_A$ and $A_A$ and ask question : What if $(Q_A,A_A) ? = (0,1)$ and what if $$

[
En fait le point que j'aimerai éclairssir c'est celui ci :
J'aimerai que Alice et Bob soit syncronisé mais que la fréquence d'execution différe seulement de deux, par exemple :
Alice a ses registres que change comme cela : $(0,0) (0,1) (1,1) (1,1)$ , nous nous voyons seulement $(0,0) (1,1)$ car on les groupes par deux et on interprete les différentes histoires compatibles par exemple on voit $(0,0)$ mais l'histoire réel (qu'on ne peut pas voir) est $(0,0) (0,1)$, comme si par la difference de fréquence on considére l'output comme étant en superposition ! En fait la superposition vient d'une différence de rythme d'interpretation entre nous, et un sous environement que nous considérons.
Puis j'aimerai aussi dire que l'intrication elle vient da la syncronisation de la manière de voir (de projete) deux traces, par exemple :
- Alice trace : $(0,0) (0,1)$
- Bob trace : $(0,0) (0,1)$

Si le résultat de Alice est $(0,0)$ alors celui de bob aussi car nous projetons de la meme manière entre les deux ! notre mesure est en phase !

Mais en considérons une mesure avec une phase de $pi/2$ alors on aurait une anti symétrie entre le résultat d'Alice et Bob.

]

== Superposition et intrication comme effets de projection

Dans le cadre proposé ici, ni la superposition ni l'intrication ne doivent être pensées comme des propriétés premières du réel en soi. Elles apparaissent au niveau du *phénomène*, c'est-à-dire au niveau du réel déjà filtré par un environnement d'observation. Elles ne décrivent donc pas immédiatement ce qui est, mais ce qui subsiste d'un processus plus fin après compression, découpage et mise en forme par un point de vue.

Soit un environnement $env$. Cet environnement n'accède pas au noumène comme à une totalité transparente. Il n'y accède qu'au moyen d'un filtre, qui impose une granularité, un rythme d'observation, et éventuellement une découpe en plusieurs interfaces locales. Autrement dit, le phénomène n'est jamais le réel brut. Il est le réel tel qu'il apparaît lorsqu'un environnement choisit comment le lire.

=== La superposition : un effet de résolution

La superposition peut être comprise comme un effet de *perte de résolution*. Supposons qu'un processus microscopique se déroule selon une suite fine d'événements, mais que l'environnement n'en observe que des blocs. Une même apparition visible peut alors correspondre à plusieurs micro-histoires incompatibles entre elles, mais indiscernables du point de vue du filtre adopté.

Soit $rho$ une micro-trace réelle, et soit $Pi^(env)(rho) = phi.alt$ le phénomène visible. Alors la classe :
$ (Pi^(env))^(-1)(phi.alt) $
désigne l'ensemble des micro-traces compatibles avec le même phénomène $phi.alt$. C'est cette *fibre* qui donne le contenu conceptuel de la superposition.

*Exemple du chemin :*
Remplaçons les registres par des micro-déplacements. Si une micro-trace est composée de deux pas (Horizontal ou Vertical) et que l'environnement n'observe que le déplacement total :
- Un déplacement diagonal $(1,1)$ peut provenir de $(H, V)$ ou $(V, H)$.
- La superposition est ici le fait qu'un même déplacement observable laisse ouvertes plusieurs histoires microscopiques.

=== L'intrication : un effet de partition

Là où la superposition vient d'une perte de finesse, l'intrication vient d'une *perte d'unité*. Un environnement peut imposer une découpe locale à un phénomène global, par exemple en considérant deux interfaces distinctes, Alice ($A$) et Bob ($B$).

Si l'environnement associe deux apparitions locales à une même micro-trace $rho$ :
$ Pi_A^(env)(rho) = phi.alt_A quad "et" quad Pi_B^(env)(rho) = phi.alt_B $
L'intrication est la cohérence résiduelle qui subsiste entre $phi.alt_A$ et $phi.alt_B$ parce qu'ils proviennent d'une seule et même cohérence plus profonde ($rho$). Elle n'est pas un excès de liaison, mais l'*échec partiel de la séparation*.

=== Synthèse

On peut condenser cette position en deux formules :

#block(fill: luma(240), inset: 8pt, radius: 4pt)[
  - *La superposition* est le résidu d'une multiplicité interne après compression.
  - *L'intrication* est le résidu d'une unité interne après séparation.
]

Dans le premier cas, plusieurs histoires demeurent sous une même apparition. Dans le second, une même histoire continue de parler à travers plusieurs apparitions locales.

Cette lecture éclaire la notion de *phase* : elle devient la mémoire du positionnement d'une apparition locale à l'intérieur de la structure fine que le filtre a effacée. Elle est la trace de ce que le découpage n'a pas réussi à supprimer.

=== Phase

#let hilber = $cal(H)_phi.alt^env$

Soit $env$ mon environement, soit $phi.alt$ un _phenomene_, c'est à dire une observation sous le prisme de mon environement.
On définit $hilber := (Pi^env)^(-1) (phi.alt)$ l'ensemble des micro traces compatibles avec mon observation.

Une phase est donné par rapport a une _structure de phase_, c'est une application : $T_phi.alt^env : hilber -> hilber$ cyclique d'ordre $m$.
Alors la phase de $rho in hilber$ est donné par sa position relatif dans l'orbite engendrée par $T_phi.alt^env$.


== Amélioration du cadre philosophique

#let arrowsq = $arrow.r.squiggly$

Le premier auteur est *Whitehead*, ce qu'il dit c'est que les noumènes n'existe pas en tant que choses mais en tant que processus. Il y a tout un pan de la philosophie qui tend a dire que les choses advienne par prises successif vers un futur pré existant. Nick Land dit par exemple que le proccessus capitalistique tend vers sa singularité, d'une certaine façon les possibles causes (on parle de rétro causalité) les manières dont le réel s'encre.
Il serait donc interessant de ne pas représenté simplement la micro trace comme existant et soi, mais comme se construisant vers un but : $e_1 arrowsq e_2 arrowsq dots arrowsq e_t$ tel que $e_t in G(e_1,dots,e_(t-1))$.

Un deuxième auteur, *Simondon* qui nous dit qu'il ne faut pas considérer l'individus comme unité première, mais comme le résultat d'un processus. Pour lui l'individus se forme par le terme d'un processus qui tend vers un but, le *préindividus* qui existe avant même la premier étape de sa formation. Pour lui l'individualisation est transductive, il se forme comme une cristalisation, à partir d'un germe local, une struture plus global émerge. Et selon lui l'individus existe forcement accompagné de son milieu associé, pour fabriquer de l'ordre donc une diminuation local d'entropie il faut la faire augmenter dans son milieu, pour permettre la cristalisation il faut dégager de la chaleur. Pour que l'homme évolue (accélartionisme de Nick Land) il faut qu'il crée le chaos.
Définissons donc un *champs préindividuels* $P$ et une opération d'individualisation, si on considére Alice et Bob on dira qu'on construira ces individus à partir du champs $P$ par : $P ->^(I^env) ("Alice","Bob",M)$ avec $M$ le reste du processus champs préindividuels.

En enfin *Uexküll* ...

== Problem of relativity

Le problème de mon modele de l'individus est le suivant

= Philo fundation - restart



= From Phenomena to Traces and Hidden Automata

The philosophical framework introduced above now needs a mathematical counterpart. If observation is always partial, then the primitive object of analysis should not be a fully transparent input-output table. It should be a process that unfolds in time and leaves a finite visible record. For this reason, the formal theory developed in this thesis begins not with correlations taken in isolation, but with events, traces, compressions, and hidden automata.

The central idea is simple. A hidden mechanism produces a run. A run gives rise to observable events. These observable events form a trace. In many cases, the observer does not keep the full trace, but only a compressed report of it. Explanation must therefore proceed across three levels:

- a hidden mechanism,
- a visible trace generated by one execution of that mechanism,
- a compressed observation actually available for scientific judgment.

This hierarchy is the formal version of the distinction introduced earlier between hidden structure and observable _phenomena_.

== Event Alphabet

Let $Sigma$ be a finite alphabet of observable events. An event is the smallest visible record produced during an experiment.

In the simplest setting, an event has the form

$ e = (a | x), $

where $x$ denotes an input, question, control setting, or experimental condition, and $a$ denotes the corresponding output or response.

In a multiparty setting, one may instead write

$ e = ((a_1, ..., a_k) | (x_1, ..., x_k)). $

The alphabet $Sigma$ is therefore not yet a space of hidden mechanisms. It is only the space of elementary observable records.

== Traces

A trace is a finite word over $Sigma$,

$ tau = e_1 e_2 ... e_n in Sigma^*. $

It represents the visible history produced by one execution of a process, or by a succession of elementary interactions viewed as one coherent run.

This point is methodologically important. A trace is not yet a theory, and it is not yet a probability distribution. It is the finite observable object that a theory must explain. In this framework, traces come before counts, summaries, or correlations, because those latter objects are obtained only after part of the trace structure has been forgotten.

== Hidden-State Automata

We model hidden mechanisms by finite automata equipped with hidden states and event-compatibility constraints.

A hidden-state automaton is a tuple

$ A = (Sigma, S, s_0, delta, E), $

where

- $Sigma$ is the event alphabet,
- $S$ is a finite set of hidden states,
- $s_0 in S$ is an initial state,
- $delta subset.eq S times S$ is a transition relation,
- $E : S -> 2^Sigma$ assigns to each hidden state the set of observable events compatible with that state.

The role of $A$ is explanatory. A hidden state does not denote a visible symbol. It denotes an internal configuration of the mechanism. An event is explained at a given stage when it is compatible with the hidden state occupied at that stage.

A trace $tau = e_1 ... e_n$ is said to be explainable by $A$ if there exists a sequence of hidden states

$ s_1, ..., s_n in S $

such that

$ (s_0, s_1) in delta, $

$ (s_(t-1), s_t) in delta text(" for all ") 2 <= t <= n, $

and

$ e_t in E(s_t) text(" for all ") 1 <= t <= n. $

The set of all traces explainable by $A$ will be denoted by $L(A) subset.eq Sigma^*$. A trace belongs to $L(A)$ exactly when its visible evolution can be lifted to a compatible hidden evolution.

== Compression and Partial Observation

In many situations, the observer does not retain the full trace. What is accessible is only a compressed summary. We therefore introduce an observation or compression map

$ pi : Sigma^* -> cal(O), $

where $cal(O)$ is a space of partial observations.

The most important example for the present thesis is Parikh compression. For each event $e in Sigma$, let

$ N_tau(e) = |{ t : e_t = e }| $

be the number of occurrences of $e$ in the trace $tau$. The corresponding Parikh map is

$ Psi : Sigma^* -> NN^Sigma, quad Psi(tau) = (N_tau(e))_(e in Sigma). $

The image $Psi(tau)$ forgets the order of events and keeps only their multiplicities. In that case, the observer no longer has access to the trace itself, but only to a count vector. This is important for experimental practice: the process may be interrupted at any time, and what remains available to the verifier may be only the accumulated counts rather than the detailed history.

== Explainability of Compressed Observations

Once compression is made explicit, the central inverse problem of the theory can be stated precisely. Given a hidden automaton $A$ and a partial observation $o in cal(O)$, one asks whether there exists a trace generated by the model whose compression agrees with the observation.

For a general compression map $pi : Sigma^* -> cal(O)$, we say that $o$ is explainable under $A$ if there exists a trace $tau in L(A)$ such that

$ pi(tau) = o. $

In the special case of Parikh compression, a count vector $hat(N) in NN^Sigma$ is explainable under $A$ if there exists a trace $tau in L(A)$ such that

$ Psi(tau) = hat(N). $

Equivalently, if one defines the Parikh image of the model by

$ Psi(A) = { Psi(tau) : tau in L(A) }, $

then $hat(N)$ is explainable under $A$ exactly when

$ hat(N) in Psi(A). $

This is a central point of the framework. The model does not directly explain a final probability table. It explains a hidden or partially hidden trace, and the observation is obtained by compressing that trace.

Because $L(A)$ is a regular language, Parikh's theorem implies that $Psi(A)$ is a semilinear subset of $NN^Sigma$. This matters for the later theory. It means that explainability of compressed observations is not an arbitrary property: it can be studied through finite combinatorial descriptions, semilinear membership questions, and optimization problems measuring distance to explainability.

== The Scientific Protocol

To formalize scientific mediation more explicitly, it is useful to distinguish three roles: a laboratory, an intermediary, and a verifier.

- The laboratory carries the hidden physical process.
- The intermediary observes a visible trace and compresses it into a communicable message.
- The verifier receives only that message and attempts to test it against an explanatory model.

The intermediary may be an honest scientist, but in interactive settings it may also be a strategic agent. This distinction is useful when one wants to separate the physical generation of data from the possibility that questions, resources, or reported answers are altered before reaching the verifier.

Let $Omega$ be an alphabet of micro-events internal to the laboratory, and let

$ rho in Omega^* $

be a micro-trace generated by the hidden process. The intermediary does not necessarily observe $rho$ directly. Instead, the intermediary accesses a visible trace through an observation map

$ op("Obs") : Omega^* -> Sigma^*. $

Thus the experimental trace is

$ tau = op("Obs")(rho). $

The intermediary then produces a message

$ m = C_S(tau) in cal(M), $

where

$ C_S : Sigma^* -> cal(M) $

is a compression or reporting map. The verifier, who sees only $m$, applies a reconstruction procedure

$ R_V : cal(M) -> 2^(Sigma^*) $

that assigns to the message a family of compatible traces.

Finally, the verifier compares these reconstructed traces with the language $L(A)$ of an explanatory automaton $A$. The message $m$ is explainable under $A$ when

$ R_V (m) inter L(A) != emptyset. $

In words: a scientific report is acceptable under the model if at least one trace compatible with the report is also compatible with the hidden dynamics of the model.

== Adversarial Mediation

The previous protocol becomes especially important in interactive complexity, where the intermediary is not neutral. One may think of a student, prover, or experimental delegate who carries a resource to a laboratory, chooses how the requested experiment is implemented, and then reports the result back to the verifier. In that setting, the verifier sends a nominal instruction $x$, but the laboratory may in fact receive a hidden instruction $tilde(x)$ chosen by the intermediary. Likewise, the laboratory may produce a hidden response $tilde(a)$ while the verifier receives a reported answer $a$.

This distinction is conceptually important. It prevents us from identifying the communicated answer with the underlying phenomenon too quickly. The observed message may be a transformed image of a deeper process. By making this mediation explicit, one can study at once the physical constraints on the laboratory and the strategic freedom of the communicating agents.

== Product Automata and Distributed Systems

Many of the motivating examples of this thesis come from distributed protocols and nonlocal games. In such settings, one does not have a single hidden automaton, but several local mechanisms evolving in parallel.

For each party $i in {1, ..., k}$, let

$ A_i = (Sigma_i, S_i, s_i^0, delta_i, E_i) $

be a local hidden automaton. A global model may then be built from a product construction

$ A_"glob" = A_1 crossproduct ... crossproduct A_k, $

whose hidden state space is the product

$ S = S_1 times ... times S_k, $

or, more generally,

$ S = S_1 times ... times S_k times Lambda $

if one wishes to include a shared hidden parameter $Lambda$ representing common preparation or shared memory. The global event alphabet is then

$ Sigma = Sigma_1 times ... times Sigma_k, $

so that an observable event takes the form

$ ((a_1, ..., a_k) | (x_1, ..., x_k)). $

This gives a precise entry point for nonlocal games. Instead of starting from a probability table $p(a_1, ..., a_k | x_1, ..., x_k)$, one starts from a distributed hidden process whose visible projection yields such events. Correlations are then understood as compressed summaries of a richer dynamical structure.

== Toward Bounded Locality

The formalism above is deliberately general, but one of its intended applications is more specific. In standard nonlocal-game models, shared entanglement is often treated as an unrestricted resource: the provers may use arbitrary states in arbitrary dimension. A central motivation of this thesis is to ask what changes when operational access to that hidden resource is explicitly bounded.

The guiding picture is the following. A distributed system may possess many copies of a shared resource, but in each round only a bounded local window of that resource can be accessed or measured. This separates several notions that are often conflated: the size of the hidden resource, the amount that can be jointly mobilized in one interaction, and the number of times fresh copies may be consumed. Later chapters will turn this intuition into a precise resource-theoretic hierarchy.

== The Basic Hierarchy

The formal theory developed here therefore starts from a strict hierarchy:

$ text("hidden run") -> text("trace") -> text("compressed observation"). $

One may refine this further by distinguishing

$ rho -> tau = op("Obs")(rho) -> m = C_S (tau). $

This order matters. If one starts directly from counts or correlations, then the sequential and local organization of the process has already been erased. By starting from traces and making compression explicit, one retains access to what has been forgotten and can ask which parts of the hidden mechanism remain reconstructible.

This is the point at which the theory truly begins. Once events, traces, hidden automata, compression maps, and reconstruction procedures are in place, one can formulate precise questions about explainability, comparison between models, causal constraints, locality, and resource cost. The next step will be to define how such hidden mechanisms may be compared, transformed, or simulated.

= Resource Theory in a Causal-Inferential Setting

The next step is to place the preceding formalism inside a broader causal-inferential framework. The guiding idea is that a scientific theory does not only describe what can influence what. It also describes what may be inferred from what, and how causal structure and inferential structure constrain one another. This is precisely the kind of perspective suggested by recent work on causal-inferential theories: one distinguishes a theory of causal influences, a theory of inference, and a rule explaining how the two interact. In the present thesis, this perspective provides the right setting for a theory of resources.

The point is important. A resource is not merely a physical object and not merely a family of probabilities. It is a structured means of producing messages under causal constraints, together with a rule for what those messages license us to infer about the hidden process that generated them. This is why the resource theory developed here must be simultaneously dynamic, causal, and inferential.

== Background Causal-Inferential Theory

We work relative to a background causal-inferential theory

$ T_"CI" = (cal(C), cal(I), Xi), $

where

- $cal(C)$ is a theory of admissible causal influences and causal wirings,
- $cal(I)$ is a theory of admissible inferences, including both Boolean support relations and Bayesian updates when desired,
- $Xi$ specifies how observable processes generated within $cal(C)$ induce inferential states in $cal(I)$.

The advantage of this separation is that one does not assume in advance that causation and inference must take their classical forms. A resource theory built relative to $T_"CI"$ can therefore keep open, at least in principle, the possibility that a quantum or otherwise nonclassical setting requires nonclassical notions of causal propagation, inferential update, or both.

== Dynamic Resources

The fundamental object is not an input-output box. It is a hidden dynamic protocol that generates traces and then messages. We therefore define a dynamic resource relative to $T_"CI"$ as a quintuple

$ R = (L, op("Obs"), C, Gamma_R, infinity_R), $

where

- $L = (Omega, Q, q_0, delta, F)$ is a hidden laboratory process,
- $op("Obs") : Omega^* -> Sigma^*$ maps hidden runs to visible traces,
- $C : Sigma^* -> cal(M)$ compresses visible traces into communicable messages,
- $Gamma_R in cal(C)$ is the admissible causal structure governing preparation, execution, and transmission,
- $infinity_R in cal(I)$ is the inferential structure associated with the messages produced by the resource.

The role of $infinity_R$ is to specify what can be inferred from a message. At minimum, it may assign to each message $m in cal(M)$ a Boolean support set

$ op("Supp")_R(m) subset.eq Sigma^*, $

consisting of the traces considered compatible with that message. In a Bayesian version, it may also assign a posterior distribution

$ P_R(- | m). $

The compatibility between causal generation and inference is enforced by $Xi$. In the present setting, this means at least that

$ op("Supp")_R(m) subset.eq { tau in L_Sigma(R) : C(tau) = m }, $

and, in the Bayesian case,

$ P_R(tau | m) = 0 text(" whenever ") C(tau) != m. $

In other words, inference must remain anchored to the traces that the resource can actually generate.

== Visible Faces of a Resource

Every resource can be viewed at several levels.

The visible trace language of $R$ is

$ L_Sigma(R) = { tau in Sigma^* : exists rho in L(L) text(" such that ") op("Obs")(rho) = tau }. $

The visible message language of $R$ is

$ L_"msg"(R) = { m in cal(M) : exists tau in L_Sigma(R) text(" such that ") C(tau) = m }. $

When $C = Psi$ is the Parikh map, the compressed image of the resource is

$ Psi(R) = { Psi(tau) : tau in L_Sigma(R) } subset.eq NN^Sigma. $

Thus a resource has at least three faces:

- a hidden causal face, given by $L$ and $Gamma_R$,
- a trace face, given by $L_Sigma(R)$,
- an inferentially accessible face, given by $L_"msg"(R)$ together with $infinity_R$.

This layered description is exactly what is needed if one wants to distinguish what the world produces, what is actually observed, and what a verifier is entitled to conclude.

== Free Resources

A free resource should capture what is available without any special distributed power. In the present framework, the natural criterion is causal: after the execution phase begins, no new forbidden causal influence should be created between the separated parts of the system.

It is convenient to distinguish a build phase from a run phase. During the build phase, common preparation, preshared memory, or installed correlations may be created. Once the run begins—one may think of this as the moment marked by a global GO signal—the admissible causal structure is restricted.

We therefore say that a resource is free when, after GO, its causal structure factorizes locally up to preshared common causes. In the bipartite case, this means that hidden states have the form

$ q = (q_A, q_B, lambda), $

where $lambda$ is a variable prepared before GO, and where outputs are generated locally, for example by relations of the form

$ a = f_A(x, q_A, lambda), quad b = f_B(y, q_B, lambda). $

Likewise, the post-GO dynamics must factorize conditionally on $lambda$. In this sense, a free resource is a dynamically local resource: correlations may come from preparation, common memory, or shared causes, but not from new prohibited influence created during execution.

== Free Operations

The resource theory is generated by a family of free operations. Intuitively, these are the operations that may degrade, relabel, reorganize, or combine resources without creating new forbidden causal power.

The minimal family contains the following transformations.

- Local preprocessing of inputs or control settings.
- Local postprocessing of outputs, traces, or messages.
- Addition of local ancillas, local clocks, or local work registers.
- Convex mixing by a preshared common cause prepared before GO.
- Coarse-graining or forgetting of hidden states, traces, or message coordinates.
- Additional compression of messages, that is, replacement of $C$ by $D circle C$.
- Parallel composition of resources.
- Serial composition of resources, provided the induced wiring remains admissible in $cal(C)$.

What is not free is equally important. One may not create new shared memory after GO, add a new hidden communication channel during the run, or introduce a forbidden cross-party influence not present in the original admissible causal structure.

In one sentence: a free operation may transform the description of a resource, but it may not create new distributed causal power.

== Convertibility

We write

$ R_1 -> R_2 $

when $R_2$ can be obtained from $R_1$ by a free operation. This defines a preorder of resource convertibility.

Several levels of convertibility are useful.

- Micro-convertibility compares the hidden laboratory processes themselves.
- Trace-convertibility compares the visible trace languages $L_Sigma(R)$.
- Observable convertibility compares only the messages or compressed observations available to the verifier.

In many early applications, observable convertibility will be the most tractable notion. For instance, in a Parikh-based setting one may ask whether $Psi(R_2)$ can be obtained from $Psi(R_1)$ by relabeling, coarse-graining, projection, or product construction.

Two resources are equivalent, written

$ R_1 equiv R_2, $

when each can simulate the other by free operations.

== Leibnizian Identification

The causal-inferential setting suggests a natural identification principle. If two resources have the same causal powers and the same inferential consequences, then they should not count as distinct at the operationally relevant level.

Accordingly, one may impose a Leibnizian equivalence relation by declaring that

$ R_1 equiv_"L" R_2 $

whenever

$ Gamma_(R_1) = Gamma_(R_2) $

and

$ infinity_(R_1)(m) = infinity_(R_2)(m) text(" for all ") m in cal(M). $

This principle is stronger than a purely operational identification and captures the spirit of a noncontextual comparison of resources: no distinction without a difference either in causal role or in inferential role.

== Resource Monotones

A resource monotone is a function

$ M : cal(R) -> RR_(>= 0) $

such that

$ R_1 -> R_2 => M(R_1) >= M(R_2). $

The present framework suggests several natural monotones.

- Build cost: the minimal cost of preparing the resource before GO.
- Shared-memory cost: the minimal size of the common variable $lambda$ required before GO.
- Signaling cost: the minimal amount of prohibited post-GO causal influence needed to realize the resource.
- Dynamic complexity: the number of hidden states, cycles, or nontrivial transitions required in the laboratory process.
- Inferential ambiguity: the residual uncertainty left by a message, for example
  $ M_"amb"(R) = sup_m log |op("Supp")_R(m)| $
  or, in a Bayesian version, the corresponding posterior entropy.
- Parikh capacity: the structural richness of $Psi(R)$, for instance through the dimension of its generated cone or the size of a minimal semilinear presentation.

These monotones do not measure the same thing. Some are causal, some dynamic, some inferential. That is precisely the point: a causal-inferential resource theory should be able to track what must be built, what may be inferred, and what cannot be generated for free.

== A First Working Subtheory

For concrete applications, it is useful to begin with a deliberately narrow subtheory. The most manageable starting point is the following.

- Two parties only.
- A build / GO / run decomposition.
- No communication after GO.
- Finite local automata.
- Classical preshared memory allowed before GO.
- Parikh compression as the visible message map.

This restricted theory is already rich enough to study nonlocal games, bounded locality, simulation between protocols, and the gap between full traces and compressed experimental records. It is also the natural place to define concrete classes of bounded resources, including later classes inspired by localized entanglement models.

== Conceptual Role of the Resource Theory

The philosophical picture can now be extended by one more layer. Truth selects the best model among those available. Understanding stabilizes what remains reconstructible after compression and transmission. Resource theory asks a different question: what had to be built, installed, shared, or protected in order for such an explanation to be physically or causally available at all?

In this sense, the three levels fit together:

- truth selects,
- understanding stabilizes,
- resource theory constrains what may legitimately underlie the explanation.

This is the role that the resource-theoretic perspective will play in the remainder of the thesis. It does not replace the theory of traces and hidden automata. It refines it by distinguishing those hidden mechanisms that are free, those that are costly, and those that may only appear when one allows stronger causal-inferential resources.

= Comptages discrets, hypergraphes contextuels et non-signaling


#v(3cm)
Cette section introduit un cadre discret pour les scénarios contextuels. L'idée de départ est simple : au lieu d'observer directement un modèle probabiliste, on observe des occurrences entières d'événements. Cela conduit naturellement à un problème de géométrie discrète : les modèles admissibles ne forment plus seulement un polytope de probabilités, mais un semi-groupe de points entiers dans le cône au-dessus de ce polytope.

Il est important de distinguer deux niveaux :

- le cadre général, valable pour un hypergraphe contextuel arbitraire ;
- le cas particulier des jeux bipartites de type Alice--Bob avec contraintes de non-signaling, et en particulier le scénario CHSH.

== Cadre général : hypergraphes contextuels et modèles discrets

Soit $G = (V,E)$ un hypergraphe fini. Les sommets $V$ représentent les événements élémentaires, et les hyperarêtes $E$ représentent les contextes de mesure, c'est-à-dire les familles d'événements qui doivent être normalisées ensemble.

Dans le modèle probabiliste usuel, un *modèle* est une fonction
$
  p : V -> RR_(>= 0)
$
telle que, pour toute arête $e in E$,
$
  sum_(v in e) p(v) = 1.
$

Dans toute cette section, nous voulons remplacer ces poids réels par des comptages entiers strictement positifs. L'intuition est que l'on part d'un fond uniforme minimal, puis que l'on ajoute des occurrences supplémentaires. Le caractère strictement positif joue ici un rôle technique important : il permet de comparer les normalisations de deux arêtes qui se coupent.

#proposition[
  Soit $G = (V,E)$ un hypergraphe, et soit $N : V -> NN^*$ un comptage strictement positif. Supposons qu'il existe une famille de constantes $(C_e)_(e in E)$ telle que, pour toute arête $e in E$,
  $
    p(v) = N(v) / C_e
  $
  définisse un modèle probabiliste valide sur $e$, c'est-à-dire
  $
    sum_(v in e) p(v) = 1.
  $
  Si le graphe d'intersection des arêtes de $G$ est connexe, alors il existe une unique constante globale $C in NN^*$ telle que
  $
    forall e in E, sum_(v in e) N(v) = C.
  $
]

#proof[
  Soit $e in E$. Par hypothèse,
  $
    sum_(v in e) p(v) = sum_(v in e) N(v) / C_e = 1,
  $
  donc
  $
    sum_(v in e) N(v) = C_e.
  $

  Soient maintenant $e,f in E$ telles que $e inter f != emptyset$, et soit $v in e inter f$. On a
  $
    N(v) / C_e = p(v) = N(v) / C_f.
  $
  Comme $N(v) > 0$, on en déduit $C_e = C_f$.

  La connexité du graphe d'intersection des arêtes implique alors que toutes les constantes $(C_e)_(e in E)$ sont égales à une même constante $C$. On obtient donc
  $
    forall e in E, sum_(v in e) N(v) = C.
  $

  L'unicité est immédiate : si $C$ et $C'$ vérifient tous deux cette propriété, alors pour n'importe quelle arête $e$,
  $
    C = sum_(v in e) N(v) = C'.
  $
  $square$
]

Cette proposition montre qu'en présence de positivité stricte et de connexité, le modèle discret possède une normalisation globale canonique. Autrement dit, même si la définition semble locale arête par arête, la structure d'intersection force une constante unique.

#definition[
  Soit $G = (V,E)$ un hypergraphe dont le graphe d'intersection des arêtes est connexe. Un *modèle discret strictement positif* sur $G$ est une application
  $
    N : V -> NN^*
  $
  telle qu'il existe une constante $C in NN^*$ vérifiant
  $
    forall e in E, sum_(v in e) N(v) = C.
  $
  Cette constante est appelée *constante de normalisation* du modèle.
]

Si l'on note $A$ la matrice d'incidence de $G$, définie par
$
  A_(e,v) = 1 quad text("si") quad v in e,
$
alors la condition précédente s'écrit simplement
$
  A N = C bb(1)_E.
$

Pour mettre en évidence la partie véritablement discrète du modèle, il est naturel d'écrire
$
  N = bb(1)_V + m
$
avec $m in NN^V$. Le vecteur $m$ représente le nombre d'occurrences *supplémentaires* par rapport au fond uniforme minimal $bb(1)_V$.

Lorsque l'hypergraphe est uniforme, cette décomposition est particulièrement simple. Si toutes les arêtes ont même taille $r$, alors
$
  A bb(1)_V = r bb(1)_E.
$
Par conséquent, l'équation $A N = C bb(1)_E$ devient
$
  A m = t bb(1)_E
  quad text("avec") quad
  t = C - r.
$

Le paramètre réellement observé dans la suite sera
$
  k(N) := sum_(v in V) m(v) = sum_(v in V) (N(v) - 1),
$
qui mesure le nombre total d'occurrences ajoutées au fond uniforme.

#proposition[
  Soit $G = (V,E)$ un hypergraphe $r$-uniforme et $d$-régulier. Soit $N = bb(1)_V + m$ un modèle discret strictement positif, et posons $k = sum_(v in V) m(v)$. Alors il existe un entier $t in NN$ tel que
  $
    A m = t bb(1)_E
  $
  et
  $
    d k = |E| t.
  $
  En particulier,
  $
    k = (|E|)/d t = (|V|)/r t.
  $
]

#proof[
  Comme $G$ est $r$-uniforme, on a $A bb(1)_V = r bb(1)_E$, donc toute solution de $A N = C bb(1)_E$ s'écrit bien
  $
    A m = (C-r) bb(1)_E = t bb(1)_E
  $
  avec $t in NN$.

  En sommant toutes les coordonnées de $A m$, on obtient d'une part
  $
    sum_(e in E) (A m)_e = sum_(e in E) t = |E| t.
  $
  D'autre part, comme chaque sommet appartient à exactement $d$ arêtes,
  $
    sum_(e in E) (A m)_e = d sum_(v in V) m(v) = d k.
  $
  Donc $d k = |E| t$.

  Enfin, l'identité $|E| r = |V| d$ donne immédiatement
  $
    (|E|)/ d = (|V|)/r
  $
  $square$
]

Cette proposition donne déjà une information forte : dans un scénario uniforme et régulier, les valeurs admissibles de $k$ ne sont pas arbitraires. Elles vivent dans une progression arithmétique déterminée par la combinatoire du scénario.

Il est maintenant naturel d'introduire l'objet algébrique associé :
$
  cal(S)(A) = { (m,t) in NN^V times NN : A m = t bb(1) }.
$
Il s'agit d'un semi-groupe affine de points entiers. Son enveloppe réelle est le cône polyédral rationnel
$
  cal(C)(A) = { (x,t) in RR_(>=0)^V times RR_(>=0) : A x = t bb(1) }.
$

Pour chaque niveau $t$, la section horizontale du cône est
$
  cal(C)(A) inter {t = "const"} = { x in RR_(>=0)^V : A x = t bb(1) } = t P(A),
$
où
$
  P(A) := { x in RR_(>=0)^V : A x = bb(1) }.
$
Ainsi, les modèles discrets de niveau $t$ sont exactement les points entiers de $t P(A)$ :
$
  {m in NN^V : A m = t bb(1)} = t P(A) inter ZZ^V.
$

Autrement dit, le passage des probabilités aux comptages ne change pas la géométrie affine de base ; il la remplace par un problème de points entiers dans les dilatations d'un polytope rationnel. C'est précisément le cadre de la théorie d'Ehrhart @linke2011rationalehrhartquasipolynomials.

#import "@preview/cetz:0.4.2"

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Style général
    set-style(
      stroke: 0.6pt,
      content: (padding: 2pt),
    )

    // ------------------------------------------------------------------
    // Schéma 3D simplifié du cône
    // ------------------------------------------------------------------

    // Sommets des trois tranches
    let p0 = (0.0, 0.0)

    let a1 = (-2.2, 1.8)
    let b1 = ( 0.8, 1.8)
    let c1 = ( 2.2, 3.0)
    let d1 = (-0.8, 3.0)

    let a2 = (-3.1, 3.5)
    let b2 = ( 1.1, 3.5)
    let c2 = ( 3.1, 5.1)
    let d2 = (-1.1, 5.1)

    let a3 = (-4.0, 5.3)
    let b3 = ( 1.4, 5.3)
    let c3 = ( 4.0, 7.2)
    let d3 = (-1.4, 7.2)

    // Arêtes du cône
    line(p0, a3, stroke: 0.8pt)
    line(p0, b3, stroke: 0.8pt)
    line(p0, c3, stroke: 0.8pt)
    line(p0, d3, stroke: 0.8pt)

    // Tranches t = 1, 2, 3 (en utilisant une liste de points)
    line(a1, b1, c1, d1, close: true, stroke: blue + 0.8pt)
    line(a2, b2, c2, d2, close: true, stroke: blue + 0.8pt)
    line(a3, b3, c3, d3, close: true, stroke: blue + 0.8pt)

    // Marques des niveaux t
    line((-5.0, 0.0), (-5.0, 7.7), mark: (end: ">"))
    content((-5.2, 0.0), anchor: "east", [$t=0$])
    content((-5.2, 2.4), anchor: "east", [$t=1$])
    content((-5.2, 4.3), anchor: "east", [$t=2$])
    content((-5.2, 6.3), anchor: "east", [$t=3$])
    content((-5.0, 8.1), [$t$])

    // Légendes des tranches
    content((4.7, 2.4), anchor: "west", [$P(A)$])
    content((4.9, 4.4), anchor: "west", [$2 P(A)$])
    content((4.9, 6.5), anchor: "west", [$3 P(A)$])

    // Point sommet
    circle(p0, radius: 0.06, fill: black)
    content((0.4, -0.3), [$0$])

    // Points entiers sur les tranches
    let pt-radius = 0.04
    // tranche t = 1
    circle((-1.1, 2.15), radius: pt-radius, fill: black)
    circle(( 0.0, 2.40), radius: pt-radius, fill: black)
    circle(( 1.0, 2.65), radius: pt-radius, fill: black)

    // tranche t = 2
    circle((-1.7, 4.05), radius: pt-radius, fill: black)
    circle((-0.4, 4.45), radius: pt-radius, fill: black)
    circle(( 0.9, 4.80), radius: pt-radius, fill: black)
    circle(( 1.9, 4.25), radius: pt-radius, fill: black)

    // tranche t = 3
    circle((-2.4, 5.95), radius: pt-radius, fill: black)
    circle((-1.0, 6.30), radius: pt-radius, fill: black)
    circle(( 0.7, 6.75), radius: pt-radius, fill: black)
    circle(( 2.3, 6.15), radius: pt-radius, fill: black)
    circle(( 3.0, 6.65), radius: pt-radius, fill: black)

    // Légende explicative
    circle((5.5, 0.7), radius: pt-radius, fill: black)
    content((5.7, 0.7), anchor: "west", [point entier de $cal(S)$])

    line((5.0, 1.3), (5.5, 1.3), stroke: blue + 0.8pt)
    content((5.7, 1.3), anchor: "west", [section $t$ fixée])

    line((5.0, 1.9), (5.5, 1.9), stroke: 0.8pt)
    content((5.7, 1.9), anchor: "west", [génératrice du cône])

    // Titre
    content((0.0, 8.8), [*Schéma du cône rationnel $cal(C)(A)$ et de son semi-groupe entier $cal(S)(A)$*])
  }),
  caption: [
    Représentation schématique de
    $cal(C)(A) = { (x,t) in RR_(>=0)^V times RR_(>=0) : A x = t bb(1) }$
    et de
    $cal(S)(A) = cal(C)(A) inter (ZZ^V times ZZ)$.
    Chaque tranche horizontale $t = "const"$ est un polytope dilaté $t P(A)$.
  ],
)

Le résultat général de la théorie d'Ehrhart s'applique donc immédiatement ici : si $P(A)$ est rationnel, la fonction
$
  Q_A (t) := \# (t P(A) inter ZZ^V)
$
est un quasi-polynôme en $t$ de degré $dim(P(A))$ ; si $P(A)$ est intégral, c'est un véritable polynôme @linke2011rationalehrhartquasipolynomials.

== Cas bipartite : Alice, Bob et contraintes de non-signaling

Considérons maintenant un scénario à deux joueurs. Les événements sont les quadruplets
$
  (a b | x y),
$
où $x$ et $y$ sont les questions de Alice et Bob, et $a$ et $b$ leurs réponses. Pour chaque contexte $(x,y)$, on note
$
  N(a b | x y) in NN
$
le nombre d'occurrences observées, et
$
  k_(x,y) := sum_(a,b) N(a b | x y)
$
le nombre total d'événements dans ce contexte.

Le modèle probabiliste associé est alors
$
  p(a b | x y) := N(a b | x y) / k_(x,y).
$

La condition de non-signaling s'écrit classiquement
$
  p(a | x 0) = p(a | x 1)
  quad text("et") quad
  p(b | 0 y) = p(b | 1 y).
$
En termes de comptages, ces égalités deviennent après élimination des dénominateurs :
$
  k_(x,1) N_A(a | x,0) = k_(x,0) N_A(a | x,1),
$
et
$
  k_(1,y) N_B(b | 0,y) = k_(0,y) N_B(b | 1,y),
$
où
$
  N_A(a | x,y) := sum_b N(a b | x y)
  quad text("et") quad
  N_B(b | x,y) := sum_a N(a b | x y).
$

Cette écriture montre bien la différence entre probabilités et comptages. Dans le cadre probabiliste, on obtient des relations affines. Dans le cadre discret, les dénominateurs dépendent eux-mêmes des données et imposent des contraintes arithmétiques supplémentaires.

L'hypergraphe contextuel permet précisément de linéariser cette situation. Les sommets sont les événements $(a b | x y)$, et les hyperarêtes codent à la fois les contextes et les identifications imposées par le non-signaling. Le polytope probabiliste non-signaling apparaît alors comme
$
  G_"NS" (A) = { p in RR_(>=0)^V : A p = bb(1) } = P(A),
$
tandis que les modèles discrets correspondent aux points entiers des dilatations $t G_"NS"(A)$.

Une intuition utile est la suivante : les probabilités décrivent une coupe affine du cône, alors que les comptages décrivent le semi-groupe entier situé sur les différentes tranches de ce cône. Plus le niveau $t$ est élevé, plus la résolution arithmétique est fine et plus on peut réaliser de points rationnels du polytope.

=== Exemple élémentaire : un effet arithmétique absent au niveau probabiliste

Considérons la configuration partielle
$
  N = mat(3,1,.,.;
    1,1,a,b;
  .,.,.,.;
  .,.,.,.;)
$
sur un scénario de type CHSH. La normalisation sur le contexte $(0,0)$ donne alors
$
  p = mat(1/2,1/6,.,.;
    1/6,1/6,a,b;
  .,.,.,.;
  .,.,.,.;)
$
pour les probabilités correspondantes.

Supposons maintenant qu'une arête de non-signaling impose
$
  1/2 + 1/6 + a + b = 1.
$
Au niveau probabiliste, cette relation admet une infinité de solutions réelles positives. Au niveau des comptages, en revanche, $a$ et $b$ doivent provenir d'entiers après renormalisation, ce qui force ici une solution discrète unique. Cet exemple illustre bien que le modèle de comptage n'est pas une simple reformulation du modèle probabiliste : il possède une rigidité arithmétique propre.

== Le scénario CHSH

Dans le scénario CHSH, l'hypergraphe contextuel possède $16$ sommets, correspondant aux événements $(a b | x y)$ avec $a,b,x,y in {0,1}$, et $12$ hyperarêtes : quatre arêtes de contexte et huit arêtes venant des contraintes de non-signaling. Chaque arête contient $4$ sommets, et chaque sommet appartient à exactement $3$ arêtes.

Dans ce cas, si l'on écrit
$
  N = bb(1) + m,
$
alors le paramètre d'excès
$
  k := sum_(v in V) m(v) = sum_(v in V) (N(v) - 1)
$
mesure le nombre total d'occurrences ajoutées au fond uniforme sur les $16$ événements.

#proposition[
  Dans le scénario CHSH, tout modèle discret strictement positif vérifie
  $
    A m = t bb(1)
  $
  pour un certain $t in NN$, et
  $
    k = 4 t.
  $
  En particulier, il n'existe aucun modèle discret pour $k = 1,2,3$, et plus généralement pour tout $k$ non multiple de $4$.
]

#proof[
  Dans CHSH, chaque arête a taille $4$, donc
  $
    A bb(1) = 4 bb(1).
  $
  Par conséquent, toute solution de $A N = C bb(1)$ s'écrit
  $
    A m = (C-4) bb(1) = t bb(1).
  $

  En sommant les coordonnées de $A m$, on obtient d'une part
  $
    sum_(e in E) (A m)_e = 12 t,
  $
  puisqu'il y a $12$ arêtes.

  D'autre part, chaque sommet appartient à exactement $3$ arêtes, donc
  $
    sum_(e in E) (A m)_e = 3 sum_(v in V) m(v) = 3 k.
  $
  On conclut que
  $
    12 t = 3 k,
  $
  donc
  $
    k = 4 t.
  $
  $square$
]

Cette simple identité explique immédiatement le phénomène observé expérimentalement : les niveaux $k=1,2,3$ sont interdits pour une raison combinatoire globale, et non à cause d'un accident local.

#proposition[
  Dans le scénario CHSH, les modèles discrets de niveau $k=4$ sont exactement les modèles déterministes locaux.
]

#proof[
  Si $k=4$, la proposition précédente donne $t=1$. On a donc
  $
    A m = bb(1).
  $
  Comme $m in NN^V$, cela signifie que, sur chaque hyperarête, la somme des coordonnées de $m$ vaut $1$. Il y a donc exactement un sommet marqué par une unité sur chaque arête, tous les autres sommets portant la valeur $0$.

  Autrement dit, $m$ sélectionne un transversal exact du scénario CHSH. Mais dans ce scénario, les transversaux exacts sont précisément les stratégies déterministes locales : pour chaque entrée $(x,y)$, on choisit un unique événement $(a b | x y)$, et la compatibilité entre les arêtes de non-signaling impose que ces choix proviennent de deux fonctions locales $a = a(x)$ et $b = b(y)$.

  Réciproquement, toute stratégie déterministe locale définit un tel transversal exact, donc un modèle discret de niveau $k=4$.
  $square$
]

Ainsi, le premier niveau non trivial du modèle discret ne révèle encore aucune non-localité : il reconstruit exactement les sommets déterministes du polytope local.

#proposition[
  Dans le scénario CHSH, les premiers modèles discrets intrinsèquement non locaux apparaissent au niveau $k=8$.
]

#proof[
  Les sommets extrémaux non locaux du polytope non-signaling de CHSH sont les boîtes PR. Leurs coordonnées sont de la forme $0$ ou $1/2$. Elles ne peuvent donc pas être réalisées comme vecteurs entiers au niveau $t=1$.

  En revanche, le vecteur $2 p$ associé à une boîte PR est entier. Son premier relèvement discret apparaît donc au niveau $t=2$. Par la relation $k = 4 t$, cela correspond à
  $
    k = 8.
  $
  $square$
]

Ce résultat donne une borne inférieure nette pour l'apparition de la non-localité dans le modèle discret : les sommets locaux apparaissent à $k=4$, tandis que les premières briques non locales apparaissent à $k=8$.

=== Comptage des modèles discrets

Dans CHSH, on note
$
  Q_"NS" (t) := \# (t G_"NS" ("CHSH") inter ZZ^16)
$
le nombre de modèles discrets non-signaling au niveau $t$, et
$
  Q_"loc" (t) := \# (t L_"loc" ("CHSH") inter ZZ^16)
$
le nombre de modèles discrets locaux au même niveau.

Le polytope non-signaling de CHSH est rationnel, tandis que le polytope local est intégral. On obtient donc :

- $Q_"NS"(t)$ est un quasi-polynôme d'Ehrhart ;
- $Q_"loc"(t)$ est un polynôme d'Ehrhart ;
- dans les deux cas, le degré est la dimension affine du polytope considéré.

Pour CHSH, cette dimension vaut $8$. Le nombre de modèles discrets croît donc comme une fonction polynomiale de degré $8$ sur les niveaux admissibles.

#proposition[
  Dans le scénario CHSH, si l'on note $M_"disc" (k)$ le nombre de modèles discrets de paramètre $k$, alors
  $
    M_"disc" (k) = 0 quad text("si") quad 4 text(" ne divise pas ") k,
  $
  et, pour $k = 4 t$,
  $
    M_"disc" (k) = Q_"NS" (t).
  $
  En particulier, sur les valeurs admissibles de $k$, le nombre de modèles discrets est régi par un quasi-polynôme de degré $8$.
]

Ceci peut être rendu complètement explicite. Un calcul exact des points entiers pour les premières dilatations, suivi d'une interpolation d'Ehrhart, donne :

#proposition[
  Dans CHSH, le polynôme d'Ehrhart du polytope local est
  $
    Q_"loc" (t)
    =
    1
    + 71/21 t
    + 6053/1260 t^2
    + 697/180 t^3
    + 91/45 t^4
    + 13/18 t^5
    + 31/180 t^6
    + 31/1260 t^7
    + 1/630 t^8.
  $

  Le quasi-polynôme d'Ehrhart du polytope non-signaling est
  $
    Q_"NS" (t)
    =
    17/10080 t^8
    + 17/630 t^7
    + 7/36 t^6
    + 37/45 t^5
    + 1607/720 t^4
    + 359/90 t^3
    + 290/63 t^2
    + 332/105 t
    + 63/64
    + (-1)^t / 64.
  $
]

Ces formules méritent quelques commentaires conceptuels.

D'abord, le degré vaut $8$ parce que le scénario CHSH n'a que $8$ degrés de liberté affines. En effet, les $16$ probabilités $p(a b | x y)$ ne sont pas indépendantes : une paramétrisation standard du polytope non-signaling consiste à choisir les deux marges d'Alice
$
  u_x := p(a=0|x),
$
les deux marges de Bob
$
  v_y := p(b=0|y),
$
et les quatre corrélations
$
  c_(x y) := p(00|x y).
$
Toutes les coordonnées se reconstruisent alors par
$
  p(00|x y) = c_(x y), quad
  p(01|x y) = u_x - c_(x y), quad
  p(10|x y) = v_y - c_(x y), quad
  p(11|x y) = 1 - u_x - v_y + c_(x y).
$
Le polytope non-signaling a donc dimension affine $8$, et le polytope local a le même espace affine. Par le théorème d'Ehrhart, cela force $Q_"loc"(t)$ et $Q_"NS"(t)$ à être de degré $8$ @linke2011rationalehrhartquasipolynomials.

Ensuite, le coefficient dominant a une interprétation géométrique directe : pour un polytope de dimension $d$, c'est le volume normalisé. Ici,
$
  8! dot 1/630 = 64,
  quad
  8! dot 17/10080 = 68.
$
Autrement dit, les volumes normalisés du polytope local et du polytope non-signaling valent respectivement $64$ et $68$. Le coefficient de degré $7$ mesure de même la moitié du volume normalisé du bord, tandis que le terme constant vaut $1$ pour un polytope entier.

La différence entre polynôme et quasi-polynôme a elle aussi une signification claire. Le polytope local est intégral, car ses sommets déterministes sont entiers. En revanche, le polytope non-signaling a des sommets PR dont les coordonnées sont dans ${0,1/2}$. Le terme oscillant
$
  (-1)^t / 64
$
provient exactement de cette demi-intégralité : il exprime le fait que les dilatations paires et impaires rencontrent le réseau de façon différente.

Enfin, les coefficients intermédiaires sont mieux compris dans la base du $h^*$-polynôme que dans la base monomiale. Pour un polytope entier $P$ de dimension $d$, on écrit
$
  sum_(t>=0) Q_P(t) z^t = h_P^*(z) / (1-z)^(d+1),
$
et les coefficients de $h_P^*$ sont des entiers positifs qui raffinent l'information combinatoire du polytope @beck2020decompositionsehrharthstar. Dans le cas local, on obtient
$
  h_"loc"^*(z) = 1 + 7 z + 20 z^2 + 28 z^3 + 7 z^4 + z^5,
$
soit le vecteur
$
  h_"loc"^* = (1,7,20,28,7,1,0,0,0).
$
On vérifie alors :

- $h_0^* = 1$ ;
- $h_1^* = 16 - (8+1) = 7$ ;
- $sum_i h_i^* = 64$, ce qui redonne le volume normalisé ;
- $h_8^* = 0$, ce qui signifie qu'il n'y a pas de point entier dans l'intérieur du polytope local.

Quelques remarques supplémentaires permettent de mieux situer ces nombres dans la littérature.

Premièrement, le *volume normalisé* ne se calcule pas dans l'espace ambiant $RR^16$ avec la mesure usuelle, mais dans le réseau affine naturel
$
  Lambda_"CHSH" := "aff"(G_"NS"("CHSH")) inter ZZ^16.
$
Dire que le volume normalisé vaut $64$ ou $68$ signifie donc que, dans ce réseau de dimension $8$, le volume euclidien a été renormalisé de sorte qu'un simplexe unimodulaire ait volume $1/8!$. C'est cette convention qui fait apparaître directement le coefficient dominant du polynôme d'Ehrhart. Autrement dit, les nombres $64$ et $68$ mesurent la "taille discrète" effective des deux polytopes dans leur géométrie affine intrinsèque, et non dans les $16$ coordonnées redondantes de départ.

Deuxièmement, le coefficient de degré $7$ contrôle la contribution du bord. Pour un polytope entier, il s'identifie à la moitié du volume normalisé des facettes, chaque facette étant mesurée dans son propre réseau induit. Conceptuellement, cela signifie que le second terme asymptotique compte la masse des points entiers qui s'accumulent près du bord lorsque l'on dilate le polytope. Le terme dominant voit le "bulk", tandis que le coefficient suivant voit le "boundary layer". Cette lecture est particulièrement utile ici : elle montre que la différence entre local et non-signaling ne porte pas seulement sur quelques sommets extrémaux, mais modifie déjà la géométrie globale du bord du polytope.

Troisièmement, la période $2$ de $Q_"NS"$ est exactement ce que prédit la théorie générale des polytopes rationnels. Le quasi-polynôme d'Ehrhart d'un polytope rationnel a une période divisant le dénominateur commun de ses sommets. Dans CHSH, les sommets locaux sont entiers, tandis que les sommets PR vivent sur le demi-réseau $(1/2) ZZ^16$. Le dénominateur pertinent est donc $2$, et l'oscillation en $(-1)^t$ exprime que les dilatations paires "voient" entièrement les sommets PR, alors que les dilatations impaires ne les voient qu'après translation fractionnaire. C'est la trace arithmétique la plus simple possible d'une non-intégralité géométrique.

Quatrièmement, la réciprocité d'Ehrhart donne un autre angle d'analyse. Pour un polytope entier de dimension $d$, la valeur $(-1)^d Q_P(-t)$ compte les points entiers dans l'intérieur de $t P$. Dans le cas local, le fait que $h_8^* = 0$ indique déjà qu'il n'y a pas de point entier intérieur au niveau $t=1$. Plus généralement, l'annulation des derniers coefficients du $h^*$-vecteur signale que, du point de vue du réseau, le polytope local est relativement "mince" dans ses grandes profondeurs intérieures. Cette lecture est souvent plus informative que celle des coefficients monomiaux pris isolément.

Enfin, le $h^*$-vecteur local
$
  (1,7,20,28,7,1,0,0,0)
$
est intéressant en lui-même. La somme vaut $64$, donc redonne le volume normalisé. Le fait que les coefficients soient concentrés dans les petits degrés signifie que l'essentiel de la combinatoire discrète du polytope local est portée par les premières couches de dilatation. Inversement, le polytope non-signaling, parce qu'il n'est pas entier, se prête moins directement à un unique $h^*$-vecteur classique ; il faut alors passer à la version rationnelle de cette théorie, où l'information se répartit sur plusieurs composantes périodiques @beck2020decompositionsehrharthstar.

#proposition[
  Si l'on note
  $
    Q_"nonloc" (t) := Q_"NS" (t) - Q_"loc" (t),
  $
  alors le nombre de modèles discrets non locaux au niveau $t$ vaut
  $
    Q_"nonloc" (t)
    =
    1/10080 t^8
    + 1/420 t^7
    + 1/45 t^6
    + 1/10 t^5
    + 151/720 t^4
    + 7/60 t^3
    - 253/1260 t^2
    - 23/105 t
    - 1/64
    + (-1)^t / 64.
  $

  En particulier,
  $
    Q_"nonloc" (t) ~ 1/10080 t^8 + O(t^7)
    quad text("quand") quad
    t -> infinity.
  $
]

Comme $Q_"NS" (t) ~ 17/10080 t^8$ et $Q_"loc" (t) ~ 16/10080 t^8$, on obtient une proportion asymptotique particulièrement simple :
$
  (Q_"nonloc" (t))/(Q_"NS" (t)) -> 1/17,
  quad
  (Q_"loc" (t) )/( Q_"NS" (t)) -> 16/17.
$

En termes du paramètre $k = 4 t$, le nombre de modèles discrets non locaux est donc nul si $4$ ne divise pas $k$, et pour $k = 4 t$ il vaut
$
  M_"nonloc" (k) = Q_"nonloc" (k/4) = k^8 / 660602880 + O(k^7).
$

Cette reformulation est conceptuellement importante : le problème du comptage des modèles discrets n'est rien d'autre que le problème d'Ehrhart associé au polytope non-signaling du scénario.

== Traces de construction et distance au non-signaling

Jusqu'ici, nous avons considéré un modèle discret final $N$. Mais pour l'interprétation physique, il est naturel de tenir compte de son histoire de construction. Une observation peut en effet résulter d'une suite de micro-événements ajoutés les uns après les autres.

Soit donc une observation finale $tilde(N) = bb(1) + m$. Une première idée consiste à représenter sa construction par une suite
$
  tau = e_1 dots e_k
$
où chaque $e_i$ ajoute une unité sur un sommet. Les modèles partiels seraient alors
$
  tilde(N)_t := bb(1) + sum_(s=1)^t e_s.
$

Cette intuition est naturelle, mais elle rencontre immédiatement une difficulté structurelle dans CHSH : comme il n'existe aucun modèle discret pour $k=1,2,3$, une trace événement par événement ne peut presque jamais rester entièrement à l'intérieur du semi-groupe non-signaling. Le fait d'imposer
$
  B(N) = 0
$
avec une telle notion de trace serait donc trop restrictif, sauf dans des cas triviaux.

La bonne notion de trace doit probablement être formulée non pas en termes d'événements élémentaires, mais en termes de *générateurs* du semi-groupe $cal(S)(A)$.

#definition[
  Un *semi-groupe* est un ensemble $S$ muni d'une loi interne $+: S times S -> S$ associative. Dans ce texte, nous considérons essentiellement des *semi-groupes additifs commutatifs* de la forme $S subset NN^n$ (ou $S subset NN^n times NN$) munis de l'addition terme à terme, c'est-à-dire des sous-ensembles stables par addition :
  $
    forall u,v in S, u+v in S.
  $

  Soit $S subset NN^n$ un semi-groupe additif *finiement engendré*. Une *base de Hilbert* de $S$ est un ensemble fini $H subset S$ tel que :
  - tout élément de $S$ s'écrit comme somme finie d'éléments de $H$ (avec répétition), i.e.
    $
      forall s in S, exists r in NN, exists h_1, dots, h_r in H, s = h_1 + dots + h_r ;
    $
  - $H$ est *minimal pour l'inclusion* parmi les ensembles qui engendrent $S$.

  Lorsque $S$ est un semi-groupe *affine pointé* (par exemple $S = C inter ZZ^n$ avec $C$ un cône polyédral rationnel pointé), cette base de Hilbert est unique et coïncide avec l'ensemble des éléments indécomposables de $S$.
]

#definition[
  Soit $Gamma subset cal(S)(A)$ une famille génératrice du semi-groupe discret. Une *trace génératrice* d'un modèle $(m,t) in cal(S)(A)$ est une suite
  $
    gamma_1, dots, gamma_r in Gamma
  $
  telle que
  $
    gamma_1 + dots + gamma_r = (m,t).
  $
]

Dans le cas CHSH, les candidats naturels pour une telle famille génératrice sont :

- les $16$ générateurs déterministes locaux de niveau $t=1$ ;
- les $8$ générateurs de type PR de niveau $t=2$.

Cela conduit à une question structurelle centrale : quelle est la base de Hilbert du semi-groupe
$
  cal(S)("CHSH") = { (m,t) in NN^16 times NN : A m = t bb(1) } ?
$

L'hypothèse la plus naturelle, suggérée par les calculs exploratoires, est que cette base est précisément constituée des $16$ générateurs déterministes et des $8$ générateurs PR. Si cette conjecture est correcte, alors toute observation discrète non-signaling dans CHSH se décompose en une somme de briques locales et de briques PR, ce qui fournit une notion beaucoup plus robuste de trace.

=== Base de Hilbert dans CHSH

Pour chaque stratégie déterministe locale $p_lambda$, on note
$
  d_lambda := p_lambda in {0,1}^16.
$
Alors
$
  A d_lambda = bb(1).
$
De même, pour chaque boîte PR extrémale $p_mu^"PR"$, on pose
$
  r_mu := 2 p_mu^"PR" in {0,1}^16,
$
de sorte que
$
  A r_mu = 2 bb(1).
$
On introduit donc la famille candidate
$
  cal(H)_"CHSH" := { (d_lambda,1) }_(lambda=1)^16 union { (r_mu,2) }_(mu=1)^8 subset cal(S)("CHSH").
$

Le point délicat est le lemme de support suivant, utilisé ici comme un fait établi par vérification exhaustive. Pour tout élément non nul $(m,t) in cal(S)("CHSH")$, il existe un générateur $(u,s) in cal(H)_"CHSH"$ tel que
$
  forall v in V, u_v <= m_v.
$
Autrement dit, le support de $m$ contient le support d'un générateur déterministe ou PR.

Cette propriété a été vérifiée par énumération exhaustive des $2^16 - 1 = 65535$ supports non vides. Pour chaque partie $S subset V$, on teste s'il existe $q in RR_(>= 0)^V$ et $tau >= 1$ tels que
$
  A q = tau bb(1),
$
avec $q_v >= 1$ pour $v in S$ et $q_v = 0$ pour les sommets hors de $S$. Si une telle solution réelle existe, elle peut être choisie rationnelle puis multipliée par un dénominateur commun, ce qui produit un élément entier $(m,t) in cal(S)("CHSH")$ de support exactement $S$. Le calcul montre alors que tout support réalisable contient le support de l'un des $24$ générateurs de $cal(H)_"CHSH"$.

#proposition[
  Dans le scénario CHSH, l'ensemble
  $
    cal(H)_"CHSH" = { (d_lambda,1) }_(lambda=1)^16 union { (r_mu,2) }_(mu=1)^8
  $
  est une base de Hilbert du semi-groupe
  $
    cal(S)("CHSH") = { (m,t) in NN^16 times NN : A m = t bb(1) }.
  $
]

#proof[
  Par construction, tous les éléments de $cal(H)_"CHSH"$ appartiennent à $cal(S)("CHSH")$.

  Les générateurs déterministes $(d_lambda,1)$ sont irréductibles, car toute décomposition
  $
    (d_lambda,1) = (m_1,t_1) + (m_2,t_2)
  $
  dans $cal(S)("CHSH")$ imposerait $t_1 + t_2 = 1$, donc l'un des deux termes serait nul.

  Les générateurs PR $(r_mu,2)$ sont eux aussi irréductibles. En effet, une décomposition non triviale
  $
    (r_mu,2) = (m_1,t_1) + (m_2,t_2)
  $
  forcerait $t_1 = t_2 = 1$. On aurait donc $A m_i = bb(1)$ pour $i=1,2$, de sorte que $m_1$ et $m_2$ seraient deux modèles déterministes locaux. On obtiendrait alors
  $
    p_mu^"PR" = 1/2 m_1 + 1/2 m_2,
  $
  ce qui écrirait une boîte PR comme combinaison convexe de boîtes déterministes, contradiction.

  Il reste à montrer que $cal(H)_"CHSH"$ engendre tout le semi-groupe. On procède par récurrence sur $t$. Si $t=0$, alors $A m = 0$, et comme chaque sommet appartient à au moins une arête, on obtient nécessairement $m=0$.

  Supposons maintenant le résultat vrai à tout niveau strictement inférieur à $t$, et soit $(m,t) in cal(S)("CHSH")$ avec $t >= 1$. Par le lemme de support, il existe $(u,s) in cal(H)_"CHSH"$ tel que $u_v <= m_v$ pour tout $v in V$. On peut donc poser $m' := m-u in NN^16$. Comme $(u,s) in cal(S)("CHSH")$, on a
  $
    A m' = A(m-u) = (t-s) bb(1),
  $
  donc $(m', t-s) in cal(S)("CHSH")$. De plus, $s in {1,2}$, donc $t-s < t$. L'hypothèse de récurrence donne alors une décomposition de $(m', t-s)$ en somme d'éléments de $cal(H)_"CHSH"$, et en y ajoutant $(u,s)$ on obtient une décomposition de $(m,t)$.

  Ainsi $cal(H)_"CHSH"$ engendre $cal(S)("CHSH")$. Enfin, aucun élément de $cal(H)_"CHSH"$ n'appartient au sous-semi-groupe engendré par les autres, puisqu'un tel fait fournirait une décomposition non triviale d'un élément irréductible. L'ensemble $cal(H)_"CHSH"$ est donc minimal pour l'inclusion parmi les familles génératrices, autrement dit c'est une base de Hilbert.
  $square$
]

Ce résultat doit être lu comme une proposition assistée par ordinateur : le seul ingrédient non encore démontré à la main est le lemme de support, tandis que le reste de la preuve est purement formel.

Dans ce cadre, la distance au non-signaling peut être reformulée de manière plus stable. Si l'on note
$
  cal(M)(G,k) := { N : V -> NN^* : exists C, A N = C bb(1) quad text("et") quad sum_(v in V) (N(v)-1) = k },
$
on peut définir
$
  ||N||_"ns" := min_(k in NN, M in cal(M)(G,k)) ||M - N||_1.
$

L'idée serait ensuite d'évaluer non plus une trace élémentaire, mais une trace génératrice, et de poser
$
  gamma_i = (m_i,t_i)
$
pour chaque générateur apparaissant dans la trace. Si
$
  m^(s) := sum_(i=1)^s m_i,
$
on peut alors définir
$
  B_Gamma (N) := min_(tau = (gamma_1,dots,gamma_r)) max_(1 <= s <= r) ||bb(1) + m^(s)||_"ns".
$
Une telle quantité mesurerait l'écart maximal à la structure non-signaling tout au long d'une décomposition canonique de $N$.

== Synthèse et programme

Les résultats précédents suggèrent la structure suivante.

- Pour un hypergraphe contextuel arbitraire, les modèles discrets strictement positifs sont gouvernés par l'équation linéaire $A N = C bb(1)$.
- Après soustraction du fond uniforme, on obtient un semi-groupe affine $cal(S)(A)$ et un cône rationnel $cal(C)(A)$.
- Le comptage des modèles discrets à niveau fixé relève alors de la théorie d'Ehrhart.
- Dans CHSH, la combinatoire du scénario impose la relation $k = 4 t$.
- Le premier niveau non trivial $k=4$ correspond exactement aux modèles déterministes locaux.
- Les premières briques intrinsèquement non locales apparaissent à $k=8$, via les boîtes PR.

Ces observations ouvrent plusieurs directions naturelles.

- Déterminer la base de Hilbert de $cal(S)(A)$ pour CHSH puis pour d'autres scénarios.
- Comparer systématiquement le semi-groupe non-signaling et le semi-groupe local.
- Étudier, pour un scénario donné, la borne inférieure sur $k$ nécessaire pour réaliser toutes les stratégies à variables cachées.
- Reformuler la notion de trace de construction en termes de décompositions semi-groupales plutôt qu'en termes d'ajout événement par événement.

#bibliography("refs.bib")
