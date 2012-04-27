class EasyIterations < Solution
  include MatrixExtension

  def initialize matrix, b_column, e = 0.01
    super matrix
    @B = b_column
  end

  def can_solve?
    for i in 0..@n
      sum = 0
      [0...i, i+1..@n].each_in_ranges { |j| sum += @matrix[i][j].abs }
      return false if @matrix[i][i].abs < sum
    end
    return true
  end

  def e k
    @norm = norm(@yakobi)
    (@norm / (1 - @norm)) * norm(@answer[k] - @answer[k-1])
  end
end
