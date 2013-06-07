var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone'], function(Backbone) {
  var Post, _ref;

  return Post = (function(_super) {
    __extends(Post, _super);

    function Post() {
      _ref = Post.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Post.prototype.urlRoot = 'posts';

    Post.prototype.idAttribute = 'id';

    Post.prototype.defaults = {
      post_image: void 0,
      body: void 0
    };

    return Post;

  })(Backbone.Model);
});
