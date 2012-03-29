module MatrixExtension
  attr_reader :B
  def norm
    # This line is for caching results. If norm calculated once, next times only return cached value
    return @norm unless @norm.nil?
    @norm = @matrix.map { |row| Math.sum(0,@n) { |i| row[i].abs } }.max
  end

  def alternative_view!
    for i in 0..@n
      @B[i] /= @matrix[i][i]
      [0...i, i+1..@n].each_in_ranges { |j| alternative_a i, j }
      @matrix[i][i] = 0
    end
  end

  private

  def alternative_a i, j
    @matrix[i][j] /= -@matrix[i][i]
  end
end
