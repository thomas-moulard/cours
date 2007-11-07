OUT=crypto.pdf
DVI=crypto.dvi
PS=crypto.ps
SRC=crypto.tex
TOC=crypto.toc
LATEX=texi2dvi -I vaucanson-g


all:
	$(LATEX) $(SRC)
	dvips $(DVI) -o$(PS)

clean:
	rm -f *.aux *.toc *.pdf *.log *.dvi *.ps
