require "test/unit"
require "./math.rb"

class TestMath < Test::Unit::TestCase
  def test_sum
    assert_equal Math.S(1,2), 3
  end
end
