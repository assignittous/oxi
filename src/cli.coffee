program = require "commander"
logger = require("./lib/logger").Logger
pkg = require "./package.json"
path = require "path"
oxi = require("./lib/injector_wrapper").injector
moment = require "moment"
fs = require "fs"
cson = require "cson"
yaml = require "js-yaml"


noOp = ()-> 
  console.log "Nothing ran, couldn't understand your command"

# this is because fs.existsSync is getting deprecated
fileExists = (path)->
  try
    # Query the entry
    stats = fs.lstatSync(path)
    # Is it a directory?
    if stats.isDirectory()
      # Yes it is
      return false
    else
      return true
  catch e
    return false
# version
program
.version(pkg.version, "-v, --version")
.option("-d, --data <datafile>", "Data file")
.option("-t, --template <templatefile>", "Template file")
.option("-o, --output <outputfile>", "Output file")
.parse(process.argv)


if program.data? && program.template? && program.output?
  if path.extname(program.output) == path.extname(program.template)
    docType = path.extname(program.output)
    dataType = path.extname(program.data)    
    
    if (program.template == program.output)
      logger.warn "Template and output are the same, a suffix will be added to the output file"
      program.output = program.output.replace("#{docType}","-#{moment().format("YYYYMMDDhhmmss")}#{docType}")

    if fileExists(program.data)

      switch dataType
        when ".json"
          logger.info "Parsing JSON file"
          try
            data = cson.parseJSONFile(program.data)
          catch e
            logger.error "JSON file appears to be malformed"
            return
        when ".cson"
          logger.info "Parsing CSON file"
          try
            data = cson.parseCSONFile(program.data)
          catch e
            logger.error "CSON file appears to be malformed"
            return          
        when ".yaml", ".yml"
          logger.info "Parsing YAML file"
          try
            data = yaml.safeLoad(fs.readFileSync(program.data, 'utf8'))
          catch e
            logger.error "JSON file appears to be malformed"
            return             
        else
          logger.error "Data type must be .json, .cson, .yml or .yaml"
          return
    else
      logger.error "Data file does not exist or is a directory"
      return

    if !fileExists(program.template)
      logger.error "Template does not exist or is a directory"


    options =
      template: program.template
      output: program.output
      data: data


    switch docType
      when ".docx"
        logger.info "Generating DOCX"
        oxi.docx options 
      when ".xlsx"
        logger.info "Generating XLSX"
        oxi.xlsx options 
      when ".pptx"
        logger.info "Generating PPTX"
        oxi.pptx options 
      else
        logger.error "The file type must be docx, xlsx or pptx"
        return


  else
    logger.error "The template and output files have different extensions"



else
  logger.error "Data (-d), template (-t) and output (-o) parameters are required."
