class Thomas < Solution
  attr_reader :answer, :p, :q

  def initialize data
    super data
    @matrix[0] = [0] + @matrix[0]
    @matrix[2] << 0
    @n = d.length - 1
  end
  
  def direct
    @p = Array.new(@n+1)
    @q = Array.new(@n+1)
    @p[0] = -c[0] / b[0]
    @q[0] = d[0] / b[0]

    for i in 1..@n
      @p[i] = -c[i] / (b[i] + a[i] * p[i-1])
      @q[i] = (d[i] - a[i] * q[i-1]) / (b[i] + a[i] * p[i-1])
    end
  end

  private

  def a; @matrix[0]; end
  def b; @matrix[1]; end
  def c; @matrix[2]; end
  def d; @matrix[3]; end

  
end
