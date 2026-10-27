// SPDX-License-Identifier: MIT-0
// Regression checks for the 0.4.1 review fixes; compile with --root .
#import "../lib.typ"
#import "../lib.typ": memo, memo-inset

// Only the documented definitions are public.
#assert.eq(dictionary(lib).keys().sorted(),
  ("memo", "memo-inset", "memo-note", "printer-rule"))

#show: memo.with(title: none, short-title: [Short], author: ("Ada", [Bob]),
  paper-color: rgb("#fff"), font: "Libertinus Serif",
  math-font: "New Computer Modern Math")
#set page(margin: auto, numbering: none)

// A torn-paper block across pages used to fail with `margin: auto`.
#memo-inset(title: [Long])[#lorem(1500)]

#context assert.eq(document.author, ("Ada", "Bob"))
