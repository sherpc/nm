require "test/unit"
require "./main.rb"

class TestArrayAsMatrix < Test::Unit::TestCase
  def setup
    @m3 = [[1,-2,3],[-2,-7,10],[0,4,2]]
  end

  def test_multiple_matrix_vector
    assert_equal @m3 ** [0,0,0], [0,0,0]
    assert_equal @m3 ** [1,1,1], [2,1,6]
    assert_equal @m3 ** [2,1,3], [9,19,10]
  end

  def test_is_vector
    assert not(@m3.is_vector?)
    assert [1,2,3].is_vector?
  end
end
