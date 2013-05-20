define [
  'backbone'
  'text!templates/posts/post_create_form.html'
], (Backbone, template) ->

  class ProtocolCreateFormView extends Backbone.View
    tagName: 'form'
    className: 'form-horizontal'

    initialize: (options) ->
      @template = _.template(template)

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$el.backboneLink(@model)
      @
