# Define the default target
all: products.csv clean

# Rule to generate blurb.html from blurb.md
blurb.html: blurb.md
	pandoc -f markdown -t html blurb.md > blurb.html

# Rule to generate HTML using generate_html.py
generate_html: products.csv
	python3 generate_html.py

# Clean rule to remove generated files
.PHONY: clean
clean:
	rm -f blurb.html

# Default rule if 'make' is called without a target
.DEFAULT_GOAL := generate_html

