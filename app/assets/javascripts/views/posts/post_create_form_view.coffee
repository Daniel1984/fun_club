define [
  'backbone'
  'views/helpers/error_handler_view'
  'text!templates/posts/post_create_form.html'
  'text!templates/posts/search.html'
  'backbone_datalink'
], (Backbone, ErrorHandler, template, CitySelectPartial) ->
  class ProtocolCreateFormView extends Backbone.View
    tagName: 'form'
    className: 'form-horizontal post-create'
    events:
      'change .file-upload': 'handleFileUpload'

    initialize: (options) ->
      @model.on('error', @handleError)
      @maxImageDimention = 300
      @template = _.template(template)
      if window.FileReader
        @fileReader = new FileReader()
        @fileReader.onload = @manageLoadedImage
      else
        @$('.file-upload-container').hide()

    render: =>
      @$el.html(@template(@model.toJSON()))
      @addCitySeletPartial()
      @$el.backboneLink(@model)
      @canvas = @$el.find('.img-canvas')[0]
      @ctx = @canvas.getContext('2d')
      @

    addCitySeletPartial: =>
      @$el.find('.city-select-container').html(CitySelectPartial)
      @$el.find('.city-select').addClass('span3')
    
    handleError: (model, error) =>
      new ErrorHandler(error: error, el: @el)

    handleFileUpload: (e) =>
      if e.currentTarget.files.length == 0 then return
      file = e.currentTarget.files[0]
      if !file.type.match('image') then return
      @fileReader.readAsDataURL(file)

    manageLoadedImage: (e) =>
      @$el.find('.img-holder').attr(src: e.target.result)
      @imgData = new Image()
      @imgData.src = e.target.result
      @imgData.onload = @passImgToCanvas

    passImgToCanvas: =>
      @setCanvasDimentions()
      @ctx.drawImage(@imgData, 0, 0, @canvas.width, @canvas.height)
      @model.set(post_image: @canvas.toDataURL('image/jpeg'))

    setCanvasDimentions: =>
      if @imgData.width > @imgData.height
        @setupLanscapeCanvas()
      else
        @setupPortraitCanvas()

    setupPortraitCanvas: =>
      delta = 100 - (-(@maxImageDimention - @imgData.height)*100/@imgData.height)
      width = (@imgData.width * delta)/100
      @setupCanvasSize(width, @maxImageDimention)

    setupLanscapeCanvas: =>
      delta = 100 - (-(@maxImageDimention - @imgData.width)*100/@imgData.width)
      height = (@imgData.height * delta)/100
      @setupCanvasSize(@maxImageDimention, height)

    setupCanvasSize: (width, height) =>
      @canvas.width = width
      @canvas.height = height
