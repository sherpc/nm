require "test/unit"
require "./main.rb"

class TestRotations < Test::Unit::TestCase
  def test_phi
    assert_equal Rotations.phi(1,2,2), Math::PI/4
    assert_not_equal Rotations.phi(1,2,3), Math::PI/4
  end
end
