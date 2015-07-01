# excel.coffee
# require 'sugar'
###
cwd = process.cwd()
filename = "#{cwd}/template.xlsx"
outfile = "output-#{Date.create().format('{MM}{dd}{HH}{mm}{ss}')}.xlsx"


XlsxTemplate = require('xlsx-injector')


values = 



workbook = new XlsxTemplate(filename)


sheetNumber = 1
workbook.substitute sheetNumber, values
workbook.writeFile(outfile)
###

# word.coffee

moment = require("moment")

fs = require('fs')
inject = require("./injector_wrapper").injector

suffix = moment().format("YYYYMMDDhhmmss")

data =
  cap: 400
  used: 295
  monthLabel: moment().subtract(1,'days').format("MMMM Has")
  daysInMonth: parseInt(moment().subtract(1,'days').endOf('month').format("D"))
  elapsedDays: parseInt(moment().subtract(1,'days').format("D"))
console.log data
options =
  template: "./template.xlsx"
  output: "./output-#{suffix}.xlsx"
  data: data
  
inject.xlsx options 