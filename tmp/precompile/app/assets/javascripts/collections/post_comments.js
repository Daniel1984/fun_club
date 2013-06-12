var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'models/post_comment'], function(Backbone, PostComment) {
  var PostComments, _ref;
  return PostComments = (function(_super) {
    __extends(PostComments, _super);

    function PostComments() {
      _ref = PostComments.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostComments.prototype.url = '/post_comments';

    PostComments.prototype.model = PostComment;

    return PostComments;

  })(Backbone.Collection);
});
