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
#let eps = math.epsilon
#let vphi = math.phi
#let phi = math.phi.alt
#let vthe = math.theta.alt
#let oo = math.infinity
#let _OO_state_ = state("emptyset symbol", math.emptyset)
#let OO = locate(loc => _OO_state_.final(loc))
#let Id = math.bb("1")
#let II = [I#h(-.15em)I]
#let acts = math.arrow.cw.half
#let into = math.arrow.hook.r
#let pt = math.diff
#let int = math.integral
#let lap = math.laplace
#let nd = math.nabla
#let bar = math.macron
#let iso = math.tilde.equiv
#let cc = math.subset
#let tens = math.times.circle
#let dsum = math.plus.circle
#let wed = math.and
#let iff = $<=>$

// Math Shorthands
#let shorthands = (
  ($==$, math.equiv),
  ($~=$, math.tilde.eq),
  ($|-->$, math.arrow.r.long.bar ),
)

// Text Alias
#let ie = emph("i.e.")
#let st = emph("s.t.")

// Functions
#let pari(a,b) = [#sym.angle.l #a,#b #sym.angle.r]
#let dd(x) = [#h(.1em) #differential(x)]
#let comment(body) = []
#let Int(a,b) = math.attach(math.integral, br:a, tr:b)