OUT=reseaux_de_petri.pdf
DVI=reseaux_de_petri.dvi
PS=reseaux_de_petri.ps
SRC=reseaux_de_petri.tex
TOC=reseaux_de_petri.toc
LATEX=texi2dvi -I gastex


all:$(OUT)
	$(LATEX) $(SRC)
	dvips $(DVI) -o$(PS)

$(OUT):$(TOC)
	$(LATEX) $(SRC)

$(TOC):$(SRC)
	$(LATEX) $(SRC)

$(SRC):
	$(LATEX) $(SRC)

clean:
	rm -f *.aux *.toc *.pdf *.log *.dvi *.ps
