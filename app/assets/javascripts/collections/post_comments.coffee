define [
  'backbone'
  'models/post_comment'
], (Backbone, PostComment) ->

  class PostComments extends Backbone.Collection
    url: '/post_comments'
    model: PostComment
