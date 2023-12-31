# Define the default target
all: products.csv styles.css

# Rule to generate blurb.html from blurb.md
blurb: blurb.md
	pandoc -f markdown -t html blurb.md -o blurb.html

generate_html: products.csv blurb styles.css script.js
	python3 generate_html.py

# Default rule if 'make' is called without a target
.DEFAULT_GOAL := generate_html

