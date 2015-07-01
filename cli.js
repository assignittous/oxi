#!/usr/bin/env node
var logger, noOp, program, result;

program = require('commander');

logger = require('../lib/logger').Logger;

noOp = function() {
  return console.log("Nothing ran, couldn't understand your command");
};

program.version(pkg.version, '-v, --version');

result = program.parse(process.argv);
