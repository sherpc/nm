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
    assert_equal [0, 1], @m_2_2.max_non_diagonal
    assert_equal [1, 2], @m_3_3.max_non_diagonal
    assert_equal [0, 1], @m_lab.max_non_diagonal
  end

  def test_rotation_matrix
    u = @m_3_3.rotation_matrix(1,2)
    expected = [[1,0,0], [0,0.76,0.65], [0,-0.65,0.76]]
    assert_equal expected, u.round.to_a
  end

  def test_rotate
    @m_3_3.rotate
    assert_equal 3, @m_3_3.lambda.length
    assert_equal [3.7301383132928194, 1.9213677570592262, 9.348493929647955], @m_3_3.lambda
    assert_equal [[0.77, 0.2, -0.6], [-0.52, 0.75, -0.42], [0.37, 0.64, 0.68]], @m_3_3.x.round
  end
end
