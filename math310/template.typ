#let project(title: "", body) = {
  let authors = ("Mark Schulist",)
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(paper: "us-letter", numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")
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