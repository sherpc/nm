require "test/unit"
require "./main.rb"

class TestLeastSquares < Test::Unit::TestCase
  def setup
    @x = [0, 1.7, 3.4, 5.1, 6.8, 8.5]
    @y = [0, 1.3038, 1.8439, 2.2583, 2.6077, 2.9155]
  end

  def test_f_1
    ls = LeastSquares.new @x, @y
    f_1 = ls.f_1
    f_2 = ls.f_2
    assert_equal 0.4712761904761896, f_1[@x[0]]
    assert_equal 0.48717378819047663, ls.error_1
    assert_equal 1.0797457142857148, f_2[@x[1]]
    assert_equal 0.09455769485714287, ls.error_2
  end
end
