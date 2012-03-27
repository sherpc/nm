require "./data.rb"

class Solution
  def initialize(data=nil)
    if data.nil?
      @matrix = Data.const_get "#{self.class.to_s.upcase}"
    else
      raise "Empty data!" if data == []
      @matrix = data
    end
    @matrix.map! { |x| x.map! { |a| a * 1.0 } }
  end
  def to_s
    "matrix" + @matrix.to_s
  end
  def matrix
    @matrix
  end
  def round!(range=2)
    @matrix.map! { |row| row.map! { |a| a.round(range) } }
  end
end

require "./algorythms/LU.rb"

class Thomas < Solution
end

lab1 = [LU.new, Thomas.new]
