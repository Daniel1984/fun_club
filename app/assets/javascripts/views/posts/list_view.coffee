define [
  'backbone'
  'views/posts/item_view'
  'collections/posts'
], (Backbone, PostItemView, Posts) ->
  class ListView extends Backbone.View
    tagName: 'ul'
    className: 'unstyled'

    initialize: (options) ->
      @posts = new Posts()
      @posts.on('reset', @renderPosts)
      @posts.fetch(data: {}, reset: true)

    render: =>
      @$el.html()
      @

    renderPosts: =>
      @posts.each(@addPost)

    addPost: (model) =>
      @postItemView = new PostItemView(model: model)
      @$el.append(@postItemView.render().el)
