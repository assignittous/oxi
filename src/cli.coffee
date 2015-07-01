


program = require('commander')
logger = require('../lib/logger').Logger

noOp = ()-> 
  console.log "Nothing ran, couldn't understand your command"


#console.log liquibase

# version
program
.version(pkg.version, '-v, --version')


result = program.parse(process.argv)

