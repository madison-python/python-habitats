all: virtualenvs.pdf anaconda.pdf
virtualenvs.pdf: virtualenvs.md
anaconda.pdf: anaconda.md

%.pdf: %.md
	pandoc \
		-f markdown -t beamer -o $@ \
		-V fontsize=10pt \
		$<
