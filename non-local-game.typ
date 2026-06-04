#import "@preview/cetz:0.4.2"

#let cred(content) = text($content$, fill: rgb(200, 0,0,200))
#let cblue(content) = text($content$, fill: rgb(0, 0,200,200))

#let sum-bits(bits) = {
  if bits.len() == 0 {
    0
  } else {
    bits.at(0) + sum-bits(bits.slice(1))
  }
}

#let test_rule(A, X) = {
  calc.rem(sum-bits(A) + sum-bits(X), 2) == 0
}

#let pow2(n) = {
  if n <= 0 {
    1
  } else {
    2 * pow2(n - 1)
  }
}

#let int-to-bits(value, size) = {
  if size <= 0 {
    ()
  } else {
    let weight = pow2(size - 1)
    let bit = if value >= weight { 1 } else { 0 }
    let rest = if value >= weight { value - weight } else { value }
    (bit,) + int-to-bits(rest, size - 1)
  }
}

#let bits-text(bits) = {
  if bits.len() == 0 {
    ""
  } else if bits.len() == 1 {
    str(bits.at(0))
  } else {
    str(bits.at(0)) + "" + bits-text(bits.slice(1))
  }
}

#let event-text(A, X) = {
  "(" + bits-text(A) + "|" + bits-text(X) + ")"
}

#let default-pair-order = ((1, 0), (0, 0), (1, 1), (0, 1))

#let pair-order-index(x, a, order: default-pair-order) = {
  if order.len() == 0 {
    0
  } else {
    let (x0, a0) = order.at(0)
    if (x, a) == (x0, a0) {
      0
    } else {
      1 + pair-order-index(x, a, order: order.slice(1))
    }
  }
}

#let quadrant-offset(index, step) = {
  (
    if calc.rem(index, 2) == 0 { 0 } else { step },
    if index < 2 { step } else { 0 },
  )
}

#let recursive-game-span(players, leaf-players: 2, cell-size: 1, gap: 1) = {
  if players <= leaf-players {
    pow2(players) * cell-size
  } else {
    2 * recursive-game-span(players - 1, leaf-players: leaf-players, cell-size: cell-size, gap: gap) + gap
  }
}

/// type(rule) = function: (array, array) -> bool, ex : rule(X,A) = true avec A.len() == X.len()
#let draw-nonlocal-game(
  rule,
  promise: none,
  players: 3,
  cell-size: 1,
  gap: 1,
  leaf-players: 2,
  unit-length: 2em,
  label-scale: 0.6,
  pair-order: default-pair-order,
  valid-color: rgb(0, 0, 200, 100),
  invalid-color: rgb(200, 0, 0, 100),
  extra-content: none,
) = {
  cetz.canvas(length: unit-length, {
    import cetz.draw: *

    extra-content

    let draw-game-grid(players, origin: (0, 0)) = {
      let (ox, oy) = origin
      if players <= leaf-players {
        let side = pow2(players) * cell-size
        grid(origin, (ox + side, oy + side))
      } else {
        let child-span = recursive-game-span(players - 1, leaf-players: leaf-players, cell-size: cell-size, gap: gap)
        let step = child-span + gap
        for (index, _) in pair-order.enumerate() {
          let (x-shift, y-shift) = quadrant-offset(index, step)
          draw-game-grid(players - 1, origin: (ox + x-shift, oy + y-shift))
        }
      }
    }

    let event-center(A, X, origin: (0, 0)) = {
      let (ox, oy) = origin
      if A.len() <= leaf-players {
        let row = pair-order-index(X.at(0), A.at(0), order: pair-order)
        let col = pair-order-index(X.at(1), A.at(1), order: pair-order)
        (
          ox + (col + 0.5) * cell-size,
          oy + (4 - row - 0.5) * cell-size,
        )
      } else {
        let child-span = recursive-game-span(A.len() - 1, leaf-players: leaf-players, cell-size: cell-size, gap: gap)
        let step = child-span + gap
        let index = pair-order-index(X.at(0), A.at(0), order: pair-order)
        let (x-shift, y-shift) = quadrant-offset(index, step)
        event-center(A.slice(1), X.slice(1), origin: (ox + x-shift, oy + y-shift))
      }
    }

    let label-size = label-scale * cell-size * unit-length / players - 0.15em

    draw-game-grid(players)

    for a-index in range(pow2(players)) {
      let A = int-to-bits(a-index, players)
      for x-index in range(pow2(players)) {
        let X = int-to-bits(x-index, players)
        let color = if rule(A, X) { valid-color } else { invalid-color }
        let valid_promise = if promise != none { promise(A,X) } else { true }
        if not valid_promise {
          color = rgb(200,200,200,100)
        }
        content(
          event-center(A, X),
          text(size: label-size, fill: black, event-text(A, X)),
        )
        let (cx, cy) = event-center(A, X)
        rect(
          (cx - 0.5 * cell-size, cy - 0.5 * cell-size),
          (cx + 0.5 * cell-size, cy + 0.5 * cell-size),
          fill: color,
          stroke: none,
        )

      }
    }
  })
}
