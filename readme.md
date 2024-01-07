---
title: "Manual Page"
---

[![Netlify Status](https://api.netlify.com/api/v1/badges/43469286-e452-4d40-96e6-735391cf1e33/deploy-status)](https://app.netlify.com/sites/dancing-pavlova-67c9fa/deploys)

## DESCRIPTION

The Makefile shows what is happening. The top of the page contains a blurb, created using pandoc to convert `blurb.md` to HTML. At the bottom of the page, there is an index created with a tree and sed command that generates a tree of the directory and saves this as an HTML section.

## GENERATED CONTENT

The Python script `generate_html.py` creates an HTML table from `products.csv`. `generate_html.py` also contains placeholder HTML which gives the page its structure. The script then uses all of the previously mentioned HTMLs and stitches them together to make the page that is `index.html`.

## MAKE COMMANDS

```bash
make               # Runs the default make command.
make blurb        # Creates the blurb.
make page_index   # Creates the directory tree in HTML.
make generate_html # Default, creates index.html with CSS and JS.
make docs # Creates HTML of this page 
```

## NETLIFY AUTOMATION

Netlify is watching for pushes to the main branch of the repository. If there is a push, Netlify will run the make command to publish the directory, serving index.html statically.

## FILES

blurb.md: Markdown file containing the blurb.
generate\_html.py: Python script for generating HTML from products.csv.
products.csv: CSV file containing product information.
