var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'models/post_join', 'text!templates/join_event/index.html'], function(Backbone, PostJoin, template) {
  var IndexView, _ref;
  return IndexView = (function(_super) {
    __extends(IndexView, _super);

    function IndexView() {
      this.onJoinEventClick = __bind(this.onJoinEventClick, this);
      this.render = __bind(this.render, this);
      _ref = IndexView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    IndexView.prototype.className = 'modal hide fade';

    IndexView.prototype.events = {
      'click .join-event-btn': 'onJoinEventClick'
    };

    IndexView.prototype.initialize = function(options) {
      this.template = _.template(template);
      this.post = options.post;
      this.model = new PostJoin();
      this.model.set({
        post_id: this.post.get('_id')
      });
      return this.render();
    };

    IndexView.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$('form').backboneLink(this.model);
      this.$el.modal('show');
      return this;
    };

    IndexView.prototype.onJoinEventClick = function(e) {
      e.preventDefault();
      return this.model.save();
    };

    return IndexView;

  })(Backbone.View);
});
