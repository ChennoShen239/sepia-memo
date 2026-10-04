// SPDX-License-Identifier: MIT-0
// Copyright (c) 2026 Chen Gao
#import "../lib.typ": memo, memo-note, memo-inset

#show: memo.with(
  lang: "zh",
  title: [关于重复测量],
  subtitle: [均值、变动与单位的简短笔记],
  author: "研究者",
  date: [2026 年 10 月 4 日],
)

#set math.equation(numbering: "(1)")

= 目的

记录“重复测量”时，应同时说明*单位、重复次数和观测值的变动*。下面沿用英文示例的五个虚构观测值，展示《测量札记》的计算（单位：任意单位）。它们用于演示，_不是实验数据_。

= 计算

#memo-inset(title: [工作假设])[
  五次观测采用相同单位与采集程序。观测值的变动描述这组测量，不代表所有实验环境中的不确定性。先核对单位，再解释 mean 与 standard deviation。
]

令 $x_i$ 表示第 $i$ 次观测，$n$ 表示观测次数。样本均值和样本标准差为

$
  overline(x) = 1/n sum_(i=1)^n x_i,
  quad s = sqrt(1/(n - 1) sum_(i=1)^n (x_i - overline(x))^2).
$ <eq-summary>

本例中，$n = 5$，$overline(x) = 10.0$，$s approx 0.16$ 任意单位。标准差保留两位小数；计算使用表中的观测值。#footnote[
  样本方差使用分母 $n - 1$，本例中为四。
]

#block(breakable: false)[
  #figure(
    table(
      columns: (1fr, 1fr, 1fr), align: (left, right, right),
      table.hline(stroke: 0.6pt),
      table.header([*观测次数*], [*观测值*], [*偏离均值*]),
      table.hline(stroke: 0.3pt),
      [1], [9.8], [$-0.2$],
      [2], [10.1], [$0.1$],
      [3], [10.0], [$0.0$],
      [4], [9.9], [$-0.1$],
      [5], [10.2], [$0.2$],
      table.hline(stroke: 0.6pt),
    ),
    caption: [虚构观测值，单位为任意单位；偏差相对于样本均值计算。],
  ) <tab-observations>
]

= 解释

#memo-note[
  *保留单位。* 数字精确，不代表测量没有不确定性。
][
  @tab-observations 便于核对 @eq-summary 的计算。偏差之和为零，偏差平方和为 $0.10$。报告四舍五入后的结果前，这两项检查有助于发现抄录错误。
]

重复测量反映采集条件下的变动。它本身不能证明仪器已经校准，也不能保证换一种环境仍得到相同分布。这些判断需要各自的观测与论证。
