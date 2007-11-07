OUT=signal.pdf
SRC=signal.tex
TOC=signal.toc
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
