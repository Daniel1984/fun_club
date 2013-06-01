define [
  'backbone'
  'views/post_details/index_view'
  'text!templates/posts/item.html'
  'shorten'
], (Backbone, PostDetailsView, template) ->
  class ItemView extends Backbone.View
    className: 'well grid post-item'
    attributes:
      data: 'oooo'
    events:
      'click .details-btn': 'showPostDetails'

    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$el.find('.title').shorten
        tail: "&hellip;"
        tooltip: true
      @

    showPostDetails: (e) =>
      console.log @model.toJSON()
      new PostDetailsView(model: @model) 
