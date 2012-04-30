require "./data.rb"

class Solution
  attr_reader :n, :matrix
  def initialize(data=nil)
    data = Data.const_get "#{self.class.to_s.upcase}" if data.nil?
    #raise "Empty data!" if data == []

    @matrix = Array.new(data.length) { |i| Array.new(data[i]) }
    @n = @matrix.length - 1
    @matrix.map! { |x| x.map! { |a| a * 1.0 } }
  end

  def new_matrix
    Array.new(@n+1) { Array.new(@n+1) }
  end

  def to_s
    "matrix" + @matrix.to_s
  end

  def self.round(m,range=2)
    m.map { |i,j,x| x.round(range) }
  end
end
