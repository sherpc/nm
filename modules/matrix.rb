class Matrix
  attr_reader :data
  def initialize array
    @data = Array.new(array.length) { |i| Array.new(array[i]) }
    @n = @data.length - 1
  end
  
  def [] i
    raise IndexError "Incorrect index" if i > @n
    @data[i]
  end

  def self.norm(matrix)
    if matrix.is_vector?
      matrix.map { |x| x.abs }.max
    else
      matrix.map { |row| Math.sum(0,matrix.length-1) { |i| row[i].abs } }.max
    end
  end
end
