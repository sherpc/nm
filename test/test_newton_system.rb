require "test/unit"
require "./main.rb"

class TestNewtonSystem < Test::Unit::TestCase
  def setup
    @f1 = ->(x1,x2) { x1 - Math.cos(x2) - 3 }
    @f2 = ->(x1,x2) { x2 - Math.sin(x1) - 3}
    @f11 = ->(x1,x2) { 1 }
    @f22 = ->(x1,x2) { 1 }
    @f12 = ->(x1,x2) { Math.sin(x2) }
    @f21 = ->(x1,x2) { -Math.cos(x1) }
  end

  def test_process
    equatation = NewtonSystem.new @f1, @f2, @f11, @f22, @f12, @f21, [2.4, 4.0]
    assert_equal [2.210445028836174, 3.802305503432496], equatation.solution
    equatation.accuracy = 0.0000001
    assert_equal [2.2104450285987975, 3.802305502067759], equatation.solution
    equatation.accuracy = 0.1
    assert_equal [2.210383749642402, 3.8023444934036195], equatation.solution
  end
end
