var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone'], function(Backbone) {
  var PostJoin, _ref;
  return PostJoin = (function(_super) {
    __extends(PostJoin, _super);

    function PostJoin() {
      _ref = PostJoin.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostJoin.prototype.idAttribute = '_id';

    PostJoin.prototype.urlRoot = 'post_join';

    return PostJoin;

  })(Backbone.Model);
});
