#import "symbols.typ": *

#import "@preview/lemmify:0.1.5": default-theorems, thm-style-simple, thm-style-proof
#let thm-style-phyxmeow(
  thm-type,
  name,
  number,
  body
) = block(width: 100%, breakable: true)[#{
  strong(thm-type)
  if number != none {
    strong(" " + number)
  }
  if name != none {
    " " + [(#name)]
  }
  strong(".") + body
}]
#let proof-style-phyxmeow(
  thm-type,
  name,
  number,
  body
) = block(width: 100%, breakable: true)[#{
  emph(thm-type)
  if name != none {
    emph(" " + name)
  }
  emph(".") + body + h(1fr) + $square$
}] // Note: No proof numbering here
#let (
  theorem, lemma, corollary, proposition, example,
  proof, definition, remark, rules: theorem-rules
) = default-theorems(
  "phyxmeow-thms",
  lang: "en",
  thm-styling: thm-style-phyxmeow,
  proof-styling: proof-style-phyxmeow,
)

#import "@preview/physica:0.9.1": *
  #let div = math.op("div")
  #let curl
  #let grad

#import "@preview/xarrow:0.2.0": xarrow

#import "@preview/quick-maths:0.1.0"

// #import "@preview/cetz:0.1.2"

// #import "@preview/commute:0.2.0": node, arr, commutative-diagram

#let default

#let preamble(body, font: default, font-size: 12pt, numbering: "1.1.") = {
  set page(
    paper: "a4",
    numbering: "1",
    margin: 1in,
  )
  set par(
    justify: true,
    first-line-indent: 2em,
  )
  set heading(
    numbering: numbering
  )

  show: theorem-rules
  show: quick-maths.shorthands.with(..shorthands)

  show raw: set text(
    font: "Fira Code",
    size: 10pt,
    weight: 400,
  )

  if font == "concrete" {
    set text(
      font: "CMU Concrete",
      size: font-size,
      weight: 500,
    )
    show math.equation: set text(
      font: "Concrete Math",
      size: font-size,
      weight: 500,
    )
    body
  } else if font == "xcharter" {
    set text(
      font: "XCharter",
      size: font-size,
      weight: 400,
    )
    show math.equation: set text(
      font: "XCharter Math",
      size: font-size,
      weight: 400,
    )
    body
  } else if font == "cambria" {
    set text(
      font: "Cambria",
      size: font-size,
      weight: 400,
    )
    show math.equation: set text(
      font: "Cambria Math",
      size: font-size,
      weight: 400,
    )
    body
  } else {
    set text(
      font: "New Computer Modern",
      size: font-size,
      weight: 450,
    )
    show math.equation: set text(
      font: "New Computer Modern Math",
      size: font-size,
      weight: 450,
      stylistic-set: 3,
    )
    _OO_state_.update("\u{2300}")
    body
  }
}