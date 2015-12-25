gulp = require("gulp")
$ = require("gulp-load-plugins")()
browserSync = require("browser-sync")
beep = require("beepbeep")
reload = browserSync.reload
path = global.path
browser_support = global.browser_support

onError = (err) ->
    beep(2, 700)

    console.log err.toString()
    this.emit('end')


gulp.task "sass", ->
    gulp.src path.scss + "*.scss"
    .pipe $.plumber({errorHandler: onError})
    .pipe $.sass()
    .pipe $.autoprefixer(browsers: browser_support)
    .pipe gulp.dest(path.css)
    .pipe $.size()
    .pipe reload({stream: true})