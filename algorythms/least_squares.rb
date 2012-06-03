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
    return lambda |x| { a0 + a1 * x }
  end
end
