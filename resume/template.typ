#let github_repo(url) = {
  text(link(url, "(GitHub Repo)"), weight: "thin")
}

#let resume(body) = {
  set list(indent: 1em)
  show list: set text(size: 0.92em)
  show link: underline
  show link: set underline(offset: 3pt)

  set page(
    paper: "us-letter",
    margin: (x: 0.45in, y: 0.40in),
  )

  set text(size: 11pt)

  body
}

#let name_header(name) = {
  set text(size: 2.25em)
  [*#name*]
}

#let header(
  name: "Mark Schulist",
  phone: "4152093361",
  email: "mschulist2@gmail.com",
  linkedin: "",
  github: "github.com/mschulist",
  site: "mschulist.com",
) = {
  align(
    center,
    block[
      #name_header(name) \
      #link("mailto:" + email)[#email] |
      #link("https://" + linkedin)[#linkedin] |
      #link("https://" + github)[#github] |
      #link("https://" + site)[#site] |
      #phone
    ],
  )
  v(5pt)
}

#let resume_heading(txt) = {
  show heading: set text(size: 0.92em, weight: "regular")

  block[
    = #smallcaps(txt)
    #v(-4pt)
    #line(length: 100%, stroke: 1pt + black)
  ]
}

#let edu_item(
  name: "Sample University",
  degree: "B.S in Bullshit",
  location: "Foo, BA",
  date: "Aug. 1600 - May 1750",
  ..points,
) = {
  set block(above: 0.7em, below: 1em)
  pad(
    left: 1em,
    right: 0.5em,
    box[
      #grid(
        columns: (3fr, 1fr),
        align(left)[
          *#name* \
          _#degree _
        ],
        align(right)[
          #location \
          _#date _
        ],
      )
      #list(..points)
    ],
  )
}

#let exp_item(
  name: "Sample Workplace",
  role: "Worker",
  date: "June 1837 - May 1845",
  location: "Foo, BA",
  ..points,
) = {
  set block(above: 0.7em, below: 1em)
  pad(
    left: 1em,
    right: 0.5em,
    box[
      #grid(
        columns: (3fr, 1fr),
        align(left)[
          *#role* \
          _#name _
        ],
        align(right)[
          #date \
          _#location _
        ],
      )
      #list(..points)
    ],
  )
}

#let project_item(
  name: "Example Project",
  skills: "Programming Language 1, Database3",
  date: "May 1234 - June 4321",
  ..points,
) = {
  set block(above: 0.7em, below: 1em)
  pad(
    left: 1em,
    right: 0.5em,
    box[
      *#name* | #skills #h(1fr) #date
      #list(..points)
    ],
  )
}

#let skill_item(
  category: "Skills",
  skills: "Balling, Yoga, Valorant",
) = {
  set block(above: 0.7em)
  set text(size: 0.91em)
  pad(left: 1em, right: 0.5em, block[*#category*: #skills])
}


#let LATEX = {
  [L]
  box(
    move(
      dx: -4.2pt,
      dy: -1.2pt,
      box(scale(65%)[A]),
    ),
  )
  box(
    move(
      dx: -5.7pt,
      dy: 0pt,
      [T],
    ),
  )
  box(
    move(
      dx: -7.0pt,
      dy: 2.7pt,
      box(scale(100%)[E]),
    ),
  )
  box(
    move(
      dx: -8.0pt,
      dy: 0pt,
      [X],
    ),
  )
  h(-8.0pt)
}
