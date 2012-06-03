require "test/unit"
require "./modules/math"

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

  def test_mul
    mul = Math.mul(0, 2) { |i| @array[i] }
    assert_equal mul, 6
  end

  def test_more_complex_mul
    mul = Math.mul(0, 2) { |i| @array[i] + @array2[i] }
    assert_equal mul, 315
  end

  def test_invalid_range
    assert_equal 1, Math.mul(0,-1) { |i| i + 3 }
    assert_equal 3, Math.mul(0,0) { |i| i + 3 }
  end
end
