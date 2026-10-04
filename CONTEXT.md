<!-- SPDX-License-Identifier: MIT-0 -->
# sepia-memo

Vintage research memos containing prose, mathematics, and tables.

## Language

**Emphasis block (强调块)**:
A passage with a clearly visible boundary that distinguishes a selected
specification, assumption, or numerical check from the surrounding memo.
It may contain prose, equations, and tables.
_Avoid_: Column (a division of the page layout).

**Pasted note (贴纸强调块)**:
An emphasis block resembling a torn paper slip attached to the memo page.

**Chinese mode (中文模式)**:
`memo(lang: "zh")` uses ChillKai handwriting with Garamond Latin text and math,
two-character paragraph indentation, and upright headings. ChillKai is Regular-only;
Chinese titles and strong markup use a 0.020 em outline on Chinese glyphs and
punctuation; emphasis uses underlines. Latin strong text uses native Garamond bold.
Body text, margin notes, and pasted annotations share one Chinese font.
Source Han Serif SC remains a
printed-book alternative through `font`. English remains the default language.
