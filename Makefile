
PANDOC= pandoc

# for HTML slides
SLIDE_OPTIONS=-s -t dzslides -V css="css/dzslides.css"

# for HTML transcripts
HTML_OPTIONS= -s -t html 

PDF_OPTIONS=--smart -s -t latex --template=latex.tex

%.html : %.md
	$(PANDOC) $(SLIDE_OPTIONS) $< -o $@

%.pdf : %.md 
	$(PANDOC) $(PDF_OPTIONS) $< -o $@

HTML_SLIDES = gitprimer.html

PDF_SLIDES = gitprimer.pdf

html : $(HTML_SLIDES)

pdf : $(PDF_SLIDES)

clean : 
	rm -f $(HTML_SLIDES) $(PDF_SLIDES)
