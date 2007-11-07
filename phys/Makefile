OUT=physique_ondulaire.pdf
SRC=physique_ondulaire.tex
TOC=physique_ondulaire.toc
LATEX=pdflatex


all:$(OUT)
	$(LATEX) $(SRC)

$(OUT):$(TOC)
	$(LATEX) $(SRC)

$(TOC):$(SRC)
	$(LATEX) $(SRC)

$(SRC):
	$(LATEX) $(SRC)

clean:
	rm -f *.aux *.toc *.pdf *.log
