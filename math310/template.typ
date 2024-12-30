#import "@preview/plotst:0.2.0": *
#import "@preview/ctheorems:1.1.2": *
#import "@preview/physica:0.9.3": *

#let project(title: "", body) = {
  let authors = ("Mark Schulist",)
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(paper: "us-letter", numbering: "1", number-align: center, fill: rgb("1c1c1c"))
  set text(font: "Libertinus Serif", lang: "en", fill: rgb("fdfdfd"))
  set heading(numbering: "1.a)")

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: true)

  body
}

#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)

#let csv_fl_one(path, len) = {
  let c = csv(path)
  let fl = ()
  for i in range(len) {
    let element = c.at(i).at(0)
    fl.push(float(element))
  }
  return fl
}

#let csv_fl(path, len) = {
  let c = csv(path)
  let fl = ()
  for i in range(len) {
    let element = c.at(i)
    fl.push((float(element.at(0)), float(element.at(1))))
  }
  return fl
}

#let plot_simple(
  data,
  xlim: (0, 1),
  xlab: [x axis],
  xstep: 1,
  ylim: (0, 1),
  ylab: [y axis],
  ystep: 1,
  title: [Plot Title],
) = {
  graph_plot(
    plot(
      data: data,
      axes: (
        axis(
          min: xlim.at(0),
          max: xlim.at(1),
          step: xstep,
          location: "bottom",
          value_color: white,
          marking_color: white,
          stroke: white,
          title: xlab,
        ),
        axis(
          min: ylim.at(0),
          max: ylim.at(1),
          step: ystep,
          location: "left",
          value_color: white,
          marking_color: white,
          stroke: white,
          title: ylab,
        ),
      ),
    ),
    (100%, 50%),
    markings: "",
    caption: title,
    stroke: red,
  )
}

#let proof(body) = block(
  width: 100%,
  {
    [_Proof._ ]
    body
    box(width: 0pt)
    h(1fr)
    sym.wj
    sym.space.nobreak
    $square$
  },
)