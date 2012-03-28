require "test/unit"
require "./math.rb"

class TestMath < Test::Unit::TestCase
  def setup
    @array = [1, 2, 3]
    @array2 = [4, 5, 6]
  end

  def test_sum
    sum = Math.sum(0, 2) { |i| @array[i] }
    assert_equal sum, 6
  end

  def test_more_complex_sum
    sum = Math.sum(0, 2) { |i| @array[i] * @array2[i] }
    assert_equal sum, 32
  end
end
