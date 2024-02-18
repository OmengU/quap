// HTL document template

#let renderTitle(
  title: "",
  sub: "",
  number: ""
) = {
  align(center)[
    #pad(x: 2cm)[
      #grid(row-gutter: 1cm,
            image("images/logoHTL.jpg", height: 5cm),
            text("Diploma thesis in the higher department of informatics", size: 10pt),
            text(title, size: 44pt),
            text(sub, size: 16pt, weight: 700),
            text(number, size: 12pt),
          )
    ]
  ]
}

#let project(
  headerShort: "HTBLA Saalfelden",
  headerDetail: "Institution for information technology",
  productLogo: "",
  title: "",
  subTitle: "",
  number: "",
  authors: (),
  authorsLastName: (),
  body
) = {
 let authorNames = ""
 for author in authors {
    authorNames += author.name + " "
 }
 
 set document(author: authorNames, title: title)
  
  set text(
    size: 12pt,
    font: "Arial",
    lang: "en"
  )
  
  set page(
    paper: "a4",
    margin: 2cm,
    header: box(
      stroke: (bottom: black),
      inset: 4pt
    )[
      #grid(
        columns: (auto, auto),
        column-gutter: (1fr),
      )[
        HTL Saalfelden - Informatics
      ][
        2023/2024
      ]
    ],
  )

  v(1.5cm)

  renderTitle(title: title, sub: subTitle, number: number)

  v(32pt)

  table(
    inset: 16pt,
    stroke: none,
    ..authors.map(author => [
      *#author.task*#linebreak()
      #table(
        columns: (2fr, 1fr, 3fr),
        inset: 0pt,
        stroke: none,
        [#author.name],
        [#author.class],
        table(
          stroke: none,
          inset: 0pt,
          row-gutter: 4mm,
          ..author.supervisors.map(supervisor => [
          *#supervisor.level supervisor*: #linebreak() #supervisor.title #supervisor.name
        ]),
        ),
      )
    ]),
  )

  v(32pt)

  par(
    align(bottom + center)[Completed in the school year 2023/2024]
  )

  set heading(numbering: "1.")
  
  set par(
    justify: true
  )
  set page(
    footer: box(
      stroke: (top: black),
      inset: 8pt
    )[
      #set text(size: 0.9em)
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: (1fr, 1fr),
      )[
        #align(left, text(authorsLastName.join(", ")))
      ][
        #align(center, number)
      ][
        #align(right, counter(page).display("1/1", both: true))
      ]
    ],
  )
  
  body
}