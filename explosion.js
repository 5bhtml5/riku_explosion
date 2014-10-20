(function() {
  window.onload = function() {
    var Point, a, canvas, counter, ctx, dpoints, drawCircle, getRan, i, nPoint, points, update;
    canvas = document.getElementById("field");
    ctx = canvas.getContext('2d');
    Point = (function() {
      function Point(x, y, size) {
        this.x = x;
        this.y = y;
        this.size = size;
      }

      Point.prototype.update = function(dx, dy, dsize) {
        this.x += dx;
        this.y += dy;
        return this.size -= dsize;
      };

      return Point;

    })();
    counter = 0;
    a = 1;
    getRan = function() {
      return (Math.random() - 0.5) * 2;
    };
    nPoint = 1000;
    points = (function() {
      var _i, _results;
      _results = [];
      for (i = _i = 0; 0 <= nPoint ? _i <= nPoint : _i >= nPoint; i = 0 <= nPoint ? ++_i : --_i) {
        _results.push(new Point(canvas.width / 2, canvas.height / 2, 5));
      }
      return _results;
    })();
    dpoints = (function() {
      var _i, _results;
      _results = [];
      for (i = _i = 0; 0 <= nPoint ? _i <= nPoint : _i >= nPoint; i = 0 <= nPoint ? ++_i : --_i) {
        _results.push({
          dx: getRan(),
          dy: getRan(),
          dsize: 0.008
        });
      }
      return _results;
    })();
    drawCircle = function(pt) {
      ctx.beginPath();
      ctx.arc(pt.x, pt.y, pt.size, 0, Math.PI * 2, true);
      return ctx.fill();
    };
    update = function() {
      var d, _i, _j, _k, _len, _len1;
      counter += 1;
      if (50 < counter) {
        for (_i = 0, _len = points.length; _i < _len; _i++) {
          i = points[_i];
          drawCircle(i);
        }
        ctx.fillStyle = 'rgb(256,256,256)';
      }
      for (_j = 0, _len1 = points.length; _j < _len1; _j++) {
        i = points[_j];
        drawCircle(i);
      }
      ctx.fillStyle = 'rgb(0,0,0)';
      for (i = _k = 0; 0 <= nPoint ? _k <= nPoint : _k >= nPoint; i = 0 <= nPoint ? ++_k : --_k) {
        d = dpoints[i];
        points[i].update(d.dx * a, d.dy * a, d.dsize);
      }
      a *= 1.008;
      return window.requestAnimationFrame(update);
    };
    return window.requestAnimationFrame(update);
  };

}).call(this);
