var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'text!templates/post_comments/form.html'], function(Backbone, template) {
  var NewComment, _ref;
  return NewComment = (function(_super) {
    __extends(NewComment, _super);

    function NewComment() {
      this.saveComment = __bind(this.saveComment, this);
      this.render = __bind(this.render, this);
      _ref = NewComment.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    NewComment.prototype.tagName = 'form';

    NewComment.prototype.className = 'form-horizontal';

    NewComment.prototype.events = {
      'click .save-comment-btn': 'saveComment'
    };

    NewComment.prototype.initialize = function(options) {
      return this.template = _.template(template);
    };

    NewComment.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$el.backboneLink(this.model);
      return this;
    };

    NewComment.prototype.saveComment = function(e) {
      e.preventDefault();
      return this.model.save();
    };

    return NewComment;

  })(Backbone.View);
});
