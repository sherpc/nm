require "test/unit"
require "./main.rb"

class TestMatrix < Test::Unit::TestCase
  def setup
    @a_2_x_2 = [[1, 2], [3, 4]]
    @matrix = Matrix.new @a_2_x_2
  end

  def test_initialize
    assert_equal @matrix.data, @a_2_x_2
    assert_equal @matrix.n, 2
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
    assert_equal @matrix[0][2], nil
  end

  def test_setter
    @matrix[0][0] = -1
    assert_equal @matrix[0][0], -1
    assert_raise(IndexError) { @matrix[2][0] = - 1 }
    assert_nothing_raised { @matrix[0][2] = - 1 }
  end

  def test_each
    arr = []
    @matrix.each { |i,j,x| arr[i*@matrix.n + j] = x }
    assert_equal [1,2,3,4], arr
  end

  def test_map!
    @matrix.map! { |i,j,x| x + 1 }
    assert_equal [[2, 3], [4, 5]], @matrix.data
  end

  def test_map
    new_matrix = @matrix.map { |i,j,x| x + 1 }
    assert_not_equal [[2, 3], [4, 5]], @matrix.data
    assert_equal [[2, 3], [4, 5]], new_matrix.data
  end
end
