# Oxi

Oxi (Office XML Injector) is a simple tool/library for injecting JSON data into Microsoft Office XML document templates - `docx`, `xlsx`, `pptx`

Oxi works as a CLI or as a library.

# Installation

`npm install oxi [--save]`

If you want to use the CLI:

`npm install oxi -g`

# Basics

Coming soon!


# Sample Code

## Excel

```coffeescript

oxi = require("oxi")

data =
  firstName: "Joe"
  lastName: "Dirt"

options =
  template: "./template.xlsx"
  output: "./output.xlsx"
  data: data
  
oxi.xlsx options 

```

## Word

```coffeescript

oxi = require("oxi")

data =
  firstName: "Joe"
  lastName: "Dirt"

options =
  template: "./template.docx"
  output: "./output.docx"
  data: data
  
oxi.docx options 

```

## Powerpoint

```coffeescript

oxi = require("oxi")

data =
  firstName: "Joe"
  lastName: "Dirt"

options =
  template: "./template.pptx"
  output: "./output.pptx"
  data: data
  
oxi.pptx options 

```



# CLI

Make sure you installed the npm globally (`npm install oxi -g`) if you want to use the CLI.

Syntax:

```
oxi --template filename1.ext --output filename2.ext --data datafile.ext

oxi -t filename1.ext -o filename2.ext -d datafile.ext
```

Rules:

* Template and output file extensions must be `.xlsx`, `.docx` or `.pptx`
* Data file must be `.cson`, `.json`, `.yml` or `.yaml`
* Both the template and output filename extensions must match


# Changelog

## 0.1.0

* Initial release


# Caveats

* Excel substitution currently only works on the first sheet
* Docxtemplater can't coexist with Sugar.js 

