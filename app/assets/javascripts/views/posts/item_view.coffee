define [
  'backbone'
  'views/post_details/index_view'
  'views/contact_poster/index_view'
  'text!templates/posts/item.html'
], (Backbone, PostDetailsView, JoinEventModal, template) ->
  class ItemView extends Backbone.View
    className: 'well grid post-item'

    events:
      'click .details-btn': 'showPostDetails'
      'click .join-event-btn': 'joinEvent'

    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @

    showPostDetails: =>
      new PostDetailsView(model: @model)

    joinEvent: =>
      new JoinEventModal(post: @model)
