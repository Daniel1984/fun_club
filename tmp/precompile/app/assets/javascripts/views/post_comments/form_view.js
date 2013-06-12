var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'models/post_comment', 'text!templates/post_comments/form.html'], function(Backbone, PostComment, template) {
  var NewComment, _ref;
  return NewComment = (function(_super) {
    __extends(NewComment, _super);

    function NewComment() {
      this.render = __bind(this.render, this);
      _ref = NewComment.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    NewComment.prototype.tagName = 'form';

    NewComment.prototype.className = 'form-horizontal';

    NewComment.prototype.initialize = function(options) {
      this.template = _.template(template);
      return this.model = new PostComment();
    };

    NewComment.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$el.backboneLink(this.model);
      return this;
    };

    return NewComment;

  })(Backbone.View);
});
