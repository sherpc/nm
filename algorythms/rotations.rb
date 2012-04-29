class Rotations < Solution
  def self.phi a_i_j, a_i_i, a_j_j
    return Math::PI / 4 if a_i_i == a_j_j
    0.5 * Math.atan((2 * a_i_j) / (a_i_i - a_j_j))
  end
end
