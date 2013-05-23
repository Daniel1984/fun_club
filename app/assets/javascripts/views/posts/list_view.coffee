define [
  'backbone'
  'views/posts/item_view'
  'collections/posts'
  'blocksit'
], (Backbone, PostItemView, Posts) ->
  class ListView extends Backbone.View
    id: 'container'

    initialize: (options) ->
      @posts = new Posts()
      @posts.on('reset', @renderPosts)
      @posts.fetch(data: {}, reset: true)

    render: =>
      @$el.html()
      @

    enableLayout: =>
      @$el.BlocksIt(
        numOfCol: 3
        offsetX: 8
        offsetY: 8
        blockElement: '.grid'
      )

    renderPosts: =>
      @posts.each(@addPost)

    addPost: (model) =>
      @postItemView = new PostItemView(model: model)
      @$el.append(@postItemView.render().el)
      @enableLayout()
