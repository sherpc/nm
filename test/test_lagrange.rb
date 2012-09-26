require "test/unit"
require "./main.rb"

class TestLagrange < Test::Unit::TestCase
  def setup
    @f = ->(x) { Math.asin(x) + x }
    @xs_a = [-0.4, -0.1, 0.2, 0.5]
    @xs_b = [-0.4, 0, 0.2, 0.5]
  end

  def test_lagrange
    interpolation = LagrangeInterpolation.new @f, @xs_a
    assert_equal 0.0006035953921869897, interpolation.error(0.1)

    interpolation.xs = @xs_b
    assert_equal 0.204652427356411, interpolation.error(0.1)
  end
end
