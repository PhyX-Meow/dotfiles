// Operators
#let sign = math.op("sign")
#let ord = math.op("ord")
#let span = math.op("span")
#let img = math.op("Im")
#let Ric = math.op("Ric")
#let Hess = math.op("Hess")
#let re = math.op("\u{211C}")
#let im = math.op("\u{2111}")
#let card = math.op("\u{0023}")

// Symbol Alias
#let bar = math.macron
#let vbar = math.bar
#let eps = math.epsilon
#let vphi = math.phi
#let phi = math.phi.alt
#let vthe = math.theta.alt
#let oo = math.infinity
#let OO = math.emptyset
#let Id = math.bb("1")
#let II = [I#h(-.15em)I]
#let acts = math.arrow.cw.half
#let into = math.arrow.hook.r
#let pt = math.diff
#let bt = math.macron(math.diff)
#let int = math.integral
#let lap = math.laplace
#let nd = math.nabla
#let iso = math.tilde.equiv
#let cc = math.subset
#let tens = math.times.circle
#let dsum = math.plus.circle
#let wed = math.and
#let ov = math.overline
#let iff = $<=>$
#let tant = scale(math.perp, y: -100%)
#let breb = scale(math.perp, y: -100%)
#let sect = math.inter
#let cap = math.inter
#let cup = math.union

// Math Shorthands
#let shorthands = (
  ($==$, math.equiv),
  ($~=$, math.tilde.eq),
  ($|-->$, math.arrow.r.long.bar),
  ($<|$, math.triangle.l),
)

// Text Alias
#let ie = emph("i.e.")
#let st = emph("s.t.")

// Functions
#let pari(a, b) = [#math.angle.l #a,#b #math.angle.r]
#let dd(x) = [#h(.1em) #differential(x)]
#let ignore(body) = []
#let Int(a, b) = math.attach(math.integral, br: a, tr: b)
