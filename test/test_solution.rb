require "test/unit"
require "./main.rb"

class TestSolution < Test::Unit::TestCase
  def test_custom_data_loading
    data = [[1,2], [3,4]]
    s = Solution.new(data)
    assert_equal s.matrix, data
  end
end
