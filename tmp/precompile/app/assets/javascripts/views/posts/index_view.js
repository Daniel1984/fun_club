var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/posts/search_post_manager', 'views/posts/create_post_manager', 'views/posts/list_view'], function(Backbone, SearchPostManager, CreatePostManager, ListView) {
  var PostsIndexView, _ref;

  return PostsIndexView = (function(_super) {
    __extends(PostsIndexView, _super);

    function PostsIndexView() {
      this.renderList = __bind(this.renderList, this);
      this.enableCreate = __bind(this.enableCreate, this);
      this.enableSearch = __bind(this.enableSearch, this);
      this.render = __bind(this.render, this);      _ref = PostsIndexView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PostsIndexView.prototype.className = 'posts-conainer';

    PostsIndexView.prototype.initialize = function(options) {};

    PostsIndexView.prototype.render = function() {
      this.$el.html();
      this.enableSearch();
      this.enableCreate();
      this.renderList();
      return this;
    };

    PostsIndexView.prototype.enableSearch = function() {
      this.searchView = new SearchPostManager({
        posts: this.posts
      });
      return this.$el.append(this.searchView.render().el);
    };

    PostsIndexView.prototype.enableCreate = function() {
      this.createInput = new CreatePostManager();
      return this.$el.append(this.createInput.render().el);
    };

    PostsIndexView.prototype.renderList = function() {
      this.listView = new ListView();
      return this.$el.append(this.listView.render().el);
    };

    return PostsIndexView;

  })(Backbone.View);
});
