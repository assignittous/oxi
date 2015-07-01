var Docxtemplater, fs;

fs = require('fs');

Docxtemplater = require('docxtemplater');

exports.injector = {
  dxt_options: {
    delimiters: {
      start: "{{",
      end: "}}"
    }
  },
  docx: function(options) {
    var buf, content, doc;
    console.log(options);
    content = fs.readFileSync(options.template, 'binary');
    doc = new Docxtemplater(content).setOptions(this.dxt_options);
    doc.setData(options.data);
    doc.render();
    buf = doc.getZip().generate({
      type: 'nodebuffer'
    });
    return fs.writeFileSync(options.output, buf);
  },
  pptx: function(options) {
    var buf, content, doc;
    content = fs.readFileSync(options.template, 'binary');
    doc = new Docxtemplater.PptxGen(content).setOptions(this.dxt_options);
    doc.setData(options.data);
    doc.render();
    buf = doc.getZip().generate({
      type: 'nodebuffer'
    });
    return fs.writeFileSync(options.output, buf);
  },
  xlsx: function(options) {
    var XlsxTemplate, sheetNumber, workbook;
    XlsxTemplate = require('xlsx-injector');
    workbook = new XlsxTemplate(options.template);
    sheetNumber = 1;
    workbook.substitute(sheetNumber, options.data);
    return workbook.writeFile(options.output);
  }
};
