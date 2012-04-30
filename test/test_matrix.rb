require "test/unit"
require "./main.rb"

class TestMatrix < Test::Unit::TestCase
  def setup
    @a_2_x_2 = [[1, 2], [3, 4]]
  end

  def test_initialize
    matrix = Matrix.new @a_2_x_2
    assert_equal matrix.data, @a_2_x_2
    @a_2_x_2[0][0] = -1
    assert_not_equal matrix.data, @a_2_x_2
  end
end
