define [
  'backbone'
  'models/post'
], (Backbone, Post) ->

  class Posts extends Backbone.Collection
    url: '/posts'
    model: Post
