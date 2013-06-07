define([], function() {
  var _this = this;

  return {
    recalibrate: function(el) {
      var col, conWidth, currentWidth, winWidth;

      winWidth = $(window).width();
      conWidth = void 0;
      if (winWidth < 750) {
        conWidth = 370;
        col = 1;
      } else if (winWidth < 1200) {
        conWidth = 720;
        col = 2;
      } else {
        conWidth = 1100;
        col = 3;
      }
      if (conWidth !== currentWidth) {
        currentWidth = conWidth;
        el.width(conWidth);
        return el.BlocksIt({
          numOfCol: col,
          offsetX: 8,
          offsetY: 8
        });
      }
    }
  };
});
