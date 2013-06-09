define [
  'backbone'
  'models/post_comment'
  'text!templates/post_comments/form.html'
], (Backbone, PostComment, template) ->
  class NewComment extends Backbone.View
    tagName: 'form'
    className: 'form-horizontal'

    initialize: (options) ->
      @template = _.template(template)
      @model = new PostComment()

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$el.backboneLink(@model)
      @
