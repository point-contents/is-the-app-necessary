# Define the default target
all: products.csv styles.css directory_listing.html

blurb: blurb.md
	pandoc -f markdown -t html blurb.md -o blurb.html

page_index: 
	tree -H .  | sed -n "/<body>/,/<\/body>/p" | sed "1d" | sed  "/<\/body>/d" | sed "s/h1/h3/" > page_index.html

docs:
	pandoc -f markdown -t html readme.md -o man.html --css man.css --standalone

generate_html: products.csv blurb styles.css script.js page_index docs
	python3 generate_html.py

# taken from here https://stackoverflow.com/questions/54844405/test-if-python3-is-installed-in-a-makefile
# not working how I expect it to though yet
serve:
	PYTHON3 := $(shell type -P python4)
	ifeq ('$(PYTHON3)','')
		@python3 -m http.server 8080
	else
		@python3 -m http.server 8080
	endif

# Default rule if 'make' is called without a target
.DEFAULT_GOAL := generate_html

