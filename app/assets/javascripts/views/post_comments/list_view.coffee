define [
  'backbone'
], (Backbone) ->
  class ListView extends Backbone.View

    initialize: (options) ->
      console.log @collection

    render: =>
      @$el.html()
      @
