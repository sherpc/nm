class Spline
  def initialize x, f
    @x, @f = x, f
    @n = 4
    @h = []
    (1..@n).each { |i| @h[i] = x[i] - x[i-1] }
  end

  def create
    @a = [0, *(1..@n).map { |i| @f[i-1] }]
    @c = [0,0,*calculate_c]
    @b = [0,*(1..@n).map { |i| calculate_b(i) }]
    @d = [0,*(1..@n).map { |i| calculate_d(i) }]
  end

  def[] x
    create unless @a
    i = x.ceil
    i = @x.find_index { |k| x <= k }
    i = 1 if i == 0
    throw "x: #{x} in not valid range" unless 1 <= i && i <= @n
    @a[i] + @b[i] * term(x,i,1) + @c[i] * term(x,i,2) + @d[i] * term(x,i,3)
  end

  def term x, i, power
    (x - @x[i-1]) ** power
  end

  def calculate_b i
    return (@f[i] - @f[i-1]) / @h[i] - (2.0/3) * @h[i] * @c[i] if i == @n
    (@f[i] - @f[i-1]) / @h[i] - (1.0/3) * @h[i] * (@c[i+1] + 2 * @c[i])
  end

  def calculate_d i
    return  -@c[i] / (3.0 * @h[i]) if i == @n
    (@c[i+1] - @c[i]) / (3.0 * @h[i])
  end

  def calculate_c
    a = (3..@n).map { |i| coeff_a(i) }
    b = (2..@n).map { |i| coeff_b(i) }
    c = (2..@n-1).map { |i| coeff_c(i) }
    d = (2..@n).map { |i| 3 * (coeff_d(i) - coeff_d(i-1)) }
    m = Thomas.new [a,b,c,d]
    m.solve
    m.answer
  end

  def coeff_d i
      (@f[i] - @f[i-1]) / @h[i]
  end

  def coeff_a i; @h[i-1]; end
  def coeff_b i
    2 * (@h[i-1] + @h[i])
  end
  def coeff_c i; @h[i]; end
end
