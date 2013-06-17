var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone'], function(Backbone) {
  var PostComment, _ref;
  return PostComment = (function(_super) {
    __extends(PostComment, _super);

    function PostComment() {
      _ref = PostComment.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostComment.prototype.urlRoot = 'post_comments';

    PostComment.prototype.idAttribute = 'id';

    PostComment.prototype.defaults = {
      author_comment: 'undefined',
      author_name: 'undefiner'
    };

    return PostComment;

  })(Backbone.Model);
});
