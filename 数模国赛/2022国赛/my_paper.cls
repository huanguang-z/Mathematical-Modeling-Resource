\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_paper}[2021/08/17 My custom CV class] 
\LoadClass[12pt]{article}
\newcommand{\lunwenbiaoti}{\fontsize{15.75pt}{0}\heiti 基于综合统计方法的玻璃文物成分研究}
\newcommand{\zhaiyao}{\fontsize{14pt}{0}\heiti 摘要}
\RequirePackage{titlesec}
\titleformat{\section}
  {\fontsize{14pt}{0}\heiti\centering}   
  {}{0em}
  {}
  []
\titleformat{\subsection}
  {\heiti}    
  {\bfseries\arabic{section}.\bfseries\arabic{subsection}}{1em}
  {}
  []
  
\titleformat{\subsubsection}
  {\heiti}
  {\bfseries\arabic{section}.\bfseries\arabic{subsection}.\bfseries\arabic{subsubsection}}{1em}
  {}
  []

\newenvironment{guanjianci}
  {\vspace{2ex}\noindent{\heiti 关键词:}}
  {} 
  
