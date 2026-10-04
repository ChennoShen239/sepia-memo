// SPDX-License-Identifier: MIT-0
#import "../lib.typ": memo, memo-inset
#show: memo.with(lang: "zh")
#context {
  assert(text.lang == "zh")
  assert(text.size == 12pt)
  assert(text.font.last() == "chillkai")
  assert(par.first-line-indent == (amount: 2em, all: true))
}
== #context {
  assert(text.style == "normal" and text.weight == "regular")
  [中文小标题]
}
_#context {
  assert(text.style == "normal" and text.weight == "regular")
  [强调内容]
}_
*#context {
  assert(text.weight == "bold")
  [重点内容]
}*
*中文重点“标点” English 123 $x = 1$*。
`// 中文注释`，$underbrace(x, text("均值"))$。
#memo-inset(title: [跨页检查])[
  #for i in range(25) [
    第 #i 次检查：正文、中文标点“引号”（括号）与 English 混排。样本均值 $overline(x)$ 的单位与观测值相同，不能省略。

    $x_(t+1) = rho x_t + epsilon_(t+1)$
  ]
]
#context {
  let first = query(<sepia-paper-start>).first().location().position()
  let last = query(<sepia-paper-end>).first().location().position()
  assert(last.page > first.page, message: "Chinese inset must cross pages")
}
