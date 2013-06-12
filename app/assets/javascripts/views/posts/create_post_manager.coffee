define [
  'backbone'
  'views/posts/post_create_modal_view'
  'views/posts/post_create_form_view' 
], (Backbone, PostCreateModalView, PostCreateFormView) ->

  class CreatePostInputManager extends Backbone.View
    tagName: 'button'
    className: 'btn btn-large btn-success post-btn'
    events:
      'click': 'createNewPost'

    initialize: (options) ->
      @post = options.post

    render: =>
      @$el.text('skelbtis')
      @

    createNewPost: =>
      @postFormView = new PostCreateFormView(model: @post)
      new PostCreateModalView(view: @postFormView)



