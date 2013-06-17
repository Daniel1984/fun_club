define [
  'backbone'
  'models/post_join'
  'text!templates/join_event/index.html'
], (Backbone, PostJoin, template) ->
  class IndexView extends Backbone.View
    className: 'modal hide fade'
    events:
      'click .join-event-btn': 'onJoinEventClick'

    initialize: (options) ->
      @template = _.template(template)
      @post = options.post
      @model = new PostJoin()
      @model.set(post_id: @post.get('_id'))
      @render()

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$('form').backboneLink(@model)
      @$el.modal('show')
      @

    onJoinEventClick: (e) =>
      e.preventDefault()
      @model.save()
