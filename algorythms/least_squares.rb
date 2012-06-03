class LeastSquares
  def initialize x, y
    @x, @y = x, y
    @n = x.length - 1
  end

  def f_1
    a11 = @n + 1
    a12 = Math.sum(0,@n) { |j| @x[j] }
    a22 = Math.sum(0,@n) { |j| @x[j] ** 2 }
    b1 = Math.sum(0,@n) { |j| @y[j] }
    b2 = Math.sum(0,@n) { |j| @y[j] * @x[j] }
    det = a11 * a22 - a12 * a12
    a0 = (b1 * a22 - b2 * a12) / det
    a1 = (b2 * a11 - b1 * a12) / det
    return lambda { |x| a0 + a1 * x }
  end
  
  def f_2
    p0 = @n + 1
    p1 = Math.sum(0,@n) { |j| @x[j] }
    p2 = Math.sum(0,@n) { |j| @x[j] ** 2 }
    p3 = Math.sum(0,@n) { |j| @x[j] ** 3 }
    p4 = Math.sum(0,@n) { |j| @x[j] ** 4 }
    b1 = Math.sum(0,@n) { |j| @y[j] }
    b2 = Math.sum(0,@n) { |j| @y[j] * @x[j] }
    b3 = Math.sum(0,@n) { |j| @y[j] * @x[j] * @x[j] }
    b = [b1,b2,b3]
    lu = LU.new [
                  [p0,p1,p2],
                  [p1,p2,p3],
                  [p2,p3,p4]
    ]
    lu.solve b
    a0, a1, a2 = lu.answer
    lambda { |x| a0 + a1 * x + a2 * x * x }
  end

  def error_1; error f_1; end
  def error_2; error f_2; end

  private

  def error f
    Math.sum(0,@n) { |j| (f[@x[j]] - @y[j]) ** 2 }
  end
end
