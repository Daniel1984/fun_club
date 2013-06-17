define [
  'backbone'
  'views/posts/post_create_form_view' 
  'text!templates/posts/post_create_modal.html'
], (Backbone, PostFormView, template) ->

  class PostCreateModalView extends Backbone.View
    className: 'modal hide fade'
    events:
      'click .save-post-btn': 'savePost'
      'hidden': 'clearView'

    initialize: (options) ->
      @template = _.template(template)
      @postForm = new PostFormView(model: @model)
      @model.on('sync', @handleSync)
      @render()

    render: =>
      @$el.html(@template)
      @$el.find('.modal-body').html(@postForm.render().el)
      @$el.modal('show')
      @

    savePost: (e) =>
      e.preventDefault()
      @model.save(wait: true)

    handleSync: =>
      @model.trigger('fetch')
      @$el.modal('hide')
      @model.off('sync', @handleSync)

    clearView: =>
      @postForm.remove()
      @model.off('error')
