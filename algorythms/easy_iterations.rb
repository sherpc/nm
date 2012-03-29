class EasyIterations < Solution
  include MatrixExtension

  def initialize matrix, b_column, e = 0.01
    super matrix
    @B = b_column
  end
end
