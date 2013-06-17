define [
  'backbone'
  'views/posts/post_create_modal_view'
], (Backbone, PostCreateModalView) ->

  class CreatePostInputManager extends Backbone.View
    tagName: 'button'
    className: 'btn btn-large btn-success post-btn'
    events:
      'click': 'createNewPost'

    render: =>
      @$el.text('skelbtis')
      @

    createNewPost: =>
      new PostCreateModalView(model: @model)
