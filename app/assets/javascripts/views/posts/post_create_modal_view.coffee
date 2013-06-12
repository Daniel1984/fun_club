define [
  'backbone'
  'text!templates/posts/post_create_modal.html'
], (Backbone, template) ->

  class PostCreateModalView extends Backbone.View
    className: 'modal hide fade'
    events:
      'click .save-post-btn': 'savePost'

    initialize: (options) ->
      @template = _.template(template)
      @view = options.view
      @model = @view.model
      @model.on('sync', @onSync)
      @render()

    render: =>
      @$el.html(@template())
      @$el.find('.modal-body').html(@view.render().el)
      @$el.modal('show')
      @

    savePost: (e) =>
      e.preventDefault()
      @model.unset('post_img_clear')
      @model.save(wait: true)

    onSync: =>
      @$el.modal('hide')
      @model.trigger('fetch')
