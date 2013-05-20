define [
  'backbone'
  'views/posts/search_post_manager'
  'views/posts/create_post_manager'
  'views/posts/list_view'
  'collections/posts'
], (Backbone, SearchPostManager, CreatePostManager, ListView, Posts) ->
  class PostsIndexView extends Backbone.View
    className: 'posts-conainer'

    initialize: (options) ->
      @posts = new Posts()
      @posts.on('reset', @renderList)

    render: =>
      @$el.html()
      @enableSearch()
      @enableCreate()
      @

    enableSearch: =>
      @searchView = new SearchPostManager(posts: @posts)
      @$el.append(@searchView.render().el)

    enableCreate: =>
      @createInput = new CreatePostManager()
      @$el.append(@createInput.render().el)

    renderList: =>
      console.log 'got here'
