var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/posts/index_view', 'text!templates/page/index.html'], function(Backbone, PostsView, template) {
  var PageIndexView, _ref;
  return PageIndexView = (function(_super) {
    __extends(PageIndexView, _super);

    function PageIndexView() {
      this.renderPosts = __bind(this.renderPosts, this);
      this.render = __bind(this.render, this);
      _ref = PageIndexView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PageIndexView.prototype.className = 'container-fluid';

    PageIndexView.prototype.initialize = function(options) {
      return this.template = _.template(template);
    };

    PageIndexView.prototype.render = function() {
      this.$el.html(this.template());
      this.renderPosts();
      return this;
    };

    PageIndexView.prototype.renderPosts = function() {
      this.postsView = new PostsView();
      return this.$el.find('.container').append(this.postsView.render().el);
    };

    return PageIndexView;

  })(Backbone.View);
});
