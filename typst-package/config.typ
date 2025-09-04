#import "symbols.typ": *

// #import "@preview/theorion:0.4.0": *
#import "@preview/lemmify:0.1.8": default-theorems, thm-numbering-heading, thm-numbering-linear
#let thm-style-phyxmeow(
  thm-type,
  name,
  number,
  body,
) = align(
  left,
  block(width: 100%, breakable: true)[#{
    strong(thm-type)
    if number != none {
      strong(" " + number)
    }
    if name != none {
      " " + [(#name)]
    }
    strong(".") + body
  }]
    + v(0em, weak: true)
    + h(0em),
)
#let proof-style-phyxmeow(
  thm-type,
  name,
  number,
  body,
) = align(
  left,
  block(width: 100%, breakable: true)[#{
    emph(thm-type)
    if number != none { number } // No output but resets the counter.
    if name != none {
      emph(" " + name)
    }
    emph(".") + body + h(1fr) + $square$
  }]
    + v(0em, weak: true)
    + h(0em),
)
#let (
  theorem,
  lemma,
  corollary,
  remark,
  proposition,
  example,
  definition,
  proof,
  rules: theorem-rules,
) = default-theorems(
  "phyxmeow-thms",
  lang: "en",
  // thm-numbering: thm-numbering-linear,
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

#import "@preview/physica:0.9.5": *
#let div = math.op("div")
#let curl
#let grad

#import "@preview/xarrow:0.3.1": xarrow
#import "@preview/quick-maths:0.2.1"
#import "@preview/algo:0.3.6": algo, comment, d, i
#import "@preview/cetz:0.4.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
// #import "@preview/autofletcher:0.1.1": placer, place-nodes, edges, tree-placer, circle-placer, arc-placer
// #import "@preview/commute:0.3.0"
#import "@preview/touying:0.6.1"

#let font-setup = (
  "ncm": (text: "New Computer Modern", math: "New Computer Modern Math", weight: 450, styles: (), features: ("cv01",)),
  "ncm-scr": (
    text: "New Computer Modern",
    math: "New Computer Modern Math",
    weight: 450,
    styles: (1,),
    features: ("cv01",),
  ),
  "concrete": (text: "CMU Concrete", math: "Concrete Math", weight: 500, styles: (), features: ()),
  "xcharter": (text: "XCharter", math: "XCharter Math", weight: 400, styles: (), features: ()),
  "stix2": (text: "STIX Two Text", math: "STIX Two Math", weight: 400, styles: (1,), features: ()),
  "cambria": (text: "Cambria", math: "Cambria Math", weight: 400, styles: (), features: ()),
  "oldstd": (text: "Old Standard", math: "OldStandard-Math", weight: 400, styles: (1,), features: ()),
  "default": (text: "Libertinus Serif", math: "STIX Two Math", weight: 400, styles: (), features: ()),
)

#let title-setup = (
  "miama": (text: "Miama Nueva", size: 20pt),
  "times": (text: "Times New Roman", size: 24pt),
  "default": (text: none, size: 20pt),
)

#let heading-setup = (
  miama: it => text(font: "Miama Nueva", it) + v(9pt),
  default: it => it,
)

#let title(body, author: none, date: none, font: "", size: none) = {
  let fc = title-setup.at(font, default: title-setup.default)
  let final-size = if size == none { fc.size } else { size }
  set align(center)
  context {
    let font-name = text.font
    if fc.text != none {
      font-name = fc.text
    }
    set text(font: font-name, size: final-size)
    block(body)
    set text(size: final-size - 8pt)
    if author != none { author }
    if date != none { "\n" + date }
  }
}

#let preamble(body, font: "", font-size: 12pt, heading-font: "", numbering: "1.1.") = {
  set page(
    paper: "a4",
    numbering: "1",
    margin: 1in,
  )
  set par(
    justify: true,
    first-line-indent: 2em,
  )
  set heading(numbering: numbering)
  show heading: heading-setup.at(heading-font, default: heading-setup.default)

  show: theorem-rules
  show: quick-maths.shorthands.with(..shorthands)

  show raw: set text(
    font: "Fira Code",
    size: 10pt,
    weight: 400,
  )

  let fc = font-setup.at(font, default: font-setup.default)
  set text(
    font: fc.text,
    size: font-size,
    weight: fc.weight,
  )
  show math.equation: set text(
    font: fc.math,
    // size: font-size,
    weight: fc.weight,
    stylistic-set: fc.styles,
    features: fc.features,
  )
  show math.equation: set block(breakable: true)
  body
}
