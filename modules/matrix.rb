module MatrixExtension
  def norm
    @matrix.map { |row| Math.sum(0,@n) { |i| row[i].abs } }.max
  end
end
