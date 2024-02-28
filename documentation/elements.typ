#let code-snippet(
  caption: "",
  body,
) = {

  show figure.where(kind: "code"): fig => align(left)[
  #fig.body  
  #v(10pt, weak: true)
  #fig.caption 
  ] 
  show raw.where(block: true): set block(
    fill: rgb("#F6FFF3"),
    inset: 5mm,
    radius: 10pt,
    stroke: 1pt + green,
    )
  show raw.line: it => {
    box(
      align(top, stack(
        dir: ltr,
        box(width: 15pt)[#it.number],
        it.body,
      ))
    )
  }
 
 figure(caption: [#caption],supplement: [Code Snippet], kind: "code")[#body]
}