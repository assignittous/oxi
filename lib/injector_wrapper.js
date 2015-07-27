var Docxtemplater, _, fs;

fs = require('fs');

_ = require("lodash");

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
    var XlsxTemplate, workbook;
    XlsxTemplate = require('xlsx-injector');
    workbook = new XlsxTemplate(options.template);
    _.forEach(workbook.sheets, function(sheet) {
      return workbook.substitute(sheet.id, options.data);
    });
    return workbook.writeFile(options.output);
  }
};
