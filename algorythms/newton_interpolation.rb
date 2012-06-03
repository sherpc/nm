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
    difference(i, x) * Math.mul(0, i-1) { |j| x - @xs[j] }
  end

  def difference power, x, i = 0
    return @f[x] if power == 0
    (difference(power-1,x,i) - difference(power-1,x,i+1)) / (@xs[i] - @xs[i+power])
  end

  def error x
    (make_polynomial[x] - @f[x]).abs
  end
end
