require "test/unit"
require "./main.rb"

class TestMatrix < Test::Unit::TestCase
  def setup
    @a_2_x_2 = [[1, 2], [3, 4]]
    @matrix = Matrix.new @a_2_x_2
  end

  def test_initialize
    assert_equal @matrix.data, @a_2_x_2
    assert_equal @matrix.data[0][2], @a_2_x_2[0][2]
    @a_2_x_2[0][0] = -1
    assert_not_equal @matrix.data, @a_2_x_2
  end

  def test_getter
    assert_equal @matrix[0][0], 1
    assert_equal @matrix[0][1], 2
    assert_equal @matrix[1][0], 3
    assert_equal @matrix[1][1], 4
    assert_raise(IndexError) { @matrix[2][0] }
  end
end
