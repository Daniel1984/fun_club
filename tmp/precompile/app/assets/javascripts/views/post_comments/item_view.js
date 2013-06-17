var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'text!templates/post_comments/item_view.html', 'xdate'], function(Backbone, template) {
  var ItemView, _ref;
  return ItemView = (function(_super) {
    __extends(ItemView, _super);

    function ItemView() {
      this.render = __bind(this.render, this);
      _ref = ItemView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ItemView.prototype.className = 'comment-item';

    ItemView.prototype.initialize = function(options) {
      return this.template = _.template(template);
    };

    ItemView.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    };

    return ItemView;

  })(Backbone.View);
});
