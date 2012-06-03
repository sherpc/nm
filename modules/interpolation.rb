class Interpolation
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

  def error x
    (make_polynomial[x] - @f[x]).abs
  end
end
