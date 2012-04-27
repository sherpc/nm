module MatrixExtension
  attr_reader :b, :yakobi
  def norm
    # This line is for caching results. If norm calculated once, next times only return cached value
    return @norm unless @norm.nil?
    @norm = @matrix.map { |row| Math.sum(0,@n) { |i| row[i].abs } }.max
  end

  def alternative_view
    @yakobi = @matrix.map { |x| x.clone }.clone
    @b = @B.clone
    for i in 0..@n
      @b[i] /= @matrix[i][i]
      [0...i, i+1..@n].each_in_ranges { |j| alternative_a i, j }
      @yakobi[i][i] = 0
    end
  end

  private

  def alternative_a i, j
    @yakobi[i][j] /= -@yakobi[i][i]
  end
end
