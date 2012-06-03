class Spline
  def initialize x, f
    @x, @f = x, f
    @n = 4
    @h = []
    (1..@n).each { |i| @h[i] = x[i] - x[i-1] }
  end

  def coefficients
    b = (2..@n).map { |i| 3 * (coeff_b(i) - coeff_b(i-1)) }
    p b
  end

  def coeff_b i
      (@f[i] - @f[i-1]) / @h[i]
  end
end
