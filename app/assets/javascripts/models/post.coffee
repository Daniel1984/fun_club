define [
  'backbone'
], (Backbone) ->

  class Post extends Backbone.Model
    urlRoot: 'posts'
    idAttribute: 'id'
