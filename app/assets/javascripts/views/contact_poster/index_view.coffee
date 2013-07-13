define [
  'backbone'
  'models/post_join'
  'views/helpers/error_handler_view'
  'text!templates/contact_poster/index.html'
  'spin'
], (Backbone, PostJoin, ErrorHandler, template, Spinner) ->
  class IndexView extends Backbone.View
    className: 'modal hide fade contact-poster'
    events:
      'click .join-event-btn': 'onJoinEventClick'

    initialize: (options) ->
      @template = _.template(template)
      @post = options.post
      @model = new PostJoin()
      @model.set(post_id: @post.get('_id'))
      @model.on('sync', @handleSync)
      @spinner = new Spinner(color: '#fff', lines: 10, length: 4, width: 2, radius: 3, tail: 35)
      @render()

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$('form').backboneLink(@model)
      @$el.modal('show')
      @

    onJoinEventClick: (e) =>
      e.preventDefault()
      currentTarget = $(e.currentTarget)
      currentTarget.attr(disabled: true)
      currentTarget.append(@spinner.spin().el)
      @model.save(wait: true)

    handleSync: =>
      @$('.join-event-btn').hide()
      @$('.modal-body').slideUp(@displayNotification)

    displayNotification: =>
      @$('.alert-success').slideDown()
