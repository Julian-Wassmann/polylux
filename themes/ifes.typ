#import "../logic.typ"
#import "../utils/utils.typ"

#let uni-short-title = state("uni-short-title", none)
#let uni-short-author = state("uni-short-author", none)

#let ifes-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: none,
  body
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0em,
    header: none,
    footer: none,
  )
  set text(size: 18pt, font: "Arial")
  show footnote.entry: set text(size: .6em)

  uni-short-title.update(short-title)
  uni-short-author.update(short-author)

  body
}

#let title-slide(
  title: [],
  author: [],
  info: [],
  date: [],
) = {

  let content = [
    #v(-10pt)
    #box(inset: 20pt)[
      #grid(
        columns: (auto, 1fr, auto),
        column-gutter: 7pt,
        image("logos/ifes_logo.png", height: 38pt),
        align(horizon)[
          #set text(size: 11pt, kerning: false, ligatures: false, font: "Calibri")
          #set par(leading: 0.6em)
          Institut für Elektrische Energiesysteme\
          Fachgebiet Elektrische Energieversorgung\
          Prof. Dr.-Ing. habil. Lutz Hofmann\
        ],
        image("logos/luh_logo.png", height: 38pt),
      )]
    #v(-20pt)
    #align(center)[#text(size: 26pt, fill: rgb("#00519e"))[#title]]
    #align(bottom)[
      #grid(
        columns: (1fr, 1fr),
        image("logos/luh.jpeg"),
        align(center + horizon)[
          *#author*
          #v(1em)
          #info
          #v(1em)
          #date
        ],
        grid.cell(
          colspan: 2,
          block(fill: silver, width: 100%, height: 18pt)[],
        )
      )
    ]
  ]

  logic.polylux-slide(content)
}

#let slide(
  title: [],
  body
) = {

  let header = grid(
    columns: (auto, 1fr, auto),
    column-gutter: 7pt,
    image("logos/ifes_logo.png", height: 25pt),
    align(horizon)[
      #set text(size: 11pt, kerning: false, ligatures: false, font: "Calibri")
      #set par(leading: 0.6em)
      Institut für Elektrische Energiesysteme\
      Fachgebiet Elektrische Energieversorgung\
    ],
    image("logos/luh_logo.png", height: 25pt),
  )

  let footer = locate(loc => {
    set align(center + horizon)
    set text(size: 9pt)
    block(fill: silver, width: 100%, height: 18pt)[
      #grid(
        columns: (1fr, auto),
        [*#uni-short-title.display() #h(.5em) -- #h(.5em) #uni-short-author.display()*],
        pad(x: 2em,)[#grid(
          rows: (auto, 1fr),
          block(width: 100pt, height: 5pt, fill: rgb("#B1C91F"))[],
          [Seite #logic.logical-slide.display()]
        )]
      )
    ]
  })

  set page(
    margin: (top: 2em, bottom: 18pt, x: 0em),
    header: pad(x: 2em, header),
    footer: footer,
    footer-descent: 0em,
    header-ascent: 0em,
  )

  logic.polylux-slide([
    #pad(x: 2em, y: 1em, [
      #align(center)[#text(size: 26pt, fill: rgb("#00519e"))[#title]]
      #v(-.5em)
      #body
    ])
  ])

}