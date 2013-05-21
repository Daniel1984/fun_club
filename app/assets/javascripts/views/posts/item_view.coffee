define [
  'backbone'
  'text!templates/posts/item.html'
], (Backbone, template) ->

  class ItemView extends Backbone.View
    tagName: 'li'
    className: 'span3 well'

    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @
