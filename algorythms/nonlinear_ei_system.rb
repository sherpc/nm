class NonlinearEISystem < IterationMethod
  def initialize f1, f2, x, q, accuracy = 0.001
    @f1, @f2 = f1, f2
    @accuracy = accuracy
    @x_start = x.clone
    @q = q / (1 - q)
    refresh_x
  end

  def step f, x, f_1
    [@f1[*x], @f2[*x]] 
  end

  def enough?
    @q * @x.map2(@x_next) { |x, x_next| (x_next - x).abs }.max <= @accuracy
  end
end
