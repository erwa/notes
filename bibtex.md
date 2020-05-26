### Why "latex bibtex latex latex"?

Multiple passes are required because some references aren't defined yet on the first pass.

If formatting doesn't look right, try running latex again.

https://tex.stackexchange.com/questions/100652/easier-than-latex-bibtex-latex-latex


### BibTeX change formatting for a field

```
\DeclareFieldFormat{title}{\mkbibquote{#1}}
```

https://tex.stackexchange.com/questions/174208/biblatex-italicizes-misc-entries/174232


### BibTeX online reference | citing a webpage

```
% urldate is the accessed date
@online{WinNT,
  author = {MultiMedia LLC},
  title = {{MS Windows NT} Kernel Description},
  year = 1999,
  url = {http://web.archive.org/web/20080207010024/http://www.808multimedia.com/winnt/kernel.htm},
  urldate = {2010-09-30}
}
```

https://tex.stackexchange.com/questions/3587/how-can-i-use-bibtex-to-cite-a-web-page


### Using BibTeX

```
% Percent sign seems to work more reliably for comments.
% cannot appear inside an entry

@ BibTex comment
@ Comment line in .bib file
@ https://tex.stackexchange.com/questions/21709/comments-in-bibtex
```

```
% example test.bib file
@misc{ Nobody06,
       author = "Nobody Jr",
       title = "My Article",
       year = "2006" }
```

```
\documentclass[11pt]{article}
\usepackage{cite}

\begin{document}

\title{My Article}
\author{Nobody Jr.}
\date{Today}
\maketitle

Blablabla said Nobody ~\cite{Nobody06}.

\bibliography{test}{}  % test.bib is the name of bib file
\bibliographystyle{plain}
\end{document}
```

```
% Add to beginning of your .tex file
% for alpha citation style (e.g.: [CW12])
\usepackage[
  backend=bibtex,
  style=alphabetic,
  citestyle=alphabetic,
  maxnames=4  % use to control how many names are printed before "et al."
]{biblatex}
\addbibresource{sample.bib}
```

Make sure to run pdflatex on the .tex file, then bibtex on the .bib file, then pdflatex twice on .tex file.

https://tex.stackexchange.com/questions/1554/biblatex-displaying-all-authors-of-multi-author-works-in-the-bibliography
https://tex.stackexchange.com/questions/305381/biblatex-empty-bibliography
https://www.sharelatex.com/learn/Biblatex_citation_styles
http://mirror.hmc.edu/ctan/macros/latex/exptl/biblatex/doc/biblatex.pdf