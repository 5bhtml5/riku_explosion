window.onload = ->
  canvas = document.getElementById "field"
  ctx = canvas.getContext '2d'

  class Point
    constructor : (x, y, size) ->
      @x = x
      @y = y
      @size = size

  point = new Point(canvas.width/2, canvas.height/2, 5)
  dx = 0
  dy = 0
  ds = 1     #追加#
  drawCircle = (pt) ->
    ctx.beginPath()
    ctx.arc pt.x, pt.y, pt.size, 0, Math.PI * 2, true
    ctx.fill()

  update = ->
    ctx.clearRect 0, 0, canvas.width, canvas.height
    console.log "update"
    drawCircle(point)
    point.x += dx
    point.y += dy
    point.size += ds　　#追加#
    window.requestAnimationFrame update

  window.requestAnimationFrame update
