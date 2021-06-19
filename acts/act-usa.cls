\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{act-usa}[2021/06/18 A class for typesetting American acts]
\LoadClass[letterpaper,10pt]{article}
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%% GEOMETRY %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[left=2.5in,right=2.5in,bottom=1in]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%% FONTS %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}

\setromanfont[RawFeature={+liga,+dlig}, ItalicFont={TeXGyreScholaX-Italic},ItalicFeatures={
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
\newfontface\goudy{Frederick Text}
\newfontface\bodo[LetterSpace=2]{Bodoni Std Bold Italic}
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTIONING COMMAND %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{seclaw}
\RequirePackage{ifthen}
\newcommand{\lawsec}[1]{\stepcounter{seclaw}\par\noindent\normalfont\MakeUppercase{\footnotesize\bfseries 
\ifnum\theseclaw=1%
section %
\else%
sec.
\fi%
\arabic{seclaw}. #1.}\par}
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%% HEADER %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\newcommand{\congress}[1]{\def\@congress{#1}}
\newcommand{\session}[1]{\def\@session{#1}}
\newcommand{\congressdow}[1]{\def\@congressdow{#1}}
\newcommand{\congressday}[1]{\def\@congressday{#1}}
\newcommand{\congressmonth}[1]{\def\@congressmonth{#1}}
\newcommand{\congressyear}[1]{\def\@congressyear{#1}}
\newcommand{\actpurpose}[1]{\def\@actpurpose{#1}}

\newcommand{\billnum}[1]{\def\@billnum{#1}}

\def\printcongress{\@congress}% Display title
\def\printsession{\@session}% Display title
\def\printcongressday{\@congressday}% Display title
\def\printcongressdow{\@congressdow}% Display title
\def\printcongressyear{\@congressyear}% Display title
\def\printcongressmonth{\@congressmonth}% Display title
\def\printactpurpose{\@actpurpose}% Display title
\def\printbillnum{\@billnum}% Display title


\makeatother
\RequirePackage{numname}
\renewcommand*{\namenumberand}{ }
\let\ordinal\relax % to avoid a spurious warning
\RequirePackage{fmtcount}
%%%%%%%%%%%%
%%%%HEADER%%
%%%%%%%%%%%%
%%%%%%%%%%%%
%%%%%%%%%%%%
\newenvironment{act}{%
\thispagestyle{empty}
\reversemarginpar
{}\marginnote{\footnotesize\printbillnum}
\begin{center}
	\large\goudy\OrdinalToName{\printcongress} Congress\\of the\\United States of America
\bigskip 

\normalfont\normalsize\bfseries \MakeUppercase{at the} \ORDINALstringnum{\printsession} \MakeUppercase{Session}

\medskip

\normalfont\bodo Begun and held at the City of Washington on \printcongressdow,
the \ordinaltoname{\printcongressday}\ day of \printcongressmonth, \numtoname{\printcongressyear}
\end{center}
\bigskip

\begin{center}
\Large\goudy An Act

\medskip

\scriptsize\normalfont\noindent\printactpurpose
	\end{center}
	
	\setlength{\parindent}{0.25in}
	
	\normalsize\textit{Be it enacted by the Senate and House of Representatives ofthe United States of America in Congress assembled,}
}{%
\vspace*{1.5in}
	

	\begin{flushright}
		\textit{Speaker of the House of Representatives.}
		
		\vspace{1.5in}
		\begin{tabular}{r}
		\textit{Vice President of the United States and}\hspace*{4.5ex}\\\textit{President of the Senate.}	
		\end{tabular}
		\end{flushright}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EASIER TO JUST HAVE IT GO AUTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\begin{act}}

\AtEndDocument{\end{act}}
