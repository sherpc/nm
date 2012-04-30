class Matrix
  attr_reader :data, :n
  def initialize array
    @data = Array.new(array.length) { |i| Array.new(array[i]) }
    @n = @data.length
  end
  
  def [] i
    raise IndexError, "Incorrect index" if i >= @n
    @data[i]
  end

  def each &block
    for i in 0...@n
      for j in 0...@n
        yield i,j,@data[i][j]
      end
    end
  end

  def map! &block
    for i in 0...@n
      for j in 0...@n
        @data[i][j] = yield i,j,@data[i][j]
      end
    end
  end

  def map &block
    buffer = Array.new(@n) { Array.new(@n) }
    for i in 0...@n
      for j in 0...@n
        buffer[i][j] = yield i, j, @data[i][j]
      end
    end
    Matrix.new buffer
  end

  def self.norm(matrix)
    if matrix.is_vector?
      matrix.map { |x| x.abs }.max
    else
      matrix.map { |row| Math.sum(0,matrix.length-1) { |i| row[i].abs } }.max
    end
  end
end
