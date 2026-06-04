#align(center, text(size: 1.8em, weight: "bold", smallcaps[Abstract]))

#v(1.5em)

#set par(first-line-indent: 0em)

This report develops a discrete, dynamic framework for studying contextuality in quantum theory. The starting point is a simple observation: a normalized probability distribution erases the amount of evidence that produced it. We therefore replace probabilities by integer counts and study the algebraic structure of compatible counting models before any normalization.

#v(0.6em)

In the first part, we recall the sheaf-theoretic formulation of contextuality and translate it into the integer counting setting. Compatibility becomes equality of marginal counts on overlaps. Noncontextuality becomes the possibility of decomposing a compatible count as an integer sum of deterministic global sections. The passage from convex geometry to semigroup geometry is made explicit: the Hilbert basis of the compatible counting semigroup plays the role that extreme points play in the classical polytope.

#v(0.6em)

In the second part, we introduce dynamic contextual automata. A generator is an elementary complete process. A dynamic state consists of closed copies (already stabilized) and open copies (still in progress, with a residual future). The visible count of a dynamic state is the sum of contributions from both closed and open copies. The residual future records exactly what must still be emitted for each open generator to close.

#v(0.6em)

In the third part, we define a dynamic contextual theory as a pair $(cal(G), xi)$, where $cal(G)$ is a generator family and $xi$ is a constraint on admissible trajectories. We study three constraints of increasing refinement: an open-generator bound, a calibrated slope targeting the finite-level trison bound, and a past/future product constraint $d^- d^+$.

#v(0.6em)

Our main result is that the past/future product constraint captures exactly the quantum set at each finite level $n$, without any reference to $sqrt(2)$. Moreover, the first coordinate of this measure recovers the contextual fraction of Abramsky, Barbosa, and Mansfield from sheaf theory. The trison bound $T(n)$, defined as the best CHSH score achievable by any quantum strategy with $n$ repetitions, is a rational number at each finite level, and the Tsirelson bound $2 sqrt(2)$ emerges only as the limit $n -> oo$.

#v(0.6em)

The framework is designed to keep the experimental record visible: finite counts, integer arithmetic, interruptible processes, and explicit hidden resources. It does not replace Hilbert-space formalism. It offers a small discrete language in which dynamic aspects of contextuality can be formulated and tested before any passage to limits or closures.

#v(2em)

#line(length: 40%, stroke: 0.5pt)

#v(1em)

#text(size: 0.9em)[
  *Keywords:* contextuality, integer counting, dynamic automata, sheaf theory, CHSH, trison bound, non-local games, generator decomposition.

  #v(0.4em)

  *Mots-cles :* contextualite, comptage entier, automates dynamiques, theorie des faisceaux, CHSH, borne trison, jeux non-locaux, decomposition par generateurs.
]
