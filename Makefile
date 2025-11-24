slidessrc=$(shell find . -iname '*-slides.md' | sed 's/ /\\ /g')
handoutssrc=$(shell find . -iname '*-handout.md' | sed 's/ /\\ /g')

slides=$(subst .md,.pdf,$(slidessrc))
handouts=$(subst .md,.pdf,$(handoutssrc))

slides : $(slides)
handouts : $(handouts)

all : slides handouts


%-slides.pdf: %-slides.md
	pandoc -i -t beamer -V theme:Warsaw $< -o $@

%-handout.pdf: %-handout.md
#	pandoc -N -V geometry=height=10in,width=7.5in --latex-engine=xelatex $< -o $@
	pandoc -N -V mainfont="STIXGeneral" -V sansfont="DejaVu Sans" -V monofont="Liberation Mono" -V fontsize=10pt -V geometry=height=10.5in,width=7.5in --pdf-engine=xelatex $< -o $@
