class Newton
  attr_accessor :accuracy
  attr_reader :x, :k
  def initialize f, f_1, f_2, x, accuracy = 0.001
    @f, @f_1, @f_2 = f, f_1, f_2
    @accuracy = accuracy
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
    @k = 0
  end

  def solve
    @x_next = process
    @k += 1
    return @x_next if enough?
    @x = @x_next
    solve
  end

  def converge?
    @f[x] * @f_2[x] > 0
  end

  def enough? 
    (@x_next - @x).abs < @accuracy
  end

  def process
    @x - @f[x] / @f_1[x]
  end

end
