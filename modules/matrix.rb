class Matrix
  def self.norm(matrix)
    if matrix.is_vector?
      matrix.map { |x| x.abs }.max
    else
      matrix.map { |row| Math.sum(0,matrix.length-1) { |i| row[i].abs } }.max
    end
  end
end
