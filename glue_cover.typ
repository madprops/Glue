// COVER DIMENSIONS (Based on A5)
#let cover-width = 148mm
#let cover-height = 210mm
#let spine-width = 5mm // Verify with print shop
#let bleed = 3mm

#set page(
  // Total width: Back Cover + Spine + Front Cover (with bleeds built in)
  width: (bleed * 2) + (cover-width * 2) + spine-width,
  height: cover-height + (bleed * 2),
  margin: 0pt,
)

// Set default text color to white for high contrast
#set text(font: "Literata", size: 18pt, fill: white)

// We define exactly 3 columns. The left and right columns absorb the 3mm bleed.
#grid(
  columns: (bleed + cover-width, spine-width, cover-width + bleed),
  rows: (100%),

  // --- 1. BACK COVER (Solid Red) ---
  block(width: 100%, height: 100%, fill: red)[
    #align(center + horizon)[
      // The box keeps the text from hitting the spine or the outer cut line
      #box(width: 80%)[
        Collection of short stories and other kinds of writings.

        #v(1em)
        A lot of this was aided, and literally written by Claude and Gemini.

        #v(1em)
        Between 2025 and 2026 in Costa Rica.
      ]
    ]
  ],

  // --- 2. SPINE (Solid Green with Text) ---
  block(width: 100%, height: 100%, fill: green)[
    #align(center + horizon)[
      // Rotates the text so it reads nicely on the spine
      #rotate(-90deg)[#text(size: 10pt, weight: "bold")[Glue]]
    ]
  ],

  // --- 3. FRONT COVER (Full Emu) ---
  block(width: 100%, height: 100%, clip: true)[
    // We place the image to act as the background for just this block
    #place(
      center + horizon,
      image("img/glue.jpg", width: 100%, height: 100%, fit: "cover")
    )

    // Absolute position for the title over the image
    #place(
      bottom + right,
      // We subtract the bleed so the text stays inside the "safe area"
      dx: -1mm - bleed,
      dy: -1mm - bleed
    )[
      #text(size: 28pt, weight: "bold")[Glue]
    ]
  ]
)