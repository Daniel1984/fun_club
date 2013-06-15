define [
  'backbone'
  'views/post_details/index_view'
  'text!templates/posts/item.html'
], (Backbone, PostDetailsView, template) ->
  class ItemView extends Backbone.View
    className: 'well grid post-item'

    events:
      'click .details-btn': 'showPostDetails'

    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @

    showPostDetails: (e) =>
      new PostDetailsView(model: @model)
