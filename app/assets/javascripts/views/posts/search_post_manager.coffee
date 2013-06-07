define [
  'backbone'
  'text!templates/posts/search.html'
  'bootstrap'
  'select2'
], (Backbone, template) ->
  class SearchView extends Backbone.View
    className: 'posts-search'
    events:
      'change .city-select': 'onCitySelect'

    initialize: (options) ->
      @template = _.template(template)
      @parent = options.parent

    render: =>
      @$el.html(@template())
      @$el.find('.city-select').select2
        placeholder: "ie&scaron;kok pagal miest&#261;"
        escapeMarkup: (m) -> return m
        width: '300px'
      @

    onCitySelect: (e) =>
      cityId = $(e.currentTarget).val()
      @parent.fetch({city: cityId})
      #     @collection.fetch(data: {city: cityId}, reset: true)
