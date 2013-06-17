define [
  'backbone'
], (Backbone) ->
  class PostJoin extends Backbone.Model
    idAttribute: '_id'
    urlRoot: 'post_join'
