<!-- SPDX-License-Identifier: MIT-0 -->
# sepia-memo

Research memos with cream paper, classical serif typography, small-cap headings,
printer's rules, and readable mathematics and tables. Adapted from
[Foadsf/vintage-latex](https://github.com/Foadsf/vintage-latex), with modern
spelling and numerals. No package dependencies or font installation are needed
for the default appearance.

Version 0.1.0 is available from this GitHub repository.
[Typst Universe submission #5916](https://github.com/typst/packages/pull/5916)
is awaiting review; the registry import below is not publicly available yet.
Requires Typst 0.15.1 or newer.

![Sample research memo](https://raw.githubusercontent.com/ChennoShen239/sepia-memo/v0.1.0/thumbnail.png)

## Try it now

Clone the repository and compile the [example](example.typ):

```sh
git clone https://github.com/ChennoShen239/sepia-memo.git
cd sepia-memo
typst compile example.typ example.pdf
```

Edit `example.typ` for the title, author, date, and appearance. Edit
`template/content.typ` for the sample body. For automatic PDF updates while
writing, run `typst watch example.typ example.pdf` and open the PDF in a viewer
that reloads changed files.

Browser preview is provided separately by an editor integration such as
[Tinymist](https://myriad-dreamin.github.io/tinymist/feature/preview.html).
Open the containing folder as your editor project. In a multi-file project,
keep `example.typ` selected as the main document for compilation and preview.
The content file only defines a function and does not render a memo by itself.

## Use as a package

The following works with a [local package installation](https://github.com/typst/packages#local-packages)
and will work from the registry once version 0.1.0 is published on Typst Universe:

```typ
#import "@preview/sepia-memo:0.1.0": memo, memo-note, printer-rule

#show: memo.with(
  title: [A research note],
  author: "Your name",
  date: [22 September 2026],
)

= Question

Write your note here.

#memo-note[Check the units.][
  A short paragraph with a note in the right margin.
]

#printer-rule()
```

When using a checkout directly, replace the package import with `"lib.typ"`
and place your document beside that file. To adapt an existing document, keep
its content and select its existing paper size explicitly, for example
`paper: "us-letter"`.

After Universe publication, create a new project with:

```sh
typst init @preview/sepia-memo:0.1.0 my-memo
typst compile my-memo/main.typ my-memo/main.pdf
```

## Options

`memo` wraps the document with a show rule. Its options are:

| Option | Default | Purpose |
| --- | --- | --- |
| `title` | `[Untitled memo]` | Title content and PDF title metadata |
| `subtitle` | `none` | Optional subtitle content |
| `author` | `""` | Author string and PDF author metadata |
| `date` | `none` | Optional date content or string; never changes automatically |
| `paper` | `"a4"` | Paper name, such as `"us-letter"` |
| `font` | `"Libertinus Serif"` | Body font family |
| `math-font` | `"New Computer Modern Math"` | OpenType math font family |
| `paper-color` | `rgb("#F4EBDD")` | Page background; use `white` for printing |
| `ink` | `rgb("#231F1A")` | Text and title-rule color |

The default fonts are embedded in the Typst CLI. Code uses DejaVu Sans Mono.
The fixed margins are 25 mm top, 26 mm bottom, 27 mm left, and 38 mm right.
The layout is intended for portrait A4 and US Letter pages.

Headings, equations, references, footnotes, figures, and bibliographies remain
ordinary Typst elements. Equation numbering is opt-in with
`#set math.equation(numbering: "(1)")`. Table text uses lining tabular numerals;
add table rules with `table.hline` as shown in the starter.
Table figures can break across pages; use `table.header(repeat: true, ...)`
for a repeating header in a long table.

`printer-rule()` inserts a three-part divider. Its optional `ink` parameter
sets its color. Import it alongside `memo` when needed.

`memo-note(note)[paragraph]` places a short note in the right margin alongside
one short paragraph. It reserves the height of both, so successive note blocks
do not overlap. The block stays on one page; use normal footnotes for long
notes. Use it at the top level with the standard memo margins, not inside a
table, column, or another narrow container.

## Optional Garamond appearance

Obtain [EB Garamond](https://github.com/octaviopardo/EBGaramond12) and
[Garamond Math](https://github.com/YuanshengZhao/Garamond-Math) from their
upstream projects. Use the regular, italic, bold, and bold-italic EB Garamond
faces. Both font projects use OFL-1.1. Install the fonts on your system, or put
them in a local directory and pass that directory to the compiler:

```sh
typst compile --font-path /path/to/fonts example.typ memo.pdf
```

Select the families in the show rule:

```typ
#import "@preview/sepia-memo:0.1.0": memo

#show: memo.with(
  title: [A research note],
  font: "EB Garamond",
  math-font: "Garamond-Math",
)
```

Check the names with `typst fonts --font-path /path/to/fonts`. For editor
preview, install the fonts or configure Tinymist's font paths. In the Typst web
app, upload the font files into your own project if they are unavailable there.
Universe prohibits bundling fonts inside packages or starter templates, so no
font files are included here. The Garamond option changes line breaks and may
change pagination.

## Attribution and licenses

The adapted library follows vintage-latex example 01 at commit
`559011918849a3da819912a7c26493071d542df5`, with the optional Garamond math pairing
from example 15. Copyright (c) 2026 the repository contributors; adaptation
copyright (c) 2026 Chen Gao. See [NOTICE](NOTICE) for the source and changes.

| Files | License |
| --- | --- |
| `lib.typ`, `thumbnail.png` | [CC BY-SA 4.0](licenses/CC-BY-SA-4.0.txt) |
| `template/*`, `example.typ`, `typst.toml`, `README.md`, `.gitignore` | [MIT-0](licenses/MIT-0.txt) |
| `LICENSE`, `NOTICE`, `licenses/*` | License and attribution notices, retained as applicable |

The independently written starter prose and invented measurements are not
copied from the upstream examples or from private research files. The MIT-0
license lets users edit and distribute these starter files without attribution
or notice requirements. It does not change the library's CC BY-SA obligations.

Authors retain rights in their original writing. Whether a particular output
has upstream obligations depends on any protected upstream material it contains
or adapts; this package offers no blanket output exception. The supplied sample
PDF and thumbnail may be shared under CC BY-SA 4.0. No fonts, engraved figures,
or fiziko code are distributed.

See [LICENSE](LICENSE) for the complete scope of each license and the links to
its terms. No endorsement by upstream authors is claimed.
