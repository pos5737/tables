Tables in LaTeX with kableExtra
================

This repo contains example files to show how to automate table creation
with kableExtra and LaTeX.

There are two parts:

1.  Create the table in R with `kable()` and saves as a `.tex` file. See
    `make-latex-table.R` for an example.
2.  `\input{}` that `.tex` file into the LaTeX manuscript. See
    `doc/manuscript.tex` for an example.
