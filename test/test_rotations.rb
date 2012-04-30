require "test/unit"
require "./main.rb"

class TestRotations < Test::Unit::TestCase
  def setup
    @a_2_2 = [[1,2], [2,4]]
    @m_2_2 = Rotations.new @a_2_2
    @a_3_3 = [[4,2,1], [2,5,3], [1,3,6]]
    @m_3_3 = Rotations.new @a_3_3
    @a_lab = [[-8,9,6], [9,9,1], [6,1,8]]
    @m_lab = Rotations.new @a_lab
  end

  def test_phi
    assert_equal Rotations.phi(1,2,2), Math::PI/4
    assert_not_equal Rotations.phi(1,2,3), Math::PI/4
  end

  def test_max_non_diagonal
    assert_equal [2, 0, 1], @m_2_2.max_non_diagonal
    assert_equal [3, 1, 2], @m_3_3.max_non_diagonal
    assert_equal [9, 0, 1], @m_lab.max_non_diagonal
  end

  def test_rotation
    @m_3_3.rotate
  end
end
