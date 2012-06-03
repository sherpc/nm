require "test/unit"
require "./main.rb"

class TestEISystem < Test::Unit::TestCase
  def setup
    @f1 = ->(x1,x2) { Math.cos(x2) + 3 }
    @f2 = ->(x1,x2) { Math.sin(x1) + 3 }
  end

  def test_process
    equatation = NonlinearEISystem.new @f1, @f2, [2.4, 4.0], 0.7
    assert_equal [2.2103233479251156, 3.802406297087812], equatation.solution
    equatation.accuracy = 0.0000001
    assert_equal [2.210445043049556, 3.802305490096135], equatation.solution
    equatation.accuracy = 0.1
    assert_equal [2.201046839189919, 3.7911979933595883], equatation.solution
  end
end
