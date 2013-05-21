define [
  'backbone'
  'views/posts/search_post_manager'
  'views/posts/create_post_manager'
  'views/posts/list_view'
], (Backbone, SearchPostManager, CreatePostManager, ListView) ->
  class PostsIndexView extends Backbone.View
    className: 'posts-conainer'

    initialize: (options) ->

    render: =>
      @$el.html()
      @enableSearch()
      @enableCreate()
      @renderList()
      @

    enableSearch: =>
      @searchView = new SearchPostManager(posts: @posts)
      @$el.append(@searchView.render().el)

    enableCreate: =>
      @createInput = new CreatePostManager()
      @$el.append(@createInput.render().el)

    renderList: =>
      @listView = new ListView()
      @$el.append(@listView.render().el)
