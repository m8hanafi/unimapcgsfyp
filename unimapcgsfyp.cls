%% This template is modified based on the usmthesis.cls 2016/04/13 version V1.66 by
%% Lim Lian Tze (liantze@gmail.com), http://liantze.penguinattack.org/latextypesetting.html#usmthesis 
%% 
%% This template is based on the "Thesis Template 2018" 
%% https://cgs.unimap.edu.my/index.php/en/form/guidelines-for-preparation-thesis-submission 
%% 
%% NOTE: This text file uses UNIX line feed conventions. When (human)
%% reading this file on other platforms, you may have to use a text
%% editor that can handle lines terminated by the UNIX line feed
%% character (0x0A).
%%
%%
%% Copyright (c) 2019 by MOHD HANAFI BIN MAT SOM (msmhanafi@ gmail.com)
%%
%% Please contact me if you need assistance. Apologies if I can't respond immediately, but
%% I'll always try.
%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unimapcgsfyp}[2019/09/05 version 2.2]

%% Version 1.1 [2019/01/26] add tabulary, booktabs, multirow package
%% Version 2.0 [2019/9/5] rename class from unimapcgs to unimapcgsfyp
%% Version 2.1 [2019/9/5] use natbib
%% Version 2.2 [2019/9/5] use numbered natbib with IEEEtranN

\RequirePackage{silence}
\WarningFilter{float}{Can't redefine}

% switches for URL font
\newif\if@urltt
\newif\if@urlsf
\newif\if@urlrm

% switch for border around figures
\newif\if@boxfig

% Added August 2015: times or arial as thesisfont
\newif\if@timesthesis
\DeclareOption{times}{\@timesthesistrue}

\DeclareOption{urltt}{\@urltttrue\@urlrmfalse\@urlsffalse}
\DeclareOption{urlsf}{\@urlsftrue\@urlttfalse\@urlrmfalse}
\DeclareOption{urlrm}{\@urlrmtrue\@urlttfalse\@urlsffalse}

\DeclareOption{boxfig}{\@boxfigtrue}
\DeclareOption{noboxfig}{\@boxfigfalse}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{10pt}{\OptionNotUsed}
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}
%\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{book}}
%\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{book}}

\ExecuteOptions{times,urltt,noboxfig}
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%
% TODO ERROR MESSAGES 
%%%%%%%%%%%%%%%%%%%%%%%%
%\tolerance=1
%\binoppenalty=\maxdimen 
%\relpenalty=\maxdimen
\hbadness=10000
\hyphenpenalty=10000
\emergencystretch=\maxdimen
%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sets up the fonts: Load the Times, Helvetica and 
%% Courier (or TX Typewriter) fonts for serif, sans serif
%% and typewriter respectively.
%% (Helvetica is loaded in lieu of Arial, which is
%% commercial.)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{mathptmx}
%\renewcommand{\ttdefault}{lmtt}

\if@timesthesis
  \LoadClass[a4paper,oneside,12pt]{book}
\else
  \LoadClass[a4paper,oneside,11pt]{book}
  \renewcommand\familydefault{\sfdefault}
\fi

\RequirePackage{ifpdf}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page Boundaries and graphics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\RequirePackage[a4paper,top=25mm,bottom=25mm,left=35mm,right=25mm,footskip=15mm]{geometry}

\ifpdf\pdfcompresslevel=9\else\fi

\RequirePackage[listofformat=parens]{subfig}
%\RequirePackage{subfigure}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% When "bahasa" is specified last, all the sectioning 
% commands become Malay e.g. "Bab", 
% "Dafter Isi" etc.  "english" is the main language
% here. Babel now supports bahasam.
% Need to install 'babel-malay'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[bahasam,english]{babel}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default spacing is double/1.5.  In your actual content,
% whenever you need a paragraph to be single-spaced,
% do this:
%
% \begin{singlespace}
% This is your paragraph using single-spacing.
% \end{singlespace}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}
\linespread{2} %double spacing


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These packages will help you in typesetting 
% mathematical symbols, formulae and equations.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amssymb,textcomp}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For including the TOC in the TOC.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tocbibind}

%%%%%%%%%%%%%%%%%%%%%%%
%TODO Abstract Enviroment 
%%%%%%%%%%%%%%%%%%%%%%%

%% English environment
%\RequirePackage{mfirstuc-english}
\newenvironment{EnAbstract}{ 
	\titleformat{\chapter}[display]{\filcenter\bfseries}{\fontsize{12pt}{14pt}\selectfont\MakeUppercase{\chaptername{} \thechapter}}{-1.7pc}{\singlespacing\bfseries\fontsize{12pt}{14pt}}
	\chapter[Abstract]{\@title}%
	\begin{center}{\fontsize{12pt}{14pt}\bfseries\selectfont ABSTRACT}\end{center}\par\vspace*{1mm}}
	{\ignorespacesafterend}
%
%% Malay abstract environment
\newenvironment{MsAbstract}
{\begin{otherlanguage}{bahasam}%		
%		\titleformat{\chapter}[display]{\filcenter\bfseries}{\fontsize{12pt}{14pt}\selectfont{\chaptername{} \thechapter}}{-1.7pc}{\singlespacing\bfseries\fontsize{12pt}{14pt}}
		\vspace*{20mm}
		\chapter[Abstrak]{ }%
		\begin{center}{\fontsize{12pt}{14pt}\bfseries\selectfont ABSTRAK}\end{center}\par\vspace*{1mm}}	
	{\end{otherlanguage}\ignorespacesafterend}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO Sections headings format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[nobottomtitles]{titlesec}
% chapters
%% Chapter heading sizes must be FIXED at 18pt.
\titleformat{\chapter}[hang]{\filcenter\bfseries}{\fontsize{18pt}{18pt}\selectfont\MakeUppercase{\chaptername{} \thechapter: }}{0pc}{\makebox[1cm][l]\bfseries\fontsize{18pt}{18pt}\selectfont\MakeUppercase}
%\titleformat{\chapter}[hang]{\filcenter\bfseries}{\fontsize{12pt}{12pt}\selectfont\MakeUppercase{\chaptername{} \thechapter: }}{0pc}{\begin{singlespace}\bfseries\fontsize{12pt}{12pt}\selectfont\MakeUppercase}[\end{singlespace}]

\titlespacing*{\chapter}{0pt}{*-3}{*3}
% section e.g. 4.1
%\titleformat{\section}[hang]{\bfseries\normalsize}{\thesection}{6pt}{}
\titleformat{\section}[hang]{\bfseries\normalsize}{\makebox[1.05cm][l]{\thesection}}{6pt}{} %indentation exactly as ms word template
\titlespacing*{\section}{0pt}{*4}{0pt}
% subsection e.g. 4.1.1
%\titleformat{\subsection}[hang]{\bfseries\normalsize}{\thesubsection}{6pt}{}
\titleformat{\subsection}[hang]{\bfseries\normalsize}{\makebox[1cm][l]{\thesubsection}}{6pt}{} %indentation exactly as ms word template
\titlespacing*{\subsection}{0pt}{*3}{*3}
% subsubsection e.g. 4.1.1.1
\titleformat{\subsubsection}[hang]{\bfseries\normalsize}{\makebox[1cm][l]{\thesubsubsection}}{6pt}{} %indentation exactly as ms word template
\titlespacing*{\subsubsection}{0pt}{*3}{*-3}
% subsubsection e.g. 4.1.1(a)
%\renewcommand\thesubsubsection{\thesubsection(\alph{subsubsection})}
%\titleformat{\subsubsection}[hang]{\bfseries}{\thesubsubsection}{6pt}{}
%\titlespacing*{\subsubsection}{0pt}{*3}{*-3}
%% 20 Mar 2016: first paragraphs need to be indented
\RequirePackage{indentfirst}
\setlength{\parindent}{1.27cm} %indentation exactly as ms word template

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formatting of the TOC, LOF and LOT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[titles,subfigure]{tocloft}
\setcounter{lofdepth}{2}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% Introducing: List of Plates
\newcommand{\listplatename}{\textbf{LIST OF PLATES}}
\newlistof[chapter]{plate}{lop}{\listplatename}
\newcommand\listofplates{\begingroup
\tocfile{\listplatename}{lop}
\endgroup}

\renewcommand\cftdotsep{\cftnodots}	%make dot disappear
\cftsetrmarg{2.6pc plus1fil}
\cftsetpnumwidth{2pc}


%\setlength\cftbeforetoctitleskip{5pc}
%\setlength\cftaftertoctitleskip{60pt}
\setlength\cftbeforepartskip{1pc}
\setlength\cftbeforechapskip{1pc}
\setlength\cftbeforesecskip{1pc}
\setlength\cftbeforesubsecskip{1pc}
\setlength\cftbeforesubsubsecskip{1pc}
\setlength\cftbeforefigskip{1pc}
\setlength\cftbeforesubfigskip{1pc}
\setlength\cftbeforetabskip{1pc}
\setlength\cftbeforeplateskip{1pc}

\cftsetindents{sec}{0pt}{2.5pc}
\cftsetindents{subsec}{2.5pc}{3.05pc}
\cftsetindents{subsubsec}{5.45pc}{4.05pc}
%\cftsetindents{subsec}{0pt}{2.5pc}
%\cftsetindents{subsubsec}{0pt}{4.05pc}

\renewcommand\cftpartfont{}
\renewcommand\cftpartpagefont{\normalfont\bfseries}
\renewcommand\cftpartdotsep{\cftnodots}
\renewcommand\cftpartleader{\normalfont\cftdotfill{\cftpartdotsep}}

\renewcommand\cftchapfont{}
\renewcommand\cftchappagefont{\normalfont\bfseries}
\renewcommand\cftchapdotsep{\cftnodots}
\renewcommand\cftchapleader{\normalfont\cftdotfill{\cftchapdotsep}}
\renewcommand\cftchappresnum{\MakeUppercase{\chaptername} }
\renewcommand\cftchapaftersnum{\;: \; }
\newlength\tmplength

\renewcommand\cftfigpresnum{Figure }
\cftsetindents{fig}{0pt}{6.2pc}
\renewcommand\cftfigdotsep{\cftnodots}
%\renewcommand\cftfigpagefont{\bfseries}

\renewcommand\cftsubfigpresnum{Figure }
\cftsetindents{subfig}{0pt}{6.2pc}
\renewcommand\cftsubfigleader{\hfill}
%\renewcommand\cftsubfigpagefont{\bfseries}
%\renewcommand\cftfigfont{\mdseries\justifying}

\renewcommand\cfttabpresnum{Table }
\cftsetindents{tab}{0pt}{6.2pc}
\renewcommand\cfttabdotsep{\cftnodots}
%\renewcommand\cfttabpagefont{\bfseries}

\renewcommand\cftplatepresnum{Plate }
\cftsetindents{plate}{0pt}{6.2pc}
\renewcommand\cftplatedotsep{\cftnodots}
%\renewcommand\cftplatepagefont{\bfseries}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and Footer formatting: empty header, and
% page number at the bottom center.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{plain}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For customising floats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{rotfloat}
\floatstyle{plaintop}\restylefloat{table}
\if@boxfig\floatstyle{boxed}\else\floatstyle{plain}\fi
\restylefloat{figure}

\newfloat{plate}{htbp}{lop}[chapter]
\floatname{plate}{Plate}
\floatstyle{plain}\restylefloat{plate}
\def\theHplate{\arabic{plate}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For more compact-looking lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage{paralist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This package will help you in typesetting urls!
% If you just type a URL like 
%    http://cs.usm.my/~abc/cgi/index.php?q=bye%20%bye
% something is going to get VERY wrong sooner or later.
% Typeset your URL like this instead: 
% \url{http://cs.usm.my/~abc/cgi/index.php?q=bye%20%bye}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}
\if@urlrm\urlstyle{rm}\else\if@urltt\urlstyle{tt}\else\urlstyle{sf}\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For typesetting the list of abbreviations and maybe help 
% control their expansion in the text.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{acronym}
\renewcommand*{\acfsfont}[1]{\rmfamily #1}
\renewcommand*{\acsfont}[1]{\rmfamily #1}
\renewcommand*{\acffont}[1]{\rmfamily #1}

%% Apr 14, 2015: cater for new acronym.sty
%% Sep 10, 2015: make everything backward compatible
\@ifpackagelater{acronym}{2014/08/01}
{%
  % New acronym.sty works with the following
%  \renewcommand*{\aclabelfont}[1]{\textbf{\acsfont{#1}}}
  \renewcommand*{\aclabelfont}[1]{\acsfont{#1}}
}
{%
  \renewenvironment{AC@deflist}[1]%
    {\ifAC@nolist%
     \else%
        \raggedright\begin{list}{}%
            {\settowidth{\labelwidth}{\textbf{\textrm{#1}}}%
            \setlength{\leftmargin}{\labelwidth}%
            \addtolength{\leftmargin}{\labelsep}%
            \renewcommand{\makelabel}{\bflabel}}%
      \fi}%
    {\ifAC@nolist%
     \else%
        \end{list}%
     \fi}
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO Table-related packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tabularx,dcolumn, tabulary, booktabs, multirow}
\RequirePackage[labelfont=bf]{caption} % make caption in bold for table and figure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO Citation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage[natbibapa]{apacite}
\RequirePackage[numbers,compress]{natbib}
%\RequirePackage[backend=biber,style=ieee,natbib=true]{biblatex}
%\RequirePackage{IEEEtran}
\addto\captionsenglish{%
\renewcommand{\bibname}{REFERENCES}
}
\setlength\bibsep{0.5em}

%\setlength\bibhang{1.5em} % not worked with the "number" option

%\setlength{\bibhang}{2.0em}
%\def\setbibindent{
%	\setlength{\itemindent}{-\bibhang}
%	\setlength{\itemsep}{11pt}
%	\setlength{\parsep}{11pt}
%	\setlength{\leftmargin}{\bibhang}
%}
%\let\urbibitem=\bibitem
%\def\bibitem{\setbibindent\urbibitem}

% USE with natbib apacite
%\setlength\bibindent{1.5em}
%\renewcommand\NAT@bibsetnum[1]{\settowidth\labelwidth{\@biblabel{#1}}%
%	\setlength{\leftmargin}{\bibindent}\addtolength{\leftmargin}{\dimexpr\labelwidth+\labelsep\relax}%
%	\setlength{\itemindent}{-\bibindent}%new command
%	\setlength{\listparindent}{\itemindent}%new command
%	\setlength{\itemsep}{\bibsep}\setlength{\parsep}{\z@}%
%	\ifNAT@openbib
%	\addtolength{\leftmargin}{\bibindent}%
%	\setlength{\itemindent}{-\bibindent}%
%	\setlength{\listparindent}{\itemindent}%
%	\setlength{\parsep}{0pt}%
%	\fi
%}

\renewcommand\bibfont{\singlespace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multiple bibliographics, used to hack up a list of 
% own publications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[resetlabels]{multibib}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO Personal Info 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Student Matric Number
\def\matric#1{\gdef\@matric{#1}}
\def\@matric{\@latex@warning@no@line{No \noexpand\matric given}}

%% Student IC/Passport Number
\def\icpass#1{\gdef\@icpass{#1}}
\def\@icpass{\@latex@warning@no@line{No \noexpand\icpass given}}

%% Date of Birth
\def\dob#1{\gdef\@dob{#1}}
\def\@dob{\@latex@warning@no@line{No \noexpand\dob given}}

%% Title of the thesis in Malay
\def\titlems#1{\gdef\@titlems{#1}}
\def\@titlems{\@latex@warning@no@line{No \noexpand\titlems given}}

%% School Name
\def\schoolname#1{\gdef\@schoolname{#1}}
\def\@schoolname{\@latex@warning@no@line{No \noexpand\schoolname given}}

%% Academic Session
\def\acads#1{\gdef\@acads{#1}}
\def\@acads{\@latex@warning@no@line{No \noexpand\acads given}}

%% Degree type: MSc or PhD
\def\degreetype#1{\gdef\@degreetype{#1}}
\def\@degreetype{\@latex@warning@no@line{No \noexpand\degreetype given}}

%% Month and year in which thesis was submitted
%\def\submitmonth#1{\gdef\@submitmonth{#1}}
%\def\@submitmonth{\@latex@warning@no@line{No \noexpand\submitmonth given}}
\def\submityear#1{\gdef\@submityear{#1}}
\def\@submityear{\@latex@warning@no@line{No \noexpand\submityear given}}

%% Declaration Date
\def\declaredate#1{\gdef\@declaredate{#1}}
\def\@declaredate{\@latex@warning@no@line{No \noexpand\declaredate given}}

%% overrides \chapter, to allow for all-caps in text but as-is in TOC
%\newcommand\mychapter[1]{\chapter[\texorpdfstring{\uppercase{#1}}{#1}]{#1}}

% May 20: re-defined \@chapter so \mychapter is not needed anymore. This
% allows IDEs such as TeXnicCenter to properly recognise the chapters and
% display them correctly in the Structure/Navigator.
% change \uppercase to \MakeUppercase{} untuk jadikan tajuk abstract capital letter
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}\texorpdfstring{\uppercase{#1}}{#1}}% %main matter toc
                       \else
%                         \addcontentsline{toc}{chapter}{#1}%
                         \addcontentsline{toc}{chapter}{\texorpdfstring{\bfseries\uppercase{#1}}{#1}}% %front matter toc
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{#1}}{#1}}%
                    \fi
                    \chaptermark{\texorpdfstring{\uppercase{#1}}{#1}}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \addtocontents{lop}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{\texorpdfstring{\uppercase{#2}}{#1}}]%
                    \else
                      \@makechapterhead{\texorpdfstring{\uppercase{#2}}{#1}}%
                      \@afterheading
                    \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO Cover page 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makecover{%

\thispagestyle{empty}{\centering\bfseries

\begin{figure}[th!]
	\centering
	\includegraphics[width=0.6\textwidth]{logounimap}
	\setlength{\belowcaptionskip}{-20mm} 
\end{figure}
\vspace*{-15mm}
{\singlespacing\fontsize{18pt}{20pt}\selectfont\@title\par}
%{\fontsize{18pt}{20pt}\selectfont\MakeUppercase{\@title}\par}

\vspace*{\stretch{2}}

{\Large by}\par

\vspace*{\stretch{2}}

\begin{singlespace}
\MakeUppercase{\fontsize{18pt}{20pt}\selectfont\@author}\\ 
\fontsize{18pt}{20pt}\selectfont(\@matric)\par 
%\end{singlespace}

\vspace*{\stretch{2}}

%\begin{singlespace}
{\fontsize{14pt}{16pt}\selectfont\normalfont A thesis submitted in fulfilment of the requirements for the degree \\ of \\
\fontsize{14pt}{16pt}\selectfont\@degreetype}\par
%\end{singlespace}

\vspace*{\stretch{2}}

{\fontsize{18pt}{24pt}\selectfont{\@schoolname}}\par
{\fontsize{16pt}{18pt}\selectfont{UNIVERSITI MALAYSIA PERLIS}}\par

\vspace*{\stretch{1}}
{\fontsize{14pt}{16pt}\selectfont\normalfont\@submityear }\par
\end{singlespace}

%\vspace*{20mm}
}
\clearpage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO Declaration 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{pdfpages}
%\chapter{Declaration of Report}
\newcommand\declaration{%
	\setcounter{page}{1} 
	\phantomsection\addcontentsline{toc}{part}{\texorpdfstring{\bfseries\uppercase{Declaration of Report}}{Declaration of Report}}
	\includepdf[pagecommand={\thispagestyle{plain}}]{Frontmatter/Declaration-Report.pdf}
}
	
%TODO Panel Approval 
%\chapter*{Panel Approval and Declaration Sheet}
\newcommand\approval{%
	\phantomsection\addcontentsline{toc}{part}{\texorpdfstring{\bfseries\uppercase{Panel Approval and Declaration Sheet}}{Panel Approval and Declaration Sheet}}
	\includepdf[pagecommand={\thispagestyle{plain}}]{Frontmatter/Panel-Approval.pdf}
}

%%%%%%%%%%%%%%%%%%%
%TODO Front Matters
%%%%%%%%%%%%%%%%%%%

\apptocmd{\frontmatter}{%
  \addtocontents{toc}{\vspace*{3pc}\protect\raggedright\protect\sloppy}
  \addtocontents{toc}{\protect\hfill{\protect\bfseries PAGE}\\}
  \addtocontents{lof}{\vspace*{3pc}\protect\raggedright\protect\sloppy}
  \addtocontents{lof}{\protect\hfill{\protect\bfseries PAGE}\\}
%  \addtocontents{lof}{\protect\textbf{Figures No.}\protect\hfill{\protect\bfseries Page}\\}
  \addtocontents{lot}{\vspace*{3pc}\protect\raggedright\protect\sloppy}
  \addtocontents{lot}{\protect\hfill{\protect\bfseries PAGE}\\}
%  \addtocontents{lot}{\protect\textbf{Tables No.}\protect\hfill{\protect\bfseries PAGE}\\}
  \addtocontents{lop}{\vspace*{3pc}\protect\raggedright\protect\sloppy}
  \addtocontents{lop}{\protect\hfill{\protect\bfseries PAGE}\\}
%  \addtocontents{lop}{\protect\textbf{Plates}\protect\hfill{\protect\bfseries Page}\\}
  
  \renewcommand\contentsname{\uppercase{\bfseries Table of Contents}}
  \renewcommand{\listfigurename}{\uppercase{\bfseries List of Figures}}
  % how to make space before List of Figures
%  \let\oldlistoffigures\listoffigures
%  \renewcommand{\listoffigures}{%
%  	\patchcmd{\@makeschapterhead}{\vspace*{50\p@}}{\relax}{}{}%
%  	\oldlistoffigures%
%  	\patchcmd{\@makeschapterhead}{\relax}{\vspace*{10\p@}}{}{}%
%  }  
  \renewcommand{\listtablename}{\uppercase{\bfseries List of Tables}}
%  \renewcommand{\refname}{\uppercase{\bfseries REFERENCES}}
  \renewcommand{\bibname}{\uppercase{\bfseries REFERENCES}}

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Inserts a "Front Matter" bookmark if using pdfLaTeX
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \ifpdf
      \pdfbookmark[-1]{Front Matter}{front}
  \else\fi
  \renewcommand{\thechapter}{\arabic{chapter}}
}{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO Formatting other headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pretocmd{\mainmatter}{%
	%add space before each section in toc
%  \addtocontents{toc}{\protect\setlength{\protect\cftbeforechapskip}{2.5pc}}
%  \addtocontents{toc}{\protect\cftpagenumbersoff{chap}}
  \addtocontents{toc}{\protect\renewcommand\protect\cftchapfont{\protect\bfseries}}
}{}{}

\apptocmd{\mainmatter}{%
  \ifpdf\pdfbookmark[-1]{Main Chapters}{main}\else\fi
}{}{}

\pretocmd{\bibliography}{%
  \addtocontents{toc}{\protect\cftpagenumberson{chap}}
  \begin{singlespace}
}{}{}

\apptocmd{\bibliography}{%
  \end{singlespace}
  \clearpage
}{}{}

\pretocmd{\appendix}{%
  \clearpage
%  \addtocontents{toc}{\protect\cftpagenumbersoff{part}}
%  \addtocontents{toc}{\protect\cftpagenumbersoff{chapter}}
  \addtocontents{toc}{\protect\setlength{\protect\cftbeforechapskip}{1pc}}  
}{}{}

\apptocmd{\appendix}{  
  \addtocontents{toc}{\protect\renewcommand{\protect\chaptername}{\appendixname}}	
  \addtocontents{toc}{\protect\renewcommand\protect\cftchapfont{\protect\bfseries}}  
  \settowidth{\tmplength}{\bfseries\MakeUppercase{\appendixname}\space N\cftchapaftersnum}
  \addtocontents{toc}{\protect\setlength{\cftchapnumwidth}{\the\tmplength}}
  \renewcommand\chaptername{\appendixname}
}{}{}

\AtBeginDocument{
\settowidth{\tmplength}	{\bfseries\MakeUppercase{\chaptername}\space9\cftchapaftersnum}
\setlength\cftchapnumwidth{\tmplength}
\apptocmd{\appendix}{%
%  \phantomsection\addcontentsline{toc}{part}{\texorpdfstring{\bfseries\uppercase{Appendices}}{Appendices}}
  \thispagestyle{empty}
  \titleformat{\chapter}[display]{\filcenter\bfseries}{\fontsize{12pt}{12pt}\selectfont\MakeUppercase{\chaptername{} \thechapter }}{-2pc}{\bfseries\fontsize{12pt}{12pt}\selectfont\MakeUppercase}
  \titlespacing*{\chapter}{0pt}{*-4.5}{*-2}
  \vspace*{\stretch{1}}
    \begin{center}
      {\Large\bfseries APPENDICES}
    \end{center}
  \vspace*{\stretch{2}}
%  \addtocontents{toc}{\protect\renewcommand{\protect\chaptername}{\appendixname}}
%  \settowidth{\tmplength}{\bfseries\MakeUppercase{\appendixname}\space N\cftchapaftersnum}
%  \addtocontents{toc}{\protect\setlength{\cftchapnumwidth}{\the\tmplength}}
%  \renewcommand\chaptername{\appendixname}
}{}{}
}