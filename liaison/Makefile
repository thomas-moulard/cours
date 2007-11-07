OUT=liaison.pdf
SRC=liaison.tex
TOC=liaison.toc
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
	rm -f *.aux *.toc $(OUT) *.log
