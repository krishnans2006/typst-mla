// MLA-style template
// Main reference: Google Docs' MLA template

#let template(
  title: none,
  author: none,
  professor: none,
  course: none,
  date: datetime.today(),
  body,
) = {
  // Document metadata
  set document(
    title: title,
    author: author,
  )

  // Font: Times New Roman 12pt
  set text(
    font: ("Times New Roman", "Liberation Serif"),
    size: 12pt,
  )

  // Page: US Letter, 1" margins.
  set page(
    paper: "us-letter",
    margin: 1in,
    numbering: "1",
    number-align: top + right,
    // We want 1/2" from the top of the page
    // header-ascent is the gap from the body to the header baseline
    // so for 12pt font that's 0.5in - 12pt
    header-ascent: 0.5in - 12pt,
  )

  // Double spacing throughout
  set par(
    leading: 2em,
    spacing: 2em,
    justify: false,
    first-line-indent: 0pt,
  )

  // Block quotes: indent 1/2" from left
  set quote(block: true)
  show quote.where(block: true): set pad(left: 0.5in)

  // First-page heading
  [
    #author

    #professor

    #course

    // MLA date: Day Month Year (e.g. 3 September 2026)
    #if type(date) == datetime {
      date.display("[day padding:none] [month repr:long] [year]")
    } else {
      date
    }

    // Title has paragraph spacing before = 30pt
    #v(30pt)

    #align(center, title)
  ]

  // Body (indent every paragraph)
  set par(first-line-indent: (amount: 0.5in, all: true))

  body
}
