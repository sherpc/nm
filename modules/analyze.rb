module Analyze
  def self.newton
    f = ->(x) { x * x * x * x - 2 * x - 1 }
    f_1 = ->(x) { 4 * x * x * x - 2 }
    f_2 = ->(x) { 12 * x * x }
    n = Newton.new f, f_1, f_2, 1.5, 0.1
    #accuracy = (1..10).map { |x| 1.0 / (10 ** x) }
    accuracy = []
    (1.0e-10).step(0.1, 1.0e-03) { |x| accuracy << x }
    iterations = accuracy.map do |e|
      n.accuracy = e
      n.solution
      n.k
    end
    Plot.render accuracy, iterations
  end
end
