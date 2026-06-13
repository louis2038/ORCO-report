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

#include "chapters/report_conclusion.typ"

#include "chapters/report_appendix.typ"

#bibliography("refs.bib")
