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
  end
end
