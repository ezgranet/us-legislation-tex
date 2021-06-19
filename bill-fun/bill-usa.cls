\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bill-usa}[2021/06/18 A class for typesetting American bills]
\LoadClass[letterpaper,12pt]{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page format
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \RequirePackage[margin=2.15in,   nomarginpar,
]{geometry}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 

\RequirePackage{fancyhdr}
\RequirePackage{fmtcount}
\fmtcountsetoptions{fmtord=level}
%\renewcommand{\fmtord}[1]{\fakesc{#1}}
\setlength{\headheight}{15pt}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\chead{\thepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For line counting fun
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
series={A},
noend,
noeledsec,
nofamiliar,
noledgroup
]{reledmac}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}
\RequirePackage{relsize}
\newcommand{\fakesc}[1]{\smaller\MakeUppercase{#1}\larger}
\newfontfamily\liner{Times New Roman}
\setmainfont[ItalicFont={De Vinne Italic Text}]{De Vinne Text}
\newfontfamily\titling{ITC Cheltenham Std Bold}
\RequirePackage{color}
\RequirePackage{fontspec}
\newfontfamily\cent[RawFeature={+liga,+dlig}, ItalicFont={TeXGyreScholaX-Italic},ItalicFeatures={
SmallCapsFont={TeXGyreScholaX-Italic},
SmallCapsFeatures={LetterSpace= 10, RawFeature={+smcp}},
},
BoldFont={TeXGyreScholaX-Bold},
BoldFeatures={
SmallCapsFont={TeXGyreScholaX-Bold},
SmallCapsFeatures={LetterSpace= 10, RawFeature={+smcp}},
},
SmallCapsFont={TeXGyreScholaX-Regular},
SmallCapsFeatures={LetterSpace= 10, RawFeature={+smcp}},
]{TeXGyreScholaX-Regular}
\RequirePackage{hhline}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Very important definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand{\billnum}[1]{\def\@billnum{#1}}
\newcommand{\version}[1]{\def\@version{#1}}
\newcommand{\status}[1]{\def\@status{#1}}
\newcommand{\signature}[1]{\def\@signature{#1}}

\newcommand{\congress}[1]{\def\@congress{#1}}
\newcommand{\session}[1]{\def\@session{#1}}
\newcommand{\sordinal}[1]{\def\@sordinal{#1}}
\newcommand{\cordinal}[1]{\def\@cordinal{#1}}
  \linenumincrement{1}
  \firstlinenum{1}
\def\printcongress{\@congress}% Display title
\def\printbillnum{\@billnum}% Display title

\def\printsession{\@session}% Display title
\def\printcordinal{\@cordinal}% Display title
\def\printsordinal{\@sordinal}% Display title
\def\printsignature{\@signature}% Display title

\newcommand{\actpurpose}[1]{\def\@actpurpose{#1}}
\def\printactpurpose{\@actpurpose}% Display title
\def\printversion{\@version}% Display title
\def\printstatus{\@status}% Display title
\makeatother

\newcommand{\raisedrule}[2][0pt]{%
  \leaders
  \hbox{%
    \makebox[0pt][l]{\rule[#1]{1pt}{#2}}%
    \rule[\dimexpr#1+.4ex]{1pt}{#2}%
  }\hfill}



\RequirePackage{graphicx}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THE ACT CODE!
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\acthead}{
\thispagestyle{empty}
\null
\vfill*
\begin{tabular}{@{}ccc}
\scalebox{0.75}{\begin{tabular}{c}
%%%%%%%%%%%%%
\printcongress\fakesc{\nth{\printcongress}}\, CONGRESS\\
\printsession\fakesc{\nth{\printsession}}\, S\fakesc{ession}\\
\hspace{1ex}\\
\end{tabular}}
&\scalebox{1.25}{\LARGE\titling\printbillnum}&
{\color{white}
}
\\
%\vspace*{-1ex}
&\rule{1.25in}{1pt}\\\vspace*{2ex}&\\
&\LARGE\titling\MakeUppercase{an act}&
\end{tabular}
\bigskip

\doublespacing
\normalsize
\hangpara{0.25in}{1}
\normalsize\printactpurpose\normalsize
\setlength{\parindent}{0.5in}





\begin{law}
\hfill\textit{Be it enacted by the Senate and House of Representa-}\\
\textit{tives of the United States of America in Congress assembled,}%
\end{law}%
\clearpage

}
\newenvironment{bill}{\acthead\begin{law}

}{	
\end{law}
\setlength{\parindent}{0.25in}
\printstatus

 Attest:

\hfill\textit{\printsignature}\\

\vspace*{\fill}
{\scriptsize\textdagger\quad\cent\bfseries\printbillnum\quad\printversion}
\clearpage
\thispagestyle{empty}
\vspace*{.25\textheight}\hfill\scalebox{0.75}{\rotatebox{270}{%%%%
\begin{minipage}{3in}
\begin{tabular}{@{}ccc}
\scalebox{0.65}{\begin{tabular}{c}
%%%%%%%%%%%%%
\printcongress\fakesc{\nth{\printcongress}}\, CONGRESS\\
\printsession\fakesc{\nth{\printsession}}\, S\fakesc{ession}\\
\end{tabular}}
&\Large\titling\printbillnum  &\end{tabular}


%\vspace*{-1ex}
\vspace{.5em} \hrule \vspace{.2em} \hrule\begin{center}\Large\titling\MakeUppercase{an act}\end{center}


\footnotesize\hangpara{0.25in}{1}\printactpurpose

\end{minipage}
%\doublespacing
%\normalsize
%\hangpara{0.25in}{1}
%\normalsize\printactpurpose\normalsize

}
}}





\setlength\parindent{0em}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VARIABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hanging}
\RequirePackage[breakable,skins]{tcolorbox}
\newtcolorbox{legis}[1][]{%
    breakable,
    width=\textwidth,
boxsep=16pt,left=0pt,right=-16pt,top=0pt,bottom=0pt,
    enhanced,
    colback=white,
    colframe=white,
    coltitle=white,
    #1
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The LAW environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{law}{
\begin{legis}\setlength{\parindent}{0.5in}
\beginnumbering\pstart}{\pend\endnumbering\end{legis}}
\renewcommand{\numlabfont}{\liner\normalsize}
\RequirePackage{lipsum}
\RequirePackage{setspace}
\RequirePackage[pagewise]{lineno}
\RequirePackage{changepage}
\RequirePackage{listings}
\RequirePackage{verse}
\newcounter{seclaw}
\RequirePackage{ifthen}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAWSECTIONING
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\lawsec}[1]{\stepcounter{seclaw}\hangpara{1in}{1}\MakeUppercase{\cent\scriptsize\bfseries 
\ifnum\theseclaw=1%
section %
\else%
sec.
\fi%
\arabic{seclaw}. #1}}






%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NTH (to work with the
% blasted
% fake SC (ugh, why oh why
% GPO????)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\nth#1{% First print number:
  \nthscript{%
  \ifnum#1\nthtest0 th\else % negatives are all ``th'' (depending on \nthtest)
  \expandafter \nthSuff \expandafter 0\number\ifnum #1<0-\fi#1\delimiter
  \fi
 }}

% Minus sign using math mode:
\def\nthM#1{\if -#1\ifmmode-\else$-$\fi\else #1\fi}

% Print suffix depending on last two digits:
\def\nthSuff#1#2#3{%
 \ifx \delimiter#3% #1#2 are last two digits
   \ifnum #1=1 th%  teens are always ``th''
   \else % use appropriate suffix
     \ifcase #2 th\or st\or nd\or rd\else th\fi
   \fi
 \else % continue scanning for last two digits
   \expandafter \nthSuff \expandafter #2\expandafter #3%
 \fi}

% Formatting hook for ordinals (\let\nthscript\textsuperscript)
\def\nthscript#1{#1}% alternate: \def\nthscript#1{$\rm^{#1}$}

% Formatting hook for all negative numbers giving ``th''
\def\nthtest{<}  % alternate: \def\nthtest{=}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIMPLIER
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\begin{bill}}

\AtEndDocument{\end{bill}}
