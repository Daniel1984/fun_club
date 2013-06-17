var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/posts/post_create_modal_view'], function(Backbone, PostCreateModalView) {
  var CreatePostInputManager, _ref;
  return CreatePostInputManager = (function(_super) {
    __extends(CreatePostInputManager, _super);

    function CreatePostInputManager() {
      this.createNewPost = __bind(this.createNewPost, this);
      this.render = __bind(this.render, this);
      _ref = CreatePostInputManager.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    CreatePostInputManager.prototype.tagName = 'button';

    CreatePostInputManager.prototype.className = 'btn btn-large btn-success post-btn';

    CreatePostInputManager.prototype.events = {
      'click': 'createNewPost'
    };

    CreatePostInputManager.prototype.render = function() {
      this.$el.text('skelbtis');
      return this;
    };

    CreatePostInputManager.prototype.createNewPost = function() {
      return new PostCreateModalView({
        model: this.model
      });
    };

    return CreatePostInputManager;

  })(Backbone.View);
});
