# Oxi

Oxi (Office XML Injector) is a simple tool/library for injecting JSON data into Microsoft Office XML document templates - `docx`, `xlsx`, `pptx`

Oxi works as a CLI or as a library.

# Basics


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






# Changelog



## Prereleases

## 0.0.4

* Doc updates

# GOTCHAS

* Docxtemplater can't coexist with Sugar.js 

