class IterationMethod
  #Need implement converge?, step and enough? methods
  attr_accessor :accuracy
  attr_reader :x, :k
  
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
    @x_next = step @f, @x, @f_1
    @k += 1
    return @x_next if enough?
    @x = @x_next
    solve
  end
end
