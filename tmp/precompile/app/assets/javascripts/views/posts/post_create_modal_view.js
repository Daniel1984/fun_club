var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'text!templates/posts/post_create_modal.html'], function(Backbone, template) {
  var PostCreateModalView, _ref;
  return PostCreateModalView = (function(_super) {
    __extends(PostCreateModalView, _super);

    function PostCreateModalView() {
      this.savePost = __bind(this.savePost, this);
      this.render = __bind(this.render, this);
      _ref = PostCreateModalView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostCreateModalView.prototype.className = 'modal hide fade';

    PostCreateModalView.prototype.events = {
      'click .save-post-btn': 'savePost'
    };

    PostCreateModalView.prototype.initialize = function(options) {
      this.template = _.template(template);
      this.view = options.view;
      this.model = this.view.model;
      return this.render();
    };

    PostCreateModalView.prototype.render = function() {
      this.$el.html(this.template());
      this.$el.find('.modal-body').html(this.view.render().el);
      this.$el.modal('show');
      return this;
    };

    PostCreateModalView.prototype.savePost = function(e) {
      e.preventDefault();
      this.model.unset('post_img_clear');
      return this.model.save();
    };

    return PostCreateModalView;

  })(Backbone.View);
});
