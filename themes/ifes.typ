#import "../logic.typ"
#import "../utils/utils.typ"

#let uni-short-title = state("uni-short-title", none)
#let uni-short-author = state("uni-short-author", none)
#let uni-short-date = state("uni-short-date", none)

#let ifes-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: none,
  short-date: none,
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
  uni-short-date.update(short-date)

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
          block(fill: silver, width: 100%, height: 1em)[],
        )
      )
    ]
  ]

  logic.polylux-slide(content)
}
