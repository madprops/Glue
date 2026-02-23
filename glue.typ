// Settings
#set page(width: 6in, height: 9in, margin: 18pt)
#set text(font: "Literata", size: 12pt)
#let breakable(s) = s.codepoints().join(sym.zws)

#let bookmark(text) = {
  place(hide(heading(level: 1)[#text]))
}

#bookmark("Cover")

// Cover
#align(center)[
  #stack(
    dir: ttb, // Stack items from top to bottom
    spacing: 18pt, // This is your absolute, controllable gap
    text(size: 28pt, weight: "bold")[Glue],
    image("img/glue.jpg", width: 100%),
  )
]

#pagebreak()

#bookmark("Introduction")

// Introduction
#align(center + horizon)[
  #v(1em)
  This is a collection of short stories and other kinds of writings.

  #v(1em)
  A lot of this was aided, and literally written by Claude and Gemini.

  #v(1em)
  Written between 2025 and 2026 in Costa Rica.
]

#pagebreak()

// Story Template
#let render_story(story_title, image_path, text_file, is_last: false) = {
  // Bookmark
  place(hide(heading(level: 1)[#story_title]))

  // Title
  align(center)[
    #stack(
      dir: ttb, // Stack items from top to bottom
      spacing: 18pt, // This is your absolute, controllable gap
      text(size: 28pt, weight: "bold")[#story_title],
      image(image_path, width: 100%),
    )
  ]

  pagebreak()

  // \S means "any non-whitespace character"
  // {30,} means "30 or more times in a row"
  // This finds huge blocks of text and inserts zero-width spaces into them
  show regex("\S{30,}"): it => it.text.codepoints().join(sym.zws)

  read(text_file)

  if is_last == false {
    pagebreak(weak: true)
  }

  pagebreak(weak: true)
}

// Stories
#render_story("Find The Body", "img/find_the_body.jpg", "txt/find_the_body.txt")
#render_story("San Lorenzo", "img/san_lorenzo.jpg", "txt/san_lorenzo.txt")
#render_story("The Shift", "img/the_shift.jpg", "txt/the_shift.txt")
#render_story("The Purple Prison", "img/the_purple_prison.jpg", "txt/the_purple_prison.txt")
#render_story("Metaballs", "img/metaballs.jpg", "txt/metaballs.txt")
#render_story("Donny Slomile", "img/donny_slomile.jpg", "txt/donny_slomile.txt")
#render_story("Noda", "img/noda.jpg", "txt/noda.txt")
#render_story("La Vía Más Corta", "img/la_via_mas_corta.jpg", "txt/la_via_mas_corta.txt", is_last:true)