#import "symbols.typ": *

#import "@local/lemmify:0.2.0": default-theorems, style-simple, qed-box
#let (
  theorem, lemma, corollary, proposition, example,
  proof, definition , theorem-rules
) = default-theorems(
  lang: "en",
  style: style-simple.with(seperator: strong(". ")),
  proof-style: style-simple.with(kind-name-style: emph, seperator: ". ",
  qed: qed-box),
  proof-numbering: none,
)
#let (remark,) = default-theorems(
  style: style-simple.with(kind-name-style: emph, seperator: ". "),
  numbering: none
)

#import "@preview/physica:0.8.1": *

#import "@preview/xarrow:0.2.0": xarrow

#import "@preview/quick-maths:0.1.0"

#let default

#let preamble(body, font: default, font-size: 12pt, numbering: "1.1") = {
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

  if font == "concrete" {
    set text(
      font: ("CMU Concrete"),
      size: font-size,
      weight: 500,
    )
    show math.equation: set text(
      font: "Concrete Math",
      size: font-size,
      weight: 500,
    )
    show raw: set text(
      font: "CMU Concrete",
      size: font-size,
      weight: 500,
    )
    _integral_shift_state_.update(-0.6em)
    body
  } else if font == "xcharter" {
    set text(
      font: ("XCharter"),
      size: font-size,
      weight: 400,
    )
    show math.equation: set text(
      font: "XCharter Math",
      size: font-size,
      weight: 400,
    )
    show raw: set text(
      font: "XCharter",
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
    body
  }
}