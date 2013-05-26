define [
  'jquery'
  'backbone'
  'views/page/index_view'
  'backstretch'
], ($, Backbone, PageIndexView) ->
  init: ->
    $('body').backstretch('http://turnlol.com/images/2012/10/light-bokeh-macro-depth-of-field-blurred-1920x1080-hd-wallpaper.jpg')
    $('body').append(new PageIndexView().render().el)
