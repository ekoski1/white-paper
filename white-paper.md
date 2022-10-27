---
title: "What exactly is a 'white paper'?"
author: 
- Eric Koski, Orebed Analytics LLC
date: "October 26, 2022[^0]"
output:
  bookdown::pdf_document2: 
    highlight: tango
    latex_engine: lualatex   # xelatex or lualatex
    keep_tex: yes
    keep_md: yes
    toc: no
    number_sections: no
    citation_package: biblatex      # natbib not tested
    extra_dependencies: 
      flafter: null
      csquotes: null
    includes:
      in_header: preamble.tex
      before_body: before_body.tex
      after_body: 
    # hyperrefoptions: null # pandoc ignores these anyway; see before_body.tex
  bookdown::html_document2:
    df_print: paged
    theme: spacelab
    highlight: tango
    css:
    number_sections: no
    toc: no
    includes:
      in_header: 
      before_body: 
      after_body: 
  rmdformats::readthedown:   
    # https://github.com/juba/rmdformats
    number_sections: no
    toc: 2
    highlight: tango
mainfont: texgyrepagella-regular.otf
mainfontoptions: "BoldFont=texgyrepagella-bold.otf,
  ItalicFont=texgyrepagella-italic.otf,
  BoldItalicFont=texgyrepagella-bolditalic.otf"
mathfont: texgyrepagella-math.otf
sansfont: zhv.otf                 # Helvetica
monofont: inconsolata.otf
# colorlinks: specify in before_body.tex
colorlinks: true
papersize: letter
geometry: margin=2.54cm   # change if A4
lang: en-US
fontsize: 10pt
bibliography: "white-paper.bib"
biblio-style: alphabetic  # choices include ieee, acm, apa, mls, alphabetic, authoryear, etc.
biblio-title: References
biblatexoptions: 
- hyperref=true
- backref=true
keywords: this, that
abstract: "This is the abstract."
---





[^0]: **Current version:** October 26, 2022; **commit:** 3ecbc3c1 2022-10-26 UF! UC!

## Introduction {#introduction}

Code chunk is included here to verify that syntax highlighting is as expected. 


```r
# utils.R contains misc useful functions; conversions.R includes unit conversions 
# and defines adjustForInflation(dollarValue, fromYear, toYear); additionally, 
# it downloads the annual inflation index from FRED. 
source("utils.R")
source("conversions.R")
```

A biblatex reference: [@nyserdaNewYorkState2019].

A url: https://www.ipums.org/projects/ipums-usa. 

See [Introduction](#introduction).^[This is a footnote.]

Reference to a Pandoc-style footnote.[^a]

[^a]: A Pandoc-style footnote.

\clearpage

```{=html}
<h2>References</h2>
```
