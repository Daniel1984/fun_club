var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/posts/post_create_form_view', 'text!templates/posts/post_create_modal.html'], function(Backbone, PostFormView, template) {
  var PostCreateModalView, _ref;
  return PostCreateModalView = (function(_super) {
    __extends(PostCreateModalView, _super);

    function PostCreateModalView() {
      this.clearView = __bind(this.clearView, this);
      this.handleSync = __bind(this.handleSync, this);
      this.savePost = __bind(this.savePost, this);
      this.render = __bind(this.render, this);
      _ref = PostCreateModalView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostCreateModalView.prototype.className = 'modal hide fade';

    PostCreateModalView.prototype.events = {
      'click .save-post-btn': 'savePost',
      'hidden': 'clearView'
    };

    PostCreateModalView.prototype.initialize = function(options) {
      this.template = _.template(template);
      this.postForm = new PostFormView({
        model: this.model
      });
      this.model.on('sync', this.handleSync);
      return this.render();
    };

    PostCreateModalView.prototype.render = function() {
      this.$el.html(this.template);
      this.$el.find('.modal-body').html(this.postForm.render().el);
      this.$el.modal('show');
      return this;
    };

    PostCreateModalView.prototype.savePost = function(e) {
      e.preventDefault();
      return this.model.save({
        wait: true
      });
    };

    PostCreateModalView.prototype.handleSync = function() {
      this.model.trigger('fetch');
      this.$el.modal('hide');
      return this.model.off('sync', this.handleSync);
    };

    PostCreateModalView.prototype.clearView = function() {
      this.postForm.remove();
      return this.model.off('error');
    };

    return PostCreateModalView;

  })(Backbone.View);
});
