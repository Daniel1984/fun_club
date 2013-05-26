define [
  'backbone'
  'text!templates/posts/item.html'
  'shorten'
], (Backbone, template) ->

  class ItemView extends Backbone.View
    className: 'well grid post-item'

    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$el.find('.title').shorten(
        tail: "&hellip;"
        tooltip: true
      )
      @$el.find('.body').shorten()
      @
