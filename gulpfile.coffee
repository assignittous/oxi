'use strict'


taskMasterOptions = 
  dirname: 'src/gulp' 
  pattern: '*.coffee' 
  cwd: process.cwd() 
  watchExt: '.watch'  

gulp = require('gulp-task-master')(taskMasterOptions)

compileAll = ['compile-lib','compile-bin', 'compile-main']
watchAll = ['compile-lib.watch','compile-bin.watch', 'compile-main.watch']

gulp.task "watch",  watchAll
gulp.task "bot", watchAll

gulp.task "default", compileAll
