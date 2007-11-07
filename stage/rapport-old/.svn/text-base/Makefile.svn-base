##% Makefile                                           -*- Makefile -*-

## Copyright (C) 2005 Michael Cadilhac for LRDE.

## Permission is granted to copy, distribute and/or modify this document
## under the terms of the GNU Free Documentation License, Version 1.2
## or any later version published by the Free Software Foundation;
## with the Invariant Sections being just ``Copying this document'',
## no Front-Cover Texts, and no Back-Cover Texts.

## A copy of the license is provided in the file COPYING.DOC.



##################################################### List all sources

SOURCES_src=		leroi_g-rapport.tex	\
			src/intro.tex		\
			src/enst.tex		\
			src/travail.tex		\
			src/conclusion.tex


SOURCES_figures= img

SOURCES_dirs= src

##################################################### Grouping sources

SOURCES=	$(SOURCES_src) $(SOURCES_figures)

################################################## Compilation details

SOURCES_comp=	leroi_g-rapport.tex

DISTCHECK_rules=dvi ps
INCLUDE_dirs=	$$(echo "$(SOURCES_dirs)" |			\
		   sed "s/\([^[:space:]][^[:space:]]*\)[ \t][ \t]*/\1:/g")

################################# Project/distribution related details

PROJECT=	leroi_g-rapport
EXTRA_DIST=	Makefile
TARNAME=	$(PROJECT).tar.bz2
COMPRESSOR=	bzip2
DEFAULT_FORMAT=	ps


################################################## Compilation details

TEXI2DVI=	texi2dvi
TEXI2DVI_flags=	--batch -I .:$(TEXINPUTS):$(INCLUDE_dirs)

PS2PDF=		ps2pdf

PDF_view=	xpdf -z 'width'
DVI_view=	xdvi
PS_view=	gv


######################################################### Global rules

all: $(PROJECT).$(DEFAULT_FORMAT)

view: $(DEFAULT_FORMAT)view


#################################################### Compilation rules

pdf: $(PROJECT).pdf

dvi: $(PROJECT).dvi

ps:  $(PROJECT).ps

pspdf: $(PROJECT).ps
	[ $(PROJECT).pdf -nt $(PROJECT).ps ] || $(PS2PDF) $(PROJECT).ps

$(PROJECT).pdf: $(SOURCES)
	newname=$$(echo $$(basename "$(SOURCES_comp)") |	\
		   sed 's/\.tex$$/.pdf/');			\
	$(TEXI2DVI) $(TEXI2DVI_flags) --pdf $(SOURCES_comp) ||	\
		(rm -f $$newname && false);			\
	[ "$$newname" = $(PROJECT).pdf ] ||			\
	mv -f "$$newname" $(PROJECT).pdf


$(PROJECT).dvi: $(SOURCES)
	newname=$$(echo $$(basename "$(SOURCES_comp)") |	\
		   sed 's/\.tex$$/.dvi/');			\
	$(TEXI2DVI) $(TEXI2DVI_flags) $(SOURCES_comp) ||	\
		(rm -f $$newname && false);			\
	[ "$$newname" = $(PROJECT).dvi ] ||			\
	mv -f "$$newname" $(PROJECT).dvi

$(PROJECT).ps: $(PROJECT).dvi
	dvips $(PROJECT).dvi -o $(PROJECT).ps


######################################################## Viewing rules

pdfview: $(PROJECT).pdf
	$(PDF_view) $(PROJECT).pdf

dviview: $(PROJECT).dvi
	$(DVI_view) $(PROJECT).dvi

psview: $(PROJECT).ps
	$(PS_view) $(PROJECT).ps

####################################################### Cleaning rules

clean:
	find . -name '*.log' | xargs rm -f
	find . -name '*.aux' | xargs rm -f
	find . -name '*.toc' | xargs rm -f
	find . -name '*.snm' | xargs rm -f
	find . -name '*.nav' | xargs rm -f
	find . -name '*.out' | xargs rm -f
	find . -name '*.bbl' | xargs rm -f
	find . -name '*.blg' | xargs rm -f
	find . -name '*~' | xargs rm -f
	rm -fR $(PROJECT)
	rm -f initial_files final_files

distclean: clean
	rm -f $(PROJECT).pdf $(PROJECT).dvi $(PROJECT).ps $(TARNAME)

####################################################### Distcheck rule

distcheck: tar
	rm -rf $(PROJECT)
	tar --extract --use-compress-program $(COMPRESSOR) --file $(TARNAME)
	find $(PROJECT) > initial_files
	cd $(PROJECT) && make all $(DISTCHECK_rules) && make distclean
	find $(PROJECT) > final_files
	diff initial_files final_files || \
	  (echo 'invalid clean rule.' >&2 ; false)
	rm -f initial_files final_files
	rm -fR $(PROJECT)
	@echo $(TARNAME) is ready for distribution.


########################################################### Dist rules

dist: tar

tar: $(TARNAME)

$(TARNAME): $(EXTRA_DIST) $(SOURCES)
	rm -rf $(PROJECT)
	mkdir -p $(PROJECT)
	for p in $(SOURCES_dirs); do	\
	  mkdir -p $(PROJECT)/$$p;			\
	  cp -pR $$(echo "$(SOURCES)" | sed 's/[\t ]/\n/g' | \
		    grep -E "^$$p/[^/]*$$") $(PROJECT)/$$p;\
	done
	cp -pR Makefile $(EXTRA_DIST) $(PROJECT)
	tar --create --use-compress-program $(COMPRESSOR) --file $(TARNAME) $(PROJECT)
	rm -fR $(PROJECT)
