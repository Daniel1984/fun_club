define [
  'backbone'
  'text!templates/posts/post_create_form.html'
  'text!templates/posts/search.html'
  'backbone_datalink'
], (Backbone, template, CitySelectPartial) ->

  class ProtocolCreateFormView extends Backbone.View
    tagName: 'form'
    className: 'form-horizontal post-create'
    events:
      'change .file-upload': 'handleFileUpload'

    initialize: (options) ->
      @template = _.template(template)
      @fileReader = new FileReader()
      @fileReader.onload = @handleLoadedFile

    render: =>
      @$el.html(@template())
      @addCitySeletPartial()
      @$el.backboneLink(@model)
      @canvasContainer = @$el.find('.img-canvas')[0]
      @ctx = @canvasContainer.getContext('2d')
      @

    addCitySeletPartial: =>
      @$el.find('.city-select-container').html(CitySelectPartial)
      @$el.find('.city-select').addClass('span3')

    handleFileUpload: (e) =>
      if e.currentTarget.files.length == 0 then return
      file = e.currentTarget.files[0]
      if !file.type.match('image') then return
      @fileReader.readAsDataURL(file)

    handleLoadedFile: (e) =>
      @$el.find('.img-holder').attr(src: e.target.result)
      img = new Image()
      img.src = e.target.result
      @ctx.drawImage(img, 0, 0, @canvasContainer.width, @canvasContainer.height)
      @model.set(post_image: @canvasContainer.toDataURL('image/webp'))
