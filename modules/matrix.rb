class Matrix < Array
  attr_reader :n
  def initialize array=[],columns_size=nil
    if array.is_a? Integer
      @n = array
      @m = columns_size.is_a?(Integer) ? columns_size : @n
      (0...@n).each { |i| self[i] = [0] * @m }
    else
      @m = @n = array.length
      (0...@n).each { |i| self[i] = Array.new(array[i]) }
    end
  end

  def each &block
    for i in 0...@n
      for j in 0...@m
        yield i,j,self[i][j]
      end
    end
  end

  def map! &block
    for i in 0...@n
      for j in 0...@m
        self[i][j] = yield i,j,self[i][j]
      end
    end
  end

  def map &block
    buffer = Array.new(@n) { Array.new(@n) }
    for i in 0...@n
      for j in 0...@m
        buffer[i][j] = yield i, j, self[i][j]
      end
    end
    Matrix.new buffer
  end

  def select &block
    buffer = []
    for i in 0...@n
      for j in 0...@m
        buffer << self[i][j] if yield(i, j, self[i][j])
      end
    end
    buffer
  end

  def reduce result=nil, &block
    result ||= self[0][0]
    for i in 0...@n
      for j in 0...@m
        result = yield result, i, j, self[i][j]
      end
    end
    result
  end

  def main_diagonal
    self.select { |i,j,x| i == j }
  end

  def round precision=2
    map { |i,j,x| x.round precision }
  end

  def transpose
    m = Matrix.new self
    m.each do |i,j,x| 
      if i < j
        m[i][j] = m[j][i]
        m[j][i] = x
      end
    end
    m
  end

  def *(other)
    raise ArgumentError, "Argument is not matrix" unless other.is_a? Matrix
    return self if other.is_a? UnaryMatrix
    raise ArgumentError, "Argument has wrong size" unless self[0].length == other.length
    result = Matrix.new self.length, other[0].length
    result.map! do |i,j,x|
      (0...other.length).inject(0) { |s,k| s + self[i][k] * other[k][j] }
    end
    result
  end
end

class UnaryMatrix < Matrix
  def *(other)
    raise ArgumentError, "Argument is not matrix" unless other.is_a? Matrix
    other
  end
end

class Matrix
  E = UnaryMatrix.new
end

class << Matrix
  def zero size
    raise ArgumentError, "Argument #{size} is not integer" unless size.is_a? Integer
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
