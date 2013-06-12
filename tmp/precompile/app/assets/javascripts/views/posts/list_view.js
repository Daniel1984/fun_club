var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/posts/item_view', 'modules/tile_manager', 'blocksit'], function(Backbone, PostItemView, TileManager) {
  var ListView, _ref;
  return ListView = (function(_super) {
    __extends(ListView, _super);

    function ListView() {
      this.manageTiles = __bind(this.manageTiles, this);
      this.addPost = __bind(this.addPost, this);
      this.renderPosts = __bind(this.renderPosts, this);
      this.render = __bind(this.render, this);
      _ref = ListView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ListView.prototype.id = 'container';

    ListView.prototype.render = function() {
      var _this = this;
      this.$el.html();
      this.renderPosts();
      $(window).resize(function() {
        return TileManager.recalibrate(_this.$el);
      });
      return this;
    };

    ListView.prototype.renderPosts = function() {
      return this.collection.each(this.addPost);
    };

    ListView.prototype.addPost = function(model) {
      this.postItemView = new PostItemView({
        model: model
      });
      return this.$el.append(this.postItemView.render().el);
    };

    ListView.prototype.manageTiles = function() {
      return TileManager.recalibrate(this.$el);
    };

    return ListView;

  })(Backbone.View);
});
