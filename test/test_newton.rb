require "test/unit"
require "./main.rb"

class TestNewton < Test::Unit::TestCase
  def setup
    @f = ->(x) { x * x * x * x - 2 * x - 1 }
    @f_1 = ->(x) { 4 * x * x * x - 2 }
    @f_2 = ->(x) { 12 * x * x }
  end

  def test_process
    equatation = Newton.new @f, @f_1, @f_2, 1.5
    assert_equal 1.39533704424061, equatation.solution
    equatation.accuracy = 0.0000001
    assert_equal 1.3953369944670762, equatation.solution
    equatation.accuracy = 0.1
    assert_equal 1.4076086956521738, equatation.solution
  end
end
