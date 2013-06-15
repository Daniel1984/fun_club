define [
  'backbone'
  'views/post_comments/item_view'
], (Backbone, ItemView) ->
  class ListView extends Backbone.View
    className: 'row-fluid'

    initialize: (options) ->
      console.log @collection

    render: =>
      @$el.html()
      @collection.each(@addItemView)
      @

    addItemView: (model) =>
      @itemView = new ItemView(model: model)
      @$el.append(@itemView.render().el)
