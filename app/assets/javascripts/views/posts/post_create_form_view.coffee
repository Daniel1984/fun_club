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
      @maxImageDimention = 200
      @template = _.template(template)
      if window.FileReader
        @fileReader = new FileReader()
        @fileReader.onload = @manageLoadedImage

    render: =>
      @$el.html(@template())
      @addCitySeletPartial()
      @$el.backboneLink(@model)
      @canvas = @$el.find('.img-canvas')[0]
      @ctx = @canvas.getContext('2d')
      @

    addCitySeletPartial: =>
      @$el.find('.city-select-container').html(CitySelectPartial)
      @$el.find('.city-select').addClass('span3')

    handleFileUpload: (e) =>
      if e.currentTarget.files.length == 0 then return
      file = e.currentTarget.files[0]
      if !file.type.match('image') then return
      @fileReader.readAsDataURL(file)

    manageLoadedImage: (e) =>
      @$el.find('.img-holder').attr(src: e.target.result)
      @imgData = new Image()
      @imgData.onload = @passImgToCanvas
      @imgData.src = e.target.result

    passImgToCanvas: =>
      @setCanvasDimentions()
      @ctx.drawImage(@imgData, 0, 0, @canvas.width, @canvas.height)
      @model.set(post_image: @canvas.toDataURL('image/webp'))

    setCanvasDimentions: =>
      if @imgData.width > @imgData.height
        @setupLanscapeCanvas()
      else
        @setupPortraitCanvas()

    setupPortraitCanvas: =>
      delta = 100 - (-(@maxImageDimention - @imgData.height)*100/@imgData.height)
      width = (@imgData.width * delta)/100
      @setupCanvasSize(width, 200)

    setupLanscapeCanvas: =>
      delta = 100 - (-(@maxImageDimention - @imgData.width)*100/@imgData.width)
      height = (@imgData.height * delta)/100
      @setupCanvasSize(200, height)

    setupCanvasSize: (width, height) =>
      @canvas.width = width
      @canvas.height = height
