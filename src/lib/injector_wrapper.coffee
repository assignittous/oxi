
fs = require('fs')

Docxtemplater = require('docxtemplater')



exports.injector = {
  dxt_options: 
    delimiters:
        start: "{{"
        end: "}}"      
  docx: (options)->
    console.log options
    content = fs.readFileSync(options.template, 'binary')
    doc = new Docxtemplater(content).setOptions @dxt_options
    doc.setData options.data
    doc.render()
    buf = doc.getZip().generate(type: 'nodebuffer')
    fs.writeFileSync options.output, buf

  pptx: (options)->
    content = fs.readFileSync(options.template, 'binary')
    doc = new Docxtemplater.PptxGen(content).setOptions @dxt_options
    doc.setData options.data
    doc.render()
    buf = doc.getZip().generate(type: 'nodebuffer')
    fs.writeFileSync options.output, buf

  xlsx: (options)->
    # this require is here because docxtemplater can't coexist with sugar
    XlsxTemplate = require('xlsx-injector')
    workbook = new XlsxTemplate(options.template)
    # todo: sheet handling needs to be better
    sheetNumber = 1
    workbook.substitute sheetNumber, options.data
    workbook.writeFile(options.output)


} 



