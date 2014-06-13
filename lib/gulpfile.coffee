gulp   = require 'gulp'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
stylus = require 'gulp-stylus'
ngmin  = require 'gulp-ngmin'
jade   = require 'gulp-jade'

paths =
  dest:    './build/'
  scripts: './assets/js/**/*.coffee'
  sheets:  './assets/css/*.styl'
  pages:   './assets/views/**/*.jade'

gulp.task 'js', ->
  gulp
    .src  paths.scripts
    .pipe coffee() #.on('error',gutil.log)
    .pipe concat 'all.min.js'
    .pipe ngmin()
    .pipe uglify()
    .pipe gulp.dest paths.dest

gulp.task 'css', ->
  gulp
    .src  paths.sheets
    .pipe stylus set: ['compress'], use: ['nib']
    .pipe gulp.dest paths.dest

gulp.task 'pages', ->
  gulp
    .src  paths.pages
    .pipe jade()
    .pipe gulp.dest paths.dest

gulp.task 'watch', ->
  gulp.watch paths.scripts, ['js']
  gulp.watch paths.sheets, ['css']
  gulp.watch paths.pages, ['pages']

gulp.task 'start', ['default','watch']

gulp.task 'default', ['js','css','pages']
