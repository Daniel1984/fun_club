define [
  'backbone'
  'views/post_comments/list_view'
  'views/post_comments/form_view'
  'collections/post_comments'
  'text!/templates/post_comments/no_comments_msg.html'
  'text!/templates/post_comments/index.html'
  'spin'
], (Backbone, ListView, FormView, PostComments, NoCommentsMsg, template, Spinner) ->
  class IndexView extends Backbone.View
    initialize: (options) ->
      @template = _.template(template)
      @postId = options.postId
      @spinner = new Spinner(color: '#000', width: 4, length: 6, lines: 11, radius: 8)
      @noCommentsMsg = _.template(NoCommentsMsg)
      @comments = new PostComments()
      @comments.on('reset', @renderList)
      @comments.fetch(data: {post_id: @postId}, reset: true)

    render: =>
      @$el.html(@template)
      @$el.find('.spinner-container').append(@spinner.spin().el)
      @renderForm()
      @

    renderList: =>
      @spinner.stop()
      if @comments.length == 0
        @$el.find('.comments-container').append(@noCommentsMsg)
      else
        @listView = new ListView(collection: @comments)
        @$el.find('.comments-container').append(@listView)

    renderForm: =>
      @formView = new FormView()
      @$el.find('.form-container').append(@formView.render().el)
