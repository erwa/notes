### Gradient

```
\nabla
```

https://tex.stackexchange.com/questions/219951/laplaces-equation-symbols


### Dot dot dot

```
\dots
\cdots

# three literal periods
...
```

https://tex.stackexchange.com/questions/32217/3-dots-in-matrix


### Infinity

```
\infty
```


### Assign value to variable

```
\nu \gets \nu + \Delta\nu
```


### Lowercase and uppercase Greek letters

```
\delta  % lowercase
\Delta  % uppercase
```


### Given that

```
\vert
```


### Indent line

```
\- \quad a=0

% \- means "breakable"
```

https://tex.stackexchange.com/a/93760/156856


### Big brackets

```
\Bigg[ ... \Bigg]
% https://www.sharelatex.com/learn/Brackets_and_Parentheses

\left [ ... \right ]
```


### Dot product

```
\cdot
```

https://tex.stackexchange.com/questions/19180/which-dot-character-to-use-in-which-context


### Derivative

```
\frac{\mathrm{d} }{\mathrm{d} x}
```


### Partial derivative

```
\frac{\partial Q}{\partial t}
```

https://tex.stackexchange.com/questions/225523/how-to-write-partial-differential-equation-ex-dq-dt-ds-dt-with-real-partial-d


### Big slash

```
\Bigg/
```

https://tex.stackexchange.com/questions/187281/big-forward-slash-in-math


### Element of

```
\in
```

https://tex.stackexchange.com/questions/213781/element-of-or-equal-to-symbol/213802


### Alignment

```
\begin{align*}
& \text{if} \sum_{j \in numeric} a_j x_j \le s & \text{go left}
\\
& \text{else} & \text{go right}
\end{align*}
```

https://www.sharelatex.com/learn/Aligning_equations_with_amsmath#Aligning_several_equations


### Center

```
\begin{align}
% ...
\end{align}

% https://tex.stackexchange.com/questions/2597/how-do-i-turn-off-equation-auto-numbering
% align without equation numbering
\begin{align*}
% ...
\end{align*}

\center{...}

% https://tex.stackexchange.com/questions/23650/when-should-we-use-begincenter-instead-of-centering
{\centering ...
}
```


### QED

`\blacksquare`

https://tex.stackexchange.com/questions/34014/qed-for-theorems-without-proofs


### Asterisk

`\star`


### argmin, argmax

```
\arg\min_a
\arg\max_a
% http://tipstrickshowtos.blogspot.com/2012/04/how-to-render-argmax-argmin-operator-in.html

{arg\,min}
{arg\,max}

\underset{1 \le k \le K}{arg\,min}
```


### Sum

`\sum_{}^{}`


### Expected value

```
\mathbb{E}
```

https://tex.stackexchange.com/questions/367950/math-mode-expected-value


### Not equal to

`\neq`

https://tex.stackexchange.com/questions/63781/how-to-write-a-not-equal-to-sign-in-latex-pseudocode


### Hat / widehat

```
\hat{Pr}
\widehat{Pr}
```


### Overline

```
\bar{\x}
```

https://tex.stackexchange.com/questions/22100/the-bar-and-overline-commands


### Subscript and superscript

```
a_1^2
```

https://www.sharelatex.com/learn/Subscripts_and_superscripts


### Comments

```
% This is a comment
```


### Using BibTeX

```
@ Comment line in .bib file
@ https://tex.stackexchange.com/questions/21709/comments-in-bibtex
```

```
% Add to beginning of your .tex file
\usepackage[
  backend=bibtex,
  style=alphabetic,
  citestyle=alphabetic,
  maxnames=4
]{biblatex}
\addbibresource{sample.bib}
```

https://www.sharelatex.com/learn/Biblatex_citation_styles
http://mirror.hmc.edu/ctan/macros/latex/exptl/biblatex/doc/biblatex.pdf


### Why "latex bibtex latex latex"?

Multiple passes are required because some references aren't defined yet on the first pass.

If formatting doesn't look right, try running latex again.

https://tex.stackexchange.com/questions/100652/easier-than-latex-bibtex-latex-latex


### Adjust margins

```
% in preamble

\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endchangemargin=\endlist

% in text to modify
\begin{changemargin}{0.5cm}{0.5cm}
%your text here
\end{changemargin}
```

https://tex.stackexchange.com/a/600


### Fonts

```
% font sizes
% https://texblog.org/2012/08/29/changing-the-font-size-in-latex/
\Huge
\huge
\LARGE
\Large
\large
\normalsize (default)
\small
\footnotesize
\scriptsize
\tiny

% Typewriter (monospace) font
\texttt{blah}

% Bold
\mathbf{x}  % can use for vector
\textbf{my_text}

% Italics
\textit
```


### Mathematical expression

```
\[ \]

% or

\( \)
```


### Example LaTeX file

```
\documentclass[12pt]{article}
\begin{document}
This is LaTeX.
\end{document}
```

http://mally.stanford.edu/~sr/computing/latex-example.html


### Online Latex renderer

https://latex.codecogs.com/eqneditor/editor.php
https://www.codecogs.com/eqnedit.php


### Whitespace / Spacing / Newline / Blank lines

```
\enskip
\enspace  % in-line space
\quad  % bigger in-line space
\qquad  % even bigger

% https://tex.stackexchange.com/questions/198432/using-the-tab-command

\parskip
\smallskip
\medskip

\vspace*{0.5cm}

% https://tex.stackexchange.com/questions/27028/what-is-the-difference-between-newline-and
\\
\newline
```

https://tex.stackexchange.com/questions/63761/inserting-a-specific-number-of-blank-lines


### Text in math mode

```
\text{foobar}
```


### Math mode

`$x + y$`

https://tex.stackexchange.com/questions/79141/is-there-a-designated-symbol-for-the-negative-sign-in-say-16


### Latex equations in Google Docs

Auto-LaTeX Equations
https://chrome.google.com/webstore/detail/auto-latex-equations/iaainhiejkciadlhlodaajgbffkebdog

```
$$<latex>$$
```


### Fraction

```
\frac{n_l n_r}{n}(\bar{y}_l - \bar{y}_r)^2

a\frac{(1-r^n)}{(1-r)}
```


### Square root / nth root

```
\sqrt{5}
\sqrt[n]{a}
```