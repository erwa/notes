### Cumulative distribution

See example under "Shade under curve".

https://tex.stackexchange.com/questions/198383/drawing-cumulative-distribution-function-for-a-discrete-variable


### Shade under curve

Plot curve. Plot y = 0. Use fillbetween.

```
\usepackage{pgfplots, pgfplotstable}
\usepgfplotslibrary{fillbetween}
\usepackage{tikz}
\usetikzlibrary{intersections}

% if inside tcolorbox, make sure "fit" parameter is NOT set
\begin{tikzpicture}
\begin{axis}[
    clip=false,
    ymin=0,ymax=100,
    xmin=10, xmax=20,
    every axis plot/.style={very thick},
    table/create on use/cumulative distribution/.style={
        create col/expr={\pgfmathaccuma + \thisrow{f(x)}}
    }
]
\addplot [name path=A, red] table [y=cumulative distribution]{
x f(x)
15.50 2
16.00 2
16.25 2
17.00 20
18.00 50
19.25 10
20.00 10
};
\addplot[draw=none,name path=B,domain=15.5:20] {0};
\addplot[red] fill between[of=A and B,soft clip={domain=15.5:20}]; %filling
\end{axis}
\end{tikzpicture}
```

https://tex.stackexchange.com/questions/453853/shading-area-under-curve-tikz


### n choose k

`{n \choose x}`

https://www.stat.berkeley.edu/~paciorek/computingTips/How_do_I_insert_symbol.html


### XOR

```
\oplus
```

https://tex.stackexchange.com/questions/3936/logic-operators-in-latex-xor/77670


### Function composition symbol

```
\circ
```

https://tex.stackexchange.com/questions/8301/is-there-a-circle-symbol


### Quotes / quotation marks

```
``Double quotes''
`Single quotes'
```

https://tex.stackexchange.com/questions/52351/quote-marks-are-backwards-using-texmaker-pdflatex


### Import multiple packages

```
\usepackage{
  amsmath,
  amssymb,
  amsthm
}
```


### Triple equal (three line equal sign)

```
\equiv

% with slash through it
\not\equiv
```

https://en.wikipedia.org/wiki/Triple_bar


### Congruent

```
\cong
```

https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols#Relation_operators


### Make one page landscape

```
\usepackage{pdflscape}
...
\begin{landscape}
...
\end{landscape}
```

https://tex.stackexchange.com/questions/337/how-to-change-certain-pages-into-landscape-portrait-mode


### Equivalent to / left-right arrow

```
% note the capital L
\Leftrightarrow
```

https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols#Set_and.2For_logic_notation


### Trace of a matrix

```
\usepackage{amsmath}
\DeclareMathOperator{\Tr}{Tr}

\Tr
```

https://tex.stackexchange.com/questions/34532/how-to-represent-the-trace-of-a-matrix


### Compile TeX file online

https://latexonline.cc/

Example: https://latexonline.cc/compile?git=https%3A%2F%2Fgithub.com%2Ferwa%2Fnotes&target=norm-facts.tex&command=pdflatex


### Union symbol

```
\bigcup
\cup
```

https://tex.stackexchange.com/questions/205125/formatting-the-union-of-sets
https://timmurphy.org/2010/05/22/union-and-intersection-symbols-in-latex/


### for all

```
\forall
```

https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols#Set_and.2For_logic_notation


### Kronecker product

```
\otimes
```

https://en.wikipedia.org/wiki/List_of_mathematical_symbols_by_subject#Matrix_calculus


### Tilde

```
\sim
```

https://tex.stackexchange.com/questions/9363/how-does-one-insert-a-backslash-or-a-tilde-into-latex


### Backslash

```
\textbackslash
```

https://tex.stackexchange.com/questions/9363/how-does-one-insert-a-backslash-or-a-tilde-into-latex


### Underscore

```
\_

\textunderscore
```

https://texfaq.org/FAQ-underscore


### Left align and right align on same line

Use `\hfill`.

```
Left-aligned \hfill right-aligned.
```

https://tex.stackexchange.com/questions/294150/left-and-right-aligned-on-same-line


### Fancy P

https://tex.stackexchange.com/questions/232922/a-hack-for-getting-a-capital-weierstrass-p-in-order-to-represent-the-power-set


### Logic symbols

```
\lor     # logical or
\land    # logical and
\to      # implies
\implies # implies
\neg     # logical not, negation
```

https://en.wikipedia.org/wiki/List_of_logic_symbols


### Imaginary Number Symbol

Just use `i`.

https://texblog.org/2013/11/27/complex-number-symbols-in-latex/


### Section heading

```
\section{Introduction}

\subsection{Overview}

% Skip a subsection, set subsection counter
\stepcounter{subsection}
\setcounter{subsection}{4} % next subsection will be 5
```

https://tex.stackexchange.com/questions/111504/setting-section-counter
https://tex.stackexchange.com/questions/132698/how-do-i-skip-a-subsection
https://www.overleaf.com/learn/latex/Sections_and_chapters
https://www.maths.tcd.ie/~dwilkins/LaTeXPrimer/SectionHeadings.html


### Footnote

```
Main text\footnote{A footnote}
```

https://www.overleaf.com/learn/latex/Footnotes


### Footnote without numbering

```
\let\thefootnote\relax\footnotetext{A footnote without numbering}
```

https://tex.stackexchange.com/questions/194075/add-a-footnote-on-the-paper-title


### Therefore (three dots in triangle)

```
\usepackage{amssymb}
\therefore
```

https://tex.stackexchange.com/questions/142551/how-to-put-therefore-and-implies-symbols


### Adding colors

```
\usepackage{xcolor}
\definecolor{emphcolor}{rgb}{0.2,0.5,0.75}
\newcommand{\txtemph}[1]{\textbf{{\sffamily\color{emphcolor}{#1}}}}
```

https://en.wikibooks.org/wiki/LaTeX/Colors


### Determinant function

```
\det
```

https://tex.stackexchange.com/questions/91378/how-to-draw-the-calculation-of-a-determinant


### Put box around expression or equation / box around answer

```
\boxed{1 + 1 = 2}
```

https://tex.stackexchange.com/questions/180325/boxed-equation-with-number/180326


### Image align top

```
\usepackage[export]{adjustbox}
\item \includegraphics[valign=t]{foo.jpg}
```

https://tex.stackexchange.com/questions/101858/make-two-figures-aligned-at-top


### tikzpicture align with top of text

```
\begin{tikzpicture}[baseline=(current bounding box.north)]
```

https://www.yesterdayscoffee.de/2014/10/15/align-the-top-of-a-tikz-picture-with-the-text/


### Disable marks for points / hide points

```
mark=none
```

https://tex.stackexchange.com/questions/65221/how-to-remove-pgfplots-circular-points


### Plotting vector field / quiver plot

```
  \begin{tikzpicture}[baseline=(current bounding box.north)]
  \begin{axis}[
        domain=-2:2,
        view={0}{90},
        axis background/.style={fill=white},
    ]
    \addplot3[blue,
        quiver={
            u={-y},
            v={x},
            scale arrows=0.3,
        },
        -stealth, samples=15]{0};  % stealth style arrow head
  \end{axis}
  \end{tikzpicture}
```

Quiver plot: https://www.mathworks.com/help/matlab/ref/quiver.html
http://pgfplots.net/media/tikz/examples/TEX/differential-equation.tex

https://tex.stackexchange.com/questions/20046/tikz-drawing-a-changing-vector-field-in-a-grid


### Insert graph / plot graph / graph function

```
\usepackage{pgfplots}

% plot derivative of sigmoid function
% https://tex.stackexchange.com/questions/68299/adding-a-legend-entry-to-a-plot
\begin{axis}[xlabel=$x$,ylabel=$\frac{e^{-x}}{(1+e^{-x})^2}$]
\addplot[domain=-10:10,samples=100,mark=none]{e^(-x)/(1+e^(-x))^2};
\addlegendentry{$\frac{e^{-x}}{(1+e^{-x})^2}$}
\end{axis}
\end{tikzpicture}

\begin{tikzpicture}
\begin{axis}

% plot line
\addplot[mark=none]{-2 * x};

% discontinuous function
\addplot[domain=0:4,blue] {x*x};
\addplot[domain=4:6,blue] {x};
\addplot[domain=6:10,blue] {-5};
\draw[dotted] (axis cs:4,16) -- (axis cs:4,4);
\draw[dotted] (axis cs:6,6) -- (axis cs:6,-5);
\addplot[holdot] coordinates{(0,0)(4,4)(6,-5)};
\addplot[soldot] coordinates{(4,16)(6,6)(10,-5)};
\end{axis}
\end{tikzpicture}

% specific tick labels
% https://tex.stackexchange.com/questions/186949/tikz-replacing-the-values-labels-on-x-axis-with-names
\begin{axis}[xtick=1, xticklabels=$\frac{1}{a}$, ytick=\empty, axis lines = middle]

% to disable labels
\begin{axis}[ytick=\empty, xtick=\empty]

% only ticket at y = 0
\begin{axis}[ytick=0]

% show axes
% https://tex.stackexchange.com/questions/222882/drawing-minimal-xy-axis
\begin{axis}[axis lines = middle]

% position labels
% https://tex.stackexchange.com/questions/375706/how-to-control-label-positions
\begin{axis}[
axis equal,  % same scale per axis, https://tex.stackexchange.com/questions/61039/how-to-keep-a-11-scale-with-x-and-y-axis
axis lines = center,
width = 10cm,
height = 10cm,
xlabel = {$x$},
ylabel = {$y$},
zlabel = {$z$},
zmax=1.1,
view/h=45,
every axis z label/.style={ at={(ticklabel* cs:1.05)}},
every axis x label/.style={ at={(ticklabel* cs:1.05)}},
every axis y label/.style={ at={(ticklabel* cs:1.05)}}
]
```

https://tex.stackexchange.com/questions/76418/plot-non-continuous-function-with-tikz


### Insert picture

```
\usepackage{graphicx}
\includegraphics[width=0.6\linewidth]{picture.png}
\includegraphics{{file.with.dots}.png}
```

https://tex.stackexchange.com/questions/10574/includegraphics-dots-in-filename


### Squiggle less than

```
\preceq
```

https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols#Relation_operators


### Greater than or equal to / less than or equal to

```
\geq
\leq
```

https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols


### Greater than with slash through it / inequality with slash through it

```
\not>
```

https://tex.stackexchange.com/questions/64556/not-greater-than-with-vertical-bar-instead-of-slanted-bar


### Much greater than / much less than

```
\gg
\ll
```


### Real numbers

```
\usepackage{amssymb}
\mathbb{R}^{m \times n}
```


### IDEA Plugin

Do not insert `\item` on Enter: use Shift + Enter

https://github.com/Ruben-Sten/TeXiFy-IDEA/pull/108


### Greater than

```
>
```

https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols#Relation_operators


### No paragraph indentation / no indentation

```
\setlength\parindent{0pt}
\begin{document}
```

https://www.overleaf.com/learn/latex/Paragraph_formatting#Paragraph_Indentation
https://tex.stackexchange.com/questions/27802/set-noindent-for-entire-file


### No hanging indentation for enumeration items

```
\begin{enumerate}[wide=0pt]
```

https://tex.stackexchange.com/questions/311667/using-enumerate-with-no-indent/


### Skip item in enumeration

```
\stepcounter{enumi}
```

https://www.overleaf.com/learn/latex/Counters


### Enumerate with custom prefix

```
\usepackage{enumitem}

% Make enumeration number bold
\begin{enumerate}[\textbf{label=Q2.\arabic*}]
\item foo  % Q2.1
\end{enumerate}
```

https://tex.stackexchange.com/questions/116101/add-bold-enumerate-items
https://tex.stackexchange.com/questions/94224/how-to-create-a-list-with-a-fixed-prefix-and-incremental-numbers


### Enumerate from 2, start numbering from 2

```
\begin{enumerate}
  % use enumii or enumiii for deeper lists
  \setcounter{enumi}{4}  % 0-indexed
  \item fifth element
\end{enumerate}
```

https://tex.stackexchange.com/questions/142/how-can-i-make-an-enumerate-list-start-at-something-other-than-1


### Roman typeface

https://tex.stackexchange.com/questions/151897/always-textrm-never-rm-a-counterexample says `\rm` is deprecated and `\textrm` should be used instead.

```
\rm
```

https://www.tutorialspoint.com/tex_commands/rm.htm


### Piecewise defined function

```
B^0_i(x) = \begin{cases}1 & x \in [x_i,x_{i+1}) \\ 0 & \textrm{ otherwise.}\end{cases}
```


### Source code / inline code

```
\texttt{monospace text block}

\usepackage{listings}

% \begin{lstlisting}[basicstyle=\small] % to reduce font size
\begin{lstlisting}
int foo() {
  return 1;
}
\end{lstlisting}
```

https://tex.stackexchange.com/questions/180222/how-to-change-font-size-for-specific-lstlisting
https://tex.stackexchange.com/questions/36030/how-to-make-a-single-word-look-as-some-code


### Algorithms / algorithm2e

```
\usepackage[ruled,linesnumbered,noline]{algorithm2e}

\begin{algorithm}
\KwIn{Some numbers}
\KwOut{The answer}
 initialization\;
 \While{While condition}{
  instructions\;
  \eIf{condition}{
   instructions1\;
   instructions2\;
   }{
   instructions3\;
  }
 }
 \caption{How to write algorithms}
\end{algorithm}
```

https://tex.stackexchange.com/questions/250310/how-to-remove-vertical-lines-representing-a-block-in-algorithm2e
https://www.overleaf.com/learn/latex/algorithms

Other examples

```
\For{$i \gets 1$ \KwTo $O(\log n)$} {
}
```


### Pseudocode function

```
% [noend] means no endfor, etc.
\usepackage[noend]{algorithmic}

\begin{algorithmic}[1]
    \Function{Steepest Descent}{$A$, $\vec{b}$} \Comment{Great algorithm!}
        \State $\vec{x} \gets \vec{0}$
        \For{$k \gets 1, 2, 3, ....$}
            \State $\vec{r} \gets \vec{b} - A \vec{x}$
            \State $\alpha \gets \frac{\vec{r}^{T}\vec{r}}{\vec{r}^{T}A\vec{r}}$
            \State $\vec{x} \gets \vec{x} + \alpha \vec{r}$
        \EndFor
        \State \Return $\vec{x}
    \EndFunction
\end{algorithmic}
```

https://tex.stackexchange.com/questions/9837/hide-closing-statements-for-algorithms
https://tex.stackexchange.com/questions/35621/how-do-you-add-a-comment-to-pseudocode-in-latex
https://tex.stackexchange.com/questions/238574/algorithm-return-statement-does-not-begin-on-new-line


### Define new command

```
% can't define commands with numbers
% https://tex.stackexchange.com/questions/9718/defining-commands-abbreviations-that-contain-numbers
\newcommand{\eq}[1]{$\begin{aligned}[t]#1\end{aligned}$}

\newcommand{\eq}[1]{\begin{align*}#1\end{align*}}

\eq{
  x^2 + 9 &= 0
}

\newcommand{\mat}[1]{\begin{pmatrix}#1\end{pmatrix}}
\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
```

https://tex.stackexchange.com/questions/13042/defining-a-command-for-amsmaths-align-environment


### Underline text

```
\underline{This text is underlined}
```

https://alexwlchan.net/2017/10/latex-underlines/


### Horizontal rule

```
\hrulefill

\begin{center}\rule{10cm}{0.4pt}\end{center}
```

https://www.techwalla.com/articles/horizontal-line-options-in-latex
https://tex.stackexchange.com/questions/23650/when-should-we-use-begincenter-instead-of-centering/23653


### Norm

```
% physics package already defines norm the same way!
\usepackage{physics}

\left\lVert Ax \right\rVert_2

\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
```

Using `||` also looks fine, generally.

https://tex.stackexchange.com/questions/107186/how-to-write-norm-which-adjusts-its-size


### a, b, c | Alphabetical list

```
\usepackage{enumitem}
\begin{enumerate}[label=(\alph*)]
```

https://tex.stackexchange.com/questions/129951/enumerate-tag-using-the-alphabet-instead-of-numbers


### Indicate "n times"

```
\overbrace{44\cdots4\,}^\text{$n$ times}
\underbrace{44\cdots4\,}_\text{$n$ times}
```

https://tex.stackexchange.com/questions/63250/typesetting-144-4-with-n-times-under-the-4s-is-easy-but-what-about-sqrt1


### Wrap long URLs

You may also need to set the line width. For example, you can wrap in a minipage:

```
\begin{minipage}{16cm}
\url{...}
\end{minipage}
```

```
\PassOptionsToPackage{hyphens}{url}\usepackage{hyperref}
```

https://tex.stackexchange.com/questions/3033/forcing-linebreaks-in-url

```
\usepackage[hyphenbreaks]{breakurl}
\usepackage[hyphens]{url}

\begin{enumerate}
\item
svn co \burl{https://svn.xxx.ch/reps/yyyyyyyyyy/Publications/ABC-paper-2012/trunk ABC-paper-2012}
\item
svn co \url{https://svn.xxx.ch/reps/yyyyyyyyyy/Publications/ABC-paper-2012/trunk ABC-paper-2012}
\item
\sloppy
svn co \burl{https://svn.xxx.ch/reps/yyyyyyyyyy/Publications/ABC-paper-2012/trunk ABC-paper-2012}
\item
svn co \url{https://svn.xxx.ch/reps/yyyyyyyyyy/Publications/ABC-paper-2012/trunk ABC-paper-2012}
\end{enumerate}
```

https://tex.stackexchange.com/questions/54946/how-to-break-long-url-in-an-item


### Insert URL

```
\usepackage{hyperref}
\url{http://mathforcollege.com/nm/mws/gen/05inp/mws_gen_inp_txt_ndd.pdf}

\usepackage{hyperref}
\usepackage{xcolor}
\newcommand{\link}[2]{{\color{blue}\href{#1}{#2}}} % extra brackets are needed to turn off blue afterward
\link{https://www.google.com}{Google}
```

https://en.wikibooks.org/wiki/LaTeX/Hyperlinks


### Change style of nested bullets

```
\renewcommand{\labelitemii}{$\star$}
```

https://tex.stackexchange.com/questions/36443/how-to-change-the-nested-itemize-bullet-characters


### Itemize without bullets

```
\begin{itemize}[label={}]
  \item First.
  \item Second.
\end{itemize}
```

https://tex.stackexchange.com/questions/50269/itemize-without-bullets


### Reduce space between bullets

```
\begin{itemize}
\itemsep0em
\item one
\item two
\item three
\end{itemize}


% No item and no list separation:
\usepackage{enumitem}

\setlist{nolistsep}
% if inside tcolorbox, need to use \begin{tcolorbox}[parbox=false]
\begin{itemize}[noitemsep]
    \item one
    \item two
    \item three
\end{itemize}
```

https://tex.stackexchange.com/questions/6081/reduce-space-between-enumerated-items


### Bullet list

```
\begin{itemize}
\item more work
\item more responsibility
\item more satisfaction
\end{itemize}
```

https://en.wikibooks.org/wiki/LaTeX/List_Structures#Customizing_lists


### Plus or minus

```
\pm
```

https://tex.stackexchange.com/questions/23773/a-centered-plus-minus-symbol


### Approximately equal

```
\approx
```

https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols


### Increase table cell padding

```
\def\arraystretch{2} % default is 1
\begin{tabular}{|l|l|}
  \hline
  column 1 & column 2 \\
  \hline
  I really would like this less & crammed \\
  \hline
\end{tabular}
```

https://tex.stackexchange.com/questions/31672/column-and-row-padding-in-tables


### Line break inside table cell / newline in table cell

```
\usepackage{makecell}

\begin{tabular}{ | c | c | c |}
  \hline
  \thead{A Head} & \thead{A Second \\ Head} & \thead{A Third \\ Head} \\
  \hline
  Some text &  \makecell{Some really \\ longer text}  & Text text text  \\
  \hline
\end{tabular}
```

https://tex.stackexchange.com/questions/2441/how-to-add-a-forced-line-break-inside-a-table-cell/19678


### Table without borders

```
\begin{tabular}{ccc}
first row & & \\
second row & & \\
and & so & on \\
\end{tabular}
```

https://tex.stackexchange.com/questions/4400/how-can-one-make-a-table-without-borders


### Draw table / create table / make table

Need to use dollars signs around formulas: `$<formula>$`

```
% l for left justified
\begin{center}
    \begin{tabular}{ | l | l | l | p{5cm} |}
    \hline
    Day & Min Temp & Max Temp & Summary \\ \hline
    Monday & 11C & 22C & A clear day with lots of sunshine.
    However, the strong breeze will bring down the temperatures. \\ \hline
    Tuesday & 9C & 19C & Cloudy with rain, across many northern regions. Clear spells
    across most of Scotland and Northern Ireland,
    but rain reaching the far northwest. \\ \hline
    Wednesday & 10C & 21C & Rain will still linger for the morning.
    Conditions will improve by early afternoon and continue
    throughout the evening. \\
    \hline
    \end{tabular}
\end{center}

% c for center
\begin{tabular}{| c | c | c | c |}
  \hline
  $y_i$ & Approximation using Euler's method with $h = 0.1$ & Actual value & Error \\ \hline
\end{tabular}
```

https://en.wikibooks.org/wiki/LaTeX/Tables


### Double prime

```
p''_1(x_2)
```

https://tex.stackexchange.com/questions/210290/how-to-write-doubleprime-in-latex/210300


### Prime symbol (to indicate derivative)

```
x^\prime
```

http://web.mit.edu/rsi/www/pdfs/ifaq.pdf


### Euler's constant

Generally no special notation, just use `e`.

https://tex.stackexchange.com/questions/58067/how-to-best-typeset-special-constants-complex-unit-i-eulers-number-e


### Logarithm

```
\log
\ln  % Natural logarithm
```

https://tex.stackexchange.com/questions/314609/no-natural-log-parentheses-when-typesetting


### Absolute value

```
% height will be height of fraction
\left| \frac{a}{b} \right|
\mid x \mid
```

http://blog.dreasgrech.com/2013/04/absolute-value-bars-for-fractions-in.html
https://docs.latexbase.com/symbols/absolute%20value/


### Integral

```
% integral from a to b
\int_{a}^{b} x \,dx
```

https://www.overleaf.com/learn/latex/Integrals,_sums_and_limits


### Inline math

```
My text with $1 + 1 = 2$ inlined.
```

https://tex.stackexchange.com/questions/52276/inline-equation-in-latex-with-text


### `\newcommand`

```
\newcommand{<name>}[<args>]{ <code> }
% <name> is name of command
% <args> is number of args
```

https://tex.stackexchange.com/questions/117358/newcommand-argument-confusion


### `\newtheorem`

```
\newtheorem{<name>}{<heading>}[<counter>]

\begin{<name>}[Pythagorean theorem]
\label{pythagorean}
...
\end{<name>}

You can reference theorems such as \ref{pythagorean} when a label is assigned.
```

https://www.overleaf.com/learn/latex/Theorems_and_proofs#Numbered_theorems.2C_definitions.2C_corollaries_and_lemmas
https://tex.stackexchange.com/questions/64931/using-newtheorem


### JavaScript LATEX library

http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML


### Gradient

```
\nabla
```

https://tex.stackexchange.com/questions/219951/laplaces-equation-symbols


### Matrix with right hand side / vertical line in middle

```
% need to use array environment rather than bmatrix
% the | describes the vertical line
\left[
\begin{array}{cccc|c}
    1 & 0 & 3 & -1 & 0 \\
    0 & 1 & 1 & -1 & 0 \\
    0 & 0 & 0 & 0 & 0 \\
\end{array}
\right]
```

https://tex.stackexchange.com/questions/33519/vertical-line-in-matrix-using-latexit


### Matrix dots

```
\dots  % horizontal dots
\vdots % vertical dots
\ddots % diagonal dots
```

https://tex.stackexchange.com/questions/327779/how-to-draw-matrix-with-dots


### Increase max number of columns of matrix

```
# to solve "Extra alignment tab has been changed to \cr" error
\setcounter{MaxMatrixCols}{20}
```

https://tex.stackexchange.com/questions/3519/how-to-use-more-than-10-tab-stops-in-bmatrix-or-other-amsmath-matrix-environment
https://www.overleaf.com/learn/latex/Errors/Extra%20alignment%20tab%20has%20been%20changed%20to%20%5Ccr


### Block matrix

```
\left[\begin{array}{ccccc}
    \multicolumn{5}{c}{\multirow{3}{*}{\huge $U^T$}} \\
    & & & & \\
    & & & &
\end{array} \right]
```

https://tex.stackexchange.com/questions/351627/make-a-symbol-take-up-an-entire-multi-column-multi-row-sub-matrix
https://tex.stackexchange.com/questions/167366/combining-multirow-and-multicolumn


### Matrix / matrices / matrixes

`bmatrix` includes brackets, `matrix` does not. `pmatrix` uses parentheses.

http://latex.wikia.com/wiki/Matrix_environments

```
% Useful new commands
% bracketed matrix
\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}

% parentheses matrix
\newcommand{\pmat}[1]{\begin{pmatrix}#1\end{pmatrix}}

% small matrix, no brackets (or you can add them, as below)
\newcommand{\smat}[1]{\left[\begin{smallmatrix} #1 \end{smallmatrix}\right]}

\begin{equation*}

\begin{matrix}
1 & 2 \\
3 & 4
\end{matrix} \qquad

\begin{bmatrix}
p_{11} & p_{12} & \ldots & p_{1n} \\
p_{21} & p_{22} & \ldots & p_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
p_{m1} & p_{m2} & \ldots & p_{mn}
\end{bmatrix}

\end{equation*}
```

https://tex.stackexchange.com/questions/204621/matrix-in-latex
https://tex.stackexchange.com/questions/156016/how-do-i-make-a-small-pmatrix


### Dot dot dot

```
\dots  % low horizontal dots
\cdots % line-height centered horizontal dots

# three literal periods
...
```

https://tex.stackexchange.com/questions/32217/3-dots-in-matrix


### n approaches infinity

```
n \to \infty
```


### Assign value to variable

```
\nu \gets \nu + \Delta\nu
```


### All uppercase font with bigger first letter (small caps)

```
\textsc{First Letter}
```

https://tex.stackexchange.com/questions/56332/all-letters-in-uppercase-but-the-first-letter-bigger-than-the-other-ones


### Cursive l / lowercase l / cursive ell / lowercase ell

```
\ell
```


### Lowercase and uppercase Greek letters

```
% variants
\varphi % variant phi

\delta  % lowercase
\Delta  % uppercase

\mathcal{X} % uppercase chi
```

https://jblevins.org/log/greek
https://tex.stackexchange.com/questions/304534/what-does-the-var-prefix-stand-for-in-varphi-and-varepsilon-etc


### Given that

```
\vert
```


### Indent block of text

```
\begin{quote}
Indented block.
\end{quote}
```


### Indent line

```
\- \quad a=0

% \- means "breakable"
```

https://tex.stackexchange.com/a/93760/156856


### Big parentheses

```
\left( ... \right)
```


### Big brackets

```
\Bigg[ ... \Bigg]
% https://www.sharelatex.com/learn/Brackets_and_Parentheses

\left [ ... \right ]
```


### Times

```
\times
\cdot
```

https://tex.stackexchange.com/questions/15129/how-to-write-n-x-n-with-a-multiplication-symbol-for-matrix-dimensions

https://tex.stackexchange.com/questions/55957/how-do-you-write-times


### Dot product

```
\cdot

\langle x, y \rangle
```

https://tex.stackexchange.com/questions/19180/which-dot-character-to-use-in-which-context


### Derivative

```
\frac{\mathrm{d} }{\mathrm{d} x}
```


### Partial derivative

```
\usepackage{physics}
\pdv{Q}{t} = \pdv{s}{t}

\frac{\partial Q}{\partial t}
```

https://tex.stackexchange.com/questions/225523/how-to-write-partial-differential-equation-ex-dq-dt-ds-dt-with-real-partial-d


### Big slash

```
\Bigg/
```

https://tex.stackexchange.com/questions/187281/big-forward-slash-in-math


### Not element of / not in

```
\not\in
```


### Element of

```
\in
```

https://tex.stackexchange.com/questions/213781/element-of-or-equal-to-symbol/213802


### Insert page break

```
\pagebreak
```

It seems this has to be put at the end of another line, not on a line by itself.


### Page break inside `{align}`

```
\allowdisplaybreaks
```

https://tex.stackexchange.com/questions/51682/is-it-possible-to-pagebreak-aligned-equations


### Align without new line

```
% must be done in math mode
$\begin{aligned}[t]
\end{aligned}$
```

https://tex.stackexchange.com/questions/269685/avoiding-line-break-when-starting-align


### `align` vs. `align*`

With `align*`, equations will NOT be numbered.

https://tex.stackexchange.com/questions/9514/whats-the-difference-between-align-and-align


### Equation comments

```
\begin{align*}
    3+x &=4 && \text{we are trying to solve for } x\\
    x &=4-3 && \text{Subtract 3 from both sides}\\
    x &=1   && x \text{ must be one}
\end{align*}
```

https://tex.stackexchange.com/questions/47687/adding-line-by-line-comments-to-math-proofs


### Blank line inside `{align}`

```
% Use comment
```

https://tex.stackexchange.com/questions/10355/blank-lines-in-align-environment


### Alignment with less whitespace

Use `alignat*`.

```
\begin{alignat*}{3}
    \noalign{$\quad \op{f} * \op{r} = \op{c}_{\op{f}*\op{r}} (x_1,...,x_k) = (\op{f}(a_1,...,a_k), \op{r}(b_1,...,b_k))$}
    &\text{if } x_i=(x^{\op{f}}_i,x^{\op{r}}_i), &&\quad\text{then } a_i=x^{\op{f}}_i \in \mathcal{S}, b_i=x^{\op{r}}_i \in (\mathcal{A}^*)^*, &&\quad 1 \leq i \leq k\\
    &\text{if } x_i \in \mathcal{A}^*, &&\quad\text{then } a_i=b_i=x_i, &&\quad 1 \leq i \leq k
\end{alignat*}
```

https://tex.stackexchange.com/questions/83658/why-does-aligning-equations-not-work-here


### Alignment

Use `\begin{align}...\end{align}` for equations split across multiple lines.

```
\usepackage{amsmath}

\begin{align*}
& \text{if} \sum_{j \in numeric} a_j x_j \le s & \text{go left}
\\
& \text{else} & \text{go right}
\end{align*}
```

https://www.sharelatex.com/learn/Aligning_equations_with_amsmath#Aligning_several_equations
https://tex.stackexchange.com/questions/131841/environment-align-undefined-line-11-all-i-can-see-to-do-is-to-retype-the-line-a/131842


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


### Maximum

```
\max
```

https://tex.stackexchange.com/questions/342538/how-to-write-underneath-max-in-formula-latex


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


### Expected value / expectation

```
\usepackage{amssymb}
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
\bar{x}
\overline{x}
```

https://tex.stackexchange.com/questions/22100/the-bar-and-overline-commands


### Multiple line subscript

```
\sum_{\substack{i=0 \\ i\neq 4}}^n i
```

https://tex.stackexchange.com/questions/80460/expression-under-summation-on-multiple-lines


### Subscript and superscript

```
a_1^2
```

https://www.sharelatex.com/learn/Subscripts_and_superscripts


### Comments

```
% This is a comment
```


### Bibliography / References

```
Great paper \cite{latexcompanion}.

\begin{thebibliography}{9}
\bibitem{latexcompanion}
Michel Goossens, Frank Mittelbach, and Alexander Samarin.
\textit{The \LaTeX\ Companion}.
Addison-Wesley, Reading, Massachusetts, 1993.

\bibitem{knuthwebsite}
Knuth: Computers and Typesetting,
\\\texttt{http://www-cs-faculty.stanford.edu/\~{}uno/abcde.html}
\end{thebibliography}
```


### List all references, even if you don't cite them

```
\begin{document}
\nocite{*}
...
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

Make sure to run bibtex before pdflatex.

https://tex.stackexchange.com/questions/305381/biblatex-empty-bibliography
https://www.sharelatex.com/learn/Biblatex_citation_styles
http://mirror.hmc.edu/ctan/macros/latex/exptl/biblatex/doc/biblatex.pdf


### Reference equations

```
\begin{align}
  E=mc^2 \nonumber\\  % don't number this equation
  E=mc^2 \label{eq1}
\end{align}

ref \ref{eq1}
```

https://tex.stackexchange.com/questions/21899/referencing-within-an-align-environment

```
\begin{equation} \label{eq:1}
\sum_{i=0}^{\infty} a_i x^i
\end{equation}

The equation \ref{eq:1} is a typical power series.
```

https://www.overleaf.com/learn/latex/Cross_referencing_sections_and_equations#Referencing_equations.2C_figures_and_tables


### Why "latex bibtex latex latex"?

Multiple passes are required because some references aren't defined yet on the first pass.

If formatting doesn't look right, try running latex again.

https://tex.stackexchange.com/questions/100652/easier-than-latex-bibtex-latex-latex


### Adjust margins

Example 1:

```
\usepackage[margin=1.0in]{geometry}
```

Example 2:

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


### Vector / variable with arrow

```
\vec u
```

To actually write out a column vector of elements, use the matrix syntax.


### Fonts

```
\begin{small}
...
\end{small}

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
{\bf bold text}  % Gotchas: https://texfaq.org/FAQ-2letterfontcmd
\mathbf{x}  % can use for vector
\textbf{my_text}

% Italics
\textit
```

https://tex.stackexchange.com/questions/4139/how-to-change-font-size-mid-document


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


### Set paragraph spacing

```
\usepackage{parskip}

\setlength{\parskip}{1em}
\begin{document}
...

% inside tcolorbox
\begin{tcolorbox}[parbox=false]
...
\end{tcolorbox}
```

https://tex.stackexchange.com/questions/154901/how-do-i-control-parskip-within-a-tcolorbox
https://www.overleaf.com/learn/latex/Paragraph_formatting


### Spacing in enumeration

```
\begin{enumerate}[parsep=3ex]
```

https://tex.stackexchange.com/questions/119919/no-spacing-between-enumerated-items-with-usepackageenumerate


### Whitespace / Spacing / Newline / Blank lines

```
~  % adds some spacing in math mode
\,  % tiny nonbreaking space (will not go to next line or page)
% https://practicaltypography.com/nonbreaking-spaces.html

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


### Text in math mode / inline text in equation

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


### Enlarge fraction

```
\cfrac
```

https://tex.stackexchange.com/questions/208367/how-to-make-nested-fractions-bigger


### Fraction

```
\frac{n_l n_r}{n}(\bar{y}_l - \bar{y}_r)^2

a\frac{(1-r^n)}{(1-r)}

% display mode
\dfrac

% text mode
\tfrac
```

https://tex.stackexchange.com/questions/135389/what-is-the-difference-between-dfrac-and-frac


### Square root / nth root

```
\sqrt{5}
\sqrt[n]{a}
```