gulp = require('gulp')
jade = require('gulp-jade')
stylus = require('gulp-stylus')
clean = require('gulp-clean')
coffee = require('gulp-coffee')

gulp.task 'templates', ->
  gulp.src('src/*.jade')
      .pipe(jade({pretty:true}))
      .pipe gulp.dest('.')
  gulp.src('src/*.styl')
      .pipe(stylus())
      .pipe gulp.dest('.')
  gulp.src('./*.coffee')
      .pipe(coffee({pretty:true}))
      .pipe gulp.dest('.')


gulp.task 'clean', ->
  gulp.src('./*.html')
      .pipe(clean())
  gulp.src('./*.css')
      .pipe(clean())
  gulp.src('./*.js')
      .pipe(clean())


gulp.task 'default', ['templates']
