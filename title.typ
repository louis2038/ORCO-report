#let title-page-report(title, author) = {
  let footer = [This work is supported by the French National Research Agency in the framework of the
    "France 2030” program: ANR 15 IDEX 02 and ANR-11-LABX-0025-01 for the LabEx PERSYVAL.]

  let citation = [How an actual entity becomes constitutes what that actual entity is; so that the two descriptions of an actual entity are not independent. Its ‘being’ is constituted by its ‘becoming.’ This is the ‘principle of process’.]
  let citation_author = [Alfred North Whitehead]

  let date = datetime(
    year: 2026,
    month: 6,
    day: 24,
  ).display()

  place(top + center, {
    grid(
      columns: 4,
      column-gutter: 3em,
      image("Logo_France2030.jpg"), image("logo_UGA.jpg"), image("Logo_PERSYVAL.png"), image("logo-ensimag.png"),
    )

    align(
      center + top,
      {
        set par(justify: false)
        v(3.5%, weak: true)
        emph(text(size: 1.5em, [Master of Operations Research, Combinatorics and Optimization]))
        v(1.25%, weak: true)
        emph([Master Informatique / Master Mathématiques \& Applications])
      },
    )
  })


  place(horizon + center, dy: 0%, {
    set par(spacing: 0.7em, leading: 0.2em, justify: false)
    align(
      center,
      text(size: 3em, smallcaps(title), weight: "regular", hyphenate: false)
        + v(2.5%, weak: true)
        + if author != none {
          text(size: 1.5em, smallcaps(author))
          v(2.5%, weak: true)
        },
    )
    v(3%, weak: true)
    emph(text(size: 1.3em, date))


    v(10%, weak: true)
    align(center, text(size: 0.9em)[
      This internship was done at the _Laboratory of Informatics of Grenoble_ (LIG) \ in the _CAPP - Calculi, Algorithms, Programs and Proofs_ team.

      Is under the supervision of _Mehdi Mhalla_.

      Defended before a jury composed of:
      #list(marker: $arrow.r.hook$)[Van-Dat Cung][Nadia Brauner][Mehdi Mhalla][Hippolyte Dourdent]
    ])
  })


  {
    set par(justify: false, linebreaks: "optimized", spacing: 1em)
    set text(costs: (runt: 400%))


    place(bottom + center, dy: 0%, {
      block(
        stroke: (top: black, bottom: black),
        inset: (top: 12pt, bottom: 12pt, left: 6pt, right: 6pt),
        width: 80%,
        align(left, text(
          size: 1.1em,
          [
            #set par(justify: true)
            #emph(citation)
            #align(right, box(text(size: 0.7em)[--- #citation_author]))
          ],
          hyphenate: false,
        )),
      )
      v(2%, weak: false)
      text(size: 0.8em, footer)
    })
  }
}
