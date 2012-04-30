class Rotations < Solution
  def initialize matrix, e = 0.01
    super matrix
    @e = e
    @a = [@matrix]
    @step = 1
  end

  def rotate
  end

  def max_non_diagonal
    max = current_a[0][1].abs
    for i in 0..@n
      for j in 0..@n
        max = current_a[i][j].abs if i < j && current_a[i][j].abs > max
      end
    end
  end

  def current_a
    @a[@step]
  end

  def self.phi a_i_j, a_i_i, a_j_j
    return Math::PI / 4 if a_i_i == a_j_j
    0.5 * Math.atan((2 * a_i_j) / (a_i_i - a_j_j))
  end
end
