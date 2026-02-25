// Settings

#set page(
  paper: "a5",
  // The inside margin is wider so text isn't swallowed by the spine
  margin: (inside: 18mm, outside: 12mm, top: 15mm, bottom: 18mm),
  numbering: "1",
)

#set text(font: "Literata", size: 11pt)
#let breakable(s) = s.codepoints().join(sym.zws)

#let bookmark(text) = {
  place(hide(heading(level: 1)[#text]))
}

#show regex("(?m)^---$"): it => block(
  width: 100%,
  above: 1.2em,
  below: 0em,
  line(length: 100%)
)

// Story Template
#let render_story(story_title, image_path, text_file, is_last: false) = {
  // Bookmark
  bookmark(story_title)

  // Title
  align(center)[
    #stack(
      dir: ttb, // Stack items from top to bottom
      spacing: 18pt, // This is your absolute, controllable gap
      text(size: 26pt, weight: "bold")[#story_title],
      image(image_path, width: 100%),
    )
  ]

  v(12pt)

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
#render_story("The Calibration Chamber", "img/the_calibration_chamber.jpg", "txt/the_calibration_chamber.txt")
#render_story("Metaballs", "img/metaballs.jpg", "txt/metaballs.txt")
#render_story("Donny Slomile", "img/donny_slomile.jpg", "txt/donny_slomile.txt")
#render_story("Noda", "img/noda.jpg", "txt/noda.txt")
#render_story("La Vía Más Corta", "img/la_via_mas_corta.jpg", "txt/la_via_mas_corta.txt")
#render_story("The Boundary Of Noise", "img/the_boundary_of_noise.jpg", "txt/the_boundary_of_noise.txt")
#render_story("El Perro De Taco Bell", "img/el_perro_de_taco_bell.jpg", "txt/el_perro_de_taco_bell.txt")
#render_story("Austerios Polip", "img/austerios_polip.jpg", "txt/austerios_polip.txt", is_last:true)