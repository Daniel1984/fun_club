define [
  'backbone'
  'views/posts/item_view'
  'collections/posts'
  'modules/tile_manager'
  'spin'
  'blocksit'
], (Backbone, PostItemView, Posts, TileManager, Spin) ->
  class ListView extends Backbone.View
    id: 'container'

    initialize: (options) ->
      @spin = new Spin(color: '#FFF')
      @posts = new Posts()
      @posts.on('reset', @renderPosts)
      @posts.fetch(data: {}, reset: true)
  
    render: =>
      @$el.html()
      @$el.append(@spin.spin().el)
      $(window).resize () => TileManager.recalibrate(@$el)
      @

    renderPosts: =>
      @spin.spin(false)
      @posts.each(@addPost)
      TileManager.recalibrate(@$el)

    addPost: (model) =>
      @postItemView = new PostItemView(model: model)
      @$el.append(@postItemView.render().el)
      
