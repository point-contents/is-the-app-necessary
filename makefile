# Define the default target
all: products.csv styles.css

blurb: blurb.md
	pandoc -f markdown -t html blurb.md -o blurb.html

index: generate_html
	tree -H .  | sed -n "/<body>/,/<\/body>/p" | sed "1d;$d" | sed "s/h1/h3/">> index.html

generate_html: products.csv blurb styles.css script.js 
	python3 generate_html.py

# Default rule if 'make' is called without a target
.DEFAULT_GOAL := generate_html

