define [
  'backbone'
  'text!templates/post_comments/form.html'
], (Backbone, template) ->
  class NewComment extends Backbone.View
    tagName: 'form'
    className: 'form-horizontal'
    events:
      'click .save-comment-btn': 'saveComment'

    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$el.backboneLink(@model)
      @

    saveComment: (e) =>
      e.preventDefault()
      @model.save()
