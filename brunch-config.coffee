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
        pretty: true
    sass:
      options:
        includePaths: ['bower_components/']
    appcache:
      network: ['*']
      fallback: {}
    imageoptimizer:
        smushit: false
        path: 'images'
  conventions:
    assets: /(assets|font)/
