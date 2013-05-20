define [
  'jquery'
  'backbone'
  'views/page/index_view'
  'backstretch'
], ($, Backbone, PageIndexView) ->
  init: ->
    $('body').backstretch('http://www.photosof.org/walls/grass_against_blurry_landscape-wide.jpg')
    $('body').append(new PageIndexView().render().el)
