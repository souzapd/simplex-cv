% -- -------------------------------------------------------------------------
% -- Simplex CV Class File
% -- simplex (latin, adj.): simple, plain.
% -- 
% -- Source: https://github.com/souzapd/simplex-cv
% -- Author: David Souza Pinto
% --
% -- Notes:
% -- (1) This class is used to construct the layout showcased in the example.tex 
% --      file.
% -- (2) The warnings generated are due to small font incompatibilities.
% -- (3) The class was written to simple to use, but if necessary, it should not 
% --       be difficult to edit the code.
% -- 
% -- 
% -- 
% -- The MIT License (MIT)
% -- 
% -- Copyright (c) 2020 David Souza Pinto <http://souzapd.github.io>
% -- 
% -- Permission is hereby granted, free of charge, to any person obtaining a 
% -- copy of this software and associated documentation files (the "Software"), 
% -- to deal in the Software without restriction, including without limitation 
% -- the rights to use, copy, modify, merge, publish, distribute, sublicense, 
% -- and/or sell copies of the Software, and to permit persons to whom the 
% -- Software is furnished to do so, subject to the following conditions:
% -- 
% -- The above copyright notice and this permission notice shall be included in
% -- all copies or substantial portions of the Software.
% -- 
% -- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% -- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% -- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
% -- THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% -- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
% -- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
% -- DEALINGS IN THE SOFTWARE.
% -- -------------------------------------------------------------------------


% -- -------------------------------------------------------------------------
% -- Setup + Class options
% -- -------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplex-cv}[2019/01/16 v1 Simplex Curriculum Vitae Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


% -- -------------------------------------------------------------------------
% -- Loading package
% -- -------------------------------------------------------------------------
\RequirePackage{geometry}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage[scaled=0.94,default,semibold,osf]{sourcesanspro}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}


% -- -------------------------------------------------------------------------
% -- Layout options
% -- -------------------------------------------------------------------------
% -- Creates and sets the length for the \xpfull, \xpshort macro
\newlength{\sidelen}
\setlength{\sidelen}{35mm}

% -- Removing paragraph indentation, reducing paragraph skip and linespread
\setlength{\parindent}{0pt}
\setlength{\parskip}{1pt}
\linespread{1}

% -- List format
\setlist[enumerate,1]{label=$\cdotp$,noitemsep,topsep=-1ex,leftmargin=1.7ex}
\AfterEndEnvironment{enumerate}{\vskip-2.25\lastskip}

% -- Redefining section distances, adding a ruler
\titlespacing*{\section}{0mm}{4pt}{3mm}
\titleformat{\section}[hang]%
            {\large\bfseries}{}{0pt}{}%
            [\vspace{-.75\baselineskip}%
            \rule{\textwidth}{0.4pt}\vspace{-0.9em}]
            
% -- Page configuration
\geometry{margin=12mm, top=10mm, bottom=6mm, heightrounded}

% -- Creating a boolean to define whether or not to use a separator
\newbool{usesep}
\setbool{usesep}{true}

% -- ----------------------------------------------------------------------------
% -- Commands
% -- ----------------------------------------------------------------------------
% -- These are declared before the begin of the document
\newcommand{\aboutme}[1]{\def\@aboutme{#1}}
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\profession}[1]{\def\@profession{#1}}
\newcommand{\address}[1]{\def\@address{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\skype}[1]{\def\@skype{#1}}
\newcommand{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand{\github}[1]{\def\@github{#1}}
\newcommand{\ghpage}[1]{\def\@ghpage{#1}}
\newcommand{\wpage}[2]{\def\@wpageid{#1}\def\@wpagelink{#2}}

% -- Invoke as soon as the document is invoked
\newcommand{\makeheader}{%
    {%
        \centering 
        {\Huge\scshape\@name}\par
        {
            \ifundef{\@profession}{\par}{%
            \scshape\MakeLowercase{\@profession}}\par
        }%
    % -- location: city, country, etc.
    \ifundef{\@address}{}{\@address}\par% 
    {%
        % -- phone number
        \ifundef{\@phone}{}{%
            \faMobile\space\@phone%
            \setbool{usesep}{false}%
        }%
        % -- email address
        \ifundef{\@email}{}{%
            \ifbool{usesep}{\setbool{usesep}{false}}{\enspace$\cdotp$\enspace}%
            \faEnvelopeO\space\@email%
        }%
        % -- Skype
        \ifundef{\@skype}{}{%
            \ifbool{usesep}{\setbool{usesep}{false}}{\enspace$\cdotp$\enspace}%
            \faSkype\space\@skype%
        }%
        % -- LinkedIn
        \ifundef{\@linkedin}{}{%
            \ifbool{usesep}{\setbool{usesep}{false}}{\enspace$\cdotp$\enspace}%
            \faLinkedinSquare\space%
            \href{https://linkedin.com/in/\@linkedin}{in/\@linkedin}%
        }%
        % -- Github repository
        \ifundef{\@github}{}{%
            \ifbool{usesep}{\setbool{usesep}{false}}{\enspace$\cdotp$\enspace}%
            \faGithub\space%
            \href{https://github.com/\@github}{\@github}%
        }%
        % -- Github page
        \ifundef{\@ghpage}{}{%
            \ifbool{usesep}{\setbool{usesep}{false}}{\enspace$\cdotp$\enspace}%
            \faGithub\space%
            \href{https://\@ghpage}{\@ghpage}%
        }%
        % -- External link
        \ifundef{\@wpageid}{}{%
            \ifbool{usesep}{\setbool{usesep}{false}}{\enspace$\cdotp$\enspace}%
            \faLink\space%
            \href{https://\@wpagelink}{\@wpageid}%
        }%
    }%
    \par%
    \vspace{-.2\baselineskip}\rule{\textwidth}{0.4pt}\par%
    \@aboutme
    }
}


% -- Args: \xpfull{position}{institution}{location}{date}{description}
% -- Note that description already uses enumerate environment. 
\newcommand{\xpfull}[5]{%
    \parbox[t][][t]{\sidelen}{\MakeLowercase{\scshape\small#4}}%
    \parbox[t][][t]{\dimexpr.98\textwidth-\sidelen}{%
        {\bfseries#1} $\cdotp$\ #2 $\cdotp$\ #3
        \begin{enumerate}#5\end{enumerate} 
    }
}


% -- Args: \xpshort{position}{institution}{location}{date}
\newcommand{\xpshort}[4]{%
    \parbox[t][][t]{\sidelen}{\MakeLowercase{\scshape\small#4}}%
    \parbox[t][][t]{\dimexpr.98\textwidth-\sidelen}{{\bfseries#1} $\cdotp$\ #2 $\cdotp$\ #3}\par
}


% -- Args: \xpshorter{position}{institution/location}{date}
\newcommand{\xpshorter}[3]{%
    \parbox[t][][t]{\sidelen}{\MakeLowercase{\scshape\small#3}}%
    \parbox[t][][t]{\dimexpr.98\textwidth-\sidelen}{{\bfseries#1} $\cdotp$\ #2}\par
}


% -- Args: \skill{skill}{description}
\newcommand{\skill}[2]{%
    \parbox[t][][t]{\sidelen}{\MakeLowercase{\scshape\small#1}}%
    \parbox[t][][t]{\dimexpr.98\textwidth-\sidelen}{#2}\par
}

% -- Creates the header automatically at compile time
\AtBeginDocument{\makeheader}