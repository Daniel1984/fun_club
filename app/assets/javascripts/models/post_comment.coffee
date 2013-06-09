define [
  'backbone'
], (Backbone) ->

  class PostComment extends Backbone.Model
    urlRoot: 'post_comments'
    idAttribute: 'id'
