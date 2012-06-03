class NewtonSystem < IterationMethod
  def initialize f1, f2, f11, f22, f12, f21, x, accuracy = 0.001
    @f1, @f2, @f11, @f22, @f12, @f21 = f1, f2, f11, f22, f12, f21
    @accuracy = accuracy
    @x_start = x.clone
    refresh_x
  end

  def step f, x, f_1
    @x.map2(increment) { |x, det_x| x + det_x }
  end

  def enough?
    @x.map2(@x_next) { |x, x_next| (x_next - x).abs }.max <= @accuracy
  end

  def increment
    # Return increment vector
    [det_1 / det, det_2 / det ]
  end

  def det
    @f11[*@x] * @f22[*@x] - @f12[*@x] * @f21[*@x]
  end

  def det_1
    -@f1[*@x] * @f22[*@x] + @f12[*@x] * @f2[*@x]
  end

  def det_2
    -@f11[*@x] * @f2[*@x] + @f1[*@x] * @f21[*@x]
  end
end
