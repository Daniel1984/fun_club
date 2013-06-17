define(['jquery', 'backbone', 'views/page/index_view', 'backstretch'], function($, Backbone, PageIndexView) {
  return {
    init: function() {
      $('body').backstretch('http://turnlol.com/images/2012/10/light-bokeh-macro-depth-of-field-blurred-1920x1080-hd-wallpaper.jpg');
      return $('body').append(new PageIndexView().render().el);
    }
  };
});
