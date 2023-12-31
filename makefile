# Makefile

.PHONY: all

all: blurb.html

blurb.html: blurb.md
	pandoc -f markdown -t html $< > $@

generate_html: blurb.html
	python3 generate_html.py

