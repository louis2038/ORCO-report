#import "non-local-game.typ" as tool
#import "@preview/cetz:0.5.2" as cetz
#import "@preview/dashy-todo:0.1.3": *

#let med(comment) = todo(position: left, stroke: blue)[*med*: #comment]
#let leo(comment) = todo(position: right, stroke: red)[*léo*: #comment]
#let lou(comment) = todo(position: right, stroke: gray)[*lou*: #comment]


// Chaque membre peux highligh des passages
#let lou_ceci(passage) = highlight(fill: gray.lighten(80%), passage)
#let med_ceci(passage) = highlight(fill: blue.lighten(80%), passage)

// Helper for CHSH visualization
#let cred(content) = text(content, fill: rgb(200, 0, 0, 200))
#let chsh_rule(A, X) = {
  let (a, b) = A
  let (x, y) = X
  if (x, y) == (1, 1) {
    if a != b {
      return true
    } else {
      return false
    }
  } else {
    if a == b {
      return true
    } else {
      return false
    }
  }
}

// $attach(in, t: star)$
#let ins = $mono("in")$
