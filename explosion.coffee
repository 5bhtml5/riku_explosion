window.onload = ->
  canvas = document.getElementById "field"
  ctx = canvas.getContext '2d'

  class Point
    constructor : (x, y, size) ->
      @x = x
      @y = y
      @size = size

    update: (dx, dy, dsize) ->
      @x += dx
      @y += dy
      @size -= dsize

  counter = 1
  getRan = () -> (Math.random() - 0.5)*2

  nPoint = 1000
  points = (new Point(canvas.width/2, canvas.height/2, 5) for i in [0..nPoint]) #描画したい位置#
  dpoints = ({dx:getRan(), dy:getRan(), dsize:0.005} for i in [0..nPoint])

  drawCircle = (pt) ->
    ctx.beginPath()
    ctx.arc pt.x, pt.y, pt.size, 0, Math.PI * 2, true  #円を描く#
    ctx.fill()                                         #円を塗りつぶす#

  update = ->
    counter += 1    
    if counter > 500
#     ctx.clearRect 0, 0, canvas.width, canvas.height
      drawCircle(i) for i in points
    if counter > 125
#     ctx.clearRect 0, 0, canvas.width, canvas.height
      drawCircle(i) for i in points
      ctx.fillStyle = 'rgb(256,256,256)' #色変更#
    drawCircle(i) for i in points
    ctx.fillStyle = 'rgb(0,0,0)' #色変更#

    for i in [0..nPoint]
      d = dpoints[i]
      points[i].update(d.dx, d.dy, d.dsize)

    window.requestAnimationFrame update

  window.requestAnimationFrame update
