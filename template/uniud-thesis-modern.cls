\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniud-thesis-modern}[Uniud thesis template]



% -- GENERAL SETUP --

% ref class
\LoadClass[11pt, a4paper, twoside]{book}

% page geometry
\RequirePackage[
  a4paper,
  twoside,
  inner=32mm,
  outer=22mm,
  top=28mm,
  bottom=32mm,
  headheight=14pt,
  headsep=9mm,
  footskip=11mm,
  bindingoffset=5mm
]{geometry}


% inverse page offset for book print
% \let\tmp\oddsidemargin
% \let\oddsidemargin\evensidemargin
% \let\evensidemargin\tmp
% \reversemarginpar  

% packages to load here to avoid conflicts:
\RequirePackage{scrextend}
\RequirePackage[explicit]{titlesec}
% ---------


% language, font and encodings
\RequirePackage{newpxtext} %,newpxmath
\RequirePackage[T1]{fontenc}
\RequirePackage{amsfonts}
\RequirePackage[english]{babel}
% colors
\RequirePackage{color}
%\RequirePackage[table]{xcolor}
\definecolor{violet}{RGB}{124, 29, 111}
\definecolor{aliceblue}{RGB}{70, 130, 180}
\definecolor{greenish}{RGB}{42, 157, 143}
\definecolor{lighterGreenish}{RGB}{143, 227, 217}
\definecolor{mainColor}{RGB}{42, 157, 143}
\definecolor{chapterColor}{RGB}{42, 157, 143}
\definecolor{myOrange}{RGB}{252, 141, 98}
\definecolor{whitesmoke}{RGB}{245, 245, 245}
 
% export in PDF/A or PDF/X
\RequirePackage{etoolbox}
\RequirePackage{colorprofiles}
\RequirePackage[a-3a,latxmp,mathxmp]{pdfx}
%   (to patch warnings)
%\selectcolormodel{natural}
\RequirePackage{ninecolors}
%\selectcolormodel{rgb}



% -- USEFUL PACKAGES --

% links
%\RequirePackage{hyperref} % hyperref loaded in pdfx
\RequirePackage{url}

% graphics
\RequirePackage{graphicx}


% mathematics
\RequirePackage{amsmath}
\RequirePackage{braket}
\RequirePackage[makeroom]{cancel}
\RequirePackage{bigints}
\RequirePackage{makecell}
\RequirePackage[bb=boondox]{mathalfa}
\RequirePackage{dsfont}
\RequirePackage{witharrows} % look this ans: https://tex.stackexchange.com/questions/12621/multi-line-equations-with-explanations-on-some-lines
\RequirePackage{amsthm} % for theorems
\RequirePackage{amssymb}
%\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
% appendix
\RequirePackage{appendix}

\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\renewcommand{\appendixname}{}%
\newcommand{\parallelslant}{\mathbin{\!/\mkern-5mu/\!}}
\headsep = 30pt

\newcommand{\equalexpl}[1]{%
\underset{\substack{\uparrow\\\mathrlap{\text{\hspace{-1em}#1}}}}{=}}

% spacings (\onehalfsize, \doublesize)
\RequirePackage{setspace}
\addtolength{\footnotesep}{1mm}

\makeatletter
\setlength{\@fptop}{0pt}
% for aligning all floating figures/tables etc... to the top margin
\makeatother

% indent first line of paragraph
\setlength{\parindent}{11pt} % control indentation of paragraph

% captions and footnotes
\RequirePackage[font=small, labelfont=bf]{caption}
\RequirePackage{subcaption}

\RequirePackage{footnote}
\RequirePackage[bottom]{footmisc}

% insert overlay in cover
\RequirePackage{watermark}

% plots & drawings
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta}

% bibliography
% Better line-breaking/stretching
\RequirePackage[nopatch=footnote]{microtype}

% Smarter URL/DOI wrapping
\RequirePackage{xurl}
\Urlmuskip=0mu plus 2mu

% Ragged-right tools and patching helpers
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}

% If you load csquotes/biblatex here, keep your existing options:
\RequirePackage[autostyle]{csquotes}
\RequirePackage[
  backend=biber,
  style=numeric-comp,
  sorting=nty,
  uniquename=mininit,
  maxnames=3,  minnames=1,
  maxbibnames=99, minbibnames=3,
  backref=true
]{biblatex}
\addbibresource{biblio.bib}

% (Optional) Your existing tweak:
\preto\fullcite{\AtNextCite{\defcounter{maxnames}{99}}}

% Let biblatex’s bibliography go a bit “sloppy” and ragged to avoid overfull boxes.
% This applies ONLY inside the bibliography.
\AtBeginDocument{%
  \appto\bibsetup{\sloppy\RaggedRight\emergencystretch=3em}%
}

% (Optional) If long DOIs/eprints are a problem, you can hide them globally:
%\ExecuteBibliographyOptions{doi=false,eprint=false}

% tables
\RequirePackage{tabularx}
\RequirePackage{rotating}
\RequirePackage{tablefootnote}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{booktabs}

% -- DEFINITIONS --
\makeatletter

% thesis info
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\thesisHeader#1{\gdef\@thesisHeader{#1}}
\def\academicYear#1{\gdef\@academicYear{#1}}
%\def\studentId#1{\gdef\@studentId{#1}}
\def\secondpage#1{\gdef\@secondpage{#1}}
\def\dedication#1{\gdef\@dedication{#1}}

% advisors
\def\advisor#1#2{\gdef\@advisor{#1} \gdef\@advisorUniversity{#2}}
\def\coadvisor#1#2{\gdef\@coadvisor{#1} \gdef\@coadvisorUniversity{#2}}
\newcommand{\otheradvisor}[3][Internal Supervisor]{\gdef\@otheradvisor{#2} \gdef\@otheradvisorUniversity{#3} \gdef\@otheradvisorDenomination{#1}}
\makeatother

% make these empty by default
\coadvisor{}{}
\otheradvisor{}{}
\secondpage{}
\dedication{}

% -- ITEMS AND ENUMARATIONS --

% reduce spacing for items and enumerations
\let\saveditemize=\itemize
 \let\savedenditemize=\enditemize
\renewenvironment{itemize}
	{\begin{spacing}{1.0}\saveditemize\itemsep0em }
	{\savedenditemize\end{spacing}}

\newenvironment{tightenumerate}
	{\begin{spacing}{1.0}\begin{enumerate}}
	{\end{enumerate}\end{spacing}}

% italic for quotes
\let\savedquote\quote
\let\endsavedquote\endquote
\renewenvironment{quote}
    {\itshape\savedquote}
    {\endsavedquote}

% -- TITLES, HEADERS AND FOOTERS --
\RequirePackage{scrextend} % remove headers and footers in blank pages 
% NOTE: loaded before pdfx to avoid conflicts

\RequirePackage{fancyhdr} % custom headers and footers
\RequirePackage[explicit]{titlesec} % custom title style


% % chapter style
% \newcommand*\chapterlabel{}
% \titleformat{\chapter}[display]
% 	{\normalfont\bfseries\Huge} % format of the chapter
% 	{\gdef\chapterlabel{\thechapter\ }} % label 
%  	{0pt} % separation between label and chapter-title
%  	  {\begin{tikzpicture}[remember picture,overlay]
%     \node[yshift=-8cm] at (current page.north west)
%       {\begin{tikzpicture}[remember picture, overlay]
%         \fill[chapterColor] (0,0) rectangle(35.5mm,15mm);
%         \node[anchor=north east,yshift=-7.1cm,xshift=32mm,minimum height=30mm,inner sep=0mm] at (current page.north west)
%         {\parbox[top][30mm][t]{15mm}{\raggedleft 
%         \color{white}\bfseries\chapterlabel}};
%         \node[anchor=north west,yshift=-7.1cm,xshift=45mm,text width=\textwidth,minimum height=30mm,inner sep=0mm] at (current page.north west)
%               {\parbox[top][30mm][t]{\textwidth}{\color{black}#1}};
%        \end{tikzpicture}
%       };
%    \end{tikzpicture}
%    \gdef\chapterlabel{}
% }
% % chapter style (numberless)
% \titleformat{name=\chapter,numberless}[display]
% 	{\normalfont\bfseries\Huge} % format of the chapter
% 	{\gdef\chapterlabel{\thechapter\ }} % label 
%  	{0pt} % separation between label and chapter-title
%  	  {\begin{tikzpicture}[remember picture,overlay]
%     \node[yshift=-8cm] at (current page.north west)
%       {\begin{tikzpicture}[remember picture, overlay]
%         \fill[chapterColor] (0,0) rectangle(35.5mm,15mm);
%         \node[anchor=north west,yshift=-7.1cm,xshift=45mm,text width=\textwidth,minimum height=30mm,inner sep=0mm] at (current page.north west)
%               {\parbox[top][30mm][t]{\textwidth}{\color{black}#1}};
%        \end{tikzpicture}
%       };
%    \end{tikzpicture}
%    \gdef\chapterlabel{}
% }

\renewcommand{\headrulewidth}{0pt} % remove line headers
\titlespacing*{\chapter}{0pt}{50pt}{70pt}

\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

% --- number and format subsubsections -----------------
\setcounter{secnumdepth}{2}   % 0=chapter, 1=section, 2=subsection, 3=subsubsection
\setcounter{tocdepth}{2}      % optional – include them in the ToC

% Numbering style: “1.a.1”
%\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% % Title look (titlesec)
% \titleformat{\subsubsection}[runin]      % or [hang] if you prefer a line break
%   {\normalfont\normalsize\bfseries}      % font
%   {\thesubsubsection}                    % numbered label
%   {1em}                                  % space between label and title
%   {}                                     % what to typeset after the label
% \titlespacing*{\subsubsection}{0pt}{2ex plus .2ex}{1ex plus .2ex}

% style for headers and footers
\newcommand{\setDefaultHF} {
    \fancyhf{}
    \fancyhead[RO, LE]{\thepage}
    \fancyhead[LO]{{\footnotesize\rightmark}}
    \fancyhead[RE]{{\footnotesize\leftmark}}
}



% -- FRONTMATTER --
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[LE,RO]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

\input{doc/glossaries}

\renewcommand{\frontmatter} {
    
    % set cover style
    \pagenumbering{roman}
    \pagestyle{fancy}
    
    % create cover
    \maketitle
    \secondcoverpage
    \cleardoublepage
    
    % set preamble style
    \pagestyle{plain}
    \setlength{\headwidth}{\textwidth}
    \fancyhf{}
    \fancyhead[RO, LE] {\thepage}
    
    % custom titles 
    \def\abstractname{Abstract}
    \def\symbolsname{Symbols}
    \def\abstractnameit{Sommario}
    \def\listacronymname{Acronyms}
    \def\acknowledgmentsname{Acknowledgments}
    \def\authorsdeclarationname{Author's Declarations}
    \def\fundingname{Funding and Computational Resources}
    \renewcommand{\bibname}{References}
    
    \dedicationpage
    \abstractpage
    % \acknowledgmentspage
    
    % \fundingpage
    
    % insert table of contents
    \setcounter{tocdepth}{2}
    {\hypersetup{linkcolor=black}\titlespacing*{\chapter}{0pt}{10pt}{10pt}\tableofcontents}
    \cleardoublepage

    \addcontentsline{toc}{chapter}{List of Figures}
    \listoffigures
    
    \cleardoublepage

    \addcontentsline{toc}{chapter}{List of Tables}
    \listoftables

   % \cleardoublepage

   % \addcontentsline{toc}{chapter}{List of Algorithms}
   % \listofalgorithms
    %\clearpage
    %\addcontentsline{toc}{chapter}{List of Listings}
    %\lstlistoflistings
   % \cleardoublepage
   %\symbolspage
   %\clearpage

%\phantomsection
% Print only the acronyms list and ensure a clean ToC entry/title
%\printglossary[
 % type=\acronymtype,
 % title={Acronyms},
%  toctitle={Acronyms},style=mcolindex
%]
}


\newcommand{\printlogos}[2][2cm]{
    \foreach \x [count=\xi] in {#2} 
       { \hspace{5mm}\includegraphics[height=#1]{\x} }
}


% -- TITLE/COVER --
\makeatletter
\renewcommand{\maketitle} {

    %set custom geometry
    \newgeometry{
        top=1.4cm, bottom=2cm,
        inner=4cm, outer=2cm,
        headheight=0cm,includehead,includefoot
    }
    
    \fancyhf{}
    \thispagestyle{empty}

    % add watermark
    \thiswatermark{\centering
    \put(-294,-750){\includegraphics[width=1.4\linewidth]{uniud-template/polloPallido.eps}}
    }

    % logo(s)
    {\hspace{-22.5mm}\noindent\printlogos[2.4cm]{uniud-template/logo.jpg}}
    %  NOTE: you can add a list of images to add more logos. Example:
    %      \printlogos[2.4cm]{template/universis}

    % content
    \begin{flushleft}
    \vspace{7ex}
    \normalsize{\@thesisHeader}

    % title
    \vspace{15ex}
    
    \begin{spacing}{1.1}
    \noindent\huge\textbf{\@title}
    \noindent\Large\textbf{\@subtitle}
    \end{spacing}
    \end{flushleft}

    % author and advisors 
    \doublespacing
    \vspace{1.7cm}
    \begin{flushleft}
        \textsc{Candidate}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@author}} %\\
        %\indent\small{\@advisorUniversity}
        }

    % supervisor
    \vspace{1cm}
    \begin{minipage}[t]{7cm}
        \textsc{Supervisor}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@advisor}}%\\
        %\indent\small\textbf{\@advisorUniversity}
        }
    \end{minipage}%
    \begin{minipage}[t]{7cm}
      % insert other advisor, if not empty
      \ifx\@otheradvisor\empty \else
        \textsc{\@otheradvisorDenomination}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@otheradvisor}}\\
        \indent\small\textbf{\@otheradvisorUniversity}
        }
      \fi
    \end{minipage}
      
      % insert co-advisor, if not empty
      \ifx\@coadvisor\empty \else
        \vspace{1cm}
        \textsc{Co-supervisor}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@coadvisor}}\\
        \indent\small\textbf{\@coadvisorUniversity}
        }
      \fi
    \end{flushleft}

    \vspace*{\fill}
    \begin{flushleft}
    \normalsize\textsc{Year \@academicYear}
    \end{flushleft}
    \vspace{5mm}
    
    % restore defaults
    \restoregeometry
    %\onehalfspacing
}


% -- DEDICATION --
\newcommand{\dedicationpage} {
\ifx\@dedication\empty \else
    % set empty style for this page (no headers and footers)
    \thispagestyle{empty}
    
    \phantomsection
    \vspace*{70pt}
    \vskip 0pt plus.3fil
    \begin{flushright}
    \@dedication
    \end{flushright}
    
    \cleardoublepage
\fi
}


% -- SECOND COVER PAGE --
\newcommand{\secondcoverpage} {
\ifx\@secondpage\empty \else
    \phantomsection
    
    \@secondpage
\fi
}
\makeatother



% the following prints the cover page with bigger fonts and no watermark
\makeatletter
\newcommand{\makecover} {
    %set custom geometry
    \newgeometry{
        top=1.4cm, bottom=1.4cm,
        inner=4cm, outer=2cm,
        headheight=0cm,includehead,includefoot
    }
    
    \fancyhf{}
    \thispagestyle{empty}

    % logo
    {\hspace{-22.5mm}\noindent\printlogos[2.4cm]{uniudTempate/logo.jpg}}

    % content
    \begin{flushleft}
    \vspace{7ex}
    \large\textsc{\@thesisHeader}
    
    % title
    \vspace{10ex}
    
    \begin{spacing}{1.1}
    \noindent\huge\textbf{\@title}
    \noindent\huge\LARGE{\@subtitle}
    \end{spacing}
    \end{flushleft}
    
    % author
    \doublespacing
    \begin{flushleft}
        \Large{\textbf{\@author}} \\
        { ID \@studentId}\\
    % supervisor
    \vspace{1.8cm}
    \begin{minipage}[t]{8cm}
        \textsc{Supervisor}\\
        {\setlength\parindent{1mm}
        \indent\Large{\textbf{\@advisor}}\\[-4mm]
        \large{\indent{\@advisorUniversity}}
        }
    \end{minipage}%
    \begin{minipage}[t]{7cm}
      % insert other advisor, if not empty
      \ifx\@otheradvisor\empty \else
        \textsc{\@otheradvisorDenomination}\\
        {\setlength\parindent{1mm}
        \indent\Large{\textbf{\@otheradvisor}}\\[-4mm]
        \large{\indent{\@otheradvisorUniversity}}
        }
      \fi
    \end{minipage}
      
      % insert co-advisor, if not empty
      \ifx\@coadvisor\empty \else
        \vspace{1cm}
        \textsc{Co-supervisor}\\
        {\setlength\parindent{1mm}
        \indent\Large{\textbf{\@coadvisor}}\\[-4mm]
        \large{\indent{\@coadvisorUniversity}}
        }
      \fi
    \end{flushleft}

    \vspace*{\fill}
    \begin{flushleft}
    \Large\textsc{Academic Year \@academicYear}
    \end{flushleft}
    \vspace{5mm}
    
    % restore defaults
    \restoregeometry
    %\onehalfspacing
}
\makeatother

% -- ABSTRACT --
\newenvironment{abstract}[1][en] {
    % get argument (en/it)
    \def\it{it}
    \def\arg{#1}
    
    \thispagestyle{plain}
    
    % set title in english or italian
    \ifx\arg\it
    \phantomsection
    \addcontentsline{toc}{section}{\abstractnameit}
        \section*{\abstractnameit}
    \else
    \phantomsection
    \addcontentsline{toc}{chapter}{\abstractname}
        \chapter*{\abstractname}
    \fi
} {
    \vfill \null
}

\newcommand{\abstractpage} {
    % english version
    \input{doc/abstract}
    \cleardoublepage
}


\newenvironment{acknowledgments}[1][en] {
    % get argument (en/it)
    \def\it{it}
    \def\arg{#1}
    
    \thispagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\acknowledgmentsname}
        \chapter*{\acknowledgmentsname}
} {
    \vfill \null
}

\newcommand{\acknowledgmentspage} {
    % english version
    \input{doc/acknowledgments}
    \cleardoublepage
}


\newenvironment{funding}[1][en] {
    % get argument (en/it)
    \def\it{en}
    \def\arg{#1}
    
    \thispagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\fundingname}
        \section*{\fundingname}
} {
    \vfill \null
}
\newcommand{\fundingpage} {
    % english version
    \input{doc/funding-and-computational-power}
    \cleardoublepage
}
\newenvironment{mysymbols}[1][en] {
    % get argument (en/it)
    \def\it{en}
    \def\arg{#1}
    
    \thispagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\symbolsname}
        \chapter*{\symbolsname}
} {
    \vfill \null
}
\newcommand{\symbolspage} {
    % english version
    \input{doc/symbols}
    \cleardoublepage
}

\newenvironment{authorsdeclaration}[1][en] {
    % get argument (en/it)
    \def\it{en}
    \def\arg{#1}
    
    \thispagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\authorsdeclarationname}
        \chapter*{\authorsdeclarationname}
} {
    \vfill \null
}
\newcommand{\authorsdeclatationpage} {
    % english version
    \input{doc/authors-declaration}
    \cleardoublepage
}


% -- MAIN MATTER --
\renewcommand{\mainmatter} {
    \cleardoublepage
    \pagestyle{fancy}
    \setDefaultHF
    \renewcommand{\headrulewidth}{1pt}
    
    % reset page counter
    \setcounter{page}{1}
    
    % set arabic page numbering
    \pagenumbering{arabic}
    
    % reset chapter counter
    \setcounter{chapter}{0}
    
    % inter-line spacing
    \setstretch{1.1}
}

% -- BACKMATTER --
\renewcommand{\backmatter}{
    
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \printbibliography
    % \cleardoublepage
    % \authorsdeclatationpage
}