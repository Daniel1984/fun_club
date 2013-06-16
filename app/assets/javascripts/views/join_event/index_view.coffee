define [
  'backbone'
  'text!templates/join_event/index.html'
], (Backbone, template) ->
  class IndexView extends Backbone.View
    className: 'modal hide fade'

    initialize: (options) ->
      @template = _.template(template)
      @render()

    render: =>
      @$el.html(@template)
      @$el.modal('show')
      @
