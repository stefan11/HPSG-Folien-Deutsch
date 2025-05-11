STYLE-PATH= ${HOME}/Library/texmf/tex/latex/
LANGSCI-PATH=~/Documents/Dienstlich/Projekte/LangSci/Git-HUB/latex/


SOURCE= $(wildcard *.tex) $(wildcard geteilte-Folien/*.tex)

09-hpsg-handout-konstituentenreihenfolge.pdf:	09-hpsg-handout-konstituentenreihenfolge.tex hpsg-konstituentenreihenfolge.tex
	xelatex 09-hpsg-handout-konstituentenreihenfolge
	biber 09-hpsg-handout-konstituentenreihenfolge
	xelatex 09-hpsg-handout-konstituentenreihenfolge
	biber 09-hpsg-handout-konstituentenreihenfolge
	xelatex 09-hpsg-handout-konstituentenreihenfolge


10-hpsg-handout-nla.pdf:	10-hpsg-handout-nla.tex hpsg-nla.tex
	xelatex 10-hpsg-handout-nla
	biber 10-hpsg-handout-nla
	xelatex 10-hpsg-handout-nla
	biber 10-hpsg-handout-nla
	xelatex 10-hpsg-handout-nla

11-hpsg-handout-lokalitaet.pdf:	11-hpsg-handout-lokalitaet.tex hpsg-lokalitaet.tex
	xelatex 11-hpsg-handout-lokalitaet
	biber 11-hpsg-handout-lokalitaet
	xelatex 11-hpsg-handout-lokalitaet
	biber 11-hpsg-handout-lokalitaet
	xelatex 11-hpsg-handout-lokalitaet


%.pdf: %.tex $(SOURCE) 
	xelatex $*
	biber $*
	xelatex $* 
	biber $*
	xelatex $* 


1-slides: hpsg-slides-present.pdf
1-handout: hpsg-handout.pdf

2-slides: hpsg-slides-2-present.pdf
2-handout: hpsg-handout-2-2x2.pdf

slides: 1-slides
handout: 1-handout



o-public: knoppix o-public-copy

klima-public: 00-Klimakatastrophe-handout.pdf\
      00-Klimakatastrophe-slides.pdf	
	scp -p $? hpsg.hu-berlin.de:/home/stefan/public_html/PS/

# hpsg-slides-2.pdf hpsg-handout-2.pdf hpsg-slides.pdf hpsg-handout.pdf 
o-public-copy: 01-hpsg-handout-einleitung.pdf \
      02-hpsg-handout-formalismus.pdf\
      03-hpsg-handout-valenz-komplementation.pdf \
      05-hpsg-handout-semantik.pdf \
#      06-hpsg-handout-adjunktion-spezifikation.pdf \
#      07-hpsg-handout-lexicon.pdf \
#      08-hpsg-handout-topologie.pdf \
#      09-hpsg-handout-konstituentenreihenfolge.pdf\
#      10-hpsg-handout-nla.pdf\
#      11-hpsg-handout-lokalitaet.pdf\
      hpsg-slides.pdf\
      hpsg-handout.pdf \
      00-Klimakatastrophe-handout.pdf\
      00-Klimakatastrophe-slides.pdf	
	scp -p $? hpsg.hu-berlin.de:/home/stefan/public_html/PS/


o-public-2: o-public-copy-2

o-public-copy-2: hpsg-slides-2.pdf hpsg-handout-2-2x2.pdf
	scp -p $? home.hpsg.fu-berlin.de:/home/stefan/public_html/PS/

# todo Teil 2
#knoppix: hpsg-slides.pdf hpsg-handout.pdf hpsg-slides-2.pdf hpsg-handout-2-2x2.pdf
knoppix: hpsg-slides.pdf hpsg-handout.pdf 
	cp -p $?  ${HOME}/Prolog/Grammatik-CD/Dokumente/



install:
	cp -p ${STYLE-PATH}Beamer/hu-beamer-includes-pdflatex.sty                                          styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/theme/beamerthemeHUBerlin.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/font/beamerfontthemehu.sty        styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/color/beamercolorthemebearHU.sty  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/inner/beamerinnerthemehui.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/HUBeamer/texmf/tex/latex/beamer/themes/outer/beamerouterthemehuo.sty     styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/beamer-movement.sty                                                      styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/forest-beamer-setup.sty                                                  styles/Beamer/
	cp -p ${STYLE-PATH}Beamer/hu-literatur-biber.tex                                                   styles/Beamer/
	cp -p ${STYLE-PATH}makros.2e.sty styles/
	cp -p ${STYLE-PATH}abbrev.sty    styles/
	cp -p ${STYLE-PATH}fixcitep.sty  styles/
	cp -p ${STYLE-PATH}de-date.sty   styles/
	cp -p ${STYLE-PATH}oneline.sty   styles/
	cp -p ${STYLE-PATH}unified-biblatex.sty          styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.bbx styles/
	cp -p ${STYLE-PATH}unified-biblatex/stmue-langsci-unified.cbx styles/
	cp -p ${STYLE-PATH}Ling/article-ex.sty           styles/
	cp -p ${STYLE-PATH}Ling/merkmalstruktur.sty      styles/
	cp -p ${STYLE-PATH}my-xspace.sty            styles/
	cp -p ${STYLE-PATH}Ling/my-gb4e-slides.sty       styles/
	cp -p ${STYLE-PATH}Ling/cgloss.sty               styles/
	cp -p ${STYLE-PATH}Ling/tikz-mrs.sty 		styles/
	cp -p ${STYLE-PATH}Ling/forest*.sty              .
	cp -p ${LANGSCI-PATH}langsci-forest-setup.sty    .

mount:
	/usr/local/bin/bindfs ~/Documents/Dienstlich/Lehre/Folien/HU/geteilte-Folien ~/Documents/Dienstlich/Lehre/Folien/HU/HPSG/geteilte-Folien

clean:
	find . -name \*\.bak -exec \rm {} \;
	find . -name \*~ -exec \rm {} \;
	rm -f *.bak *.toc *.bbl *.blg *~ *.log *.aux *.*pk *.cut *.tmp *.out *.nav *.snm *.bcf
	rm geteilte-Folien/*.aux


realclean: clean
	rm -f *.dvi *.ps *.pdf



