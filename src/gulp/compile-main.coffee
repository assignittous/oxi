###

# Compile bin folder

`gulp compile-bin`


---
###


gulp   = require "gulp"
coffee = require "gulp-coffee"
plumber = require "gulp-plumber"

# paths

mainPath = ["./src/*.coffee","!./src/cli.coffee"]

targetPath = "./"

module.exports = ()->

  gulp.src(mainPath).pipe(plumber()).pipe(coffee({bare:true})).pipe(gulp.dest(targetPath))

  return

module.exports.watch = mainPath