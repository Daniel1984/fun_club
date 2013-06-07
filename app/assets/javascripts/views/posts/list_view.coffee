define [
  'backbone'
  'views/posts/item_view' 
  'modules/tile_manager'
  'blocksit'
], (Backbone, PostItemView, TileManager) ->
  class ListView extends Backbone.View
    id: 'container'

    render: =>
      @$el.html()
      @renderPosts()
      $(window).resize () => TileManager.recalibrate(@$el)
      @

    renderPosts: =>
      @collection.each(@addPost)

    addPost: (model) =>
      @postItemView = new PostItemView(model: model)
      @$el.append(@postItemView.render().el)

    manageTiles: =>
      TileManager.recalibrate(@$el)
