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

  def make_polynom
    lambda do |x|
      (0..@power).inject(0) do |s, i|
        s + (0..@power).inject(1) do |m, j|
          m * (i == j ? @f[@xs[i]] / w_xs(i) : (x - @xs[i]))
        end
      end
    end
  end

  def part i
    (0..@power).inject(1) do |m, j|
      m * (i == j ? @f[@xs[i]] / w_xs(i) : (x - @xs[i]))
    end
  end

  def error x
    (make_polynom[x] - @f[x]).abs
  end
end
