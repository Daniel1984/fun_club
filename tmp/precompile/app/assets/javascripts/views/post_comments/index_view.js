var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/post_comments/list_view', 'views/post_comments/form_view', 'collections/post_comments', 'text!/templates/post_comments/no_comments_msg.html', 'text!/templates/post_comments/index.html', 'spin'], function(Backbone, ListView, FormView, PostComments, NoCommentsMsg, template, Spinner) {
  var IndexView, _ref;
  return IndexView = (function(_super) {
    __extends(IndexView, _super);

    function IndexView() {
      this.renderForm = __bind(this.renderForm, this);
      this.renderList = __bind(this.renderList, this);
      this.render = __bind(this.render, this);
      _ref = IndexView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    IndexView.prototype.initialize = function(options) {
      this.template = _.template(template);
      this.postId = options.postId;
      this.spinner = new Spinner({
        color: '#000',
        width: 4,
        length: 6,
        lines: 11,
        radius: 8
      });
      this.noCommentsMsg = _.template(NoCommentsMsg);
      this.comments = new PostComments();
      this.comments.on('reset', this.renderList);
      return this.comments.fetch({
        data: {
          post_id: this.postId
        },
        reset: true
      });
    };

    IndexView.prototype.render = function() {
      this.$el.html(this.template);
      this.$el.find('.spinner-container').append(this.spinner.spin().el);
      this.renderForm();
      return this;
    };

    IndexView.prototype.renderList = function() {
      this.spinner.stop();
      if (this.comments.length === 0) {
        return this.$el.find('.comments-container').append(this.noCommentsMsg);
      } else {
        this.listView = new ListView({
          collection: this.comments
        });
        return this.$el.find('.comments-container').append(this.listView);
      }
    };

    IndexView.prototype.renderForm = function() {
      this.formView = new FormView();
      return this.$el.find('.form-container').append(this.formView.render().el);
    };

    return IndexView;

  })(Backbone.View);
});
