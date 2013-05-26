define [], () ->

  recalibrate: (el) =>
    winWidth = $(window).width()
    conWidth = undefined
    if winWidth < 750
      conWidth = 370
      col = 1
    else if winWidth < 1200
      conWidth = 720
      col = 2
    else
      conWidth = 1100
      col = 3
    if conWidth != currentWidth
      currentWidth = conWidth
      el.width(conWidth)
      el.BlocksIt
        numOfCol: col
        offsetX: 8
        offsetY: 8
