module Analyze
  def self.newton
    f = ->(x) { x * x * x * x - 2 * x - 1 }
    f_1 = ->(x) { 4 * x * x * x - 2 }
    f_2 = ->(x) { 12 * x * x }
    n = Newton.new f, f_1, f_2, 1.5, 0.1
    xs, ys, xt, yt = generate_points n
    Plot.render xs, ys, xt, yt, "Newton method", "newton"
  end

  def self.ei
    f = ->(x) { (2 * x + 1) ** 0.25 }
    n = NonlinearEI.new f, 0.2, 1.4, 0.1
    xs, ys, xt, yt = generate_points n
    Plot.render xs, ys, xt, yt, "Easy iterations method", "ei"
  end

  private

  def self.generate_points solver
    accuracy = []
    (1.0e-10).step(0.1, 1.0e-03) { |x| accuracy << x }
    iterations = accuracy.map do |e|
      solver.accuracy = e
      solver.solution
      solver.k
    end
    return iterations, accuracy, "Iterations count", "Accuracy"
  end
end
