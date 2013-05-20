define [
  'backbone'
  'views/posts/post_create_modal_view'
  'views/posts/post_create_form_view'
  'models/post'
], (Backbone, PostCreateModalView, PostCreateFormView, Post) ->

  class CreatePostInputManager extends Backbone.View
    tagName: 'button'
    className: 'btn btn-large btn-success post-btn'
    events:
      'click': 'createNewPost'

    initialize: (options) ->
      @post = new Post()
      @post.on('sync', @onPostSync)

    render: =>
      @$el.text('skelbtis')
      @

    onPostSync: (model, response) =>
      console.log 'model', model
      console.log 'response', response

    createNewPost: =>
      @postFormView = new PostCreateFormView(model: @post)
      new PostCreateModalView(view: @postFormView)



