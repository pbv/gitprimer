
PANDOC= pandoc

# for HTML slides
SLIDE_OPTIONS=-s -t dzslides -V css="css/dzslides.css"

# for PDF handouts
PDF_OPTIONS= -s -t latex

%.html : %.md
	$(PANDOC) $(SLIDE_OPTIONS) $< -o $@

%.pdf : %.md 
	$(PANDOC) $(PDF_OPTIONS) $< -o $@

HTML_SLIDES = gitprimer.html

PDF_HANDOUTS = gitprimer.pdf


html : $(HTML_SLIDES)

pdf : $(PDF_HANDOUTS)

clean : 
	rm -f $(HTML_SLIDES) $(PDF_HANDOUTS)
