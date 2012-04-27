class EasyIterations < Solution
  include MatrixExtension
  attr_reader :answer

  def initialize matrix, b_column, e = 0.01
    super matrix
    @B = b_column
    @e = e
  end

  def can_solve?
    for i in 0..@n
      sum = 0
      [0...i, i+1..@n].each_in_ranges { |j| sum += @matrix[i][j].abs }
      return false if @matrix[i][i].abs < sum
    end
    return true
  end

  def solve
    alternative_view unless @yakobi
    raise "Can't solve SoLE" unless can_solve?
    @answer = [@b]
    k = 0
    begin
      k += 1
      @answer[k] = @b.map2(@yakobi ** @answer[k-1]) { |x,y| x+y }
    end while(e(k) > @e)
  end

  def e k
    norm = MatrixExtension.norm(@yakobi)
    (norm / (1 - norm)) * MatrixExtension.norm(@answer[k].map2(@answer[k-1]) { |x,y| x-y })
  end
end
