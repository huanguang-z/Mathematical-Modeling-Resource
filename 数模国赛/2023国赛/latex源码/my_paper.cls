\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_paper}[2021/08/17 My custom CV class] 
\LoadClass[12pt]{article}
\newcommand{\lunwenbiaoti}{\fontsize{15.75pt}{0}\heiti 基于完全成本加成定价和动态规划的蔬菜补货与定价决策}
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

