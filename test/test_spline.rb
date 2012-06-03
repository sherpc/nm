require "test/unit"
require "./main.rb"

class TestSpline < Test::Unit::TestCase
  def setup
    @x = [0,1,2,3,4].map { |x| x.to_f }
    @f = [0,1.8415,2.9093,3.1411,3.2432]

    @x_l = [-0.4, -0.1, 0.2, 0.5, 0.8]
    @f_l = [-0.81152, -0.20017, 0.40136, 1.0236, 1.7273]
  end

  def test_spline
    sp = Spline.new @x, @f
    sp.create
    assert_equal 2.4969642857142857, sp[1.5]
    sp = Spline.new @x_l, @f_l
    assert_equal 0.19952999999999985, sp[0.1]
  end
end
