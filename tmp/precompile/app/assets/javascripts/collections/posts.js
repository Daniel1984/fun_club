var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'models/post'], function(Backbone, Post) {
  var Posts, _ref;

  return Posts = (function(_super) {
    __extends(Posts, _super);

    function Posts() {
      _ref = Posts.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Posts.prototype.url = '/posts';

    Posts.prototype.model = Post;

    return Posts;

  })(Backbone.Collection);
});
