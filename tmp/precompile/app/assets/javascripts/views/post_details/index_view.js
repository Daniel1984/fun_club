var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/post_comments/index_view', 'text!templates/post_details/index.html', 'xdate', 'modal', 'modalmanager'], function(Backbone, PostCommentsIndexView, template) {
  var PostDetails, _ref;
  return PostDetails = (function(_super) {
    __extends(PostDetails, _super);

    function PostDetails() {
      this.renderComments = __bind(this.renderComments, this);
      this.render = __bind(this.render, this);
      _ref = PostDetails.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostDetails.prototype.className = 'modal hide fade post_details';

    PostDetails.prototype.attributes = {
      'data-width': '1024'
    };

    PostDetails.prototype.initialize = function(options) {
      this.template = _.template(template);
      return this.render();
    };

    PostDetails.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.renderComments();
      this.$el.modal('show');
      return this;
    };

    PostDetails.prototype.renderComments = function() {
      this.postComments = new PostCommentsIndexView({
        postId: this.model.get('_id')
      });
      return this.$el.find('.comment-container').append(this.postComments.render().el);
    };

    return PostDetails;

  })(Backbone.View);
});
