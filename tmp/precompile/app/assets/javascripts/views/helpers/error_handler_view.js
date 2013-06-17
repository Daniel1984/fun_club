var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone'], function(Backbone) {
  var ErrorView, _ref;
  return ErrorView = (function(_super) {
    __extends(ErrorView, _super);

    function ErrorView() {
      this.removeError = __bind(this.removeError, this);
      this.renderError = __bind(this.renderError, this);
      this.render = __bind(this.render, this);
      _ref = ErrorView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    ErrorView.prototype.events = {
      'keydown input': 'removeError',
      'keydown textarea': 'removeError',
      'change select': 'removeError'
    };

    ErrorView.prototype.initialize = function(options) {
      this.el = options.el;
      this.error = JSON.parse(options.error.responseText);
      return this.render();
    };

    ErrorView.prototype.render = function() {
      var key, val, _ref1, _ref2, _results, _results1;
      if (this.error.errors) {
        _ref1 = this.error.errors;
        _results = [];
        for (key in _ref1) {
          val = _ref1[key];
          _results.push(this.renderError(key, val.type));
        }
        return _results;
      } else {
        _ref2 = this.error;
        _results1 = [];
        for (key in _ref2) {
          val = _ref2[key];
          _results1.push(this.renderError(key, val));
        }
        return _results1;
      }
    };

    ErrorView.prototype.renderError = function(field, msg) {
      console.log("field -> " + field + " / error -> " + msg);
      this.$(".base").html("<div class='alert alert-error'>" + msg + "</div>");
      this.$("[name=\"" + field + "\"]").closest('div[class^="control-group"]').addClass('error');
      this.$("[name=\"" + field + "\"]").closest('div[class^="controls"]').find('.help-inline').remove();
      this.$("[name=\"" + field + "\"]").closest('div[class^="controls"]').append("<span class='help-inline'>" + msg + "</span>");
      return this.$('.btn').addClass('disabled');
    };

    ErrorView.prototype.removeError = function(e) {
      this.$(e.currentTarget).closest('div[class^="control-group"]').removeClass('error');
      this.$(e.currentTarget).closest('div[class^="controls"]').find('.help-inline').remove();
      return this.$('.btn').removeClass('disabled');
    };

    return ErrorView;

  })(Backbone.View);
});
