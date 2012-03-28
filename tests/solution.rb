require "test/unit"
require "./main.rb"

class TestSolution < Test::Unit::TestCase
  def test_data_loading
    assert_equal(Data::THOMAS,Thomas.new.matrix)
  end

  def test_custom_data_loading
    data = [[1,2], [3,4]]
    assert_equal(LU.new(data).matrix, data)
  end
end
