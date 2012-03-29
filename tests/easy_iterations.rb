require "test/unit"
require "./main.rb"

class TestEasyIterations < Test::Unit::TestCase
  def setup
    @m3_alt = [[0, -0.1, -0.1], [-0.2, 0, -0.1], [-0.2, -0.2, 0]]
    @m3 = [[10,1,1], [2,10,1], [2,2,10]]
    @m2 = [[4, 3], [-6, 3]]
  end

  def test_norm
    assert_equal EasyIterations.new(@m3_alt).norm, 0.4
    assert_equal EasyIterations.new(@m3).norm, 14
    assert_equal EasyIterations.new(@m2).norm, 9
  end
end
