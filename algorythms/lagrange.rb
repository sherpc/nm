class LagrangeInterpolation < Interpolation
  def term i, x
    Math.mul(0,@power) do |j|
      i == j ? @f[@xs[i]] / w_xs(i) : (x - @xs[i])
    end
  end

  def w_xs i
    (0..@power).inject(1) do |m,j|
      i == j ? 1 : m * (@xs[i]-@xs[j])
    end
    #Math.mul(0,@power) { |j| i == j ? 1 : (@xs[i]-@xs[j]) }
  end
end
