require.config
  baseUrl: './'
  paths:
    text: 'lib/requirejs/text'
    domready: 'lib/requirejs/domready'
    jquery: 'lib/jquery'
    underscore: 'lib/underscore'
    backbone: 'lib/backbone'
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'

require ['domready', 'app'], (domReady, app) ->
  domReady ->
    app.init()


