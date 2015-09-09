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
    jaded:
      jade:
        pretty: false
    sass:
      options:
        includePaths: ['bower_components/']
