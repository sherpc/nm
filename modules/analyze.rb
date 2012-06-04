module Analyze
  def self.newton
    f = ->(x) { x * x * x * x - 2 * x - 1 }
    f_1 = ->(x) { 4 * x * x * x - 2 }
    f_2 = ->(x) { 12 * x * x }
    n = Newton.new f, f_1, f_2, 1.5, 0.1
    xs, ys, xt, yt = generate_points n
    Plot.render xt, yt, "Newton method", "newton", ds(xs,ys)
  end

  def self.ei
    f = ->(x) { (2 * x + 1) ** 0.25 }
    n = NonlinearEI.new f, 0.2, 1.4, 0.1
    xs, ys, xt, yt = generate_points n
    Plot.render xt, yt, "Easy iterations method", "ei", ds(xs,ys)
  end

  def self.least_squares
    x = [0, 1.7, 3.4, 5.1, 6.8, 8.5]
    y = [0, 1.3038, 1.8439, 2.2583, 2.6077, 2.9155]
    ls = LeastSquares.new x, y
    f_1 = ls.f_1
    f_2 = ls.f_2
    x1 = []
    0.step(9, 0.1).each { |x| x1 << x }
    y1 = x1.map { |x| f_1[x] }
    y2 = x1.map { |x| f_2[x] }
    Plot.render "X","Y","Least squares", "ls", [Plot.ds(x,y,"","points"), Plot.ds(x1,y1,"f_1"), Plot.ds(x1,y2,"f_2")]
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
