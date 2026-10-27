<!-- SPDX-License-Identifier: MIT-0 -->
# Working on sepia-memo

`lib.typ` is the package entrypoint. It only re-exports the public definitions
from `src/sepia-memo.typ`, where the implementation lives.

## Preview from the repository

The starter and the Chinese example import the published package. To preview
local changes, change the sepia-memo import in the file to `"../lib.typ"` and
run from the repository root:

```sh
typst watch --root . template/main.typ memo.pdf
typst watch --root . examples/chinese.typ chinese.pdf
```

Change the import back before committing. Editors with the
[Tinymist browser preview](https://myriad-dreamin.github.io/tinymist/feature/preview.html)
work the same way.

## Tests

Each file in `tests/` compiles without a template and fails on an assertion
error:

```sh
for f in tests/*.typ; do typst compile --root . "$f" /tmp/out.pdf || echo "FAILED: $f"; done
```

`tests/chinese.typ` needs ChillKai; the others fall back to fonts embedded in
the Typst CLI.

## Preview images

The README images and the Universe thumbnail are rendered at 144 ppi with the
default fonts installed, from copies of the starter and the Chinese example
whose import points at `"../lib.typ"`:

```sh
typst compile --root . template/main.typ "preview-page-{p}.png" --ppi 144
cp preview-page-1.png thumbnail.png
typst compile --root . examples/chinese.typ preview-chinese.png --ppi 144
```

## Submitting to Typst Universe

Copy the repository into `packages/preview/sepia-memo/<version>/` of a
typst/packages fork, leaving out `.git`, `.gitignore`, `.zed/`, `output/`,
`tests/`, `examples/`, `CONTEXT.md`, and this file. Keep the `preview-*.png`
images, which the README shows, and shorten `exclude` in that copy's
`typst.toml` to `["/preview-*.png"]`, since the other entries name files that
are not there.
