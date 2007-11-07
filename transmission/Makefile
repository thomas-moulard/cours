OUT=transmission.pdf
SRC=transmission.tex
TOC=transmission.toc
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
