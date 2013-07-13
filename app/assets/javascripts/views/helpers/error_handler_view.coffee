define [
  'backbone'
], (Backbone) ->
  class ErrorView extends Backbone.View
    events:
      'keydown input': 'removeError'
      'keydown textarea': 'removeError'
      'change select': 'removeError'

    initialize: (options) ->
      @el = options.el
      @error = JSON.parse(options.error.responseText)
      @render()

    render: =>
      if @error.errors
        for key, val of @error.errors
          @renderError(key, val.type)
      else
        for key, val of @error
          @renderError(key, val)


    renderError: (field, msg) =>
      console.log "field -> #{field} / error -> #{msg}"
      @$(".base").html("<div class='alert alert-error'>#{msg}</div>")
      @$("[name=\"#{field}\"]").closest('div[class^="control-group"]').addClass('error')
      @$("[name=\"#{field}\"]").closest('div[class^="controls"]').find('.help-inline').remove()
      @$("[name=\"#{field}\"]").closest('div[class^="controls"]').append("<span class='help-inline'>#{msg}</span>")
      @$('.btn').addClass('disabled')

    removeError: (e) =>
      @$(e.currentTarget).closest('div[class^="control-group"]').removeClass('error')
      @$(e.currentTarget).closest('div[class^="controls"]').find('.help-inline').remove()
      @$('button').attr(disabled: false)
      @$('.disabled').removeClass('disabled')
      @$('.spinner').remove()
