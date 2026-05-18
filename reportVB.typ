#import "@local/tool-box-louis:1.0.0": book, corollary, definition, lemma, proof, proposition, remark
// #import "template.typ": book, corollary, definition, lemma, proof, proposition, remark

#import "@preview/physica:0.9.8": *

#import "title.typ": title-page-report

#set page(paper: "us-letter")

#show: book.with(
  title: [Processual catoptrics of quanta],
  author: "Louis TRIOULEYRE--ROBERJOT",
  title-page-fct: title-page-report,
)

#import "@preview/dashy-todo:0.1.3": todo

#set par(spacing: 1.2em, first-line-indent: 0pt)

#outline()

// = Context and historical perspective

// This internship was a little bit special for me. At the origin, my supervisor propose me to study the link between tree paper @botteron2024communicationcomplexitygraphisomorphism, @cui2025quantumperfectmatchings and @balliu2024distributedquantumadvantagelocal because it has an intuition that they are related. This intuition come with a big project that my supervisor is working on and that is very special in the meaning that it is very philosophal and out of the box. Howver understand him viewpoint was very challaling and i was not able to find something without understand deeply him intuition and viewpoint.

// They are two thing : one is the quantum is actually not understand, the Hilbert space is an abstration and being informatitien, is not sufficient to have a absrtact model that work well, we want to have a model that have the smallest number of abstration and that seams natural.
// The second thing is they are multiple variant of quantum model, communting operator, non cummunting, finite hilbert space. And the three don't have the same power. An recent result $"MIP"^* = "RE"$ show that we can encode a infinite proof into an entreglement state. But this suppose that we have infinite hilbert space. So the second question is to recover a notion of locality in the quantum.

// = Context and historical perspective

// This internship started in an unusual way. At the beginning, my supervisor did not give me a standard problem with a clearly delimited set of definitions, lemmas, and expected techniques. Instead, he suggested that I study possible connections between three recent works: @botteron2024communicationcomplexitygraphisomorphism, @cui2025quantumperfectmatchings, and @balliu2024distributedquantumadvantagelocal. The motivation was not a known theorem, but an intuition: these papers seemed to point toward the same hidden issue, namely the role of locality in quantum information and in the way global structure can emerge from local constraints.

// This made the internship difficult in a specific sense. The difficulty was not only technical. Of course, the mathematical background is demanding: nonlocal games, quantum strategies, graph isomorphism games, perfect matching games, distributed locality, and the theorem $"MIP"^* = "RE"$ all belong to advanced and rather separate literatures. But the deeper difficulty was that there was no already established framework in which the question naturally lived. I was not asked to solve a well-known open problem inside a fixed theory. I was asked to understand an intuition that was still being formed.

// This intuition was part of a broader project developed by my supervisor. What made it unusual is that it was not only a mathematical project, but also a philosophical one. It concerned the way we relate to the world through models. In quantum information, the Hilbert-space formalism is extremely successful, but it is also highly abstract. From a purely mathematical point of view, this is not a problem: the formalism works. However, from an explanatory point of view, one may still ask what kind of hidden organization, locality, memory, or resource is being represented by this abstraction. As computer scientists, we are often not satisfied with a model only because it gives the right predictions. We also want to know what is being built, what is being stored, what is being transmitted, and what is being used as a resource.

// A central motivation of the internship was therefore the following tension. On the one hand, standard quantum models allow very powerful forms of shared correlation. In particular, the theorem $"MIP"^* = "RE"$ shows that entangled multi-prover interactive proofs can recognize every recursively enumerable language. This result reveals an extreme expressive power of quantum correlations in interactive proof systems. On the other hand, this power is obtained in a model where the shared entangled state is allowed to have unbounded dimension and where no explicit geometric or operational locality constraint is imposed on the entanglement resource. The theorem is mathematically precise, but it also raises a structural question: which part of this power comes from quantum nonlocality itself, and which part comes from allowing arbitrarily large and globally organized resources?

// This question becomes even sharper because there is not only one possible mathematical model of quantum correlations. One can distinguish finite-dimensional tensor-product models, infinite-dimensional limits, and commuting-operator models. These variants are closely related, but they do not behave identically. The differences between them show that the choice of formal model is not a harmless technical detail. It can change the computational and logical power of the theory. From this perspective, the problem is not simply to use quantum mechanics as a black box, but to understand which structural assumptions are responsible for which consequences.

// The guiding idea of my internship was to *recover a notion of locality* inside this very abstract setting. Instead of treating entanglement as a globally available and unstructured resource, we try to ask what happens when only bounded local pieces of a larger resource can be accessed at once. This leads to the localized model developed in these notes, denoted $"LMIP"^*_0[k,n]$, where $k$ controls the size of the local quantum window that can be jointly used in one interaction, and $n$ controls the number of independent copies available for repetition. The point is not to deny quantum nonlocality, but to separate it from unbounded global access. Quantum correlations remain present, but their operational use is constrained.

// The three initial papers then acquire a common role. The work on graph isomorphism games shows that quantum and non-signaling strategies can sometimes be characterized by purely combinatorial invariants, such as homomorphism counts from restricted graph families. The work on quantum perfect matchings shows how local verification rules can force global combinatorial structure, and how quantum strategies can be reformulated through algebraic objects such as projective packings. The work on distributed quantum advantage shows that locality is not only a physical constraint, but also a computational one: bounded-radius access changes what can be known, communicated, and certified. Together, these papers suggested a possible methodology: look for a combinatorial language in which local quantum access, global consistency, and resource constraints can be studied at the same time.

// For this reason, the first part of the internship was largely devoted to understanding the point of view rather than proving a single theorem. I had to reconstruct the motivation behind the project: why locality matters, why unbounded Hilbert-space descriptions may hide important resources, why local tests can certify global structure, and why the usual formulation of nonlocal games may be too compressed to expose the mechanisms that make them powerful. This was challenging because the subject was not yet a standard research area with a fixed vocabulary. It was closer to the beginning of a research programme, built from a fresh intuition about quantum theory, computation, and our relation to mathematical models of the world.

// The aim of this report is therefore not to present a completed theory. It is to make this emerging viewpoint precise enough to become mathematically usable. The main question is: can one define a localized version of entangled interactive proofs in which the amount of quantum correlation accessible in one interaction is explicitly bounded, and can one relate the resulting model to combinatorial structures such as graph games, matching games, distributed local problems, and window-intersection graphs? In this sense, the internship was both technical and foundational: it tried to turn a philosophical intuition about locality and abstraction into a concrete mathematical framework.

= Introduction

== Context and historical perspective

This internship started from an unusual situation. I was not given a standard problem with a fixed list of definitions, known techniques, and expected intermediate lemmas. Instead, my supervisor suggested that I study possible connections between three recent works: @botteron2024communicationcomplexitygraphisomorphism, @cui2025quantumperfectmatchings, and @balliu2024distributedquantumadvantagelocal. At first sight, these papers belong to different areas: graph isomorphism games, quantum perfect matchings, and distributed quantum advantage for local problems. The initial motivation was not an already established theorem connecting them, but an intuition that they were different manifestations of the same structural phenomenon.

The common theme is locality. In each of these works, a global property is not accessed directly. It is tested, certified, or reconstructed from local information. In graph isomorphism games, local constraints imposed by a game can correspond to global combinatorial equivalences. In quantum perfect matching games, local consistency rules can force the existence of a global matching-like structure, or of a quantum analogue of it. In distributed computing, bounded-radius access changes what can be known, communicated, and solved. These examples suggest a general question: how can global structure emerge from local tests, and what kind of resource is required for this emergence?

This question became the guiding thread of the internship. Its difficulty was not only technical, although the technical background is already demanding. The deeper difficulty was that the project did not live inside a fully stabilized domain. I had to work with an intuition that was still in formation. The task was therefore not only to solve a problem, but also to identify the right language in which the problem could be stated.

This made the internship personal in a precise sense. I had to understand not only a mathematical question, but also a point of view. My supervisor's broader project questions the way we use abstract mathematical models to describe the world. In quantum information, the Hilbert-space formalism is extremely successful. It gives correct predictions and supports a powerful theory. However, from an explanatory and computational point of view, one may still ask what this formalism hides. Which resources are being used? Where is locality encoded? What must be built, stored, synchronized, or transmitted in order for the abstract model to be physically or operationally meaningful?

The point is not to reject the Hilbert-space formalism. The point is to ask whether it is always the right primitive object when one wants to understand resources. A probability distribution or a family of quantum correlations is already a compressed object. It does not show the process by which the data were generated, the intermediate states of the experiment, the possible interruptions, or the hidden structure that makes the correlations reproducible. As computer scientists, we are often interested not only in what a model predicts, but also in how it is generated, how it can be simulated, and what resources it consumes.

This perspective is particularly relevant in the context of entangled multi-prover interactive proofs. The theorem $"MIP"^* = "RE"$ shows that entangled provers can recognize every recursively enumerable language. This is one of the most striking results in quantum complexity theory. It also reveals how powerful the standard model is when provers may share arbitrary entangled states of unbounded finite dimension. The theorem is mathematically precise, but it raises a structural question: which part of this power comes from quantum nonlocality itself, and which part comes from allowing extremely large, globally organized, and abstractly accessible resources?

This question is sharpened by the fact that quantum correlations can be modeled in several inequivalent ways. One may work with finite-dimensional tensor-product models, with infinite-dimensional limits, or with commuting-operator models. These variants are related, but they do not always have the same power. Thus the choice of mathematical model is not a harmless technicality. It can change the computational and logical behavior of the theory. This suggests that a resource-sensitive analysis should make explicit which assumptions are being made about dimension, locality, access, and reuse.

The long-term motivation of this internship was therefore to recover a notion of locality inside highly abstract models of quantum information. Instead of treating entanglement as a globally available and unstructured resource, we ask what happens when only bounded local pieces of a larger resource can be accessed in a single interaction. This leads to a localized version of entangled interactive proofs, denoted $"LMIP"^*_0[k,n]$, where $k$ controls the size of the quantum window that can be jointly used in one interaction, and $n$ controls the number of independent copies available for repetition. The purpose of this model is not to remove quantum nonlocality, but to separate nonlocality from unbounded global access.

The first part of my work was therefore conceptual: to turn a philosophical intuition about locality, abstraction, and resources into mathematical objects. This led me to replace static probability tables by finite traces of observable events. A trace can be interrupted. It can be compressed. It can be partially forgotten. It can also be explained by a hidden mechanism. This change of primitive object is important. Instead of starting from a probability distribution $p(a|x)$ or $p(a,b|x,y)$, we start from a finite word of events
$
  tau = e_1 e_2 dots e_T.
$
The usual statistical objects are then obtained only after compression.

This gives the basic hierarchy used throughout the report:
$
  "hidden process" -> "trace" -> "compressed observation" -> "reconstruction".
$
A hidden process generates a visible trace. The trace is compressed into a message, for instance a count vector. A verifier receives only this compressed object and tries to decide whether it is compatible with a proposed hidden model. In this framework, explanation is not the direct fitting of a probability table. It is the existence of at least one hidden evolution whose visible and compressed image agrees with the observation.

The second part of the work was to make this idea finite and testable. I modeled hidden mechanisms by finite automata and Petri-net-like systems. In this setting, a trace is explainable if it can be lifted to a path in a hidden state space. When the observation is a count vector, the relevant compression is the Parikh map, which forgets the order of events and keeps only their multiplicities. This connects the philosophical idea of partial observation with concrete combinatorics: languages of traces, Parikh images, semilinear sets, and integer count constraints.

The third part of the work was experimental and focused on CHSH. The goal was not to reproduce quantum theory from scratch, but to test whether a dynamic and interruptible model can see more structure than a purely static count model. In the CHSH scenario, deterministic local strategies and PR-type generators can be represented by supports of events. A static count only records how many events have occurred. But an interrupted process has more structure: some generator copies may be open, some events may already have been emitted, and some residual events may still be available. This led to the notion of an interface.

For a generator $g$, an interface is a decomposition
$
  g = E + R,
$
where $E$ is the part already emitted and $R$ is the residual future. The corresponding past/future signature is
$
  Phi(eta) = (E_eta, R_eta).
$
This signature is not merely a count. It records the state of an unfinished process. Two interfaces can then be compared by a past/future angular metric:
$
  d_"PF"(eta,zeta)
  =
$
The interpretation is that two interrupted processes are close when they have similar stabilized pasts and similar possible futures.

The main clean observation obtained at this stage concerns balanced interruptions of a PR generator in CHSH. A winning PR support contains eight events. If it is interrupted into two balanced halves $P_8 = E + R$ with $|E| = |R| = 4$, then the normalized past and future weights are both
$
  ||E|| / ||P_8|| = ||R|| / ||P_8|| = 1 / sqrt(2).
$
Thus the factor $1/sqrt(2)$ appears naturally as the coefficient of a balanced past/future interface. This is not yet a derivation of the Tsirelson bound. It is a more modest result: a discrete interruptible model already contains a canonical mechanism by which a square-root normalization appears.

This observation was verified computationally by enumerating CHSH local generators, PR generators, and interrupted PR interfaces. The scripts in the research workspace confirm, among other facts, that balanced half-PR sections containing one event per context win all four CHSH constraints, while no deterministic local generator does. Such a half-PR object has the size of a local support but the coherence of a PR support. This makes it a useful test object for the dynamic framework.

The report therefore has two layers. The first layer is foundational: it introduces traces, compression, hidden automata, scientific mediation, and dynamic resources. The second layer is concrete: it applies these notions to nonlocal games, especially CHSH, and then uses the lessons from this finite model to motivate localized entangled interactive proofs. The aim is not to claim that the full quantum formalism has been reconstructed. The aim is to show that a resource-sensitive and dynamic language can be built, tested, and connected to existing questions in quantum information and complexity.

The central question of the report is therefore the following:

#quote[
  Can one replace the purely static description of nonlocal correlations by a dynamic, interruptible, and resource-sensitive model of traces, and can this model clarify which forms of locality are hidden inside powerful quantum abstractions such as $"MIP"^*$?
]

The answer developed here is partial but structured. We define the basic objects, test them on CHSH, identify the role of interfaces and residual futures, and use this as a stepping stone toward localized models of entangled interactive proofs. In this sense, the internship was not only a study of existing results. It was the construction of a possible research programme from a fresh intuition: quantum correlations should not only be classified by the probabilities they produce, but also by the hidden processes, local windows, and reconstructible interfaces through which they become observable.

= Philosophical Foundations

== Phenomena, Hidden Structure, and the Status of Models

Any scientific theory starts from a simple asymmetry. Some things are observed; other things are introduced in order to explain what is observed. The observable side consists of data, measurement outcomes, traces, correlations, or experimental reports. The hidden side consists of models, mechanisms, states, strategies, or processes that are not directly given, but are proposed in order to organize and explain the observable side.

One possible way to describe this distinction is to use the vocabulary of phenomenon and noumenon. The phenomenon is what is given to inquiry under concrete conditions of observation: through an apparatus, a protocol, a language, a scale, and a point of view. The noumenon, if one uses this term, denotes whatever may exist independently of these conditions of access. In this report, this distinction is not used as a metaphysical doctrine. It is used only as a methodological reminder: science does not begin from reality fully given. It begins from partial appearances that must be interpreted.

This point is important because experimental data are not transparent copies of the world. They are produced through interfaces. An apparatus selects some degrees of freedom and ignores others. A protocol decides which questions are asked. A language determines which distinctions can be expressed. A statistical summary forgets the order of events. Thus what is observed is always structured by a mode of access. A theory should therefore not only describe the observations, but also make clear which aspects of the underlying situation have been kept, compressed, or forgotten.

At the same time, the hidden side of explanation should not be treated as direct access to an ultimate reality. Hidden variables, internal states, automata, quantum states, or strategies are explanatory objects. They may be extremely useful, but they remain models. Their role is to account for observable regularities, support predictions, and make comparison possible between different explanations. A model is therefore not justified because it reveals the world as it is in itself, but because it explains the observable domain under explicit assumptions and with controlled resources.

This gives the methodological position adopted in this report. On the observable side, we have phenomena: events, traces, correlations, and compressed summaries of experiments. On the explanatory side, we introduce hidden structures: automata, processes, strategies, or resources. The aim is not to identify these hidden structures with reality itself. The aim is to compare them as possible explanations of what is observed.

In this sense, truth will be understood modestly. A model is accepted only relative to a class of available models, a set of observations, and a criterion of comparison. It is the best current explanation within a given framework, not a final possession of the thing itself. This does not make truth arbitrary. It remains constrained by empirical adequacy, internal consistency, predictive success, and resource cost. But it remains revisable, because observations may change, and because the space of possible models may also change.

This attitude is particularly useful in quantum information and complexity theory. The Hilbert-space formalism is mathematically powerful and experimentally successful. However, when one is interested in computation, locality, and resources, it is natural to ask what this formalism abstracts away. Which parts of a process are represented explicitly? Which parts are hidden inside the state space? Which resources are assumed to be freely available? Which operations are local, and which require global coordination? These questions do not challenge the formalism itself. They ask for a complementary description, more sensitive to locality, construction, and access.

== Understanding as Reconstructive Stability

If truth is the selection of a good explanatory model, then understanding is something slightly different. A model may predict correctly and still remain opaque. It may fit the data but be too fragile to reuse, too complex to transmit, or too dependent on an implicit context. For this reason, understanding should not be reduced to correctness alone.

In this report, understanding is viewed as a form of reconstructive stability. To understand a model is not necessarily to store its complete description. It is to be able to recover enough of its organization after compression, transmission, interruption, or change of scale. A model is understood when it can be resumed, reformulated, and reused without losing the structure that made it explanatory in the first place.

This idea is connected to finiteness. Scientific reasoning is not performed by ideal agents with unlimited memory and perfect access to the world. It is performed by finite observers, finite communities, finite protocols, and finite descriptions. These agents compress information, forget details, transmit summaries, and reconstruct missing structure. Under these conditions, the central question is not only whether a model fits the observations, but whether it remains meaningful when it is passed through such finite operations.

This motivates the basic chain used throughout the report:
$
  "hidden process" -> "observable trace" -> "compressed report" -> "reconstruction".
$
A hidden process generates a trace. The trace is only partially retained, for example through a count vector or a statistical summary. A verifier then receives this compressed object and tries to reconstruct enough information to judge whether the observation is compatible with a proposed model.

This viewpoint explains why traces play a central role. A probability table is already a compressed object. It summarizes repeated observations, but it forgets the order in which they occurred and the possible intermediate states of the process. By contrast, a trace keeps the temporal structure of observation. It allows one to ask what was produced, in which order, and what could still have happened if the process had been interrupted. For this reason, traces are a natural primitive when one wants to study explanation under finite access.

== Why Locality?

The emphasis on locality comes from the same methodological concern. If observation is always mediated by interfaces, then no observer has access to everything at once. Access is local in at least three senses.

First, it is local in space or structure: an agent interacts only with a limited part of a system. Second, it is local in time: an experiment unfolds step by step, and may be interrupted before completion. Third, it is local in information: a report contains only a compressed image of the process that produced it.

Locality is therefore not only a physical restriction. It is also an epistemic and computational restriction. It expresses the fact that explanations must often be built from partial views. A global structure is rarely observed directly. It is inferred from local tests, local consistencies, and local fragments that must be glued together.

This is one of the main reasons why nonlocal games and interactive proofs are relevant. In such settings, a verifier does not inspect a full proof or a complete hidden state. Instead, the verifier asks local questions and checks local consistency conditions. The power of the protocol comes from the fact that these local checks may force the existence of a global structure. Thus locality is not merely a limitation. It can also be a method of certification.

The same idea appears in distributed computing. A node in a network sees only a bounded neighborhood, yet global properties may sometimes be solved or certified by local rules. It also appears in quantum information: correlations may be globally nonclassical, while each measurement accesses only a limited subsystem. In all these examples, the central question is how much global structure can be reconstructed from local access.

This report follows this line of thought. Instead of treating a global resource as immediately and completely available, we ask what can be explained or certified when access to that resource is bounded. The goal is not to eliminate global structure, but to understand how it is built, accessed, and reconstructed through local interfaces.

== Processes, Stabilization, and Interfaces

A useful complementary intuition is to think in terms of processes rather than static objects. On this view, what is observed at a given moment may be the stabilized trace of an underlying evolution. A state is then not necessarily taken as primitive. It can be seen as a convenient description of what remains stable enough to be named, stored, transmitted, or reused.

This process-oriented language should be understood as an intuition, not as a new physical postulate. It suggests that, when studying an experiment, one may ask not only what final outcome was observed, but also what partial evolution could have produced it. If the process is interrupted, there may be a meaningful distinction between what has already been produced and what remains possible. This distinction is the origin of the notion of an interface.

In the technical part of the report, this intuition becomes concrete. A hidden mechanism generates observable events. A partial execution has a past part, already emitted, and a future part, still available. In a Petri-net or automaton model, this can be represented by a residual state. The interface is the information that must be kept in order to resume the process later.

Thus an interface is not merely a boundary between two systems. It is also a memory of an unfinished construction. It records what has already been stabilized and what remains open. This is why interfaces are useful for a theory of locality: they describe what a local observer can retain about a global process without having access to the whole process.

== Projection, Resolution, and Correlation

This language also gives a cautious way to think about some quantum-like phenomena, without claiming to replace quantum mechanics. Suppose that a fine-grained process is observed through a coarse interface. Several different microscopic histories may then give rise to the same visible event. From the point of view of the observer, the visible event does not determine a unique hidden history. It corresponds instead to a set of compatible histories.

This gives a general intuition for superposition-like descriptions: a coarse observation may leave several underlying alternatives unresolved. The point is not to say that quantum superposition is merely classical ignorance. The point is weaker and methodological: whenever observation loses resolution, the model must retain some representation of the alternatives that remain compatible with what is seen.

Similarly, if a single hidden process is observed through several separated interfaces, the resulting local observations may remain correlated because they come from a common underlying structure. This gives a general intuition for entanglement-like descriptions: separation at the level of observation does not necessarily imply independence at the level of explanation. Again, this is not proposed as a replacement for the quantum formalism. It is only a guiding analogy for why local views of a global process may display correlations that are not visible from either local view alone.

In this report, these intuitions are used only to motivate the formal framework. The actual technical objects will be finite: events, traces, automata, compression maps, count vectors, interfaces, and local resource constraints. The purpose is to build a language in which one can ask precise questions about what is observed, what is hidden, what is compressed, and what can be reconstructed from local access.

== Compact Summary

The philosophical role of this chapter can be summarized as follows.

- Observations are partial and mediated by interfaces.
- Models are explanatory structures, not direct access to reality itself.
- Truth is understood modestly as the best current explanation within a given model class.
- Understanding requires reconstructive stability under compression, transmission, and interruption.
- Locality is natural because access to a process is always bounded in space, time, or information.
- Traces are more primitive than probabilities when one wants to study finite observation.
- Interfaces record what a local observer can retain about an unfinished global process.

The rest of the report turns these ideas into mathematical objects. Hidden processes will be modeled by automata or Petri-like systems. Observations will be modeled as traces and compressed count vectors. Locality will be modeled as bounded access to resources. The guiding question will be how much global structure can be explained, certified, or reconstructed from such local and compressed data.

= Philosophical Foundations

== Phenomena, Hidden Structure, and the Status of Truth

Any scientific theory begins with a simple distinction. Some things are observed; other things are introduced in order to explain what is observed. In a broadly Kantian vocabulary, what inquiry receives is the _phenomenon_: the world as it appears under concrete conditions of observation, measurement, and thought. What may exist independently of those conditions can be called the _noumenon_, or thing-in-itself. Science does not grasp the _noumenon_ directly. It works from _phenomena_: data, traces, correlations, and measurable outcomes.

This point matters because experimental data are never a transparent window onto reality. They give access only through a specific interface: an apparatus, a protocol, a language of description, and a point of view. What is observed is therefore always partial, structured, and situated. A theory must begin from this modest fact: we do not start from reality fully given, but from appearances that must be interpreted.

At the same time, one should not turn the hidden side of explanation into a metaphysical absolute. In a broadly Nietzschean spirit, one may remain wary of the idea that behind appearances there stands a final and fully accessible "true world." That temptation is dangerous for science. It transforms a useful explanatory hypothesis into a dogma. For this reason, hidden functions, latent variables, or internal automata should not be treated as direct revelations of the _noumenon_. They are models. Their role is to organize what we observe, explain regularities, and support prediction.

This gives a clear methodological picture. On one side there are _phenomena_: outcomes, traces, correlations, summaries of traces. On the other side there are models of hidden structure: mechanisms proposed to account for those observations. The aim of theory is not to unveil a final essence, but to build and compare admissible models. These models are judged by how well they fit the data, how causally coherent they are, and how economical they are in structure and resources. A model is justified not because it reaches ultimate reality, but because, under explicit constraints, it explains the observable domain better than its competitors.

On this basis, truth must also be understood in a modest and operational sense. A statement, mechanism, or model is true only in the provisional sense that, among the models currently available, it gives the best explanation of the observed _phenomena_. Truth here does not mean absolute possession of the thing-in-itself. It means the current optimum of inquiry: the best explanatory model we presently know how to formulate and test. This notion is not arbitrary. It is constrained by observation, internal consistency, predictive success, and the cost of the resources required by the model. But it remains revisable, because both our observations and our model space can change. Truth is dynamic not because reality fluctuates arbitrarily, but because scientific access to reality proceeds through revisable constructions.

This position gives a natural foundation for the study of hidden mechanisms. Observable data belong to the level of _phenomena_. Hidden functions, strategies, and automata belong to the level of explanatory hypotheses. Scientific work then consists in asking which hidden structures are compatible with the observed _phenomena_, which among them are more economical or more causally coherent, and what resources are required to realize them. In this framework, the search for hidden mechanisms is not a metaphysical claim to possess the _noumenon_. It is a disciplined effort to construct the best available account of appearances.

=== Understanding as Reconstructive Stability

If truth is identified, provisionally, with the model that best fits observation, then understanding cannot be reduced to truth alone. A model may predict correctly and still remain opaque. It may fit the data while being too fragile to reuse, too obscure to teach, or too complex to reconstruct after interruption. For this reason, understanding must be defined at another level.

In this work, understanding is treated as a reconstructive capacity. To understand a structure is not simply to store a complete representation of it, nor merely to execute a formal procedure. It is to be able to recover enough of its organization to restart it after interruption, translate it into a nearby form, change its scale of description, and preserve its meaning under partial loss of memory or context. Understanding is therefore not static possession. It is stability through transformation.

This idea is inseparable from finitude. Reasoning, transmission, and interpretation do not occur in ideal minds with perfect memory and unlimited access. They occur in finite communities that forget, compress, select, and deform. Under these real conditions, the central question is not whether a representation is complete in principle, but whether it remains intelligible and revisable as it moves from one situated agent to another. A structure is understood when it survives this passage without collapsing into empty repetition or arbitrary reinterpretation.

Understanding therefore extends the provisional notion of truth introduced above. Truth asks: which model best explains what is observed? Understanding asks: can this model be reconstructed, resumed, compressed, and transmitted while preserving enough continuity with its previous uses? In short, truth concerns explanatory adequacy; understanding concerns reconstructive stability.

=== A Compact Formal Summary

The whole picture may be summarized in a simple chain.

- _Noumenon_: whatever may exist independently of our modes of access. It is a limiting idea, not a direct object of scientific observation.
- _Phenomenon_: what is actually given in inquiry—measurements, traces, outcomes, correlations, and experimentally accessible appearances.
- Model: a structured hypothesis that links hidden organization to observable consequences.
- Truth at time $t$: the currently best model among those available for explaining the observed _phenomena_.
- Understanding: the capacity of a community to reconstruct and stabilize that model after compression, transmission, and partial loss.

== Process philosophy

The view point of my supervisor come to the field of Process philosophy. We think that everthink is a interupted process. What i means by a process ? A process is a dynamics, we think that in the first place, they don't have think but move, they don't have state but derivative. The word is contruct by sequence of move, not by a sequence of state. My supervisor view this with light that derive in a cicle way, he call that the 'derive' and this is the stabisitation of this movement in a predictive partern that crate a space, objet.

=== What means stabilisation ?

This notion of understanding with explicit compression and decompression is not the only way to see.

#let env = $sans("ENV")$
#let model = $sans("M")$
Let's denote $env$ the environement, the community, the peaple that apply filter or compression model. The _phenomena_ will be not the same depending of $env$.

Let's $Pi^env : "Noumene" -> "Phenomene"^env$ the projection of the noumene space to the subjective phenomena of $env$.
Let $model^env : "Noumene" -> "Phenomene"^env$ the projection of the noumene space to our model of the Phenomena. We can then define the _truth_ of the model as the distance between $Pi^env$ and $model^env$. Why i say that the model depend of the environement ? Because the model is express by world, and a language is subjectif. So the model is subjectif. The is nothing we can agree without applying local filter. The true become local by nature : a model $model^*$ is true if $model^* = "argmin"_(M in cal(H)^env) "Fit"(Pi^env; model^env)$ where $cal(H)^env$ is the set of all the model i remember in my environement.

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


#bibliography("refs.bib")
