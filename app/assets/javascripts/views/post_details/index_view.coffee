define [
  'backbone'
  'views/post_comments/index_view'
  'text!templates/post_details/index.html'
  'xdate'
  'modal'
  'modalmanager'
], (Backbone, PostCommentsIndexView, template) ->
  class PostDetails extends Backbone.View
    className: 'modal hide fade post_details'
    attributes:
      'data-width': '1024'

    initialize: (options) ->
      @template = _.template(template)
      @render()

    render: =>
      @$el.html(@template(@model.toJSON()))
      @renderComments()
      @$el.modal('show')
      @

    renderComments: =>
      @postComments = new PostCommentsIndexView(postId: @model.get('_id'))
      @$el.find('.comment-container').append(@postComments.render().el)
