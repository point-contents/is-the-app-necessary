import csv

csv_file_path = 'products.csv'
html_file_path = 'index.html'
blurb_file_path = 'blurb.html'
searching_script_path = 'script.js'
directory_listing = 'page_index.html'

# Read CSV file
with open(csv_file_path, 'r') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    rows = list(csv_reader)

with open(blurb_file_path, 'r') as blurb:
    blurb_text = "\n" + blurb.read() + "\n"

with open(searching_script_path, 'r') as searcher:
    searcher_script = "\n" + searcher.read() + "\n"

with open(directory_listing, 'r') as listing:
    directory_list = listing.read()

# Generate HTML
table_rows = ''
for row in rows:
    table_rows += f'    <tr><td>{row["Product"]}</td><td>{row["App Needed to Use"]}</td><td>{row["App Needed to Setup"]}</td></tr>\n'

html_content = f'''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Is the App Necessary?</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Is the App Necessary?</h1>
    {blurb_text}
    <input id='user_input' onkeyup='search_table()' type='text' placeholder="Enter item here">
    <table id="product_table">
        <thead>
            <tr id="table_header">
                <th>Product</th>
                <th>App Needed to Use</th>
                <th>App Needed to Setup</th>
            </tr>
        </thead>
        <tbody>
{table_rows}
        </tbody>
    </table>
    <ul>
    <li><a href="https://github.com/point-contents/is-the-app-necessary" target="_blank">Visit Git Repository</a></li>
    </ul>
    <br><br>
{directory_list}
</body>
<script>
{searcher_script}
</script>
'''

# Write HTML file
with open(html_file_path, 'w') as html_file:
    html_file.write(html_content)

print('HTML file generated successfully.')

