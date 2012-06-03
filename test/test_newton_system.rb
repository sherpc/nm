require "test/unit"
require "./main.rb"

class TestNewtonSystem < Test::Unit::TestCase
  def setup
    @f1 = ->(x1,x2) { x1 * x1 - 2 * Math.log(x2) - 1 }
    @f2 = ->(x1,x2) { x1 * x1 - x1 * x2 + 1}
    @f11 = ->(x1,x2) { 2.0 * x1 }
    @f22 = ->(x1,x2) { x1 }
    @f12 = ->(x1,x2) { -2.0 / x2 }
    @f21 = ->(x1,x2) { 2.0 * x1 - x2 }
  end

  def test_process
    equatation = NewtonSystem.new @f1, @f2, @f11, @f22, @f12, @f21, [1.4, 2.0]
    assert_equal [1.646008089670357, 2.346700647860357], equatation.solution
    equatation.accuracy = 0.0000001
    assert_equal [1.646008089670357, 2.346700647860357], equatation.solution
    equatation.accuracy = 0.1
    assert_equal [1.646008089670357, 2.346700647860357], equatation.solution
  end
end
