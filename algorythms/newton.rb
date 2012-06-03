class Newton < IterationMethod
  def initialize f, f_1, f_2, x, accuracy = 0.001
    @f, @f_1, @f_2 = f, f_1, f_2
    @accuracy = accuracy
    @x_start = x
    refresh_x
  end
  
  private

  def converge?
    @f[x] * @f_2[x] > 0
  end

  def enough? 
    (@x_next - @x).abs < @accuracy
  end

  def step f, x, f_1 = nil
    x - f[x] / f_1[x]
  end
end
