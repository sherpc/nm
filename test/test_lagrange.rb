require "test/unit"
require "./main.rb"

class TestLagrange < Test::Unit::TestCase
  def setup
    @f = ->(x) { Math.asin(x) + x }
    @xs_a = [-0.4, -0.1, 0.2, 0.5]
    @xs_b = [-0.4, 0, 0.2, 0.5]
    X = 0.1
  end

  def test_lagrange
    interpolation = LagrangeInterpolation.new @f, @xs
    polynom = interpolation.make_polynom
    assert_equal 1, polynom[X]
  end
end
