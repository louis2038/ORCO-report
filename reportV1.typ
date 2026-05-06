#import "@local/tool-box-louis:1.0.0": book, corollary, definition, lemma, proof, proposition, remark
#import "@preview/physica:0.9.8": *

#let title-page-report(title, author) = {
  let footer = [This work is supported by the French National Research Agency in the framework of the
    "France 2030” program: ANR 15 IDEX 02 and ANR-11-LABX-0025-01 for the LabEx PERSYVAL.]

  let date = datetime(
    year: 2026,
    month: 6,
    day: 22,
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


  place(horizon + center, dy: -5%, {
    set par(spacing: 0.7em, leading: 0.2em, justify: false)
    align(
      center,
      text(size: 4em, smallcaps(title), weight: "regular", hyphenate: false)
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

      Is under the supervision of _mehdi mhalla_.

      Defended before a jury composed of:
      #list(marker: $arrow.r.hook$)[Van-Dat Cung][Nadia Brauner]
    ])
  })


  let epigraph = quote(
    attribution: [Jonathan Bingus],
  )[This is a tremendously inspirational quote that sets the tone of this course; truly, one of the epigraphs of all time.]
  {
    set par(justify: false, linebreaks: "optimized", spacing: 1em)
    set text(costs: (runt: 400%))
    set quote(block: true)
    show quote: it => [
      #emph(it.body)

      #align(right, box(text(size: 0.7em)[--- #it.attribution]))
    ]

    if epigraph != none {
      place(bottom + center, dy: -17.5%, block(
        stroke: (top: black, bottom: black),
        inset: (top: 12pt, bottom: 12pt, left: 6pt, right: 6pt),
        width: 80%,
        align(left, text(size: 1.4em, epigraph, hyphenate: false)),
      ))
    }
  }

  align(bottom + center, text(size: 0.8em, footer))
}

#set page(paper: "us-letter")

#show: book.with(
  title: [Quantique],
  author: "Louis TRIOULEYRE--ROBERJOT",
  title-page-fct: title-page-report,
)

// Useful command : definition, theorem,
// glue, qed, tablef

#import "@preview/dashy-todo:0.1.3": todo

#set par(spacing: 1.2em, first-line-indent: 0pt)

#outline()

= ee

== eee

d'après @ji2022mipre et @linke2011rationalehrhartquasipolynomials et @beck2020decompositionsehrharthstar

#bibliography("refs.bib")
