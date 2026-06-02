
== First result #lou[A travailler]

We now record the elementary consequences of the previous definitions for the CHSH scenario. In this subsection, $N$ denotes the counting vector. The entries of $N$ are the integer variables that we study.

For a context $C in cal(M)$ and a local section $s in ℰ(C)$, the coordinate $N(C,s)$ may also be written $N(s | C)$. In the Bell notation this becomes $N(a b | x y)$: conditionally on the chosen questions $(x,y)$, one counts the observed answers $(a,b)$.

In CHSH the vertex set is $V = { (a b | x y) | a,b,x,y in {0,1} }$, hence $|V| = 16$. The contextual hypergraph has $12$ hyperedges: four context-normalization edges and eight non-signaling marginal edges. Each edge has size $4$, and each vertex belongs to exactly $3$ edges. If $A_("aug")$ is the corresponding incidence matrix (encoding both context normalization and marginal compatibility), then the discrete non-signaling equation is
$A_("aug") N = t 𝟙$.

This is the same object as the non-signaling polytope, but seen before normalization. Indeed, if
$G_("NS") := { p in RR_(>=0)^V | A_("aug") p = 𝟙 }$,
then the equation $A_("aug") N = t 𝟙$ is equivalent, for $t > 0$, to $p := N/t in G_("NS")$. Thus
$
  { N in NN^V | A_("aug") N = t 𝟙 }
  = t G_("NS") inter ZZ^V.
$
The semigroup $𝒮_("ns")$ is therefore the semigroup of integer points in the cone over $G_("NS")$:
$
  𝒮_("ns")
  := { (N,t) in NN^V times NN | A_("aug") N = t 𝟙 }
  = { (N,t) | N in t G_("NS") inter ZZ^V }.
$
The polytope $G_("NS")$ is the normalized slice $t=1$ of this cone, while the discrete models at level $t$ are the integer points in the dilated slice $t G_("NS")$.
The local part is obtained by replacing $G_("NS")$ by the local polytope
$L_("loc") := "conv" { d_lambda | lambda " deterministic" }.$
If we define $Q_("NS")(t) := \#(t G_("NS") inter ZZ^V)$ and $Q_("loc")(t) := \#(t L_("loc") inter ZZ^V)$, then these functions count the number of discrete models at level $t$ in the non-signaling and local cases.

The first admissible nonzero level is therefore $t=1$, equivalently $k=4$. At this level, $A_("aug") N = 𝟙$ forces $N$ to select exactly one event on every hyperedge. These exact transversals are precisely the local deterministic strategies, i.e. assignments $a = f(x)$ and $b = g(y)$. Thus the first level contains only classical generators.

The first intrinsically non-local CHSH generators occur at $t=2$, equivalently $k=8$. Because a PR box has probabilities in ${0,1/2}$ and therefore is not an integer point at level $t=1$. Multiplying it by $2$ gives an integer vector $r in {0,1}^16$ with $A_("aug") r = 2 𝟙$. Hence its first discrete lift is at level $t=2$.

Let $d_lambda in {0,1}^16$ denote the $16$ local deterministic generators, with $A_("aug") d_lambda = 𝟙$, and let $r_mu = 2 p_mu^"PR" in {0,1}^16$ denote the $8$ lifted PR generators, with $A_("aug") r_mu = 2 𝟙$. The natural candidate Hilbert basis, i.e. the set of points that generate any other points in $𝒮_"ns"$ is
$
  ℋ_("ns") := { (d_lambda,1) }_(lambda=1)^16 union { (r_mu,2) }_(mu=1)^8.
$

#proposition[
  Assuming the support lemma verified by exhaustive enumeration of the CHSH supports, $ℋ_("CHSH")$ is the Hilbert basis of $𝒮_("ns")("CHSH")$.
]

#proof[
  The deterministic elements are irreducible because their level is $1$. A lifted PR element is also irreducible: a nontrivial decomposition of $(r_mu,2)$ would split it into two level-$1$ elements, hence into two deterministic local models, which would write a PR box as a convex combination of local deterministic boxes. This is impossible. For generation, the support lemma states that every nonzero $(N,t) in 𝒮_("ns")("CHSH")$ contains the support of some element $(u,s) in ℋ_("CHSH")$. Then $(N-u,t-s)$ is again in $𝒮_("ns")("CHSH")$, and induction on $t$ gives a decomposition into elements of $ℋ_("CHSH")$.
]


#proposition[
  The set of integer models $ℋ_"ns"$ is an Hilbert basis of the semigroup $𝒮_"ns"$.
]

#proof[
  By construction, all elements of $cal(H)_"ns"$ belong to $cal(S)_"ns"$.
  The deterministic generators $(d_lambda,1)$ are irreducible.
  The PR generators $(r_mu,2)$ are also irreducible. Indeed, any non-trivial decomposition
  $(r_mu,2) = (N_1,t_1) + (N_2,t_2)$
  would force $t_1 = t_2 = 1$. Hence we would have $A N_i = bb(1)$ for $i=1,2$, so $N_1$ and $N_2$ would be two local deterministic models. It would follow that
  $p_mu^"PR" = 1/2 N_1 + 1/2 N_2$,
  which would express a PR box as a convex combination of deterministic boxes, a contradiction.

  It remains to prove that $cal(H)_"ns"$ generates the whole semigroup. We proceed by induction on $t$. If $t=0$, then $A N = 0$, and since every vertex belongs to at least one edge, we necessarily get $N=0$.

  We first need the following support lemma.
  #lemma(name: "Support lemma", id: "lem:support")[
    For every nonzero $(N,t) in cal(S)_"ns"$, there exists $(U,s) in cal(H)_"ns"$ such that $U(v) <= N(v)$ for every vertex $v in V$.
  ]
  #proof[
    The proof is computer-assisted. The finite step is an exhaustive test of supports.
    Let $S subset.eq V$ be a nonempty subset of the $16$ vertices. We say that $S$ is #strong[realizable] if there is an element $(m,t) in cal(S)_"ns"$ such that
    $"supp"(m) = S$.
    Since $|V| = 16$, there are $2^16 - 1 = 65535$ nonempty supports to test.
    For each nonempty subset $S subset.eq V$, the computation solves the following feasibility problem. Find a vector $q in RR_(>=0)^V$ and a scalar $tau >= 1$ such that
    $A q = tau bold(1)$,
    with the support constraints
    $q_v >= 1$ for $v in S,
    q_v = 0$ for $v in.not S$.

    If this system has no solution, then no element of $cal(S)_"ns"$ can have support $S$. Indeed, any integer element $(m,t)$ with support $S$ would also be a real solution by taking $q=m$ and $tau=t$.

    If the system has a solution, then $S$ is realizable. The matrix $A$ and all support constraints have rational coefficients. Hence a feasible rational point exists whenever the rational polyhedron is nonempty. Multiplying by a common denominator gives an integer vector $m in NN^16$ and an integer level $t in NN$ such that
    $
      A m = t bold(1)
      quad "and" quad
      "supp"(m) = S.
    $
    Thus $(m,t) in cal(S)_("CHSH")$.

    The exhaustive computation then applies a second test to every realizable support $S$. It checks whether there exists one of the proposed generators
    $
      (u,s) in cal(H)_("CHSH")
    $
    such that
    $
      "supp"(u) subset.eq S.
    $
    The computation verifies that this condition holds for every realizable nonempty support $S subset.eq V$.

    We now use this finite verification to prove the lemma. Let $(m,t) in cal(S)_("CHSH")$ be nonzero, and set $S := "supp"(m)$. Then $S$ is a realizable nonempty support. By the exhaustive verification, there is a generator $(u,s) in cal(H)_("CHSH")$ with $"supp"(u) subset.eq S$.

    Every deterministic generator and every lifted PR generator has entries in ${0,1}$. Therefore, for each vertex $v in V$, there are two cases. If $u_v = 0$, then $u_v <= m_v$ is immediate. If $u_v = 1$, then $v in "supp"(u) subset.eq S = "supp"(m)$, so $m_v >= 1$ and again $u_v <= m_v$. Hence
    $
      u_v <= m_v quad "for every" quad v in V.
    $

    Thus every nonzero element of the semigroup contains one of the $24$ proposed generators as a sub-counting. This proves the lemma.
  ]

  We now prove generation by induction on the level $t$. The case $t=0$ was treated above. Assume that every element of level strictly smaller than $t$ is generated by $cal(H)_"CHSH"$, and let $(N,t) in cal(S)_"ns"$ with $t >= 1$.

  By the support lemma, there exists a generator $(u,s) in cal(H)_"ns"$ such that $u_v <= N_v$ for every $v in V$. Hence the difference
  $
    M := N - u
  $
  is again an element of $NN^16$. Since $(u,s) in cal(S)_"ns"$, we have
  $
    A M = A(N-u) = (t-s) bb(1).
  $
  Thus $(M, t-s) in cal(S)_("CHSH")$. Moreover, $s in {1,2}$, so $t-s < t$. By the induction hypothesis, $(M, t-s)$ is a sum of elements of $cal(H)_"CHSH"$. Adding $(u,s)$ to this sum gives a decomposition of $(N,t)$.

  Therefore, $cal(H)_"CHSH"$ generates $cal(S)_("CHSH")$. Finally, no element of $cal(H)_"CHSH"$ belongs to the subsemigroup generated by the others, since this would give a non-trivial decomposition of an irreducible element. Hence $cal(H)_"CHSH"$ is minimal, with respect to inclusion, among generating families. In other words, it is a Hilbert basis.
]

This means that, at the discrete level, CHSH non-signaling models are built from two types of irreducible bricks: local deterministic bricks of level $1$ and PR bricks of level $2$.

Finally, counting the number of int @Miller2005. Let $G_("NS") = { p in RR_(>=0)^16 | A_("aug") p = 𝟙 }$ be the CHSH non-signaling polytope and let $L_("loc")$ be the local polytope. Define $Q_("NS")(t) := \# (t G_("NS") inter ZZ^16)$ and $Q_("loc")(t) := \# (t L_("loc") inter ZZ^16)$. Since the affine dimension is $8$, these functions have degree $8$; $Q_("loc")$ is an Ehrhart polynomial, while $Q_("NS")$ is a quasi-polynomial of period $2$ because PR vertices have denominator $2$.

A direct interpolation from exact integer-point counts gives
$Q_("loc")(t) = 1 + 71/21 t + 6053/1260 t^2 + 697/180 t^3 + 91/45 t^4 + 13/18 t^5 + 31/180 t^6 + 31/1260 t^7 + 1/630 t^8$
and
$Q_("NS")(t) = 17/10080 t^8 + 17/630 t^7 + 7/36 t^6 + 37/45 t^5 + 1607/720 t^4 + 359/90 t^3 + 290/63 t^2 + 332/105 t + 63/64 + (-1)^t / 64$.
Thus the number of discrete CHSH models with parameter $k$ is $0$ if $4$ does not divide $k$, and is $Q_("NS")(k/4)$ if $k = 4t$. The local polynomial has normalized volume $8! dot 1/630 = 64$, whereas the non-signaling quasi-polynomial has normalized volume $8! dot 17/10080 = 68$. Consequently, the asymptotic non-local part $Q_("NS")(t) - Q_("loc")(t)$ has leading term $1/10080 t^8$, and the asymptotic proportion of non-local integer models inside the non-signaling ones is $1/17$.
