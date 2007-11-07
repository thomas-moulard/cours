OUT=stocha.pdf
SRC=stocha.tex
TOC=stocha.toc
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
	rm -f *.aux *.toc *.pdf *.log *~
