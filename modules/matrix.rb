module MatrixExtension
  attr_reader :b, :yakobi
  def self.norm(matrix)
    if matrix.is_vector?
      matrix.map { |x| x.abs }.max
    else
      matrix.map { |row| Math.sum(0,matrix.length-1) { |i| row[i].abs } }.max
    end
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
