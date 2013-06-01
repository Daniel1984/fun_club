define [
  'backbone'
  'text!templates/post_details/index.html'
  'modalmanager'
], (Backbone, template) ->
  class PostDetails extends Backbone.View
    className: 'modal hide fade'

    initialize: (options) ->
      @template = _.template(template)
      @render()

    render: =>
      @$el.html(@template(@model.toJSON()))
      @$el.modal('show')
      @
