###

# Utilities

Utility functions

###

require 'sugar'
fs = require('fs')
logger = require('./logger.coffee').Logger
exports.Utilities = 

  # Produce a date sid
  dateSid: ()->
    Date.create().format("{yyyy}{MM}{dd}{HH}{mm}{ss}{fff}")

  # Check if a path has extension, if not add it
  checkExtension: (path, ext)->
    if path.endsWith(ext)
      return path
    else
      return "#{path}#{ext}"

  getSubDirectories: (rootDir)->
    paths = fs.readdirSync rootDir
    dirs = []
    for path in paths
        if path[0] != '.'
            checkPath = "#{rootDir}/#{path}"
            stat = fs.statSync(checkPath)

            if stat.isDirectory()
                dirs.push(path)
    return dirs

  deleteFileIfExists: (path)->
    try
      fs.openSync path, 'r'
      fs.unlinkSync path
      logger.info "Deleted #{path}"
    catch e
      console.log "can't open"
    finally
      console.log "finally"