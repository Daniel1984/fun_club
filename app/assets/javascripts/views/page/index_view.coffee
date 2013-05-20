define [
  'backbone'
  'views/posts/index_view'
  'text!templates/page/index.html'
], (Backbone, PostsView, template) ->
  class PageIndexView extends Backbone.View
    className: 'row-fluid'
    
    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template())
      @renderPosts()
      @

    renderPosts: =>
      @postsView = new PostsView()
      @$el.find('.container').append(@postsView.render().el)
