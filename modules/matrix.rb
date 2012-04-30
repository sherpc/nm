class Matrix < Array
  attr_reader :n
  def initialize array
    @n = array.length
    for i in 0...@n
      self[i] = Array.new(array[i])
    end
  end
  
  def each &block
    for i in 0...@n
      for j in 0...@n
        yield i,j,self[i][j]
      end
    end
  end

  def map! &block
    for i in 0...@n
      for j in 0...@n
        self[i][j] = yield i,j,self[i][j]
      end
    end
  end

  def map &block
    buffer = Array.new(@n) { Array.new(@n) }
    for i in 0...@n
      for j in 0...@n
        buffer[i][j] = yield i, j, self[i][j]
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
