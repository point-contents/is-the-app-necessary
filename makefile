# Define the default target
all: products.csv styles.css

# Rule to generate blurb.html from blurb.md
blurb: blurb.md
	pandoc -f markdown -t html blurb.md > blurb.html

# Rule to generate HTML using generate_html.py
generate_html: products.csv blurb styles.css
	python3 generate_html.py

# Default rule if 'make' is called without a target
.DEFAULT_GOAL := generate_html

