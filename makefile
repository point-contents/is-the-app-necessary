# Define the default target
all: products.csv styles.css directory_listing.html

blurb: blurb.md
	pandoc -f markdown -t html blurb.md -o blurb.html

page_index: 
	tree -H .  | sed -n "/<body>/,/<\/body>/p" | sed "1d" | sed  "/<\/body>/d" | sed "s/h1/h3/" > page_index.html

generate_html: products.csv blurb styles.css script.js page_index
	python3 generate_html.py

# Default rule if 'make' is called without a target
.DEFAULT_GOAL := generate_html

