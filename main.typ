// #import "@local/tool-box-louis:1.0.0": book, corollary, definition, lemma, proof, proposition, remark
#import "template.typ": book, corollary, definition, lemma, proof, proposition, remark

// s#import "@preview/physica:0.9.8": *

#import "title.typ": title-page-report

#set page(paper: "us-letter")

#show: book.with(
  title: [Contextuality as Automata: Open Generators and the Dynamics of Quantum Phenomena],
  author: "Louis TRIOULEYRE--ROBERJOT",
  title-page-fct: title-page-report,
)

#include "prelude.typ"

// ====================================== //


#include "abstract.typ"

#outline(title: "Review", target: figure.where(kind: "todo"))

#outline(depth: 2)

// = Context and Motivation
#include "chapters/report_part1.typ"

// = Technical Preliminaries
#include "chapters/report_part2.typ"

// = Main concept : dynamic contextual automata
#include "chapters/report_part3.typ"

// Quantum view by dynamic contextual automata
#include "chapters/report_part4.typ"

// fractionnal contextuality is equivalent to half distance
#include "chapters/report_part5.typ"

// Towards a dynamic condition to capture quantum non-locality
#include "chapters/report_part6.typ"

= Internship timeline

#v(-5em)
== Nature of the internship

This internship was unusual because the object studied in this report was not the initial subject. The first plan was to explore links between quantum information, combinatorial structures, and localized complexity classes. In particular, the idea was to ask whether one could define a quantum cost of using entanglement when access to the entangled resource is constrained by locality. The initial state of the art and this first formulation are described in @app:initial-state-of-art.

During the internship, this direction changed. The reason was not a lack of interest in the initial subject, but the emergence of a more fundamental question. My supervisor, Mehdi Mhalla, had a long-standing intuition about quantum phenomena as processes of stabilization, interruption, and reconstruction. As he explained it to me, this intuition had been maturing for almost forty years. It was not given as a finished mathematical theory. It was a conceptual direction, with strong geometric and philosophical content, but without a fixed formal object on which one could immediately prove theorems.

This made the internship very demanding. I was not only learning a known field and applying known tools. I also had to help turn a difficult intuition into definitions that could be tested. For a long time, it was unclear what the right mathematical object should be: a graph, a complexity class, a nonlocal game, an automaton, a resource theory, or a sheaf-theoretic invariant. Many discussions showed that the intuition was hard to communicate, even to researchers familiar with quantum information. A large part of the work therefore consisted in finding a language precise enough to make the idea stable.

== Progression of the work

The first month was mainly devoted to the state of the art. I studied papers on localized quantum advantage in distributed computing, quantum graph games, quantum perfect matchings, gap-preserving reductions for entangled-prover games.
The next two months were more exploratory. I tried several directions that did not immediately become the final report. I worked on the distributed-computing framework of @balliu2024distributedquantumadvantagelocal and tried to understand how it could be applied to examples such as $C_5$ #footnote[The game has five players arranged on a cycle. Player $i$ receives a question $x_i$ and answers $a_i$. The winning conditions are:
  $(a_(i-1) + a_i + a_(i+1))(a_(j-1) + a_j + a_(j+1)) = 1$
  whenever $(x_(i-1), x_i, x_(i+1)) = (0,1,0)$, $(x_(j-1), x_j, x_(j+1)) = (0,1,0)$, and $|i - j mod 5| >= 2$. If $x_i = 1$ for all $i$, then the condition is
  $sum_i a_i = 1.$].
I also read about tensor networks, graph-state methods, the zero-gap problem, nonlocal games, and graph-theoretic encodings of quantum constraints. At the same time, I had to think about the philosophical part of the project: what it means for an observation to be only a trace of a hidden process, and how a process can be constrained without being deterministic.

The turning point was the decision to describe observations as events emitted by elementary generators. A generator can be closed, open, or partially emitted. This led to the language of traces, count, automata, Petri nets, and dynamic states. From this point on, the project became more stable. The first concrete results were the integer and Ehrhart-type viewpoint on contextuality in @chap:technical-preliminaries, followed by the construction of dynamic contextual automata in @chap:dynamic-contextual-automata.

Only at this late stage did we realize that some of the quantities introduced in this report were related to measures of contextuality, especially the contextual fraction @Abramsky_Barbosa_Mansfield_2016. This was an important point: it showed that the formalism was not merely a language built for a specific intuition, but could be compared with existing mathematical structures.

For this reason, the report should be read as the record of a stabilization process. It does not claim to finish the theory. Its main contribution is to isolate a precise finite framework in which the original intuition can be tested: integer countings, generators, dynamic explanations, and constraints on the past and future debt of an observation.

#include "chapters/report_appendix.typ"

#bibliography("refs.bib")
