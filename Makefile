virtualenvs.pdf: virtualenvs.md
	pandoc \
		-f markdown -t beamer -o $@ \
		-V fontsize=10pt \
		$<
