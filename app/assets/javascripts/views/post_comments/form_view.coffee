define [
  'backbone'
  'views/helpers/error_handler_view'
  'text!templates/post_comments/form.html'
  'spin'
], (Backbone, ErrorHandlerView, template, Spinner) ->
  class NewComment extends Backbone.View
    tagName: 'form'
    className: 'form-horizontal'
    events:
      'click .save-comment-btn': 'saveComment'

    initialize: (options) ->
      @template = _.template(template)
      @spinner = new Spinner(color: '#fff', lines: 10, length: 4, width: 2, radius: 3, tail: 35)
      @model.on('sync', @handleSync)
      @model.on('error', @handleError)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$el.backboneLink(@model)
      @

    saveComment: (e) =>
      e.preventDefault()
      @$('.save-comment-btn').attr('disabled', true)
      @$('.save-comment-btn').append(@spinner.spin().el)
      @model.save(wait: true)

    handleSync: (model, response) =>
      postId = model.get('post_id')
      model.clear()
      model.set(post_id: postId)
      @$('.save-comment-btn').attr('disabled', false)
      @spinner.stop()

    handleError: (model, err) =>
      new ErrorHandlerView(error: err, el: @el)

