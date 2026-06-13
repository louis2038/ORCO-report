#align(center, text(size: 1.8em, weight: "bold", smallcaps[Abstract]))

#v(1.5em)

#set par(first-line-indent: 0em)

This report develops a discrete and dynamic approach to contextuality. The starting point is operational: an experiment is first recorded as finite events before it is normalized into a probability table. Normalization is useful for prediction, but it erases the level of evidence, the arithmetic constraints imposed by finite counts, and the possibility of viewing an observation as a partial process that may still be completed. We therefore replace probability tables by integer countings and study their algebraic and dynamic structure.
The work is situated in the sheaf-theoretic approach to contextuality, where contextuality is an obstruction to gluing local data into a global section @Abramsky_Brandenburger_2011, and in the theory of the contextual fraction @Abramsky_Barbosa_Mansfield_2016. Its aim is not to replace these frameworks, but to make their finite and constructive content explicit, while introducing a new quantity that extends the contextual fraction: the _contextual completion deficit_. Compatible observations form an affine semigroup, deterministic explanations become integer sums of global sections, and open generators record the residual future required to close a partial explanation.
The guiding motivation comes from discussions with Mehdi MHALLA: understanding is not merely the possession of a final model, but the capacity to interrupt a process, distinguish what is already stabilized from what remains open, and reconstruct its admissible futures. In this sense, the report is a mathematical test of a broader idea: a scientific explanation should keep track of how evidence is produced, stabilized, interrupted, and completed. Contextuality provides a sharp laboratory for this idea, because it separates local observational consistency from the existence of a global classical explanation.

#v(0.6em)

The report is organized around this passage from static records to dynamic explanations. In @chap:context-motivation, we motivate the operational stance: start from observations, keep the finite record, and ask what hidden structure could have produced it. In @chap:technical-preliminaries, we recall the sheaf-theoretic formulation of contextuality and translate it into integer countings. Noncontextuality becomes integer decomposition into deterministic integer global sections, and the classical convex picture is replaced by the semigroup of compatible countings.
In @chap:dynamic-contextual-automata, we introduce the main contribution of the report: dynamic contextual automata. A generator is treated as an elementary process, while an interrupted experiment is represented by a dynamic state with closed copies and open copies (an intermediate state of the automata). This turns partial observations into meaningful mathematical objects.
In @chap:quantum-dynamic-automata, we apply the framework to the $(2,2,2)$ bell scenario. We define the finite-level trison bound $T(t)$ as the best quantum-realizable integer CHSH score at level $t$. This makes explicit an arithmetic point: every finite level gives a rational score, and the Tsirelson value $2 sqrt(2)$ appears only as an asymptotic limit. In @chap:contextual-fraction, we compare our new framework with the contextual fraction of @Abramsky_Barbosa_Mansfield_2016. The closed deficit of an integer counting recovers the contextual fraction after normalization, so the dynamic framework agrees with the standard sheaf-theoretic measure on its static coordinate.
Finally, @chap:dynamic-condition-nonlocality formulates the target problem for a quantum dynamic theory $𝕋_q = (𝒢_q, ξ_q)$: finding generators and a constraint such that a finite counting is accepted exactly when its normalization is Hilbert-space quantum. Of course this is a guideline, we do not pretend such a result. After a short open-generator baseline, we focus on the past/future product constraint $d^- d^+ <= A$ as the first concrete candidate. Then, we will describe the experimental algorithm used to test if an experiment result belong to our theory.
#v(1em)
#align(
  center,
  [$quad$ _This new framework, built entirely during this internship, is promising for two reasons. First, it recovers the standard results of the literature in a direct and constructive way. Second, it adds an extra layer: a theory that revises its own explanatory criteria during the experiment, capturing a genuinely dynamic notion of contextual influence._],
)

#v(1em)

// #line(length: 40%, stroke: 0.5pt)

// #text(size: 0.8em)[
//   *Keywords:* contextuality, integer counting, dynamic automata, sheaf theory, CHSH, trison bound, non-local games, generator decomposition.

//   #v(0.2em)

//   *Mots-cles :* contextualite, comptage entier, automates dynamiques, theorie des faisceaux, CHSH, borne trison, jeux non-locaux, decomposition par generateurs.
// ]
