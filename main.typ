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


#align(center, text(size: 1.8em, weight: "bold", smallcaps[Acknowledgements]))

#v(3em)

#align(center, text(size: 1.2em)[
  _I would like to thank Mehdi Mhalla for his constant presence, his trust, and the many discussions that shaped this work. This internship was an intense and deeply enriching experience. It allowed me to discover research in a very direct way: starting almost from a blank page, trying to understand an intuition, struggling with it, and slowly seeing a direction, a language, and a form of understanding emerge._
])

#pagebreak()

#include "abstract.typ"

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

#include "chapters/report_conclusion.typ"

#bibliography("refs.bib")

#include "chapters/report_appendix.typ"
