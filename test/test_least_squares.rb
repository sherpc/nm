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
    assert_equal 1, f_1[@x[1]]
  end
end
