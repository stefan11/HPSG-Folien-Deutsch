DVIPS-OPTIONS=-Pwww -j0

#DVIPS-OPTIONS=-Pstefan


STYLE-PATH= ${HOME}/Library/texmf/tex/latex/
#STYLE-PATH= ${HOME}/.LaTeX/

SOURCE= hpsg-include.tex hpsg-slides-present.tex hpsg-handout.tex ${STYLE-PATH}/Beamer/hu-beamer-includes.sty\
	hpsg-einleitung.tex               \
	hpsg-phrasenstrukturgrammatik.tex \
        hpsg-formalismus.tex              \
        hpsg-valenz-grammatikregeln.tex   \
        hpsg-adjunktion-spezifikation.tex \
	hpsg-semantik.tex                 \
        hpsg-lexikon.tex                  \
	hpsg-topologie.tex                \
        hpsg-konstituentenreihenfolge.tex \
	hpsg-nla.tex lokalitaet-hpsg-folien.tex \
	hpsg-light.tex

SOURCE2= hpsg-include-2.tex hpsg-slides-2-present.tex hpsg-handout-2.tex ${STYLE-PATH}/Beamer/hu-beamer-includes.sty\
        hpsg-komplementation.tex kongruenz-hpsg-folien.tex kasus-hpsg-folien.tex\
	verbkomplex-hpsg-folien.tex \
        anhebung-hpsg-folien.tex    \
        passiv-hpsg-folien.tex


dvi: hpsg-vorl-slides.dvi hpsg-vorl-slides.bib.dvi hpsg-vorl-handout.dvi

1-slides: hpsg-slides-present.pdf
1-handout: hpsg-handout-2x2.pdf

2-slides: hpsg-slides-2-present.pdf
2-handout: hpsg-handout-2-2x2.pdf

slides: 1-slides
handout: 1-handout

%.dvi: %.tex $(SOURCE) $(SOURCE2)
	latex $*
	latex $*
	bibtex $*
	latex $* 
	bibtex $*
	latex $* 

%.ps: %.dvi
	dvips $*.dvi -o


%.pdf: %.ps
	ps2pdf $*.ps
#	dvips -Plandscapeplus -Pwww $* -o


%.ps.gz: %.ps
	cp $*.ps $*.tmp
	gzip $*.tmp
	mv $*.tmp.gz $*.ps.gz
	latex $*
	latex $* |grep -v math
	bibtex $*
	latex $* |grep -v math
	bibtex $*
	latex $* |grep -v math|egrep 'Warning|label|aux'



hpsg-handout-2x2.pdf: hpsg-handout.pdf
	beamer2handout $?

hpsg-handout-light-2x2.pdf: hpsg-handout-light.pdf
	beamer2handout $?

hpsg-handout-2-2x2.pdf: hpsg-handout-2.pdf
	beamer2handout $?

display:
	latex jena-hpsg-vorl-slides
	make pdf
	acroread jena-hpsg-vorl-slides.pdf



public: hpsg-slides.pdf hpsg-handout-2x2.pdf
	scp $? /home/stefan/public_html/PS/


o-public: knoppix o-public-copy

o-public-copy: hpsg-slides.pdf hpsg-handout-2x2.pdf hpsg-slides-2.pdf hpsg-handout-2-2x2.pdf
	scp -p $? home.hpsg.fu-berlin.de:/home/stefan/public_html/PS/


o-public-2: o-public-copy-2

o-public-copy-2: hpsg-slides-2.pdf hpsg-handout-2-2x2.pdf
	scp -p $? home.hpsg.fu-berlin.de:/home/stefan/public_html/PS/


knoppix: hpsg-slides.pdf hpsg-handout-2x2.pdf hpsg-slides-2.pdf hpsg-handout-2-2x2.pdf
	cp -p $?  ${HOME}/Prolog/Grammatik-CD/Dokumente/

code-public:
	tar cjvhf /tmp/hpsg-slides.tbz *.tex Makefile \
${STYLE-PATH}tree-dvips/ ${STYLE-PATH}/authorindex/  \
${STYLE-PATH}beamer-includes.sty \
${STYLE-PATH}beamer-subsubsubsec.sty \
${STYLE-PATH}beamer-movement.sty \
${STYLE-PATH}beamer-subsubsubsec-3.06.sty \
${STYLE-PATH}beamer-subsubsubsec-tree.sty \
${STYLE-PATH}folie-literatur-deutsch.tex \
${STYLE-PATH}makros.2e.sty \
${STYLE-PATH}my-index-shortcuts.sty \
${STYLE-PATH}merkmalstruktur.sty \
${STYLE-PATH}de-commands.sty \
${STYLE-PATH}mycommands.sty \
${STYLE-PATH}abbrev.sty \
${STYLE-PATH}eng-date.sty \
${STYLE-PATH}de-date.sty \
${STYLE-PATH}my-xspace.sty \
${STYLE-PATH}8bit.sty \
${STYLE-PATH}Ling/short-long-ex.sty \
${STYLE-PATH}Ling/article-ex.sty \
${STYLE-PATH}Ling/my-gb4e-slides.sty \
${STYLE-PATH}Ling/cgloss.sty \
${HOME}/Documents/Dienstlich/PS-Figures/types-pos.eps \
${HOME}/Documents/Dienstlich/PS-Figures/er-das-buch-dem-mann-gibt-simple.eps \
${HOME}/bin/pdfnup \
${STYLE-PATH}UniBremenBrief/logo_sw.eps \
${STYLE-PATH}UniBremenBrief/logo_4c.eps
	scp -p /tmp/hpsg-slides.tbz home.hpsg.fu-berlin.de:/home/stefan/public_html/PS/
	cp  -p /tmp/hpsg-slides.tbz                      ${HOME}/public_html/PS/




clean:
	find . -name \*\.bak -exec \rm {} \;
	find . -name \*~ -exec \rm {} \;
	rm -f *.bak *.toc *.bbl *.blg *~ *.log *.aux *.*pk *.cut *.tmp *.out *.nav *.snm


realclean: clean
	rm -f *.dvi *.ps *.pdf



