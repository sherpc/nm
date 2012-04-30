class Matrix < Array
  attr_reader :n
  def initialize array=[]
    if array.is_a? Integer
      @n = array
      for i in 0...@n
        self[i] = [0] * @n
      end
    else
      @n = array.length
      for i in 0...@n
        self[i] = Array.new(array[i])
      end
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

  def round precision=2
    map { |i,j,x| x.round precision }
  end
end

class << Matrix
  def zero size
    raise ArgumenError, "Argument #{size} is not integer" unless size.is_a? Integer
    Matrix.new size
  end

  def unary size
    Matrix.zero(size).map { |i,j,x| i == j ? 1 : 0 }
  end

  def norm(matrix)
    if matrix.is_vector?
      matrix.map { |x| x.abs }.max
    else
      matrix.map { |row| Math.sum(0,matrix.length-1) { |i| row[i].abs } }.max
    end
  end
end
