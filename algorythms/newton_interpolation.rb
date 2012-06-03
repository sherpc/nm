class NewtonInterpolation
  attr_accessor :xs
  def initialize f, xs
    @f, @xs = f, xs
    @power = 3
  end

  def make_polynomial
    lambda do |x|
      Math.sum(0,@power) { |i| term(i, x) }
    end
  end

  def term i, x
    Math.mul(0, i-1) do |j|
      i == j ? @f[@xs[i]] / w_xs(i) : (x - @xs[i])
    end
  end

  def error x
    (make_polynomial[x] - @f[x]).abs
  end
end
