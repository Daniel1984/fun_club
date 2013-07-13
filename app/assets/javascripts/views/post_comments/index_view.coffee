define [
  'backbone'
  'views/post_comments/list_view'
  'views/post_comments/form_view'
  'collections/post_comments'
  'models/post_comment'
  'text!templates/post_comments/alert_msg.html'
  'text!templates/post_comments/index.html'
  'spin'
], (Backbone, ListView, FormView, Comments, Comment, NoCommentsMsg, template, Spinner) ->
  class IndexView extends Backbone.View
    className: 'post-comments'

    initialize: (options) ->
      @template = _.template(template)
      @noCommentsMsg = _.template(NoCommentsMsg)
      @postId = options.postId
      @spinner = new Spinner(color: '#000', width: 4, length: 6, lines: 11, radius: 8) 
      @comment = new Comment(post_id: @postId)
      @comment.on('sync', @handleSync)
      @comments = new Comments()
      @comments.on('reset', @renderList)
      @fetch(post_id: @postId)

    render: =>
      @$el.html(@template)
      @renderSpinner()
      @renderForm()
      @

    renderSpinner: =>
      @$('.spinner-container').append(@spinner.spin().el)

    fetch: (data = {}) =>
      @comments.fetch(data: data, reset: true)

    renderList: => 
      @spinner.stop()
      @$('.comments-container').empty()
      if @comments.length == 0
        @$el.find('.comments-container').append(@noCommentsMsg)
      else
        @listView = new ListView(collection: @comments)
        @$el.find('.comments-container').append(@listView.render().el)

    renderForm: =>
      @formView = new FormView(model: @comment)
      @$el.find('.form-container').append(@formView.render().el)

    handleSync: =>
      @listView?.remove()
      @renderSpinner()
      @fetch(post_id: @postId)
