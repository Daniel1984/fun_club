var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/posts/search_post_manager', 'views/posts/create_post_manager', 'views/posts/list_view', 'collections/posts', 'spin'], function(Backbone, SearchPostManager, CreatePostManager, ListView, Posts, Spinner) {
  var PostsIndexView, _ref;

  return PostsIndexView = (function(_super) {
    __extends(PostsIndexView, _super);

    function PostsIndexView() {
      this.renderList = __bind(this.renderList, this);
      this.enableCreate = __bind(this.enableCreate, this);
      this.enableSearch = __bind(this.enableSearch, this);
      this.fetch = __bind(this.fetch, this);
      this.render = __bind(this.render, this);      _ref = PostsIndexView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostsIndexView.prototype.className = 'posts-conainer';

    PostsIndexView.prototype.initialize = function(options) {
      this.spinner = new Spinner({
        color: '#fff'
      });
      this.posts = new Posts();
      return this.posts.on('reset', this.renderList);
    };

    PostsIndexView.prototype.render = function() {
      this.$el.html();
      this.enableSearch();
      this.enableCreate();
      this.fetch();
      return this;
    };

    PostsIndexView.prototype.fetch = function(data) {
      var _ref1;

      if (data == null) {
        data = {};
      }
      if ((_ref1 = this.listView) != null) {
        _ref1.remove();
      }
      this.$el.append(this.spinner.spin().el);
      return this.posts.fetch({
        data: data,
        reset: true
      });
    };

    PostsIndexView.prototype.enableSearch = function() {
      this.searchView = new SearchPostManager({
        collection: this.posts,
        parent: this
      });
      return this.$el.append(this.searchView.render().el);
    };

    PostsIndexView.prototype.enableCreate = function() {
      this.createInput = new CreatePostManager();
      return this.$el.append(this.createInput.render().el);
    };

    PostsIndexView.prototype.renderList = function() {
      this.spinner.stop();
      this.listView = new ListView({
        collection: this.posts
      });
      this.$el.append(this.listView.render().el);
      return this.listView.manageTiles();
    };

    return PostsIndexView;

  })(Backbone.View);
});
