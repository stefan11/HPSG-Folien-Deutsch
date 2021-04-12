STYLE-PATH= ${HOME}/Library/texmf/tex/latex/


SOURCE= $(wildcard *.tex)

%.pdf: %.tex $(SOURCE) 
	xelatex $*
	biber $*
	xelatex $* 
	biber $*
	xelatex $* 


1-slides: hpsg-slides-present.pdf
1-handout: hpsg-handout-2x2.pdf

2-slides: hpsg-slides-2-present.pdf
2-handout: hpsg-handout-2-2x2.pdf

slides: 1-slides
handout: 1-handout



o-public: knoppix o-public-copy

# hpsg-slides-2.pdf hpsg-handout-2.pdf hpsg-slides.pdf hpsg-handout.pdf 
o-public-copy: hpsg-handout-einleitung.pdf hpsg-handout-formalismus.pdf hpsg-handout-komplementation.pdf hpsg-handout-hpsg-light.pdf hpsg-handout-semantik.pdf
	scp -p $? hpsg.hu-berlin.de:/home/stefan/public_html/PS/


o-public-2: o-public-copy-2

o-public-copy-2: hpsg-slides-2.pdf hpsg-handout-2-2x2.pdf
	scp -p $? home.hpsg.fu-berlin.de:/home/stefan/public_html/PS/


knoppix: hpsg-slides.pdf hpsg-handout-2x2.pdf hpsg-slides-2.pdf hpsg-handout-2-2x2.pdf
	cp -p $?  ${HOME}/Prolog/Grammatik-CD/Dokumente/





clean:
	find . -name \*\.bak -exec \rm {} \;
	find . -name \*~ -exec \rm {} \;
	rm -f *.bak *.toc *.bbl *.blg *~ *.log *.aux *.*pk *.cut *.tmp *.out *.nav *.snm


realclean: clean
	rm -f *.dvi *.ps *.pdf



