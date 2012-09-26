module Analyze
  def self.newton
    f = ->(x) { x * x * x * x - 2 * x - 1 }
    f_1 = ->(x) { 4 * x * x * x - 2 }
    f_2 = ->(x) { 12 * x * x }
    n = Newton.new f, f_1, f_2, 1.5, 0.1
    xs, ys, xt, yt = generate_points n
    Plot.render xt, yt, "Newton method", "newton", ds(xs,ys)
  end

  def self.lagrange
    f = ->(x) { Math.asin(x) + x }
    x = [-0.4, -0.1, 0.2, 0.5]
    #f = ->(x) { Math.cos(x) + x }
    #x = [0,0.523598, 1, 1.57]
    #interpolation = NewtonInterpolation.new f, x
    interpolation = LagrangeInterpolation.new f, x
    l = interpolation.make_polynomial
    x1 = []
    (x[0]-0.1).step(x[3]+0.1, 0.1).each { |x| x1 << x }
    y = x1.map { |k| f[k] }
    y1 = x1.map { |x| l[x] }
    Plot.render "X","Y","Lagrange", "lagrange", [Plot.ds(x1,y,""), Plot.ds(x1,y1,"polynomial")]
  end

  def self.ei
    f = ->(x) { (2 * x + 1) ** 0.25 }
    n = NonlinearEI.new f, 0.2, 1.4, 0.1
    xs, ys, xt, yt = generate_points n
    Plot.render xt, yt, "Easy iterations method", "ei", ds(xs,ys)
  end

  def self.least_squares
    #ex = [0, 1.7, 3.4, 5.1, 6.8, 8.5]
    #ey = [0, 1.3038, 1.8439, 2.2583, 2.6077, 2.9155]
    x = [-0.7, -0.4, 1.1, 0.2, 0.5, 0.8]
    y = [-1.4754, -0.81152, -0.20017, 0.40136, 1.0236, 1.7273]
    #3x = [-0.9, 0, 0.9, 1.8, 2.7, 3.6]
    #3y = [-0.36892, 0, 0.36892, 0.85408, 1.7856, 6.3138]
    ls = LeastSquares.new x, y
    f_1 = ls.f_1
    f_2 = ls.f_2
    x1 = []
    (x[0]-0.1).step(x[5]+0.1, 0.1).each { |x| x1 << x }
    y1 = x1.map { |x| f_1[x] }
    y2 = x1.map { |x| f_2[x] }
    Plot.render "X","Y","Least squares", "ls", [Plot.ds(x,y,"","points"), Plot.ds(x1,y1,"f_1"), Plot.ds(x1,y2,"f_2")]
  end

  def self.spline
    #x = [-0.4, -0.1, 0.2, 0.5, 0.8]
    #f = [-0.81152, -0.20017, 0.40136, 1.0236, 1.7273]
    #x = [0,1,2,3,4]
    #f = [1,1.5403,1.5839,2.01,3.3464]
    x = [-3,-1,1,3,5]
    f = [-1.249, -0.785, 0.785,1.249,1.373]
    sp = Spline.new x, f
    sp.create
    x1 = []
    (x[0]).step(x[4], 0.1).each { |x| x1 << x }
    y1 = x1.map { |x| sp[x] }
    Plot.render "X","Y","Spline", "spline_10", [Plot.ds(x,f,""), Plot.ds(x1,y1,"spline")]
  end

  private

  def self.generate_points solver
    accuracy = []
    (1.0e-10).step(0.1, 1.0e-03) { |x| accuracy << x }
    error = []
    iterations = accuracy.map do |e|
      solver.accuracy = e
      error << (solver.solution-1.39534).abs
      solver.k
    end
    return iterations, error, "Iterations count", "Error"
  end

  def self.ds x, y
    [Plot.ds(x,y)]
  end
end
