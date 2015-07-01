# word.coffee

fs = require('fs')
inject = require("./injector_wrapper").injector

moment = require "moment"



data =
  label: "June Has"
  daysInMonth: 30
  elapsedDays: 29
  remainingDays: 1
  cap: "400.00"
  usedCap: "295.00"
  remainingCap: "105.00"
  dailyCap: "13.33"
  expectedUsed: "386.67"
  remainingCap: "105.00"
  deficitSurplus: "91.67"
  averageUsed: "10.17"

suffix = moment().format("YYYYMMDDhhmmss")
options =

  template: "./template.docx"

  output: "./output-#{suffix}.docx"
  data: data

inject.docx options 
