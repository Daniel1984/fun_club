var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/posts/item_view', 'collections/posts', 'modules/tile_manager', 'spin', 'blocksit'], function(Backbone, PostItemView, Posts, TileManager, Spin) {
  var ListView, _ref;

  return ListView = (function(_super) {
    __extends(ListView, _super);

    function ListView() {
      this.addPost = __bind(this.addPost, this);
      this.renderPosts = __bind(this.renderPosts, this);
      this.render = __bind(this.render, this);      _ref = ListView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ListView.prototype.id = 'container';

    ListView.prototype.initialize = function(options) {
      this.spin = new Spin({
        color: '#FFF'
      });
      this.posts = new Posts();
      this.posts.on('reset', this.renderPosts);
      return this.posts.fetch({
        data: {},
        reset: true
      });
    };

    ListView.prototype.render = function() {
      var _this = this;

      this.$el.html();
      this.$el.append(this.spin.spin().el);
      $(window).resize(function() {
        return TileManager.recalibrate(_this.$el);
      });
      return this;
    };

    ListView.prototype.renderPosts = function() {
      this.spin.spin(false);
      this.posts.each(this.addPost);
      return TileManager.recalibrate(this.$el);
    };

    ListView.prototype.addPost = function(model) {
      this.postItemView = new PostItemView({
        model: model
      });
      return this.$el.append(this.postItemView.render().el);
    };

    return ListView;

  })(Backbone.View);
});
