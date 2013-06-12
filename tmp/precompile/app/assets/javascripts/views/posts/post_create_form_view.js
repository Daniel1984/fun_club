var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'text!templates/posts/post_create_form.html', 'text!templates/posts/search.html', 'backbone_datalink'], function(Backbone, template, CitySelectPartial) {
  var ProtocolCreateFormView, _ref;
  return ProtocolCreateFormView = (function(_super) {
    __extends(ProtocolCreateFormView, _super);

    function ProtocolCreateFormView() {
      this.setupCanvasSize = __bind(this.setupCanvasSize, this);
      this.setupLanscapeCanvas = __bind(this.setupLanscapeCanvas, this);
      this.setupPortraitCanvas = __bind(this.setupPortraitCanvas, this);
      this.setCanvasDimentions = __bind(this.setCanvasDimentions, this);
      this.passImgToCanvas = __bind(this.passImgToCanvas, this);
      this.manageLoadedImage = __bind(this.manageLoadedImage, this);
      this.handleFileUpload = __bind(this.handleFileUpload, this);
      this.addCitySeletPartial = __bind(this.addCitySeletPartial, this);
      this.render = __bind(this.render, this);
      _ref = ProtocolCreateFormView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ProtocolCreateFormView.prototype.tagName = 'form';

    ProtocolCreateFormView.prototype.className = 'form-horizontal post-create';

    ProtocolCreateFormView.prototype.events = {
      'change .file-upload': 'handleFileUpload'
    };

    ProtocolCreateFormView.prototype.initialize = function(options) {
      this.maxImageDimention = 300;
      this.template = _.template(template);
      if (window.FileReader) {
        this.fileReader = new FileReader();
        return this.fileReader.onload = this.manageLoadedImage;
      }
    };

    ProtocolCreateFormView.prototype.render = function() {
      this.$el.html(this.template());
      this.addCitySeletPartial();
      this.$el.backboneLink(this.model);
      this.canvas = this.$el.find('.img-canvas')[0];
      this.ctx = this.canvas.getContext('2d');
      return this;
    };

    ProtocolCreateFormView.prototype.addCitySeletPartial = function() {
      this.$el.find('.city-select-container').html(CitySelectPartial);
      return this.$el.find('.city-select').addClass('span3');
    };

    ProtocolCreateFormView.prototype.handleFileUpload = function(e) {
      var file;
      if (e.currentTarget.files.length === 0) {
        return;
      }
      file = e.currentTarget.files[0];
      if (!file.type.match('image')) {
        return;
      }
      return this.fileReader.readAsDataURL(file);
    };

    ProtocolCreateFormView.prototype.manageLoadedImage = function(e) {
      this.$el.find('.img-holder').attr({
        src: e.target.result
      });
      this.imgData = new Image();
      this.imgData.src = e.target.result;
      return this.imgData.onload = this.passImgToCanvas;
    };

    ProtocolCreateFormView.prototype.passImgToCanvas = function() {
      this.setCanvasDimentions();
      this.ctx.drawImage(this.imgData, 0, 0, this.canvas.width, this.canvas.height);
      this.model.set({
        post_image: this.canvas.toDataURL('image/jpeg')
      });
      return console.log(this.model.get('post_image'));
    };

    ProtocolCreateFormView.prototype.setCanvasDimentions = function() {
      if (this.imgData.width > this.imgData.height) {
        return this.setupLanscapeCanvas();
      } else {
        return this.setupPortraitCanvas();
      }
    };

    ProtocolCreateFormView.prototype.setupPortraitCanvas = function() {
      var delta, width;
      delta = 100 - (-(this.maxImageDimention - this.imgData.height) * 100 / this.imgData.height);
      width = (this.imgData.width * delta) / 100;
      return this.setupCanvasSize(width, this.maxImageDimention);
    };

    ProtocolCreateFormView.prototype.setupLanscapeCanvas = function() {
      var delta, height;
      delta = 100 - (-(this.maxImageDimention - this.imgData.width) * 100 / this.imgData.width);
      height = (this.imgData.height * delta) / 100;
      return this.setupCanvasSize(this.maxImageDimention, height);
    };

    ProtocolCreateFormView.prototype.setupCanvasSize = function(width, height) {
      this.canvas.width = width;
      return this.canvas.height = height;
    };

    return ProtocolCreateFormView;

  })(Backbone.View);
});
