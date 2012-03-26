require "./data.rb"

class Solution
  def initialize()
    @matrix = Data.const_get "#{self.class.to_s.upcase}"
  end
  def to_s
    @matrix.to_s
  end
  def matrix
    @matrix
  end
end

class LU < Solution
end

class Thomas < Solution
end

lab1 = [LU.new, Thomas.new]
