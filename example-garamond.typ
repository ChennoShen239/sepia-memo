// SPDX-License-Identifier: MIT-0
// Copyright (c) 2026 Chen Gao
// Optional font example. Install EB Garamond and Garamond-Math first.
// See README.md for font setup. Usable before the package is published.
#import "lib.typ": memo, memo-note
#import "template/content.typ": sample

#show: memo.with(
  title: [On repeated measurement],
  subtitle: [A short note on averages and variation],
  author: "A. Researcher",
  date: [23 September 2026],
  font: "EB Garamond",
  math-font: "Garamond-Math",
)

#sample(memo-note)
