class NonlinearEI < IterationMethod
  def initialize f, q, x, accuracy = 0.001
    @f = f
    @q = q
    @accuracy = accuracy
    @x_start = x
    refresh_x
  end
  
  private

  def enough? 
    (@q/(1-@q)) * (@x_next - @x).abs <= @accuracy
  end

  def step f, x, f_1
    f[x]
  end
end
