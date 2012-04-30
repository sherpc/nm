class Rotations < Solution
  def initialize matrix, e = 0.01
    @e = e
    @a = [Matrix.new(matrix)]
    @step = 0
  end

  def rotate
  end

  def max_non_diagonal
    max = current_a[0][1].abs
    current_a.each do |i, j, x|
        max = x.abs if i < j && x.abs > max
    end
    max
  end

  def current_a
    @a[@step]
  end

  def self.phi a_i_j, a_i_i, a_j_j
    return Math::PI / 4 if a_i_i == a_j_j
    0.5 * Math.atan((2 * a_i_j) / (a_i_i - a_j_j))
  end
end
