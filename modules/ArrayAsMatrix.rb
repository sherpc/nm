module ArrayAsMatrix
  def **(vector)
    raise ArgumentError, "Argument is not a vector -- #{vector}" unless vector.is_a? Array
    raise ArgumentError, "Argument has wrong length -- #{vector}" unless self[0].length == vector.length
    self.map { |row| row.map2(vector) { |x,y| x * y }.sum() }
  end

  def sum
    self.inject(0) { |s,x| s + x }
  end

  def map2(xs,&block)
    self.zip(xs).map(&block)
  end
end

class Array
  include ArrayAsMatrix
end
