exports.config =
  files:
    javascripts:
      joinTo: 'app.js'
    stylesheets:
      joinTo: 'app.css'
    templates:
      joinTo:
        'js/templates.js': /.+\.jade$/
  plugins:
    static_jade:
      path: [/app/]
    sass:
      options:
        includePaths: ['bower_components/bootstrap/scss']
