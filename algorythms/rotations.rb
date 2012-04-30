class Rotations < Solution
  def initialize matrix, e = 0.01
    @e = e
    @a = [Matrix.new(matrix)]
    @step = 0
  end

  def rotate
    max, i, j = max_non_diagonal
    u = rotation_matrix i, j
  end

  def rotation_matrix i, j
    phi = Rotations.phi(current_a[i][j], current_a[i][i], current_a[j][j])
    u = Matrix.unary current_a.n
    sin_phi = Math.sin(phi)
    cos_phi = Math.cos(phi)
    u[i][j] = -sin_phi
    u[j][i] = sin_phi
    u[i][i] = u[j][j] = cos_phi
    return u
  end

  def max_non_diagonal
    max = current_a[0][1].abs
    max_i, max_j = 0, 1
    current_a.each do |i, j, x|
        max, max_i, max_j = x.abs, i, j if i < j && x.abs > max
    end
    [max, max_i, max_j]
  end

  def current_a
    @a[@step]
  end

  def self.phi a_i_j, a_i_i, a_j_j
    return Math::PI / 4 if a_i_i == a_j_j
    0.5 * Math.atan((2 * a_i_j) / (a_i_i - a_j_j))
  end
end
