#import "@preview/tablex:0.0.8": tablex, colspanx

#let renderTitle(
  title: "",
  sub: "",
  number: ""
) = {
  align(center)[
    #pad(x: 2cm)[
      #grid(row-gutter: 1cm,
            image("images/logoHTL.jpg", height: 6cm),
            text("Diploma thesis in the higher department of Informatics", size: 11pt),
            text(title, size: 47pt),
            text(sub, size: 18pt, weight: 700),
            text(number, size: 14pt),
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
  set list(marker: ([•], [--]))

  let aNames = ()

  for author in authors {
    aNames.push(author.name)
  }
  
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
    footer: box(
      stroke: (top: black),
      inset: 8pt
    )[
      #set text(size: 0.9em)
      #grid(
        columns: (1fr, 1fr, 2fr),
        column-gutter: (1fr, 1fr),
      )[
        #align(left, text(aNames.join(", ")))
      ][
        #align(center, "")
      ][
        #align(right, number)
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
    justify: true,
    leading: 0.82em,
  )

  pagebreak()

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }

  show heading.where(level: 4): it => {
    heading(numbering: none, outlined: false)[#it.body]
  }
  
  body
}

#let footer-set(authors: (), number: "", body) = {
  let aNames = ()

  for author in authors {
    aNames.push(author.name)
  }
  
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
        #align(left, text(aNames.join(", ")))
      ][
        #align(center, number)
      ][
        #align(right, counter(page).display("1/1", both: true))
      ]
    ],
  )
  body
}

#let table-overview(body) = {
  
  heading(numbering: none, outlined: false)[Short version/task overview]

  tablex(
    columns: (1fr, 1fr, 1fr, 1fr),
    inset: 3mm,

    colspanx(1)[*Topic*], colspanx(3)[Development of a web-based Quiz application],
    colspanx(1)[*Task* #linebreak() *(short)*], colspanx(3)[
      The goal is to plan and implement a web-based quiz application for classrooms. The application will be run on an instructor's computer, which students can use to connect. A quiz is then run on the PC, which Students can take part in by reading the questions on a projector screen and then choosing the correct answer on their device.
    ],
    colspanx(2)[*Candidates*], colspanx(2)[*Supervisors*],
    colspanx(2)[Florian Piberger], colspanx(2)[Dipl.-Ing. (FH) Dietmar Winkler],
    colspanx(2)[],colspanx(2)[Prof. Dipl.-Ing. (FH) Markus Falkensteiner],
    colspanx(4)[*External partners*],
    colspanx(4)[none],
    colspanx(4)[*Budget:* none],
    colspanx(4)[
      *Planned Usage of the product:*

      The source code will be openly viewable on GitHub. Commercial use of the Code or the product is not intended now or at any time in the future.
    ]

  )

  pagebreak()
  body
}

#let declaration(body) = [

#align(center)[#heading(numbering: none, outlined: false)[Erklärung]]
#linebreak()

  
Die unterfertigten Kandidaten haben gemäß § 34 (3) SchUG in Verbindung mit § 22 (1) Zi. 3 lit. b der Verordnung über die abschließenden Prüfungen in den berufsbildenden mittleren und höheren Schulen, BGBl. II Nr. 70 vom 24.02.2000 (Prüfungsordnung BMHS), die Ausarbeitung einer Diplomarbeit mit der umseitig angeführten Aufgabenstellung gewählt.

#block(inset: 4mm)[
#strong()[#align(center)[
Die Kandidaten / Kandidatinnen nehmen zur Kenntnis, dass die Diplomarbeit in eigenständiger Weise und außerhalb des Unterrichtes zu bearbeiten und anzufertigen ist, wobei Ergebnisse des Unterrichtes mit einbezogen werden können.

Die Abgabe der vollständigen Diplomarbeit hat bis spätestes

05.04.2024

beim zuständigen Betreuer zu erfolgen.

Die Kandidaten nehmen weiters zur Kenntnis, dass gemäß § 9
(6) der Prüfungsordnung BMHS nur der Schulleiter bis spätestens
Ende des vorletzten Semesters den Abbruch einer Diplomarbeit
anordnen kann, wenn diese aus nicht beim Prüfungskandidaten (bei
den Prüfungskandidaten) gelegenen Gründen nicht fertiggestellt
werden kann.
]]
]


#table(
  columns: (1fr, 1fr),
  rows: (auto, auto),
  inset: 4mm,

  [*Kandidaten / Kandidatinnen*], [*Unterschrift*],
  [Florian Piberger], []
)
  
  
#pagebreak()
#body
]