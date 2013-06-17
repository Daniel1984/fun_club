var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'views/post_comments/item_view'], function(Backbone, ItemView) {
  var ListView, _ref;
  return ListView = (function(_super) {
    __extends(ListView, _super);

    function ListView() {
      this.addItemView = __bind(this.addItemView, this);
      this.render = __bind(this.render, this);
      _ref = ListView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ListView.prototype.className = 'row-fluid';

    ListView.prototype.initialize = function(options) {
      return console.log(this.collection);
    };

    ListView.prototype.render = function() {
      this.$el.html();
      this.collection.each(this.addItemView);
      return this;
    };

    ListView.prototype.addItemView = function(model) {
      this.itemView = new ItemView({
        model: model
      });
      return this.$el.append(this.itemView.render().el);
    };

    return ListView;

  })(Backbone.View);
});
