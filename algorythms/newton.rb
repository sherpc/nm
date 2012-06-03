class Newton
  attr_accessor :e
  attr_reader :x
  def initialize f, f_1, f_2, x, e = 0.001
    @f, @f_1, @f_2 = f, f_1, f_2
    @e = e
    @x_start = x
    refresh_x
  end
  
  def solution
    refresh_x
    throw "Function does not converge" unless converge?
    solve
  end

  def x= value
    @x_start = value
    refresh_x
  end

  private

  def refresh_x
    @x = @x_start
    @x_next = @x_start
  end

  def solve
    @x_next = process
    return @x_next if enough?
    @x = @x_next
    solve
  end

  def converge?
    @f[x] * @f_2[x] > 0
  end

  def enough? 
    (@x_next - @x).abs < @e
  end

  def process
    @x - @f[x] / @f_1[x]
  end

end
