require.config
  paths:
    jquery: 'lib/jquery'
    underscore: 'lib/underscore'
    backbone: 'lib/backbone'
    'backbone_datalink': 'lib/backbone_datalink'
    text: 'lib/requirejs/text'
    domready: 'lib/requirejs/domready'
    bootstrap: 'lib/bootstrap'
    select2: 'lib/select2'
    backstretch: 'lib/backstretch'
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery', 'backbone_datalink']
      exports: 'Backbone'
    select2:
      deps: ['jquery']
      exports: 'jQuery.fn.select2'
    backstretch:
      deps: ['jquery']
      exports: 'jQuery.fn.backstretch'


require ['domready', 'app'], (domReady, app) ->
  domReady ->
    app.init()
