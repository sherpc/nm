class LagrangeInterpolation
  attr_accessor :xs
  def initialize f, xs
    @f, @xs = f, xs
    @power = 3
  end

  def w_xs i
    (0..@power).inject(1) do |m, j| 
      i == j ? 1 : m * (@xs[i] - @xs[j])
    end
  end

  def make_polynomial
    lambda do |x|
      Math.sum(0,@power) { |i| term(i, x) }
    end
  end

  def term i, x
    Math.mul(0,@power) do |j|
      i == j ? @f[@xs[i]] / w_xs(i) : (x - @xs[i])
    end
  end

  def error x
    (make_polynomial[x] - @f[x]).abs
  end
end
