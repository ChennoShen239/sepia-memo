// SPDX-License-Identifier: MIT-0
#import "../lib.typ": memo, memo-inset
#show: memo.with(title: [Emphasis blocks], font: "Libertinus Serif",
  math-font: "New Computer Modern Math")
#memo-inset(title: [Assumption])[
  A short block with mathematics: $x = 1$.
]
#memo-inset[A block without a title.]
#memo-inset(title: [Long block])[
  #table(columns: 2, [Object], [Value], [Mean], [$x$])
  #for i in range(18) [
    #lorem(75)

    $x_(t+1) = rho x_t + epsilon_(t+1)$
  ]
]
#context {
  let starts = query(<sepia-paper-start>)
  let ends = query(<sepia-paper-end>)
  assert(starts.len() == 3 and ends.len() == 3)
  let first = starts.last().location().position()
  let last = ends.find(it => it.value == starts.last().value.id).location().position()
  assert(last.page > first.page, message: "Long block must cross pages")
}
