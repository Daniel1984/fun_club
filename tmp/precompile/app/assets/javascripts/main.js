require.config({
  paths: {
    jquery: 'lib/jquery',
    underscore: 'lib/underscore',
    backbone: 'lib/backbone',
    backbone_datalink: 'lib/backbone_datalink',
    text: 'lib/requirejs/text',
    domready: 'lib/requirejs/domready',
    bootstrap: 'lib/bootstrap',
    modal: 'lib/bootstrap_modal',
    modalmanager: 'lib/bootstrap_modalmanager',
    select2: 'lib/select2',
    backstretch: 'lib/backstretch',
    blocksit: 'lib/blocksit',
    spin: 'lib/spin',
    xdate: 'lib/xdate'
  },
  shim: {
    underscore: {
      exports: '_'
    },
    backbone: {
      deps: ['underscore', 'jquery', 'backbone_datalink'],
      exports: 'Backbone'
    },
    backbone_datalink: {
      deps: ['jquery'],
      exports: 'jQuery.fn.backboneLink'
    },
    select2: {
      deps: ['jquery'],
      exports: 'jQuery.fn.select2'
    },
    backstretch: {
      deps: ['jquery'],
      exports: 'jQuery.fn.backstretch'
    },
    blocksit: {
      deps: ['jquery'],
      exports: 'jQuery.fn.blocksit'
    },
    xdate: {
      exports: 'XDate'
    }
  }
});

require(['domready', 'app'], function(domReady, app) {
  var _this = this;
  return domReady(function() {
    return app.init();
  });
});
