var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone', 'text!templates/posts/search.html', 'bootstrap', 'select2'], function(Backbone, template) {
  var SearchView, _ref;

  return SearchView = (function(_super) {
    __extends(SearchView, _super);

    function SearchView() {
      this.onCitySelect = __bind(this.onCitySelect, this);
      this.render = __bind(this.render, this);      _ref = SearchView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    SearchView.prototype.className = 'posts-search';

    SearchView.prototype.events = {
      'change .city-select': 'onCitySelect'
    };

    SearchView.prototype.initialize = function(options) {
      this.template = _.template(template);
      return this.parent = options.parent;
    };

    SearchView.prototype.render = function() {
      this.$el.html(this.template());
      this.$el.find('.city-select').select2({
        placeholder: "ie&scaron;kok pagal miest&#261;",
        escapeMarkup: function(m) {
          return m;
        },
        width: '300px'
      });
      return this;
    };

    SearchView.prototype.onCitySelect = function(e) {
      var cityId;

      cityId = $(e.currentTarget).val();
      return this.parent.fetch({
        city: cityId
      });
    };

    return SearchView;

  })(Backbone.View);
});
