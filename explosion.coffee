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

  getRan = () -> (Math.random() - 0.5)*8   #2→8#

  nPoint = 1000
  points = (new Point(canvas.width/2, canvas.height/2, 5) for i in [0..nPoint])
  dpoints = ({dx:getRan(), dy:getRan(), dsize:0.04} for i in [0..nPoint])  #0.01→0.04#

  drawCircle = (pt) ->
    ctx.beginPath()
    ctx.arc pt.x, pt.y, pt.size, 0, Math.PI * 2, true
    ctx.fill()

  update = ->
    ctx.clearRect 0, 0, canvas.width, canvas.height
    drawCircle(i) for i in points

    for i in [0..nPoint]
      d = dpoints[i]
      points[i].update(d.dx, d.dy, d.dsize)

    window.requestAnimationFrame update

  window.requestAnimationFrame update
