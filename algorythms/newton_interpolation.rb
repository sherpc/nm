class NewtonInterpolation < Interpolation
  def term i, x
    difference(i, x) * Math.mul(0, i-1) { |j| x - @xs[j] }
  end

  def difference power, x, i = 0
    return @f[x] if power == 0
    (difference(power-1,x,i) - difference(power-1,x,i+1)) / (@xs[i] - @xs[i+power])
  end
end
