#align(center, text(size: 1.8em, weight: "bold", smallcaps[Abstract]))

#v(1.5em)

#set par(first-line-indent: 0em)

#import "prelude.typ": *

This report develops a discrete and dynamic approach to contextuality. The starting point is operational: an experiment is first recorded as finite events before it is normalized into a probability table. Normalization is useful for prediction, but it erases the level of evidence, the arithmetic constraints imposed by finite counts, and the possibility of viewing an observation as a partial process that may still be completed. We therefore replace probability tables by integer countings. Most importantly, they make it possible to define objects that have no analogue in the probabilistic framework: the #emph[contextual completion deficit], which measures how much work remains to close a partial explanation, and the #emph[interruption profile], which records how each coordinate of an observation has advanced in its past-to-future trajectory. After normalization, these dynamic quantities reduce to the standard contextual fraction. Before normalization, they carry strictly more information.
The work is situated in the sheaf-theoretic approach to contextuality, where contextuality is an obstruction to gluing local data into a global section @Abramsky_Brandenburger_2011, and in the theory of the contextual fraction @Abramsky_Barbosa_Mansfield_2016. Compatible observations form an affine semigroup, deterministic explanations become integer sums of global sections, and open generators record the residual future required to close a partial explanation.
The guiding motivation comes from discussions with Mehdi MHALLA: understanding is not merely the possession of a final model, but the capacity to interrupt a process, distinguish what is already stabilized from what remains open, and reconstruct its admissible futures. In this sense, the report is a mathematical test of a broader idea: a scientific explanation should keep track of how evidence is produced, stabilized, interrupted, and completed. Contextuality provides a sharp laboratory for this idea, because it separates local observational consistency from the existence of a global classical explanation.

#v(0.6em)

The report is organized around this passage from static records to dynamic explanations. In @chap:context-motivation, we motivate the operational stance: start from observations, keep the finite record, and ask what hidden structure could have produced it. In @chap:technical-preliminaries, we recall the sheaf-theoretic formulation of contextuality and translate it into integer countings. The first contribution is this _translation itself_. By replacing probabilities with integer counts, contextuality becomes a question about integer decomposition in a semigroup. This shift is motivated by expressiveness: the probabilistic framework erases the level of evidence and the temporal order of production, while the integer framework keeps them.
In @chap:dynamic-contextual-automata, we introduce the second contribution: _dynamic contextual automata_. A generator is treated as an elementary process, while an interrupted experiment is represented by a dynamic state with closed copies and open copies. This turns partial observations into meaningful mathematical objects.
In @chap:quantum-dynamic-automata, we apply the framework to the $(2,2,2)$ Bell scenario. We define the finite-level Tsirelson bound $T(t)$ as the best quantum-realizable integer CHSH score at level $t$. This makes explicit an arithmetic point: every finite level gives a rational score, and the Tsirelson value $2 sqrt(2)$ appears only as an asymptotic limit. Using results from the NPA hierarchy, we approximate this bound and show how the integer framework connects to standard quantum relaxations. In @chap:contextual-fraction, we compare our new framework with the contextual fraction of @Abramsky_Barbosa_Mansfield_2016. The closed deficit of an integer counting recovers the contextual fraction after normalization, so the dynamic framework agrees with the standard sheaf-theoretic measure on its static coordinate. The contextual fraction is recovered as a normalized special case. Our second contribution, the _completion deficit_, measures how much future work remains to close a partial observation, starting from the best non-contextual past. This object has no analogue in the probabilistic framework.
In @chap:dynamic-condition-nonlocality, we explore several dynamic constraints for characterizing quantum correlations. The investigation tests past/future product constraints, the _interruption profile_ $k_η$ that records the per-coordinate temporal structure of an explanation, and a constraint-programming formulation for computing admissible explanations. Each constraint reveals different aspects of the classical-quantum boundary, and the exploration shows how the dynamic framework enriches the standard contextual fraction with dynamics structure.
#v(1em)
The integer framework recovers the contextual fraction and the sheaf-theoretic obstructions in a direct, constructive, and finite way. It also introduces a genuinely dynamic layer: the interruption profile records the internal temporal structure of a process, not only its global outcome. This construction applies whenever a process can be decomposed into elementary steps and interrupted at intermediate stages, allowing the framework to distinguish observations with the same statistics but different underlying dynamics.

#v(1em)

// #line(length: 40%, stroke: 0.5pt)

// #text(size: 0.8em)[
//   *Keywords:* contextuality, integer counting, dynamic automata, sheaf theory, CHSH, tsirelson bound, non-local games, generator decomposition.

//   #v(0.2em)

//   *Mots-cles :* contextualite, comptage entier, automates dynamiques, theorie des faisceaux, CHSH, borne tsirelson, jeux non-locaux, decomposition par generateurs.
// ]
