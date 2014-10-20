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

  counter = 0
  a = 1                             #加速度#

  getRan = () -> (Math.random() - 0.5)*2
 
  nPoint = 1000
  points = (new Point(canvas.width/2, canvas.height/2, 5) for i in [0..nPoint]) #描画したい位置#
  dpoints = ({dx:getRan(), dy:getRan(), dsize:0.008} for i in [0..nPoint])

  drawCircle = (pt) ->
    ctx.beginPath()
    ctx.arc pt.x, pt.y, pt.size, 0, Math.PI * 2, true  #円を描く#
    ctx.fill()                                         #円を塗りつぶす#

  update = ->
    counter += 1                      #カウンターを追加して時間で色を変更させる#

    if 50 < counter
      drawCircle(i) for i in points
      ctx.fillStyle = 'rgb(256,256,256)' #色変更(白)#

    drawCircle(i) for i in points
    ctx.fillStyle = 'rgb(0,0,0)' #色変更(黒)#
#   ctx.clearRect 0, 0, canvas.width, canvas.height     #clearしないことで残像を作る#


    for i in [0..nPoint]
      d = dpoints[i]
      points[i].update(d.dx*a, d.dy*a, d.dsize)  #加速度を与える#
    a*=1.008

    window.requestAnimationFrame update

  window.requestAnimationFrame update
