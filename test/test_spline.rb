require "test/unit"
require "./main.rb"

class TestSpline < Test::Unit::TestCase
  def setup
    @x = [0,1,2,3,4].map { |x| x.to_f }
    @f = [0,1.8415,2.9093,3.1411,3.2432]

    @x_l = []
  end

  def test_tmp
    sp = Spline.new @x, @f
    sp.create
    assert_equal 2.4969642857142857, sp[1.5]
  end
end
