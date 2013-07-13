define [
  'backbone'
], (Backbone) ->

  class Post extends Backbone.Model
    urlRoot: 'posts'
    idAttribute: '_id'

    defaults:
      post_image: undefined
      body: undefined
