OUT=complexite.pdf
DVI=complexite.dvi
PS=complexite.ps
SRC=complexite.tex
TOC=complexite.toc
LATEX=texi2dvi -I gastex/


all:
	$(LATEX) $(SRC)
	dvips $(DVI) -o$(PS)

clean:
	rm -f *.aux *.toc *.pdf *.log *.dvi *.ps
