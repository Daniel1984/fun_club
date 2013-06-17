define [
  'backbone'
  'text!templates/post_comments/item_view.html'
  'xdate'
], (Backbone, template) ->
  class ItemView extends Backbone.View
    className: 'comment-item'
    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @
