var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/post_details/index_view', 'text!templates/posts/item.html', 'shorten'], function(Backbone, PostDetailsView, template) {
  var ItemView, _ref;
  return ItemView = (function(_super) {
    __extends(ItemView, _super);

    function ItemView() {
      this.showPostDetails = __bind(this.showPostDetails, this);
      this.render = __bind(this.render, this);
      _ref = ItemView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ItemView.prototype.className = 'well grid post-item';

    ItemView.prototype.events = {
      'click .details-btn': 'showPostDetails'
    };

    ItemView.prototype.initialize = function(options) {
      return this.template = _.template(template);
    };

    ItemView.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$el.find('.title').shorten({
        tail: "&hellip;",
        tooltip: true
      });
      return this;
    };

    ItemView.prototype.showPostDetails = function(e) {
      return new PostDetailsView({
        model: this.model
      });
    };

    return ItemView;

  })(Backbone.View);
});
