#import "symbols.typ": *

// #import "@preview/ctheorems:1.1.3": *
// #show: thmrules
#import "@preview/lemmify:0.1.7": default-theorems
#let thm-style-phyxmeow(
  thm-type,
  name,
  number,
  body
) = align(left, block(width: 100%, breakable: true)[#{
  strong(thm-type)
  if number != none {
    strong(" " + number)
  }
  if name != none {
    " " + [(#name)]
  }
  strong(".") + body
}] + v(0em, weak: true) + h(0em))
#let proof-style-phyxmeow(
  thm-type,
  name,
  number,
  body
) = align(left,block(width: 100%, breakable: true)[#{
  emph(thm-type)
  if name != none {
    emph(" " + name)
  }
  emph(".") + body + h(1fr) + $square$
}] + v(0em, weak: true) + h(0em))
#let (
  theorem, lemma, corollary, proposition, example,
  proof, definition, remark, rules: theorem-rules
) = default-theorems(
  "phyxmeow-thms",
  lang: "en",
  thm-styling: thm-style-phyxmeow,
  proof-styling: proof-style-phyxmeow,
)

#let code(body, linenumber: true, block-algin: center, width: auto) = {
  show raw.where(block: true): code => {
    // set text(font: "Fira Code")
    set align(left)
    show raw: block.with(
      breakable: true,
      width: width,
      inset: 8pt,
      stroke: 1pt + rgb("#888888"),
      fill: rgb("#F8F8F8"),
    )
    show raw.line: line => {
      if linenumber {
        text(fill: gray)[#line.number]
        h(1em)
      }
      line.body
    }
    code
  }
  align(block-algin, block(body))
}

#import "@preview/physica:0.9.4": *
  #let div = math.op("div")
  #let curl
  #let grad

#import "@preview/xarrow:0.3.1": xarrow
#import "@preview/quick-maths:0.2.0"
#import "@preview/algo:0.3.4": algo, i, d, comment
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge
// #import "@preview/autofletcher:0.1.0": placer, place-nodes, edges, tree-placer, circle-placer, arc-placer
#import "@preview/touying:0.5.5"

#let preamble(body, font: "", font-size: 12pt, numbering: "1.1.") = {
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
  } else if font == "miama" {
    set text(
      font: "Miama Nueva",
      size: font-size,
      weight: 400,
    )
    show math.equation: set text(
      font: "STIX Two Math",
      size: font-size,
      weight: 400,
      stylistic-set: 1,
    )
    body
  } else if font == "stix2" {
    set text(
      font: "STIX Two",
      size: font-size,
      weight: 400,
    )
    show math.equation: set text(
      font: "STIX Two Math",
      size: font-size,
      weight: 400,
      // stylistic-set: 1, // For mathscr
    )
    body
  } else if font == "ncm" {
    set text(
      font: "New Computer Modern",
      size: font-size,
      weight: 450,
    )
    show math.equation: set text(
      font: "New Computer Modern Math",
      size: font-size,
      weight: 450,
      features: ("cv01",),
      // stylistic-set: 1, // For mathscr
    )
    // _OO_state_.update("\u{2300}")
    body
  } else {
    set text(
      font: "Libertinus Serif",
      size: font-size,
      weight: 400,
    )
    show math.equation: set text(
      font: "Libertinus Math",
      size: font-size,
      weight: 400,
    )
    body
  }
}